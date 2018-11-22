//
//  LGViewController.m
//  LG3DTouch
//
//  Created by 553521355@qq.com on 11/22/2018.
//  Copyright (c) 2018 553521355@qq.com. All rights reserved.
//

#import "LGViewController.h"
#import "LGMainViewController.h"
#import "LGPresentationViewController.h"


@interface LGViewController ()
@property (weak, nonatomic) IBOutlet UIButton *itemClickA;
@property (weak, nonatomic) IBOutlet UIButton *itemClickB;

@end

@implementation LGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)itemClickA:(id)sender {
    //点击A
    LGShortcutItem *itemA = [[LGShortcutItem alloc] initWithIconType:UIApplicationShortcutIconTypeTask typeName:@"GoTypeA" localizedTitle:@"去目的地A" localizedSubtitle:nil jumpUrl:nil];
    [[LG3DTouchManager shareManager] autoRegisterUnit:itemA];
    
}
- (IBAction)itemClickB:(id)sender {
    //点击B
    LGShortcutItem *itemB = [[LGShortcutItem alloc] initWithIconType:UIApplicationShortcutIconTypeTask typeName:@"GoTypeB" localizedTitle:@"去目的地B" localizedSubtitle:nil jumpUrl:nil];
    [[LG3DTouchManager shareManager] autoRegisterUnit:itemB];
    
}
- (IBAction)resetClick:(id)sender {
    //重置所有
    [[LG3DTouchManager shareManager] reset];
}
- (IBAction)next:(id)sender {
    
    [self.navigationController pushViewController:[LGMainViewController new] animated:YES];
}

@end
