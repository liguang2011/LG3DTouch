//
//  LG3DTouchProxyTarget.h
//  Pods-LG3DTouch_Example
//
//  Created by liguang on 2018/11/21.
//

#import <Foundation/Foundation.h>

API_AVAILABLE(ios(9.0))
@interface LG3DTouchProxyTarget : NSObject

@property (nonatomic, weak) NSString *previewName;

@property (nonatomic, weak) UIViewController *current;

@property (nonatomic, weak) UIView *sourceView;

- (id)initWithPreview:(NSString *)previewControllerName current:(UIViewController *)current sourceView:(UIView *)sourceView;

@end
