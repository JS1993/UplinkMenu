//
//  CategoryTableViewController.h
//  UplinkMenu
//
//  Created by  江苏 on 16/5/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryTableViewController;

@protocol CategoryTableViewControllerDelegate <NSObject>

@optional

-(void)categoryTableViewController:(CategoryTableViewController *)categoryTableViewController didSelectedCellWithCategories:(NSArray*)categories;

@end

@interface CategoryTableViewController : UITableViewController

@property(nonatomic,weak)id<CategoryTableViewControllerDelegate> delegate;

@end
