//
//  WYSqliteFmdbTool.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/25.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYSqliteFmdbTool.h"
#import "FMDB.h"
@implementation WYSqliteFmdbTool
static FMDatabase *db;


+(void)initialize{
    //沙盒路径
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject]stringByAppendingPathComponent:@"FavouriteChannel"];
    db = [FMDatabase databaseWithPath:filePath];
    if ([db open]) {
        //创建表语句
        NSString *creatTableSql = @"CREATE TABLE IF NOT EXISTS t_FavouriteChannel(title text,urlString text , key text)";
        //创建表
        BOOL result = [db executeUpdate:creatTableSql];
        if (result) {
            NSLog(@"success");
        }
        else{
            NSLog(@"fail");
        }
        NSMutableArray *dbArr = [self selectedChannels];
        if (dbArr.count == 0) {
            NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"DefaultURLs.plist" ofType:nil]];
            for (NSDictionary *temp in arr) {
                [self addChannelWithDic:temp];
            }
        }
        NSLog(@"%@",filePath);
    }
}
//添加数据
+(void)addChannelWithDic:(NSDictionary*)dic{
    [db executeUpdateWithFormat:@"INSERT INTO t_FavouriteChannel(title,urlString,key) VALUES(%@,%@,%@)",dic[@"title"],dic[@"urlString"],dic[@"key"]];
}

+(NSMutableArray*)selectedChannels{
    
    NSMutableArray *result = [NSMutableArray new];
    FMResultSet *set = [db executeQuery:@"SELECT *FROM t_FavouriteChannel"];
    while (set.next) {
        NSString *title = [set stringForColumn:@"title"];
        NSString *urlString = [set stringForColumn:@"urlString"];
        NSString *key = [set stringForColumn:@"key"];
        [result addObject:@{@"title":title,@"urlString":urlString,@"key":key}];
    }
    return result;
}

+(void)delectedChannelWithTitle:(NSString*)title{
    
    if ([db open]) {
        NSString *deleteSql = [NSString stringWithFormat:@"DELETE FROM t_FavouriteChannel where title = %@",title];
        BOOL res = [db executeUpdate:deleteSql];
        if (!res) {
            NSLog(@"失败");
        }
        else{
            NSLog(@"成功");
        }
    }
}
+(void)delectedAll{
    
    NSString * sql = @"delete from t_FavouriteChannel";
    BOOL res = [db executeUpdate:sql];
    if (res) {
        NSLog(@"delected All success");
    }
    else{
        NSLog(@"delected fail");
    }
    
}

+(void)addChannelsWithArr:(NSMutableArray *)arr{
    for (NSDictionary *temp in arr) {
        [self addChannelWithDic:temp];
    }
}

@end
