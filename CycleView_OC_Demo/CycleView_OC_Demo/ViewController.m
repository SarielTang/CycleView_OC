//
//  ViewController.m
//  CycleView_OC_Demo
//
//  Created by SarielTang on 15/7/10.
//  Copyright (c) 2015年 SarielTang. All rights reserved.
//

#import "ViewController.h"
#import "CycleViewController.h"
#import "CycleViewCommenController.h"

@interface ViewController ()
//<CycleAnimatorViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CycleViewController *cycleView = [[CycleViewController alloc] init];  // 创建图片轮转
    CycleViewCommenController *cycleView = [[CycleViewCommenController alloc]init];
    
    [self addChildViewController:cycleView];// 添加控制
    
    //在将控制器添加到self之后，将视图添加到view上之前，设置list
    cycleView.cycleImageUrls = @[@"http://pic2.sc.chinaz.com/files/pic/pic9/201512/apic16892.jpg",@"http://pic14.nipic.com/20110522/7411759_164157418126_2.jpg",@"http://pic.nipic.com/2007-11-09/2007119122519868_2.jpg",@"http://pic24.nipic.com/20121022/9252150_193011306000_2.jpg"];
    
    self.tableView.tableHeaderView = cycleView.view;
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    
//    cycleView.delegate = self;
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
