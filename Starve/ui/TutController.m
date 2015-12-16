//
//  TutController.m
//  Starve
//
//  Created by Shuwei on 15/11/10.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "TutController.h"

@interface TutController ()

@end

@implementation TutController{
    NSArray *list;
    NSArray *htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"新手攻略";
    list = [NSArray arrayWithObjects:@"作者游戏心得",@"新手攻略一",@"新手攻略二",@"新手百天攻略",@"新手简单过寒冬",@"最实用的5个食谱",@"四季boss攻略一",@"四季boss攻略二",@"常见boss攻略",@"游戏介绍", nil];
    htmls = [NSArray arrayWithObjects:@"b8",@"b0",@"b3",@"b1",@"b2",@"b4",@"b5",@"b6",@"b7",@"baseinfor" ,nil];
    self.tableView.tableFooterView=[[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [list count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellIdentifier";
    UITableViewCell    *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    cell.textLabel.text=[list objectAtIndex:indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [ShareData shareInstance].urltype=nil;
    DataBean *bean = [[DataBean alloc] init];
    bean.html =[htmls objectAtIndex:indexPath.row];
    bean.name=[list objectAtIndex:indexPath.row];
    [ShareData shareInstance].bean=bean;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    WebController *show = [[WebController alloc] init];
    [self.navigationController pushViewController:show animated:YES];
}
@end
