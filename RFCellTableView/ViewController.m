//
//  ViewController.m
//  RFCellTableView
//
//  Created by 冯剑 on 2018/3/15.
//  Copyright © 2018年 冯剑. All rights reserved.
//

#import "ViewController.h"
#import "ContentView.h"

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define HeaderViewH 250
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) ContentView *contentView;
@property (nonatomic, strong) UITableView *mainTabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 顶部悬浮视图
    UILabel *navView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    navView.backgroundColor = [UIColor cyanColor];
    navView.textAlignment = 1;
    navView.text = @"cell中加tabelView";
    [self.view addSubview:navView];
    
    // 滚动视图上部
    UITableView *mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0,50, SCREEN_WIDTH, SCREEN_HEIGHT - 50) style:UITableViewStylePlain];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    mainTable.bounces = NO;
    mainTable.contentInset = UIEdgeInsetsMake(HeaderViewH, 0, 0, 0);
    [self.view addSubview:mainTable];
    self.mainTabel = mainTable;
    
    // 主视图头部
    UILabel *headView = [[UILabel alloc] initWithFrame:CGRectMake(0, -HeaderViewH, CGRectGetWidth(self.view.frame), HeaderViewH)];
    headView.backgroundColor = [UIColor grayColor];
    headView.textAlignment = 1;
    headView.text = @"main tabelView的头部视图";
    [mainTable addSubview:headView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT - 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ContentView *content = [[ContentView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 50)];
    [cell.contentView addSubview:content];
    self.contentView = content;
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.mainTabel) {
        if (scrollView.contentOffset.y < 0) {
            self.contentView.tableView.scrollEnabled = NO;
        }else{
            self.contentView.tableView.scrollEnabled = YES;
        }
    }
    
    NSLog(@"%f",scrollView.contentOffset.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
