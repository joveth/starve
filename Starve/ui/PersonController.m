//
//  PersonController.m
//  Starve
//
//  Created by Shuwei on 15/10/28.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "PersonController.h"

@interface PersonController ()

@end

@implementation PersonController{
    MBProgressHUD *hud;
    NSMutableArray *list;
    DBHelper *db;
    CGFloat width;
    BOOL flag;
    UIBarButtonItem *rightItem;
    UIImage *attac;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    db = [DBHelper sharedInstance];
    self.title=@"饥荒人物";
    list = [[NSMutableArray alloc] init];
    hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:hud];
    hud.labelText = @"加载中...";
    [hud show:YES];
    rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"switch"] style:UIBarButtonItemStyleBordered target:self action:@selector(showHint:)];
    width = [UIScreen mainScreen].applicationFrame.size.width-55;
    rightItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem =rightItem;
    self.tableView.tableFooterView=[[UIView alloc] init];
    //原图片
    UIImage * img = [UIImage imageNamed:@"tools.png"];
    //转化为位图
    CGImageRef temImg = img.CGImage;
    temImg=CGImageCreateWithImageInRect(img.CGImage, CGRectMake(1780, 900, 96, 96));
    //得到新的图片
    attac = [UIImage imageWithCGImage:temImg];
}
-(IBAction)showHint:(id)sender{
    flag = !flag;
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self load];
    
}
-(void)load{
    if([db openDB]){
        list = [db getStarveByType:@"1"];
        [self.tableView reloadData];
    }
    [hud hide:YES];
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
    cell.backgroundColor = [UIColor whiteColor];
    UILabel *nameLabel =(UILabel*)[cell viewWithTag:1];
    UIImageView *image=(UIImageView*)[cell viewWithTag:2];
    UILabel *contentLabel=(UILabel*)[cell viewWithTag:3];
    UIImageView *hunger =(UIImageView*)[cell viewWithTag:4];
    UIImageView *spirit =(UIImageView*)[cell viewWithTag:5];
    UIImageView *life =(UIImageView*)[cell viewWithTag:6];
    UIImageView *attack =(UIImageView*)[cell viewWithTag:7];
    
    UILabel *p1=(UILabel*)[cell viewWithTag:8];
    UILabel *p2=(UILabel*)[cell viewWithTag:9];
    UILabel *p3=(UILabel*)[cell viewWithTag:10];
    UILabel *p4=(UILabel*)[cell viewWithTag:11];
    
    if(nameLabel==nil){
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 4, width, 22)];
        nameLabel.lineBreakMode=NSLineBreakByWordWrapping;
        nameLabel.numberOfLines=0;
        nameLabel.tag=1;
        [cell addSubview:nameLabel];
    }
    if(image==nil){
        image = [[UIImageView alloc]init];
        image.tag=2;
        [cell addSubview:image];
    }
    if(contentLabel==nil){
        contentLabel = [[UILabel alloc] init];
        contentLabel.lineBreakMode=NSLineBreakByWordWrapping;
        contentLabel.numberOfLines=0;
        contentLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        contentLabel.tag=3;
        [cell addSubview:contentLabel];
    }
    if(hunger==nil){
        hunger = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hunger"]];
        hunger.tag=4;
        [cell addSubview:hunger];
    }
    if(spirit==nil){
        spirit = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"spirit"]];
        spirit.tag=5;
        [cell addSubview:spirit];
    }
    if(life==nil){
        life = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life"]];
        life.tag=6;
        [cell addSubview:life];
    }
    if(attack==nil){
        attack = [[UIImageView alloc]initWithImage:attac];
        attack.tag=7;
        [cell addSubview:attack];
    }
    if(p1==nil){
        p1 = [[UILabel alloc] init];
        p1.tag=8;
        p1.font = [UIFont fontWithName:@"Arial" size:12.0f];
        [cell addSubview:p1];
    }
    if(p2==nil){
        p2 = [[UILabel alloc] init];
        p2.tag=9;
        p2.font = [UIFont fontWithName:@"Arial" size:12.0f];
        [cell addSubview:p2];
    }
    if(p3==nil){
        p3 = [[UILabel alloc] init];
        p3.tag=10;
        p3.font = [UIFont fontWithName:@"Arial" size:12.0f];
        [cell addSubview:p3];
    }
    if(p4==nil){
        p4 = [[UILabel alloc] init];
        p4.tag=11;
        p4.font = [UIFont fontWithName:@"Arial" size:12.0f];
        [cell addSubview:p4];
    }
    
    DataBean *bean = [list objectAtIndex:indexPath.row];
    if(flag){
        [nameLabel removeFromSuperview];
        [image removeFromSuperview];
        [contentLabel removeFromSuperview];
        [hunger removeFromSuperview];
        [spirit removeFromSuperview];
        [life removeFromSuperview];
        [attack removeFromSuperview];
        [p1 removeFromSuperview];
        [p2 removeFromSuperview];
        [p3 removeFromSuperview];
        [p4 removeFromSuperview];
        cell.imageView.image=[UIImage imageNamed:bean.image];
        cell.textLabel.text=[NSString stringWithFormat:@"%@(%@)",bean.name,bean.enName];
    }else{
    
    if(bean){
        nameLabel.text = [NSString stringWithFormat:@"%@(%@)",bean.name,bean.enName];
        if(![Common isEmptyString:bean.image]){
            image.image = [UIImage imageNamed:bean.image];
        }
        if(![Common isEmptyString:bean.content]){
            CGSize size = [bean.content sizeWithFont:[UIFont fontWithName:@"Arial" size:12.0f] constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:NSLineBreakByWordWrapping];
        
            contentLabel.frame=CGRectMake(50, 30, width, size.height);
            contentLabel.text = bean.content;
            image.frame = CGRectMake(4, (size.height)/2, 40, 40);
            p1.text=bean.p1;
            p2.text=bean.p2;
            p3.text=bean.p3;
            p4.text=bean.p4;
            hunger.frame=CGRectMake(50, size.height+34, 20, 20);
            p1.frame = CGRectMake(72, size.height+34, 48, 20);
            spirit.frame=CGRectMake(120, size.height+34, 20, 20);
            p2.frame = CGRectMake(142, size.height+34, 48, 20);
            life.frame=CGRectMake(190, size.height+34, 20, 20);
            p3.frame = CGRectMake(212, size.height+34, 48, 20);
            attack.frame=CGRectMake(260, size.height+34, 20, 20);
            p4.frame = CGRectMake(282, size.height+34, 48, 20);
            
        }else{
            image.frame = CGRectMake(8, 2, 40, 40);
        }
        
    }
        
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(flag){
        return 44;
    }
    DataBean *bean = [list objectAtIndex:indexPath.row];
    if(bean){
        if(![Common isEmptyString:bean.content]){
            CGSize size = [bean.content sizeWithFont:[UIFont fontWithName:@"Arial" size:12.0f] constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:NSLineBreakByWordWrapping];
            return size.height+64;
        }
    }
    
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DataBean *bean = [list objectAtIndex:indexPath.row];
    [ShareData shareInstance].bean=bean;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    WebController *show = [[WebController alloc] init];
    [self.navigationController pushViewController:show animated:YES];
}
@end
