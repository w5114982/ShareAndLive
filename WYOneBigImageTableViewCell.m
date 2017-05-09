//
//  WYOneBigImageTableViewCell.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/2.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYOneBigImageTableViewCell.h"
#import "WYTools.h"
#import  <UIImageView+WebCache.h>
#import "WYNewsModel.h"

/*图片与文字之间边线的间距**/
#define  ONEBIGIMAGESPACE 10

/**图片占据Cell高度的比例*/
#define BIGIMAGESCALE 0.65
@implementation WYOneBigImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


- (void)createUI{
    self.titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(ONEBIGIMAGESPACE, ONEBIGIMAGESPACE, UISCREENWIDTH -2* ONEBIGIMAGESPACE, ONEBIGIMAGECELLHEIGHT *BIGIMAGESCALE)];
    [self addSubview:self.titleImage];

    self.titleLabel = [WYTools titleLabelWithFrame:CGRectMake(ONEBIGIMAGESPACE, ONEBIGIMAGECELLHEIGHT *BIGIMAGESCALE + ONEBIGIMAGESPACE *1.5 , UISCREENWIDTH -2 *ONEBIGIMAGESPACE, 20)];
    [self addSubview:self.titleLabel];
    
    self.digestLabel = [WYTools digestLabelWithFrame:CGRectMake(ONEBIGIMAGESPACE, ONEBIGIMAGECELLHEIGHT *BIGIMAGESCALE + ONEBIGIMAGESPACE *1.5+25, UISCREENWIDTH -2*ONEBIGIMAGESPACE, 30)];
    [self addSubview:self.digestLabel];
    
    self.replyCount = [WYTools replyCountLabelWithFrame:CGRectMake(0, ONEBIGIMAGECELLHEIGHT *BIGIMAGESCALE + 1.5*ONEBIGIMAGESPACE +45 , 0, 20)];
    [self addSubview:self.replyCount];
}

- (void)getDataWithModel:(id)model{
    WYNewsModel *newsModel = (WYNewsModel *)model;
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:nil];
    
    self.titleLabel.text = newsModel.title;
    self.digestLabel.text = newsModel.digest;
    [WYTools replyCountLabelWidth:newsModel.replyCount Height:20 font:12 view:self.replyCount];
}
@end
