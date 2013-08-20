//
//  Settings.m
//  weibo
//
//  Created by 王 强 on 13-8-9.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "Settings.h"
#import "Settings2.h"

@interface Settings ()

@end

@implementation Settings


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
        [self.btn addTarget:self action:@selector(pushSettings2:) forControlEvents:UIControlEventTouchUpInside];
        tv.dataSource = self;
        [self.view addSubview:tv];
    }
    
    return self;
}

-(void)pushSettings2:(UIButton *) sender
{
    
    Settings2 *s2 = [[Settings2 alloc]init];
    [self.navigationController pushViewController:s2 animated:YES];
}



#pragma make-
#pragma make UIViewTableSource;

// 多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
//每组多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rowCount = 1;
    switch (section) {
        case 2:
            rowCount = 2;
            break;
        case 3:
            rowCount = 2;
            break;
        case 4:
            rowCount = 5;
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
    
    UIImageView * newImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"skin_icon_new.png"]];
    
    
    
    
    int s = indexPath.section;
    int r = indexPath.row;
    
    switch (s) {
        case 0:
            cell.textLabel.text = @"草稿箱";
            [cell setAccessoryView:btn2];
            

            break;
        
        case 1:
            cell.textLabel.text = @"帐号管理";
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
        case 2:
            if(r==0){
                
                cell.textLabel.text = @"阅读模式";
                lb.text = @"有图模式";
                [cell setAccessoryView:lb];
            }else{
                cell.textLabel.text = @"主题";
                
                lb.text = @"经典主题";
                [cell setAccessoryView:lb];

            }
            break;
        case 3:
            
            if(r==0){
                cell.textLabel.text = @"隐私设置";
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

            }else{
                cell.textLabel.text = @"帐号安全";
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

            }
            break;
        case 4:
            switch (r) {
                case 0:
                    cell.textLabel.text = @"官方微博";
                    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

                    break;
                   
                case 1:
                    cell.textLabel.text = @"意见反馈";
                    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

                    break;
                case 2:
                    cell.textLabel.text = @"给我评分";
                    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

                    break;
                case 3:
                    cell.textLabel.text = @"信版本检测";
                    [cell setAccessoryView:newImg];
                    break;
                case 4:
                    cell.textLabel.text = @"关于";
                    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

                    break;
                    
                default:
                    break;
            }
            break;
        case 5:
//            UIButton * btn = [UIButton ]
//            UIButton * btn = [[UIButton allloc] ini];
            btn.frame = CGRectMake(2, 0, 296, 43);
            [cell.contentView addSubview:btn];
            break;
            
        default:
            break;
    }
    
        if (indexPath.section == 2 || indexPath.section == 3) {
            
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
        }else if (indexPath.section ==4)
        {
            if(indexPath.row == 0)
            {
                UIImage *i1 = [UIImage imageNamed:@"common_card_top_background@2x.png"];
                UIImage *si1 = [UIImage imageNamed:@"common_card_top_background_highlighted@2x.png"];
                
                UIImageView *iv1 = [[UIImageView alloc ]initWithImage:[i1 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
                UIImageView *sv1 = [[UIImageView alloc ]initWithImage:[si1 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
                cell.backgroundView = iv1;
                cell.selectedBackgroundView = sv1;
                
            }else if(indexPath.row ==4){
                UIImage *i2 = [UIImage imageNamed:@"common_card_bottom_background@2x.png"];
                UIImage *si2 = [UIImage imageNamed:@"common_card_bottom_background_highlighted@2x.png"];
                UIImageView *iv2 = [[UIImageView alloc ]initWithImage:[i2 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
                UIImageView *sv2 = [[UIImageView alloc ]initWithImage:[si2 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
                cell.backgroundView = iv2;
                cell.selectedBackgroundView = sv2;
            }else{
                UIImage *i3 = [UIImage imageNamed:@"common_card_middle_background@2x.png"];
                UIImage *si3 = [UIImage imageNamed:@"common_card_middle_background_highlighted@2x.png"];
                UIImageView *iv3 = [[UIImageView alloc ]initWithImage:[i3 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
                UIImageView *sv3 = [[UIImageView alloc ]initWithImage:[si3 resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10,10, 10) ] ];
                cell.backgroundView = iv3;
                cell.selectedBackgroundView = sv3;
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
