//
//  SJSelectView.m
//  SJSelectView
//
//  Created by iGhibli on 2018/8/20.
//  Copyright © 2018年 iGhibli. All rights reserved.
//

#import "SJSelectView.h"
#import "SJButton.h"

#define VIEW_W self.frame.size.width
#define VIEW_H self.frame.size.height

@implementation SJSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
        [self setupMainView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialization];
    [self setupMainView];
}

- (void)initialization {
    _mainColor = [UIColor colorWithRed:0.49 green:0.69 blue:0.47 alpha:1.00];
    _otherColor = [UIColor whiteColor];
    _perlineCount = 3;
    
    self.backgroundColor = [UIColor whiteColor];
}

+ (instancetype)SJSelectViewWithFrame:(CGRect)frame datas:(NSArray *)datas selectIndex:(SJBlock)block {
    SJSelectView *selectView = [[self alloc] initWithFrame:frame];
    selectView.datas = [NSMutableArray arrayWithArray:datas];
    selectView.SJBlock = block;
    return selectView;
}

- (void)setupMainView {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    CGFloat margin = 10; // 间距
    CGFloat btnVH = 60; // 高
    CGFloat btnVW = (VIEW_W - 20*2 - margin*(_perlineCount - 1)) / _perlineCount; // 宽

    int count = (int)self.datas.count;
    for (int i=0; i<count; i++) {
        int row = i / _perlineCount;  // 行号
        int loc = i % _perlineCount;  // 列号
        CGFloat btnVX = 20 + (margin + btnVW) * loc; // x
        CGFloat btnVY = margin + (margin + btnVH) * row; // y
        
        SJButton *btn = [SJButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnVX, btnVY, btnVW, btnVH);
        [btn setMainTitle:[NSString stringWithFormat:@"%@",self.datas[i]]];
        [btn setSubTitle:[NSString stringWithFormat:@"%@",self.datas[i]]];
        
        [btn setMainTitleNormalColor:_mainColor];
        [btn setMainTitleSelectedColor:_otherColor];
        
        [btn setSubTitleNormalColor:_mainColor];
        [btn setSubTitleSelectedColor:_otherColor];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = i + 1000;
        
        btn.layer.cornerRadius = 3;
        btn.layer.borderColor = _mainColor.CGColor;
        btn.layer.borderWidth = 0.6;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}


#pragma mark - properties
- (void)setMainColor:(UIColor *)mainColor {
    _mainColor = mainColor;
}

- (void)setOtherColor:(UIColor *)otherColor {
    _otherColor = otherColor;
}

- (void)setDatas:(NSArray *)datas {
    _datas = datas;
    [self setupMainView];
}

- (void)setPerlineCount:(NSInteger)perlineCount {
    _perlineCount = perlineCount;
}

#pragma mark - actions
- (void)btnClick:(UIButton *)priceBtn {
    for (int i=0; i<self.datas.count; i++) {
        SJButton *btn = [self viewWithTag:i+1000];
        
        if (btn.tag == priceBtn.tag) {
            btn.selected = YES;
            [btn setBackgroundColor:[UIColor colorWithRed:0.49 green:0.69 blue:0.47 alpha:1.00]];
            if (self.SJBlock) {
                self.SJBlock(i);
            }
        }else {
            btn.selected = NO;
            [btn setBackgroundColor:[UIColor whiteColor]];
        }
    }
}

#pragma mark - life circles
- (void)layoutSubviews {
    self.SJBlock = self.SJBlock;
    [super layoutSubviews];
}

- (void)dealloc {
    
}

@end
