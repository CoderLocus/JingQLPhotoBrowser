//
//  ImageViewer.h
//  ImageViewer
//
//  Created by tusm on 15/12/31.
//  Copyright © 2015年 tusm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoTableView.h"

@interface ImageViewer : UIView

/*
    显示PageControl传yes
    显示label就传no
 */
@property (nonatomic, assign) BOOL pageControl;

@property (nonatomic, retain) NSMutableArray *imageArray;//图片
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *uploaderArray;

@property (nonatomic, strong) PhotoTableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *images;

//选中的图片索引
@property(nonatomic,assign)NSInteger index;

/*显示ImageViewer到指定控制器上*/
- (void)showView:(UIViewController *)viewController;

+ (ImageViewer *)getSelf;
- (void)showTool;
- (void)dissMiss;

@end
