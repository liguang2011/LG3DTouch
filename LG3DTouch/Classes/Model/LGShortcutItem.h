//
//  LGShortcutItem.h
//  Pods-LG3DTouch_Example
//
//  Created by liguang on 2018/11/20.
//

#import <Foundation/Foundation.h>

API_AVAILABLE(ios(9.0))
@interface LGShortcutItem : NSObject

@property (nonatomic, strong) NSString *typeName;

@property (nonatomic, strong) NSString *localizedTitle;

@property (nonatomic, strong) NSString *localizedSubtitle;

@property (nonatomic, strong) UIApplicationShortcutIcon *icon;

/**
 遵循跳转协议
 */
@property (nonatomic, strong) NSString *url;

- (instancetype)initWithIconType:(UIApplicationShortcutIconType)iconType
                        typeName:(NSString *)typeName
                  localizedTitle:(nonnull NSString *)localizedTitle
               localizedSubtitle:(nullable NSString *)localizedSubtitle
                         jumpUrl:(NSString *)url;

- (instancetype)initWithIconName:(NSString *)iconName
                        typeName:(NSString *)typeName
                  localizedTitle:(nonnull NSString *)localizedTitle
               localizedSubtitle:(nullable NSString *)localizedSubtitle
                         jumpUrl:(NSString *)url;
@end
