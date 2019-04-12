//
//  ViewController.m
//  gifFileDemo
//
//  Created by zyy on 2019/4/12.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "ViewController.h"
#import "CreateGifTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"卧槽");
    
    //这里还差地址，存储的地址
    [[CreateGifTool shareTool] interceptVideoAndVideoUrl:[NSURL URLWithString:@"http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136ffd93020457e3c4ff02024ef202031e8d7f02030f42400204045a320a0201000400"] withOutPath:@"" outputFileType:AVFileTypeMPEG4 range:NSMakeRange(0, 4) intercept:^(NSError * _Nonnull error, NSURL * _Nonnull outPutURL) {
        if (error) {
            
        }
        else{
            
        }
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
