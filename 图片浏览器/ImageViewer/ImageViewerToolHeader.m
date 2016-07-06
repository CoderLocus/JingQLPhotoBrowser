//
//  ImageViewerToolHeader.m
//  FamilyTree
//
//  Created by 井庆林 on 16/7/5.
//  Copyright © 2016年 北京金色乐途网络科技有限公司. All rights reserved.
//

#import "ImageViewerToolHeader.h"
#import "Masonry.h"

#define Font(x) [UIFont systemFontOfSize:x]

@implementation ImageViewerToolHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0.133 green:0.141 blue:0.161 alpha:0.500];
        
        UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, 20, 20)];
        [back setBackgroundImage:[UIImage imageNamed:@"back_arrow"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:back];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = Font(15);
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(25);
            make.centerX.equalTo(self);
        }];
        
        _UploaderLabel = [[UILabel alloc] init];
        _UploaderLabel.textColor = [UIColor lightGrayColor];
        _UploaderLabel.font = Font(13);
        [self addSubview:_UploaderLabel];
        [_UploaderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
            make.centerX.equalTo(self);
        }];
        
        _currentLabel = [[UILabel alloc] init];
        _currentLabel.font = Font(15);
        _currentLabel.textColor = [UIColor whiteColor];
        [self addSubview:_currentLabel];
        [_currentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(25);
            make.trailing.equalTo(self).offset(-20);
        }];
    }
    return self;
}

- (void)back {
    if (self.backBlock) {
        self.backBlock();
    }
}
@end
