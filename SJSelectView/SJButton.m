//
//  SJButton.m
//  SJSelectView
//
//  Created by iGhibli on 2018/8/20.
//  Copyright © 2018年 iGhibli. All rights reserved.
//

#define selfW   self.frame.size.width
#define selfH   self.frame.size.height

#import "SJButton.h"
@interface SJButton()
@property (nonatomic, strong) UILabel *titleLB;         // 主标题
@property (nonatomic, strong) UILabel *subTitleLB;      // 副标题

@end

@implementation SJButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setMainTitleNormalColor:(UIColor *)mainTitleNormalColor {
    _mainTitleNormalColor = mainTitleNormalColor;
    _titleLB.textColor = mainTitleNormalColor;
}

- (void)setMainTitleSelectedColor:(UIColor *)mainTitleSelectedColor {
    _mainTitleSelectedColor = mainTitleSelectedColor;
}

- (void)setSubTitleNormalColor:(UIColor *)subTitleNormalColor {
    _subTitleNormalColor = subTitleNormalColor;
    _subTitleLB.textColor = subTitleNormalColor;
}

- (void)setSubTitleSelectedColor:(UIColor *)subTitleSelectedColor{
    _subTitleSelectedColor = subTitleSelectedColor;
}

- (void)setMainTitle:(NSString *)mainTitle {
    if (_mainTitle != mainTitle) {
        if (_titleLB == nil) {
            _titleLB = [[UILabel alloc] initWithFrame:CGRectMake(0, selfH/2-15, selfW, 15)];
            _titleLB.backgroundColor = [UIColor clearColor];
            _titleLB.font = [UIFont systemFontOfSize:16.0f];
            _titleLB.textColor = [UIColor blackColor];
            _titleLB.textAlignment = NSTextAlignmentCenter;
            _titleLB.text = mainTitle;
            [self addSubview:_titleLB];
        }
    }
}

- (void)setSubTitle:(NSString *)subTitle {
    if (_subTitle != subTitle) {
        if (_subTitleLB == nil) {
            _subTitleLB = [[UILabel alloc] initWithFrame:CGRectMake(0, selfH/2 + 5, selfW, 15)];
            _subTitleLB.backgroundColor = [UIColor clearColor];
            _subTitleLB.font = [UIFont systemFontOfSize:14.0f];
            _subTitleLB.textColor = [UIColor blackColor];
            _subTitleLB.textAlignment = NSTextAlignmentCenter;
            _subTitleLB.text = subTitle;
            [self addSubview:_subTitleLB];
        }
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.titleLB.textColor = self.mainTitleSelectedColor;
        self.subTitleLB.textColor = self.subTitleSelectedColor;
    }else {
        self.titleLB.textColor = self.mainTitleNormalColor;
        self.subTitleLB.textColor = self.subTitleNormalColor;
    }
}

@end
