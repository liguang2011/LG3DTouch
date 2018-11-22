//
//  LGShortcutItem.m
//  Pods-LG3DTouch_Example
//
//  Created by liguang on 2018/11/20.
//

#import "LGShortcutItem.h"

@implementation LGShortcutItem

- (instancetype)initWithIconType:(UIApplicationShortcutIconType)iconType
                        typeName:(NSString *)typeName
                  localizedTitle:(nonnull NSString *)localizedTitle
               localizedSubtitle:(nullable NSString *)localizedSubtitle
                         jumpUrl:(NSString *)url {
    if (self = [super init]) {
        self.typeName = typeName;
        self.localizedTitle = localizedTitle;
        self.localizedSubtitle = localizedSubtitle;
        self.icon = [UIApplicationShortcutIcon iconWithType:iconType];
        self.url = url;
    }
    return self;
}

- (instancetype)initWithIconName:(NSString *)iconName
                        typeName:(NSString *)typeName
                  localizedTitle:(nonnull NSString *)localizedTitle
               localizedSubtitle:(nullable NSString *)localizedSubtitle
                         jumpUrl:(NSString *)url {
    if (self = [super init]) {
        self.typeName = typeName;
        self.localizedTitle = localizedTitle;
        self.localizedSubtitle = localizedSubtitle;
        self.icon = [UIApplicationShortcutIcon iconWithTemplateImageName:iconName];
        self.url = url;
    }
    return self;
}
@end
