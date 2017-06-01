//
//  WYNewsModel.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/27.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewsModel : NSObject
//新闻的ID
@property(nonatomic ,copy)NSString *ID;
//新闻的标题
@property (nonatomic ,copy)NSString *title;
//新闻的内容
@property (nonatomic , copy)NSString  *profile;
//新闻的类型
@property (nonatomic ,copy)NSString *c_type;
//作者
@property (nonatomic , copy)NSString  *author;
//类别
@property (nonatomic , copy)NSString  *category;
//图片的url
@property (nonatomic , copy)NSString  *fm_pic;

+ (instancetype)newsModelWithDic:(NSDictionary *)dic;
@end
