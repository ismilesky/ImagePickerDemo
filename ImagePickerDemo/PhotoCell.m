//
//  PhotoCell.m
//  JKImagePicker
//
//  Created by Jecky on 15/1/16.
//  Copyright (c) 2015年 Jecky. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "PhotoCell.h"
#import "UIView+JKPicker.h"

@interface PhotoCell()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *checkButton;
@end

@implementation PhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // Create a image view
        self.backgroundColor = [UIColor clearColor];
        self.checkButton.right = self.imageView.right - 5;
        [self imageView];
    }
    
    return self;
}

- (void)setAsset:(JKAssets *)asset{
    if (_asset != asset) {
        _asset = asset;
        
        ALAssetsLibrary   *lib = [[ALAssetsLibrary alloc] init];
        [lib assetForURL:_asset.assetPropertyURL resultBlock:^(ALAsset *asset) {
            if (asset) {
                self.imageView.image = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
            }
        } failureBlock:^(NSError *error) {

        }];
    }
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.userInteractionEnabled = YES;
        _imageView.clipsToBounds = YES;
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        // 将图片超出的边界切掉,保证和imageView大小一致
        _imageView.layer.borderColor = [UIColor clearColor].CGColor;
        _imageView.layer.borderWidth = 0.5;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UIButton *)checkButton{
    if (!_checkButton) {
        _checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *img = [UIImage imageNamed:@"close"];
        _checkButton.frame = CGRectMake(-5, 5, 20, 20);
        [_checkButton setBackgroundImage:img forState:UIControlStateNormal];
        [_checkButton addTarget:self action:@selector(composePicAdd:) forControlEvents:UIControlEventTouchUpInside];
        _checkButton.exclusiveTouch = YES;
        [self.imageView addSubview:_checkButton];
    }
    return _checkButton;
}

- (void)composePicAdd:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(photoCellClickCell:)]) {
        [_delegate photoCellClickCell:self];
    }
}


@end
