//
//  ToolController.m
//  Starve
//
//  Created by Shuwei on 15/11/10.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "ToolController.h"

@interface ToolController ()

@end

@implementation ToolController{
    MBProgressHUD *hud;
    NSMutableArray *list;
    DBHelper *db;
    CGFloat width;
    BOOL flag;
    UIBarButtonItem *rightItem;
    UISearchController *searchController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:hud];
    hud.labelText = @"加载中...";
    [hud show:YES];
    db = [DBHelper sharedInstance];
    self.title=@"工具";
    list = [[NSMutableArray alloc] init];
    rightItem = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        [button setBackgroundImage:[UIImage imageNamed:@"more2"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        barButtonItem;
    });
    rightItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem =rightItem;
    width = [UIScreen mainScreen].applicationFrame.size.width-55;
    self.tableView.tableFooterView=[[UIView alloc] init];
    searchController= [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = self;
    searchController.dimsBackgroundDuringPresentation = YES;
    searchController.hidesNavigationBarDuringPresentation = NO;
    searchController.searchBar.frame = CGRectMake(searchController.searchBar.frame.origin.x,searchController.searchBar.frame.origin.y, searchController.searchBar.frame.size.width, 44.0);
    searchController.searchBar.placeholder=@"搜索";
    self.tableView.tableHeaderView = searchController.searchBar;
}
-(IBAction)showMenu:(UIButton *)sender{
    CGPoint point =
    CGPointMake(sender.frame.origin.x + sender.frame.size.width / 2,
                64.0 + 3.0);
    NSArray *titles = @[@"工具", @"光源",@"生存",@"食物",@"科学",@"战斗",@"建筑",@"精炼",@"魔法",@"服饰",@"远古",@"全部"];
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point
                                                   titles:titles
                                               imageNames:@[@"Icon_Tools.png",@"Icon_Fire.png",@"Icon_Survival.png",@"Icon_Food.png",@"Icon_Science.png",@"Icon_Fight.png",@"Icon_Build.png",@"Icon_Refine.png",@"Icon_Magic.png",@"Icon_Dress.png",@"Icon_Acient.png",@""]];
    pop.delegate = self;
    [pop show];
}
- (void)didSelectedRowAtIndex:(NSInteger)index {
    [hud show:YES];
    [list removeAllObjects];
    if (index == 0) {
        self.title=@"工具";
        list =[db getStarveByType:@"5" andTag:@"1"];
    }else if(index == 1) {
        self.title=@"光源";
        list =[db getStarveByType:@"5" andTag:@"2"];
    }else if(index == 2) {
        self.title=@"生存";
        list =[db getStarveByType:@"5" andTag:@"3"];
    }else if(index == 3) {
        self.title=@"食物";
        list =[db getStarveByType:@"5" andTag:@"4"];
    }else if(index == 4) {
        self.title=@"科学";
        list =[db getStarveByType:@"5" andTag:@"5"];
    }else if(index == 5) {
        self.title=@"战斗";
        list =[db getStarveByType:@"5" andTag:@"6"];
    }else if(index == 6) {
        self.title=@"建筑";
        list =[db getStarveByType:@"5" andTag:@"7"];
    }else if(index == 7) {
        self.title=@"精炼";
        list =[db getStarveByType:@"5" andTag:@"8"];
    }else if(index == 8) {
        self.title=@"魔法";
        list =[db getStarveByType:@"5" andTag:@"9"];
    }else if(index == 9) {
        self.title=@"服饰";
        list =[db getStarveByType:@"5" andTag:@"10"];
    }else if(index == 10) {
        self.title=@"远古";
        list =[db getStarveByType:@"5" andTag:@"11"];
    }else if(index == 11) {
        self.title=@"全部";
        list =[db getStarveByType:@"5" ];
    }

    
    
    [self.tableView reloadData];
    [hud hide:YES];
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
        list = [db getStarveByType:@"5"];
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
    UILabel *tagLabel=(UILabel*)[cell viewWithTag:4];
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
    if(tagLabel==nil){
        tagLabel = [[UILabel alloc] init];
        tagLabel.lineBreakMode=NSLineBreakByWordWrapping;
        tagLabel.numberOfLines=0;
        tagLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        tagLabel.tag=4;
        [cell addSubview:tagLabel];
    }
    DataBean *bean = [list objectAtIndex:indexPath.row];
    if(flag){
        [nameLabel removeFromSuperview];
        [image removeFromSuperview];
        [contentLabel removeFromSuperview];
        cell.imageView.image=[UIImage imageNamed:bean.image];
        cell.textLabel.text=[NSString stringWithFormat:@"%@",bean.name];
    }else{
        
        if(bean){
            nameLabel.text = [NSString stringWithFormat:@"%@",bean.name];
            if(![Common isEmptyString:bean.image]){
                image.image = [UIImage imageNamed:bean.image];
            }
            if(![Common isEmptyString:bean.content]){
                CGSize size = [bean.content sizeWithFont:[UIFont fontWithName:@"Arial" size:12.0f] constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:NSLineBreakByWordWrapping];
                contentLabel.frame=CGRectMake(50, 30, width, size.height);
                contentLabel.text = bean.content;
                image.frame = CGRectMake(4, (size.height+10)/2, 40, 40);
                tagLabel.frame=CGRectMake(50, size.height+35, width, 20);
                tagLabel.text = [NSString stringWithFormat:@"%@,%@",bean.p1,bean.p2];;
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
            
            return size.height+60;
        }
    }
    
    return 44;
}
-(void)updateSearchResultsForSearchController:(UISearchController *)sController {
    NSString *searchString = [searchController.searchBar text];
    if(![Common isEmptyString:searchString]){
        list = [db getStarveByType:@"5" andKey:searchString];
        [self.tableView reloadData];
    }
}

@end
