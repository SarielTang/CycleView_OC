//
//  ViewController.m
//  CycleView_OC_Demo
//
//  Created by SarielTang on 15/7/10.
//  Copyright (c) 2015年 SarielTang. All rights reserved.
//

#import "ViewController.h"
#import "CycleViewController.h"

@interface ViewController ()<CycleAnimatorViewControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CycleViewController *cycleView = [[CycleViewController alloc] init];  // 创建图片轮转
    [self addChildViewController:cycleView];// 添加控制
    
    self.tableView.tableHeaderView = cycleView.view;
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    
    cycleView.delegate = self;
}

///通过重写这个代理方法，即可进行点击图片后的交互处理.
- (void)pictureCycleCellDidSelected:(NSInteger)itemTag{
	NSLog(@"被选中的item的tag值：%zd", itemTag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

@end
