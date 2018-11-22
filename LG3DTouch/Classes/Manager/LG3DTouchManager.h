//
//  LG3DTouchManager.h
//  Pods-LG3DTouch_Example
//
//  Created by liguang on 2018/11/20.
//

#import <Foundation/Foundation.h>
#import "LGShortcutItem.h"
#import "LG3DTouchProxyTarget.h"

API_AVAILABLE(ios(9.0))
@interface LG3DTouchManager : NSObject

+ (instancetype)shareManager;

#pragma mark - 图标事件
/**
 注册元素 自动完成覆盖 使其一定能被注册

 @param shortcutItem 元素
 */
- (void)autoRegisterUnit:(LGShortcutItem *)shortcutItem;

/**
 移除所有item元素
 */
- (void)reset;

/**
 删除最近的一个元素
 */
- (void)removeNearlyItem;

#pragma mark - 预览事件

/**
 注册预览事件

 @param target 预览需要的模型
 */
- (void)registerPreviewController:(LG3DTouchProxyTarget *)target
                      paramBlock:(void (^)(UIViewController *previewController,UIView *sourceView))block;



/**
 注册预览状态下的按钮

 @param title <#title description#>
 @param style <#style description#>
 @param handler <#handler description#>
 @return <#return value description#>
 */
- (UIPreviewAction *)registerActionWithTitle:(NSString *)title style:(UIPreviewActionStyle)style handler:(void(^)(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController))handler;


@end
