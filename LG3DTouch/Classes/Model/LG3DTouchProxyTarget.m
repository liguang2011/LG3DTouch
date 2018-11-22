//
//  LG3DTouchProxyTarget.m
//  Pods-LG3DTouch_Example
//
//  Created by liguang on 2018/11/21.
//

#import "LG3DTouchProxyTarget.h"

@implementation LG3DTouchProxyTarget

- (id)initWithPreview:(NSString *)previewControllerName current:(UIViewController *)current sourceView:(UIView *)sourceView {
    if (self = [super init]) {
        self.previewName = previewControllerName;
        self.current = current;
        self.sourceView = sourceView;
    }
    return self;
}

- (void)dealloc {
    _previewName = nil;
    _current = nil;
    _sourceView = nil;
}

@end
