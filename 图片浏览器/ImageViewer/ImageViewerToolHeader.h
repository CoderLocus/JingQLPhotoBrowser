//
//  ImageViewerToolHeader.h
//  FamilyTree
//
//  Created by 井庆林 on 16/7/5.
//  Copyright © 2016年 北京金色乐途网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageViewerToolHeaderBackBlock)();
@interface ImageViewerToolHeader : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *UploaderLabel;
@property (nonatomic, strong) UILabel *currentLabel;

@property (nonatomic, copy) ImageViewerToolHeaderBackBlock backBlock;
@end
