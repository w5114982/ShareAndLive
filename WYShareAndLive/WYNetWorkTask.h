//
//  WYNetWorkTask.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/9.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

//请求成功的block类型
typedef void(^successBlock)(id result);
typedef void(^FailBlock) (NSError *error);
@interface WYNetWorkTask : NSObject
/**
 * 返回值类型
 */
typedef NS_ENUM(NSUInteger,ResponseType)
{
    /**
     * JSON
     */
    ResponseTypeJSON,
    /*
     * XML
     **/
    ReponseTypeXML,
    
    /*
     * Data
     */
    ResponseTypeData,
};

/**
 *Body类型
 **/
typedef NS_ENUM(NSUInteger,BodyType){
    /**
     ** 字符串
     **/
    BodyTypeString,
    
    /**
     * 字典
     */
    BodyTypeDictonary
    
};
/**
 *
 *GET请求
 *
 * @param url     URL
 * @param parameter 参数
 * @param httpHeader 请求头
 * @param responseType 返回值类型
 * @param success 成功
 * @param fail 失败
 */

+ (void)getWithURL:(NSString *)url withParameter:(NSDictionary *)parameter withHttpHeader:(NSDictionary *)httpHeader withResponseType:(ResponseType)responseType withSuccess:(successBlock)success withFail:(FailBlock)fail;

/*
 * POST请求
 *
 * @param url URL
 * @param body  body体
 * @param bodyType body 类型
 * @param httpHeader 请求头
 * @param responseType 返回值类型
 * @param success 成功
 * @param fail  失败
 
 */

+ (void)postWithURL:(NSString *)url  withBody:(id)body withBodyType:(BodyType)bodyType withHttpHeader:(NSDictionary *)httpHeader withResponseType:(ResponseType)responseType withSuccess:(successBlock)success withFail:(FailBlock)fail;




@end
