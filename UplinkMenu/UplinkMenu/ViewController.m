//
//  ViewController.m
//  UplinkMenu
//
//  Created by  江苏 on 16/5/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "CategoryTableViewController.h"
#import "SubcategoryTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CategoryTableViewController* cateVC=[[CategoryTableViewController alloc]init];
    
    cateVC.view.frame=CGRectMake(0, 0, self.view.bounds.size.width/2, self.view.bounds.size.height);
    
    [self.view addSubview:cateVC.view];
    
    [self addChildViewController:cateVC];
    
    SubcategoryTableViewController* subcateVC=[[SubcategoryTableViewController alloc]init];
    
    //添加导航栏后需要手动设置一下contentInset属性，否则会被遮住，但是第一个控件不需要自己设置
    subcateVC.tableView.contentInset=UIEdgeInsetsMake(64, 0, 0, 0);
    
    cateVC.delegate=subcateVC;
    
    subcateVC.view.frame=CGRectMake(self.view.bounds.size.width/2, 0, self.view.bounds.size.width/2, self.view.bounds.size.height);
    
    [self.view addSubview:subcateVC.view];
    
    [self addChildViewController:subcateVC];
}



@end
