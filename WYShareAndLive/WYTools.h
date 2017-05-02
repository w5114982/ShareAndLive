//
//  WYTools.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/2.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,animationType) {
    Show,
    Hide
};
@interface WYTools : NSObject
/**标题Label*/
+ (UILabel *)titleLabelWithFrame:(CGRect)frame;
/*子标题Label**/
+ (UILabel *)digestLabelWithFrame:(CGRect)frame;
/*跟帖数Label**/
+ (UILabel *)replyCountLabelWithFrame:(CGRect)frame;

/*跟帖数label的宽度**/
+ (void)replyCountLabelWidth:(NSNumber *)data Height:(CGFloat)Height font:(CGFloat)font view:(UILabel *)label;


/*时间label**/
+ (UILabel *)timeLabelWithFrame:(CGRect)frame;
/*时间戳转日期**/
+ (NSString *)timeStampToDate:(NSNumber *)time;

/*视频出现动画**/
+ (CAAnimationGroup *)animationGroupWithType:(animationType)type;
@end
