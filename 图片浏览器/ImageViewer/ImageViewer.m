//
//  ImageViewer.m
//  ImageViewer
//
//  Created by tusm on 15/12/31.
//  Copyright © 2015年 tusm. All rights reserved.
//

#import "ImageViewer.h"
#import "ImageViewerToolFooter.h"
#import "ImageViewerToolHeader.h"
#import "UIView+Category.h"
#import "UIImageView+WebCache.h"

static ImageViewer  *_imageViewer;

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define NSLog(...) NSLog(__VA_ARGS__)

@interface ImageViewer() <ImageViewerToolFooterDelegate>

@property (nonatomic, strong) ImageViewerToolHeader *header;
@property (nonatomic, strong) ImageViewerToolFooter *footer;

@end

@implementation ImageViewer

- (id)init{
    self = [super init];
    if (self) {
        _imageViewer = self;
        _images = [NSMutableDictionary new];
    }
    return self;
}

- (void)initViewWithFrame:(CGRect)rect{
    
    self.backgroundColor = [UIColor colorWithRed:0.133 green:0.141 blue:0.161 alpha:1];
    
    UIPageControl *page;
    if (self.pageControl) {
        page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(rect)-10, 0, 10)];
        page.numberOfPages = self.imageArray.count;
        page.tag = 101;
        page.currentPage = self.index;
        [self insertSubview:page atIndex:1];
    }else{
        _header = [[ImageViewerToolHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
        WEAKSELF
        _header.backBlock = ^(){
            [weakSelf dissMiss];
        };
        [self insertSubview:_header atIndex:1];
        
        _footer = [[ImageViewerToolFooter alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
        _footer.delegate = self;
        [self insertSubview:_footer atIndex:1];
        
        [self reloadData];
    }
    
    _tableView = [[PhotoTableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetMaxX(rect), CGRectGetMaxY(rect)) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    WEAKSELF
    _tableView.block = ^(NSInteger index){
        _index = index;
        if (page) {
            page.currentPage = index;
        } else {
            [weakSelf reloadData];
        }
    };
    _tableView.rowHeight = CGRectGetMaxX(rect);
    if (page) {
        [self insertSubview:_tableView belowSubview:page];
    } else {
        [self insertSubview:_tableView aboveSubview:_header];
        [self insertSubview:_header aboveSubview:_footer];
    }
    
    
    _tableView.pagingEnabled  = YES;
    
    //将所有的图片url赋给tableView显示
    _tableView.imageArray = self.imageArray;
    
    //滚动到指定的单元格
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.index inSection:0];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)showView:(UIViewController *)viewController{
    CGRect rect;
    
    UIView *showView = viewController.navigationController.view?viewController.navigationController.view:viewController.view;
    
    rect = CGRectMake(0, 0, CGRectGetMaxX(showView.frame), CGRectGetMaxY(showView.frame));
    
    [self initViewWithFrame:rect];
    
    self.frame = CGRectMake(0, CGRectGetMaxY(showView.frame), CGRectGetMaxX(showView.frame), CGRectGetMaxY(showView.frame));
    
    [showView addSubview:self];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.frame = rect;
                     } completion:^(BOOL finished) {
                     }];
}

- (void)showTool {
    if (_header.y >= 0) {
        [UIView animateWithDuration:0.3 animations:^{
            _header.y = -_header.height;
            _footer.y = SCREEN_HEIGHT;
        } completion:^(BOOL finished) {
            _header.alpha = 0.0;
            _footer.alpha = 0.0;
        }];
    } else {
        _header.alpha = 1.0;
        _footer.alpha = 1.0;
        [UIView animateWithDuration:0.3 animations:^{
            _header.y = 0;
            _footer.y = SCREEN_HEIGHT - _footer.height;
        }];
    }
}

- (void)reloadData {
    if (self.index < 0) {
        return;
    }
    _header.currentLabel.text = [NSString stringWithFormat:@"%ld/%ld",(self.index+1),self.imageArray.count];
    _header.UploaderLabel.text = [NSString stringWithFormat:@"%@ 上传", self.uploaderArray[self.index]];
    _header.titleLabel.text = [NSString stringWithFormat:@"%@", self.titleArray[self.index]];
}

- (void)saveImage {
    UIImage *image = _images[self.tableView.imageArray[_index]];
    if (image) {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)deleteImage {
    [_imageArray removeObjectAtIndex:_index];
    [_titleArray removeObjectAtIndex:_index];
    [_uploaderArray removeObjectAtIndex:_index];
    if (_index == _imageArray.count) {
        _index--;
    }
    [self reloadData];
    [_tableView reloadData];
}

- (void)comment {
    
}

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *message;
    if (!error) {
        message = @"成功保存到相册";
    } else {
        message = [error description];
    }
    NSLog(@"message is %@",message);
}

+ (ImageViewer *)getSelf{
    return _imageViewer;
}

- (void)dissMiss{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.frame = CGRectMake(0, CGRectGetMaxY(self.frame), CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame));
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

@end
