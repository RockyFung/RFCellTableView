//
//  ContentView.m
//  RFCellTableView
//
//  Created by 冯剑 on 2018/3/15.
//  Copyright © 2018年 冯剑. All rights reserved.
//

#import "ContentView.h"
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT    [[UIScreen mainScreen] bounds].size.height
@interface ContentView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ContentView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    
    UILabel *header = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    header.backgroundColor = [UIColor blueColor];
    header.textAlignment = 1;
    header.text = @"第一栏tab        第二栏tab          第三栏tab";
    [self addSubview:header];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, self.bounds.size.height - 50) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.scrollEnabled = NO;
    [self addSubview:tableView];
    self.tableView = tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId2"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId2" forIndexPath:indexPath];
    cell.textLabel.text = @"contentview中的tableview";
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    

}

@end
