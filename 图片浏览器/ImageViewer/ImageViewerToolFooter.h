//
//  ImageViewerToolFooter.h
//  FamilyTree
//
//  Created by 井庆林 on 16/7/5.
//  Copyright © 2016年 北京金色乐途网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageViewerToolFooterDelegate <NSObject>

- (void)saveImage;
- (void)deleteImage;
- (void)comment;

@end
@interface ImageViewerToolFooter : UIView

@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, weak) id<ImageViewerToolFooterDelegate> delegate;

@end
