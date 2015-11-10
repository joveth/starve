//
//  QuickLookController.m
//  IsaacNew
//
//  Created by Shuwei on 15/10/13.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "QuickLookController.h"

@interface QuickLookController ()

@end

@implementation QuickLookController{
    NSMutableArray *list;
    MBProgressHUD *HUD;
    DBHelper *db;
    NSMutableArray *isaacs;
    NSMutableArray *bosses;
    NSMutableArray *smolles;
    NSMutableArray *otheres;
    CGFloat width;
    NSInteger sect;
}

static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseHeaderIdentifier = @"HeaderCell";
- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"全物速览";
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.labelText = @"加载中...";
    [HUD show:YES];
    list = [[NSMutableArray alloc] init];
    isaacs = [[NSMutableArray alloc] init];
    width = [UIScreen mainScreen].applicationFrame.size.width/4;
    self.collectionView.backgroundColor=[UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseHeaderIdentifier];
    db = [DBHelper sharedInstance];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self load];
}

-(void)load{
    if([db openDB]){
        isaacs = [db getStarves];
    }
    [HUD hide:YES];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [isaacs count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.layer.borderWidth=0.3f;
    cell.layer.borderColor=[Common colorWithHexString:@"8a8a8a"].CGColor;
    cell.backgroundColor=[UIColor whiteColor];
    
    UILabel *name = (UILabel *)[cell.contentView viewWithTag:1] ;
    UIImageView *image =(UIImageView *)[cell.contentView viewWithTag:2] ;
    if(name==nil){
        name = [[UILabel alloc] initWithFrame:CGRectMake(1, 40, width-2, 20)];
        name.tag = 1;
        name.textAlignment=NSTextAlignmentCenter;
        name.font=[UIFont systemFontOfSize:10];
        [cell.contentView addSubview:name];
    }
    if(image==nil){
        image = [[UIImageView alloc] initWithFrame:CGRectMake((width-35)/2, 5, 35, 35)];
        image.tag = 2;
        [cell.contentView addSubview:image];
    }
    DataBean *bean = [isaacs objectAtIndex:indexPath.row];
    if(bean){
        name.text=bean.name;
        image.image=[UIImage imageNamed:bean.image];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    CGSize returnSize = CGSizeMake(width, 60);
    return returnSize;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ShowSearchController *show = [[ShowSearchController alloc] init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
    [ShareData shareInstance].bean = [isaacs objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:show animated:YES];
}

@end
