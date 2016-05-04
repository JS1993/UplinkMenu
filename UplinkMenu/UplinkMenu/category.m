//
//  category.m
//  UplinkMenu
//
//  Created by  江苏 on 16/5/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "category.h"

@implementation category

-(instancetype)initWithDict:(NSDictionary*)dict{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)categoryWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
+(NSArray*)category{
    NSMutableArray* arrM=[NSMutableArray array];
    NSArray* arr=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"]];
    for (NSDictionary* dic in arr ) {
        [arrM addObject:[self categoryWithDict:dic]];
    }
    return arrM;
}

@end
