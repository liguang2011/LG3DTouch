//
//  LG3DTouchManager.m
//  Pods-LG3DTouch_Example
//
//  Created by liguang on 2018/11/20.
//

#import "LG3DTouchManager.h"

typedef void(^PreviewParamBlock)(UIViewController *previewController,UIView *sourceView);

@interface LG3DTouchManager()

{
    BOOL _isLock;
}

@property (nonatomic, strong) NSMutableArray <UIApplicationShortcutItem *> *shortcutItems;
@property (nonatomic, strong) LG3DTouchProxyTarget *proxyTarget;
@property (nonatomic, copy) PreviewParamBlock blcok;

@end

@implementation LG3DTouchManager

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static LG3DTouchManager * manager;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        manager.shortcutItems = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
        if (manager.shortcutItems.count) {
            [manager lock];
        }
    });
    return manager;
}

#pragma mark - 图标点击
- (void)registerUnit:(LGShortcutItem *)shortcutItem {
#if DEBUG
    NSAssert(shortcutItem, @"shortcutItem 不可用为空值");
    NSAssert(shortcutItem.localizedTitle.length, @"localizedTitle 作为标题必须存在");
    NSAssert(shortcutItem.typeName, @"选项类型必须存在");
    NSAssert(shortcutItem.icon, @"icon必须存在");
#endif
    
    for (UIApplicationShortcutItem * item in self.shortcutItems) {
        if ([item.type isEqualToString:shortcutItem.typeName])
            return;
    }
    
    NSDictionary *userInfo;
    if (shortcutItem.url.length) {
        userInfo = [NSDictionary dictionaryWithObject:shortcutItem.url forKey:@"url"];
    }
    UIApplicationShortcutItem *newItem = [[UIApplicationShortcutItem alloc]
                                            initWithType:shortcutItem.typeName
                                          localizedTitle:shortcutItem.localizedTitle
                                       localizedSubtitle:shortcutItem.localizedSubtitle
                                                    icon:shortcutItem.icon
                                                userInfo:userInfo];
    [self.shortcutItems addObject:newItem];
}

- (void)autoRegisterUnit:(LGShortcutItem *)shortcutItem {
    
    [self unlock];
    [self registerUnit:shortcutItem];
    if (self.shortcutItems.count > 4) {
        [self removeNearlyItem];
        [self autoRegisterUnit:shortcutItem];
    }
    [self lock];
}

- (void)lock {
#if DEBUG
    NSAssert(self.shortcutItems.count, @"self.shortcutItems 不可用为空数组");
    NSAssert(self.shortcutItems.count <= 4, @"LG3DTouchManager 最多允许添加4个元素 可以使用autoRegisterUnit:方法来自动覆盖");
#endif
    //只有调用了 lock 方法 3DTouch元素才会生效
    [UIApplication sharedApplication].shortcutItems = self.shortcutItems;
    _isLock = YES;
}

- (void)unlock {
    self.shortcutItems = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
    _isLock = NO;
}

- (void)reset {
    [self.shortcutItems removeAllObjects];
    [UIApplication sharedApplication].shortcutItems = [NSMutableArray array];
    _isLock = NO;
}

- (void)removeNearlyItem {
    [self unlock];
#if DEBUG
    NSAssert(self.shortcutItems.count, @"_shortcutItems 不可用为空数组");
#endif
    [self.shortcutItems removeLastObject];
    [self lock];
}

#pragma mark - 预览事件
- (UIPreviewAction *)registerActionWithTitle:(NSString *)title
                                       style:(UIPreviewActionStyle)style
                                     handler:(void(^)(UIPreviewAction * _Nonnull actionLG, UIViewController * _Nonnull previewViewControllerLG))actionBack {
    return [UIPreviewAction actionWithTitle:title
                                      style:style
                                    handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                                        actionBack(action,previewViewController);
    }];
}


- (void)registerPreviewController:(LG3DTouchProxyTarget *)target
                       paramBlock:(void (^)(UIViewController *previewController,UIView *sourceView))block {
    self.blcok = block;
    self.proxyTarget = target;
    //    UIForceTouchCapabilityUnknown = 0,     //未知
    //    UIForceTouchCapabilityUnavailable = 1, //不可用
    //    UIForceTouchCapabilityAvailable = 2    //可用
    if ([self.proxyTarget.current respondsToSelector:@selector(traitCollection)]) {
        if ([self.proxyTarget.current.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
            if (self.proxyTarget.current.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
                [self.proxyTarget.current registerForPreviewingWithDelegate:(id)self sourceView:self.proxyTarget.sourceView];
            }
        }
    }
}

#pragma mark - UIViewControllerPreviewingDelegate
#pragma mark peek(preview)
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0) {
//    //指定当前上下文视图Rect
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    previewingContext.sourceRect = rect;
    
    Class obj = NSClassFromString(self.proxyTarget.previewName);
    id returnObj = [[obj alloc] init];
    NSAssert([returnObj isKindOfClass:[UIViewController class]], @"obj 必须是 UIViewController 或其子类");
    self.blcok(returnObj,[previewingContext sourceView]);
    return (UIViewController *)returnObj;
}

#pragma mark pop(push)
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0) {
    [self.proxyTarget.current showViewController:viewControllerToCommit sender:self.proxyTarget.current];
}





@end
