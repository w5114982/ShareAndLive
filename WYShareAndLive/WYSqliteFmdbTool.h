//
//  WYSqliteFmdbTool.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/25.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYSqliteFmdbTool : NSObject
+ (NSMutableArray *)selectedChannels;
+ (void)delectedAll;
+ (void)addChannelWithDic:(NSDictionary *)dic;
+ (void)addChannelsWithArr:(NSMutableArray *)arr;
@end
