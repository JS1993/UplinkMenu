//
//  category.h
//  UplinkMenu
//
//  Created by  江苏 on 16/5/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface category : NSObject

@property(copy,nonatomic)NSString* icon;

@property(copy,nonatomic)NSString* highlighted_icon;

@property(copy,nonatomic)NSString* name;

@property(strong,nonatomic)NSArray* subcategories;

+(NSArray*)category;

@end
