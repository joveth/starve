//
//  AboutController.m
//  Starve
//
//  Created by Shuwei on 15/10/28.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "AboutController.h"

@interface AboutController ()

@end

@implementation AboutController{
    NSString *desc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"关于应用";
    self.tableView.tableFooterView=[[UIView alloc] init];
    self.tableView.backgroundColor=[Common colorWithHexString:@"e0e0e0"];
    
    desc= @"本应用中主要数据来自百度贴吧，中文WIFI及网友提供，本人对数据进行收集整理，并顺带纠错，如果你发现应用中的数据对你造成了侵权，请及时与我联系。";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return 3;
    }
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellIdentifier";
    UITableViewCell    *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text=@"";
    cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines=0;
    if(indexPath.section==0){
        if(indexPath.row==0){
            cell.textLabel.text=@"作者 jov";
        }
        if(indexPath.row==1){
            cell.textLabel.text=@"Q Q 247911950";
        }
        if(indexPath.row==2){
            cell.textLabel.text=@"邮箱 funny_ba@163.com";
        }
    }else{
        cell.textLabel.text=desc;
    }
    return cell;
}
//secltion head
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *myHeader = [[UIView alloc] init];
    UILabel *myLabel = [[UILabel alloc] init];
    [myLabel setFrame:CGRectMake(8, 5, 200, 20)];
    [myLabel setTag:101];
    [myLabel setAlpha:0.5];
    [myLabel setFont: [UIFont fontWithName:@"Arial" size:14]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myHeader setBackgroundColor:[Common colorWithHexString:@"#e0e0e0"]];
    
    switch (section) {
        case 1:
            [myLabel setText:[NSString stringWithFormat:@"软件声明"]];
            break;
        case 2:
            [myLabel setText:[NSString stringWithFormat:@"作者的话"]];
            break;
        case 3:
            [myLabel setText:[NSString stringWithFormat:@"给我留言"]];
            break;
        default:
            [myLabel setText:[NSString stringWithFormat:@" "]];
            break;
    }
    [myHeader addSubview:myLabel];
    return myHeader;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 22;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        return 44;
    }
    CGSize size = [desc sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] constrainedToSize:CGSizeMake(self.view.frame.size.width-16, 1000) lineBreakMode:NSLineBreakByWordWrapping];
    return size.height+100;
}
@end
