//
//  WYTools.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/2.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYTools.h"

@implementation WYTools
+(UILabel *)titleLabelWithFrame:(CGRect)frame{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
    titleLabel.textColor  =[UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    
    
    return titleLabel;
}


+ (UILabel *)digestLabelWithFrame:(CGRect)frame{
    UILabel * digestLabel = [[UILabel alloc] initWithFrame:frame];
    digestLabel.textColor= [UIColor grayColor];
    digestLabel.numberOfLines = 0;
    
    return digestLabel;
}

+ (UILabel *)replyCountLabelWithFrame:(CGRect)frame{
    UILabel *replyLabel = [[UILabel alloc] initWithFrame:frame];
    replyLabel.textColor = [UIColor grayColor];
    replyLabel.numberOfLines = 0;
    replyLabel.layer.borderWidth =1;
    replyLabel.layer.cornerRadius = 8;
    replyLabel.layer.borderColor = [UIColor colorWithWhite:0.808 alpha:1.000].CGColor;
    replyLabel.textAlignment = NSTextAlignmentCenter;
    
    
    return replyLabel;
}

+(void)replyCountLabelWidth:(NSNumber *)data Height:(CGFloat)Height font:(CGFloat)font view:(UILabel *)label{
    label.text = [self replyCountText:data];
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, Height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    rect.size.width = rect.size.width+10;
    rect.origin.x = UISCREENWIDTH -10 - rect.size.width;
    rect.origin.y = label.frame.origin.y;
    label.frame =rect;
}

+ (NSString *)replyCountText:(NSNumber *)data{
    if (data.integerValue>10000) {
        return [NSString stringWithFormat:@"%.1f万跟帖",data.doubleValue/10000];
        
    }
    else if(data == nil){
        return nil;
    }
    else{
        return [NSString stringWithFormat:@"%@跟帖",data];
    }
}

+ (UILabel *)timeLabelWithFrame:(CGRect)frame{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = [UIColor colorWithWhite:0.500 alpha:1.000];
    label.font = [UIFont systemFontOfSize:12];
    return label;
}
+ (NSString *)timeStampToDate:(NSNumber *)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time.unsignedLongLongValue/1000];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

+ (CAAnimationGroup *)animationGroupWithType:(animationType)type{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    CATransition *transition = [CATransition animation];
    transition.duration = 1;
    transition.type = @"rippleEffect";
    transition.subtype = kCATransitionFromBottom;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"opacity";
    animation.duration = 1;
    switch (type) {
        case Show:
            animation.values = @[@0,@1];
            break;
            case Hide:
            animation.values = @[@1,@0];
            
        default:
            break;
    }
    group.animations = @[transition];
    group.duration = 1;
    return group;
}

@end
