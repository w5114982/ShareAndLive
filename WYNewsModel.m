//
//  WYNewsModel.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/27.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYNewsModel.h"

@implementation WYNewsModel
+ (instancetype)newsModelWithDic:(NSDictionary *)dic{
    WYNewsModel *model = [WYNewsModel new];
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqual:@"id"]) {
        self.ID = value;
    }
}
@end
