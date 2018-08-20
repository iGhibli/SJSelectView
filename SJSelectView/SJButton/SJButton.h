//
//  SJButton.h
//  SJSelectView
//
//  Created by iGhibli on 2018/8/20.
//  Copyright © 2018年 iGhibli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJButton : UIButton
@property (nonatomic,copy) NSString *mainTitle;
@property (nonatomic,copy) NSString *subTitle;
@property (nonatomic, strong) UIColor *mainTitleNormalColor;
@property (nonatomic, strong) UIColor *mainTitleSelectedColor;
@property (nonatomic, strong) UIColor *subTitleNormalColor;
@property (nonatomic, strong) UIColor *subTitleSelectedColor;

@end
