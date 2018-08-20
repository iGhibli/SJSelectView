//
//  SJSelectView.h
//  SJSelectView
//
//  Created by iGhibli on 2018/8/20.
//  Copyright © 2018年 iGhibli. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SJBlock)(NSInteger index); // 回调block

@interface SJSelectView : UIView
@property (nonatomic, strong) UIColor *mainColor; // 主色调
@property (nonatomic, strong) UIColor *otherColor; // 杂色
@property (nonatomic, assign) NSInteger perlineCount; // 每行个数
@property (nonatomic, strong) NSArray *datas; // 标题数组
@property (nonatomic, copy) SJBlock SJBlock;

/** 初始化SJSelectView **/
+ (instancetype)SJSelectViewWithFrame:(CGRect)frame datas:(NSArray *)datas selectIndex:(SJBlock)block;

@end
