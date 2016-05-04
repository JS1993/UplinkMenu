//
//  CategoryTableViewController.m
//  UplinkMenu
//
//  Created by  江苏 on 16/5/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "category.h"

@interface CategoryTableViewController ()

@property(strong,nonatomic)NSArray* categories;

@end

@implementation CategoryTableViewController

-(NSArray *)categories{
    if (_categories==nil) {
        _categories=[category category];
    }
    return _categories;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView=[[UIView alloc]init];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* indentifier=@"cell";
    
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    category* category=self.categories[indexPath.row];
    
    cell.imageView.image=[UIImage imageNamed:category.icon];
    cell.imageView.highlightedImage=[UIImage imageNamed:category.highlighted_icon];
    
    cell.textLabel.text=category.name;
    cell.textLabel.highlightedTextColor=[UIColor greenColor];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if ([self.delegate respondsToSelector:@selector(categoryTableViewController:didSelectedCellWithCategories:)]) {
        
        [self.delegate categoryTableViewController:self didSelectedCellWithCategories:[self.categories[indexPath.row] subcategories]];
        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
