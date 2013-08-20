//
//  RightPopViewController.m
//  weibo
//
//  Created by 王 强 on 13-8-10.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "RightPopViewController.h"

@interface RightPopViewController ()

@end

@implementation RightPopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel * lb = [[UILabel alloc ]initWithFrame:CGRectMake(10, 10, 60, 20)];
    [lb setText:@"hao"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, 150,300 );
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
