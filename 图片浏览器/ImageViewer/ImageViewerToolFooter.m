//
//  ImageViewerToolFooter.m
//  FamilyTree
//
//  Created by 井庆林 on 16/7/5.
//  Copyright © 2016年 北京金色乐途网络科技有限公司. All rights reserved.
//

#import "ImageViewerToolFooter.h"
#import "Masonry.h"

#define Font(x) [UIFont systemFontOfSize:x]

@implementation ImageViewerToolFooter

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0.267 green:0.282 blue:0.318 alpha:0.600];
        
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentButton setImage:[UIImage imageNamed:@"dynamic_comment_normal"] forState:UIControlStateNormal];
        [_commentButton setTitle:@"6" forState:UIControlStateNormal];
        [_commentButton addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_commentButton];
        [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@60);
            make.height.equalTo(@40);
            make.centerY.equalTo(self);
            make.leading.equalTo(self).offset(20);
        }];
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setImage:[UIImage imageNamed:@"message_village_deleteMessage"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_deleteButton];
        [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@40);
            make.height.equalTo(@40);
            make.centerY.equalTo(self);
            make.trailing.equalTo(self).offset(-20);
        }];
        
        _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_saveButton setImage:[UIImage imageNamed:@"mine_mission"] forState:UIControlStateNormal];
        [_saveButton addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_saveButton];
        [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@40);
            make.height.equalTo(@40);
            make.centerY.equalTo(self);
            make.trailing.equalTo(_deleteButton.mas_leading).offset(-20);
        }];
    }
    return self;
}

- (void)delete:(id)sender {
    if (self.delegate) {
        [self.delegate deleteImage];
    }
}

- (void)comment:(id)sender {
    if (self.delegate) {
        [self.delegate comment];
    }
}

- (void)save:(id)sender {
    if (self.delegate) {
        [self.delegate saveImage];
    }
}

@end
