//
//  WYImagesTableViewCell.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/2.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYImagesTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "WYTools.h"
#import "WYNewsModel.h"
#define IMAGESPACE 10
#define IMAGEWIDTH (UISCREENWIDTH - IMAGESPACE *4)/3
@implementation WYImagesTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)createUI{
    self.titleLabel = [WYTools titleLabelWithFrame:CGRectMake(IMAGESPACE, IMAGESPACE, 300, IMAGESCELLHEIGHT/6)];
    [self addSubview:self.titleLabel];
    
    self.replyCountLabel = [WYTools replyCountLabelWithFrame:CGRectMake(0, IMAGESPACE*1.5, 0, IMAGESCELLHEIGHT/6)];
    [self addSubview:self.replyCountLabel];
    
    self.titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(IMAGESPACE, IMAGESPACE * 2+IMAGESCELLHEIGHT/6, IMAGEWIDTH, IMAGESCELLHEIGHT-IMAGESPACE *3+IMAGESCELLHEIGHT/6)];
    [self addSubview:self.titleImage];
    
    self.imageCenter = [[UIImageView alloc] initWithFrame:CGRectMake(IMAGESPACE *2 +IMAGEWIDTH, IMAGESPACE *2+IMAGESCELLHEIGHT/6, IMAGEWIDTH, IMAGESPACE*2+IMAGESCELLHEIGHT/6)];
    [self addSubview:self.imageCenter];
    
    self.imageRight = [[UIImageView alloc] initWithFrame:CGRectMake(IMAGESPACE *3 + IMAGEWIDTH *2, IMAGESPACE *2 + IMAGESCELLHEIGHT/6, IMAGEWIDTH, IMAGESCELLHEIGHT - IMAGESPACE *3 - IMAGESCELLHEIGHT/6)];
    [self addSubview:self.imageRight];
    
    
}

- (void)getDataWithModel:(id)model{
    WYNewsModel *newsModel = (WYNewsModel *)model;
    self.titleLabel.text = newsModel.title;
    
    [WYTools replyCountLabelWidth:newsModel.replyCount Height:IMAGESCELLHEIGHT/6 font:12 view:self.replyCountLabel];
    
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:nil];
    
    [self.imageCenter sd_setImageWithURL:[NSURL URLWithString:newsModel.imgextra[0] [@"imgsrc"]]placeholderImage:nil];
    
    [self.imageRight sd_setImageWithURL:[NSURL URLWithString:newsModel.imgextra[1]
     [@"imgsrc"] ]placeholderImage:nil];
    
    
}

@end
