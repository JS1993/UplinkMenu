//
//  SubcategoryTableViewController.m
//  UplinkMenu
//
//  Created by  江苏 on 16/5/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "SubcategoryTableViewController.h"

@interface SubcategoryTableViewController ()

@property(nonatomic,strong)NSArray* subcategories;
@end

@implementation SubcategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView=[[UIView alloc]init];
}

-(void)categoryTableViewController:(CategoryTableViewController *)categoryTableViewController didSelectedCellWithCategories:(NSArray *)categories{
    
    self.subcategories=categories;
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.subcategories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* ID=@"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text=self.subcategories[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:13];
    
    return cell;
}



@end
