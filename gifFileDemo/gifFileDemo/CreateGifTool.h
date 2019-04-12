//
//  CreateGifTool.h
//  gifFileDemo
//
//  Created by zyy on 2019/4/12.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GIFSize)
{
    GIFSizeVeryLow = 2,
    GIFSizeLow = 3,
    GIFSizeMedium = 5,
    GIFSizeHigh = 7,
    GIFSizeOriginal = 10
    
};

typedef void(^InterceptBlock)(NSError * error , NSURL * outPutURL);

typedef void(^CompleteBlock)(NSError * error , NSURL * gifURL);

@interface CreateGifTool : NSObject

@property (strong , nonatomic) InterceptBlock interceptBlock;
@property (strong , nonatomic) CompleteBlock completeBlock;

@property (assign , nonatomic) GIFSize gifSize;

@property (strong , nonatomic) NSError * error;

+(instancetype)shareTool;

-(void)interceptVideoAndVideoUrl:(NSURL *)videoUrl withOutPath:(NSString *)outPath outputFileType:(NSString *)outputFileType range:(NSRange)videoRange intercept:(InterceptBlock)interceptBlock;

-(void)createGIFfromURL:(NSURL*)videoUrl loopCount:(int)loopCount delayTime:(CGFloat)time gifImagePath:(NSString *)imagePath complete:(CompleteBlock)completeBlock;

@end

NS_ASSUME_NONNULL_END
