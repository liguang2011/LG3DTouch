//
//  LGPresentationViewController.m
//  LG3DTouch
//
//  Created by 553521355@qq.com on 11/22/2018.
//  Copyright (c) 2018 553521355@qq.com. All rights reserved.
//

#import "LGPresentationViewController.h"

@interface LGPresentationViewController ()

@property (nonatomic, strong)UILabel *labInformation;

@end

@implementation LGPresentationViewController

- (UILabel *)labInformation {

    if (!_labInformation) {
        
        _labInformation = [[UILabel alloc] init];
    }
    
    return _labInformation;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"预览界面被创建了");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configLabel];
}

- (void)configLabel {

    self.labInformation.text = [NSString stringWithFormat:@"通过点击下标为[%@]进来的", self.strInfo];
    self.labInformation.textColor = [UIColor blackColor];
    self.labInformation.textAlignment = NSTextAlignmentCenter;
    self.labInformation.frame = CGRectMake(0, 0, 200, 30);
    [self.labInformation sizeToFit];
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    self.labInformation.center = center;
    
    [self.view addSubview:self.labInformation];
}

#pragma mark - 3D Touch 预览Action代理
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
//
    NSMutableArray *arrItem = [NSMutableArray array];
    
    UIPreviewAction *previewAction0 = [[LG3DTouchManager shareManager] registerActionWithTitle:@"取消" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *previewAction1 = [[LG3DTouchManager shareManager] registerActionWithTitle:@"其他操作" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

    }];
    
    [arrItem addObjectsFromArray:@[previewAction0 ,previewAction1]];
    
    return arrItem;
}

- (void)replaceItem {

}

- (void)dealloc {
    NSLog(@"预览界面被释放了");
}


@end
