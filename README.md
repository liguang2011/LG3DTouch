# LG3DTouch

[![CI Status](https://img.shields.io/travis/553521355@qq.com/LG3DTouch.svg?style=flat)](https://travis-ci.org/553521355@qq.com/LG3DTouch)
[![Version](https://img.shields.io/cocoapods/v/LG3DTouch.svg?style=flat)](https://cocoapods.org/pods/LG3DTouch)
[![License](https://img.shields.io/cocoapods/l/LG3DTouch.svg?style=flat)](https://cocoapods.org/pods/LG3DTouch)
[![Platform](https://img.shields.io/cocoapods/p/LG3DTouch.svg?style=flat)](https://cocoapods.org/pods/LG3DTouch)

## 前言

包含iOS新特性3DTouch相关封装

## 初始化

```
//图标按压的初始化
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    LGShortcutItem *item1 = [[LGShortcutItem alloc] initWithIconType:UIApplicationShortcutIconTypeHome typeName:@"GoType1" localizedTitle:@"去目的地1" localizedSubtitle:nil jumpUrl:@"action://page=home"];
    
    LGShortcutItem *item2 = [[LGShortcutItem alloc] initWithIconType:UIApplicationShortcutIconTypeTask typeName:@"GoType2" localizedTitle:@"去目的地2" localizedSubtitle:@"子标题2" jumpUrl:nil];
    
    [[LG3DTouchManager shareManager] autoRegisterUnit:item1];
    [[LG3DTouchManager shareManager] autoRegisterUnit:item2];
    
    return YES;
}

```

```
//tableView按压的初始化
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell的创建和代码逻辑...

//注册预览页和当前页
    LG3DTouchProxyTarget *target = [[LG3DTouchProxyTarget alloc] initWithPreview:@"LGPresentationViewController" current:self sourceView:cell];
    [[LG3DTouchManager shareManager] registerPreviewController:target paramBlock:^(UIViewController *previewController,UIView *sourceView) {
        //在这里传递参数
        LGPresentationViewController *vc = (LGPresentationViewController *)previewController;
        UITableViewCell *returnCell = (UITableViewCell *)sourceView;
        vc.strInfo = returnCell.textLabel.text;
    }];
}
```

## 引入方式

LG3DTouch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LG3DTouch'
```

## Author

553521355@qq.com, liguang@daojia-inc.com

## License

LG3DTouch is available under the MIT license. See the LICENSE file for more info.
