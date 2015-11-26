//
//  PhotoCell.h
//  JKImagePicker
//
//  Created by Jecky on 15/1/16.
//  Copyright (c) 2015年 Jecky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKAssets.h"
@class PhotoCell;
@protocol PhotoCellDelegate <NSObject>

@optional
- (void)photoCellClickCell:(PhotoCell *)cell;
@end

@interface PhotoCell : UICollectionViewCell

@property (nonatomic, strong) JKAssets *asset;
@property (weak, nonatomic) id<PhotoCellDelegate> delegate;
@end
