//
//  LGMainViewController.m
//  LG3DTouch
//
//  Created by 553521355@qq.com on 11/22/2018.
//  Copyright (c) 2018 553521355@qq.com. All rights reserved.
//

#import "LGMainViewController.h"
#import "LGPresentationViewController.h"

static NSString *reusedId = @"3dTouch";

@interface LGMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSArray *arrData;

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation LGMainViewController

#pragma mark - lazy load
- (NSArray *)arrData {

    if (!_arrData) {
        
        _arrData = [NSArray array];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i < 30; i++) {
            
            [arr addObject:@(i)];
        }
        
        _arrData = arr;
    }
    
    return _arrData;
}

- (UITableView *)tableView {

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] init];
        _tableView.tableFooterView = [[UIView alloc] init];

    }
    
    return _tableView;
}



#pragma mark - cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"tableView界面被创建了");
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self configTableView];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self.tableView selector:@selector(reloadData) name:@"NOTIFICATION_RELOADDATA" object:nil];
}

- (void)configTableView {

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = self.view.bounds;
    
    [self.view addSubview:self.tableView];
}


#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = [NSString stringWithFormat:@"row [%@]", self.arrData[indexPath.row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedId];
        
    }
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = str;
    
    //注册预览页和当前页
    LG3DTouchProxyTarget *target = [[LG3DTouchProxyTarget alloc] initWithPreview:@"LGPresentationViewController" current:self sourceView:cell];
    [[LG3DTouchManager shareManager] registerPreviewController:target paramBlock:^(UIViewController *previewController,UIView *sourceView) {
        //在这里传递参数
        LGPresentationViewController *vc = (LGPresentationViewController *)previewController;
        UITableViewCell *returnCell = (UITableViewCell *)sourceView;
        vc.strInfo = returnCell.textLabel.text;
    }];
    
    return cell;
}

#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    cell.selected = NO;
    
    NSString *str = [NSString stringWithFormat:@"%@", self.arrData[indexPath.row]];
    LGPresentationViewController *presentationVC = [LGPresentationViewController new];
    presentationVC.strInfo = str;
    [self.navigationController pushViewController:presentationVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 88.0;
}


#pragma mark - UIViewControllerPreviewingDelegate
#pragma mark peek(preview)
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0) {

    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)[previewingContext sourceView]];
    NSString *str = [NSString stringWithFormat:@"%@",self.arrData[indexPath.row]];
    
    //创建要预览的控制器
    LGPresentationViewController *presentationVC = [[LGPresentationViewController alloc] init];
    presentationVC.arrData = (NSMutableArray *)self.arrData;
    presentationVC.index = indexPath.row;
    presentationVC.strInfo = str;
    
    //指定当前上下文视图Rect
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    previewingContext.sourceRect = rect;

    return presentationVC;
}

- (void)dealloc {
    NSLog(@"tableView界面被释放了");
}

@end
