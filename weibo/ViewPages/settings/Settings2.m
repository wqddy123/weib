//
//  Settings.m
//  weibo
//
//  Created by 王 强 on 13-8-9.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "Settings2.h"

@interface Settings2 ()

@end

@implementation Settings2


@synthesize tv;

- (id)init
{
    self = [super init];
    if (self) {
        
        tv = [[UITableView   alloc ]initWithFrame:CGRectMake(0, 0, baseVeiwSize.width, baseVeiwSize.height-75) style:UITableViewStyleGrouped];
        UIView *a = [[UIView alloc]initWithFrame:CGRectZero];
        a.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        
        tv.backgroundView = a;
        //        tv.backgroundColor = [UIColor whiteColor];
        tv.dataSource = self;
        

        [self.view addSubview:tv];
    }
    
    return self;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLable.text = @"设置";
    //左按钮
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *leftBtn = [[UIButton alloc ]init];
    leftBtn.frame = CGRectMake(100, 100, 40, 40);
    UIImage * leftimg1 = [UIImage imageNamed:@"navigationbar_back.png"];
    UIImage * leftimg2 = [UIImage imageNamed:@"navigationbar_back_highlighted.png"];
    [leftBtn setImage:leftimg1 forState:UIControlStateNormal];
    [leftBtn setImage:leftimg2 forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * lbtn = [[UIBarButtonItem alloc ] initWithCustomView:leftBtn];
    //self.navigationItem.backBarButtonItem  = nil;
    
    self.navigationItem.hidesBackButton = YES;
    [self.navigationItem setLeftBarButtonItem:lbtn];
//    self.navigationItem.backBarButtonItem = lbtn;
    
    
}

-(void)backView:(UIButton *) sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
// 多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
//每组多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rowCount = 1;
    switch (section) {
        case 2:
            rowCount = 2;
            break;
        case 4:
            rowCount = 2;
            break;
        default:
            break;
    }
    return rowCount;
}
//返回每一行信息
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    
    
    
    
    UIButton * btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[[UIImage imageNamed:@"common_button_big_red.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 6, 5, 6)] forState:UIControlStateNormal];
    [btn setTitle:@"退出当前帐号" forState :UIControlStateNormal];
    
    UIImage *timg =[[UIImage imageNamed:@"new_dot@2x.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4) ] ;
    
    UIButton * btn2 = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 22, 20)];
    [btn2 setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    [btn2 setBackgroundImage:timg forState:UIControlStateNormal];
    [btn2 setTitle:@"3" forState:UIControlStateNormal];
    [btn2.titleLabel setFont:[UIFont systemFontOfSize:13]];
    btn2.titleLabel.textColor =  [UIColor whiteColor];
    
    
    [cell.textLabel setFont:[UIFont systemFontOfSize:15]];
    
    
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
    lb.textAlignment = UITextAlignmentCenter;
    [lb setFont:[UIFont systemFontOfSize:13]];
    lb.textColor = [UIColor grayColor];
    
    UISwitch * sw = [[UISwitch alloc]initWithFrame:CGRectMake( 0,0,30,20)];
    
    //UIImageView * newImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"skin_icon_new.png"]];
    
    
    
    
    int s = indexPath.section;
    int r = indexPath.row;
    
    switch (s) {
        case 0:
            cell.textLabel.text = @"字号设置";
            
            lb.text = @"中";
            [cell setAccessoryView:lb];
            
            
            break;
            
        case 1:
            cell.textLabel.text = @"图片质量设置";
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
        case 2:
            if(r==0){
                
                cell.textLabel.text = @"提示音";
                [cell setAccessoryView:sw];

            }else{
                cell.textLabel.text = @"主题";
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

                
            }
            break;
        case 3:
            
            cell.textLabel.text = @"多语言环境设置";
            
            lb.text = @"简体中文";
            [cell setAccessoryView:lb];

            break;
        case 4:
            switch (r) {
                case 0:
                    cell.textLabel.text = @"清除图片缓存";
                    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                    
                    break;
                    
                case 1:
                    cell.textLabel.text = @"清空搜索历史";
                    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                    
                    break;
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    if (indexPath.section == 2 || indexPath.section == 4) {
        
        if(indexPath.row == 0)
        {
            UIImage *i1 = [UIImage imageNamed:@"common_card_top_background@2x.png"];
            UIImage *si1 = [UIImage imageNamed:@"common_card_top_background_highlighted@2x.png"];
            
            UIImageView *iv1 = [[UIImageView alloc ]initWithImage:[i1 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
            UIImageView *sv1 = [[UIImageView alloc ]initWithImage:[si1 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
            cell.backgroundView = iv1;
            cell.selectedBackgroundView = sv1;
            
        }else{
            UIImage *i2 = [UIImage imageNamed:@"common_card_bottom_background@2x.png"];
            UIImage *si2 = [UIImage imageNamed:@"common_card_bottom_background_highlighted@2x.png"];
            UIImageView *iv2 = [[UIImageView alloc ]initWithImage:[i2 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
            UIImageView *sv2 = [[UIImageView alloc ]initWithImage:[si2 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
            
            cell.backgroundView = iv2;
            cell.selectedBackgroundView = sv2;
        }
    }else{
        UIImage *i1 = [UIImage imageNamed:@"common_card_background@2x.png"];
        UIImage *si1 = [UIImage imageNamed:@"common_card_background_highlighted@2x.png"];
        
        UIImageView *iv1 = [[UIImageView alloc ]initWithImage:[i1 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10)] ];
        UIImageView *sv1 = [[UIImageView alloc ]initWithImage:[si1 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10)] ];
        cell.backgroundView = iv1;
        cell.selectedBackgroundView = sv1;
        
    }
    
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    
    cell.textLabel.highlightedTextColor =[UIColor blackColor];
    
    
    
    
    
    return cell;
    
}
@end
