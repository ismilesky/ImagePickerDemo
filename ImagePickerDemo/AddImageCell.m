//
//  AddImageCell.m
//  ComicPhoto
//
//  Created by youngstar on 15/11/21.
//  Copyright © 2015年 com.ifenghui. All rights reserved.
//

#import "AddImageCell.h"
#import "UIView+JKPicker.h"

@interface AddImageCell ()
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation AddImageCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawLine];
        [self setupImageView];
    }
    return self;
}

- (void)drawLine {
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, self.width, self.height);
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:0].CGPath;
    borderLayer.lineWidth = 2;
    //虚线边框
    borderLayer.lineDashPattern = @[@8, @8];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
//    borderLayer.strokeColor = RGBA_COLOR(252, 176, 80, 1).CGColor;
    borderLayer.strokeColor = [UIColor orangeColor].CGColor;
    [self.contentView.layer addSublayer:borderLayer];
}

- (void)setupImageView {
    _imageView = [[UIImageView alloc] init];
    _imageView.center = CGPointMake(self.width / 4, self.width / 4);
    _imageView.size = CGSizeMake(45, 45);
    _imageView.userInteractionEnabled = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    // 将图片超出的边界切掉,保证和imageView大小一致
    _imageView.clipsToBounds = YES;
    _imageView.image = [UIImage imageNamed:@"add.png"];
    [self.contentView addSubview:_imageView];
}

@end
