//
//  ViewController.m
//  图片浏览器
//
//  Created by 井庆林 on 16/7/6.
//  Copyright © 2016年 JingQL. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewer.h"

@interface ViewController ()

@property (nonatomic) ImageViewer *imageViewer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.imageViewer = [[ImageViewer alloc] init];
    self.imageViewer.pageControl = NO;
    NSArray *images = [NSArray new];
    images = @[@"http://img.jj20.com/up/allimg/911/121215132T8/151212132T8-1-lp.jpg",
               @"http://b.zol-img.com.cn/sjbizhi/images/6/208x312/1396940684766.jpg",
               @"http://b.zol-img.com.cn/sjbizhi/images/6/208x312/1394701139813.jpg",
               @"http://img.jj20.com/up/allimg/911/0P315132137/150P3132137-1-lp.jpg",
               @"http://b.zol-img.com.cn/sjbizhi/images/1/208x312/1350915106394.jpg",
               @"http://b.zol-img.com.cn/sjbizhi/images/8/208x312/1427966117121.jpg",
               @"http://img.jj20.com/up/allimg/811/052515103222/150525103222-1-lp.jpg",
               @"http://b.zol-img.com.cn/sjbizhi/images/8/208x312/1435742799400.jpg",
               @"http://imga1.pic21.com/bizhi/131016/02507/s11.jpg"];
    self.imageViewer.imageArray = [images mutableCopy];
    self.imageViewer.titleArray = [@[@"金乐佳", @"婚礼", @"金乐佳", @"婚礼", @"金乐佳", @"婚礼", @"金乐佳", @"婚礼", @"婚礼"] mutableCopy];
    self.imageViewer.uploaderArray = [@[@"进了图", @"李四", @"进了图", @"李四", @"进了图", @"李四", @"进了图", @"李四", @"婚礼"] mutableCopy];
    self.imageViewer.index = 0;
    [self.imageViewer showView:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
