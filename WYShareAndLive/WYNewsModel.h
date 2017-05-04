//
//  WYNewsModel.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/3.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewsModel : NSObject
/**新闻ID*/
@property(nonatomic,copy)NSString *postid;
/**webView界面*/
@property(nonatomic,copy)NSString *url_3w;
/**关注数*/
@property(nonatomic,retain)NSNumber *votecount;
/**跟帖数*/
@property(nonatomic,retain)NSNumber *replyCount;
/**新闻长标题*/
@property (nonatomic,copy)NSString *ltitle;
/**新闻简介*/
@property(nonatomic,copy)NSString *digest;
/***/
@property(nonatomic,copy)NSString *url;
/**postid*/
@property(nonatomic,copy)NSString *docid;
/**新闻标题*/
@property(nonatomic,copy)NSString *title;
/**新闻来源*/
@property(nonatomic,copy)NSString *source;
/**新闻时间*/
@property(nonatomic,copy)NSString *Imodify;
/***/
@property(nonatomic,copy)NSString *priority;
/**新闻类型标识*/
@property(nonatomic,copy)NSString *boardid;
/**新闻图片*/
@property(nonatomic,copy)NSString *imgsrc;
/***/
@property(nonatomic,copy)NSString *subtitle;
/**新闻发生的时间*/
@property(nonatomic,copy)NSString *ptime;
/***/
@property(nonatomic,copy)NSString *TAG;
/**专题新闻特有属性*/

/**专题类型*/

@end
