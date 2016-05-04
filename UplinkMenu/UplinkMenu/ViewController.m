//
//  ViewController.m
//  UplinkMenu
//
//  Created by  江苏 on 16/5/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "category.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *categoryTableView;
@property (strong, nonatomic) IBOutlet UITableView *subcategoryTableView;

@property(strong,nonatomic)NSArray* categories;

@end

@implementation ViewController

-(NSArray *)categories{
    if (_categories==nil) {
        _categories=[category category];
    }
    return _categories;
}

-(void)viewDidLoad{
    
    self.categoryTableView.tableFooterView=[[UIView alloc]init];
    
    self.subcategoryTableView.tableFooterView=[[UIView alloc]init];
    
}

#pragma mark-tableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.categoryTableView) {
        return self.categories.count;
    }else{
        category* cate=self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        
        return cate.subcategories.count;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==self.categoryTableView) {
        
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
        
        category* category=self.categories[indexPath.row];
        
        cell.imageView.image=[UIImage imageNamed:category.icon];
        cell.imageView.highlightedImage=[UIImage imageNamed:category.highlighted_icon];
        
        cell.textLabel.text=category.name;
        cell.textLabel.highlightedTextColor=[UIColor greenColor];
        cell.textLabel.font=[UIFont systemFontOfSize:14];
        
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subcategoryCell" forIndexPath:indexPath];
        
        category* cate=self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        
        cell.textLabel.text=cate.subcategories[indexPath.row];
       
        cell.textLabel.font=[UIFont systemFontOfSize:13];
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.categoryTableView) {
        [self.subcategoryTableView reloadData];
    }
}
@end
