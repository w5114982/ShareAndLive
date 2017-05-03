//
//  WYOneImageTableViewCell.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/2.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYOneImageTableViewCell.h"
#import "WYTools.h"

/*图片与文字以及边线的距离**/
#define ONEIMAGESPACE 10

/*图片与屏幕宽度的比例**/
#define IMAGESCALE 0.25

@implementation WYOneImageTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)createUI{
    self.titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(ONEIMAGESPACE,ONEIMAGESPACE , UISCREENWIDTH *IMAGESCALE,ONEIMAGECELLHEIGHT- 2*ONEIMAGESPACE)];
    [self addSubview:self.titleImage];
    
    
    self.titleLabel = [WYTools titleLabelWithFrame:CGRectMake(1.5*ONEIMAGESPACE + UISCREENWIDTH *IMAGESCALE, ONEIMAGESPACE, UISCREENWIDTH *0.7, ONEIMAGECELLHEIGHT *0.3)];
    [self addSubview:self.titleLabel];
    
    self.digestLabel = [WYTools digestLabelWithFrame:CGRectMake(1.5*ONEIMAGESPACE, ONEIMAGESPACE +ONEIMAGECELLHEIGHT *0.3, UISCREENWIDTH *0.7, ONEIMAGECELLHEIGHT * 0.4)];
    [self addSubview:self.digestLabel];
    
    
    self.replyCount = [WYTools replyCountLabelWithFrame:CGRectMake(UISCREENWIDTH -50, ONEIMAGESPACE + ONEIMAGECELLHEIGHT * 0.6, 40, 20)];
    [self addSubview:self.replyCount];
    
}

@end
