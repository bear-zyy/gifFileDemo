//
//  ViewController.m
//  gifFileDemo
//
//  Created by zyy on 2019/4/12.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "ViewController.h"
#import "CreateGifTool.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@property (strong , nonatomic) WKWebView * webView;

@property (strong , nonatomic) NSURL * gifUrl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"卧槽");
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.webView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.webView];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];

    NSString * fileUrl = [path stringByAppendingString:[NSString stringWithFormat:@"/%@.MP4",@"three"]];
//
    NSLog(@"fileUrl  =  %@" , fileUrl);
    //这里还差地址，存储的地址
    [[CreateGifTool shareTool] interceptVideoAndVideoUrl:[NSURL URLWithString:@"http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136ffd93020457e3c4ff02024ef202031e8d7f02030f42400204045a320a0201000400"] withOutPath:fileUrl outputFileType:AVFileTypeMPEG4 range:NSMakeRange(4, 4) intercept:^(NSError * _Nonnull error, NSURL * _Nonnull outPutURL) {
        if (error) {
            NSLog(@"%@" , error);
        }
        else{
            NSLog(@"outPutURL = %@" , outPutURL);
            
            [[CreateGifTool shareTool] createGIFfromURL:outPutURL loopCount:1 delayTime:0.1 gifImagePath:[path stringByAppendingString:[NSString stringWithFormat:@"/%@.gif" ,@"gif"]] complete:^(NSError * _Nonnull error, NSURL * _Nonnull gifURL) {
                NSLog(@"gifURL == %@" , gifURL);
                
                self.gifUrl = gifURL;
                
                NSURLRequest * request = [NSURLRequest requestWithURL:gifURL];
                
                [self.webView loadRequest:request];
            }];
            
        }
    }];
    
    
    UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(100, 300, 100, 40);
    [but setTitle:@"显示" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(showClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    //fileUrl  =  /Users/zyy/Library/Developer/CoreSimulator/Devices/26F65E59-AA1E-4ED3-B4D7-55AEC1F446D6/data/Containers/Data/Application/E6466822-9C8A-429D-A412-C746A5607C6F/Documents/first.MP4
    
    //outPutURL = file:///Users/zyy/Library/Developer/CoreSimulator/Devices/26F65E59-AA1E-4ED3-B4D7-55AEC1F446D6/data/Containers/Data/Application/E6466822-9C8A-429D-A412-C746A5607C6F/Documents/first.MP4
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)showClick{
    NSURLRequest * request = [NSURLRequest requestWithURL:self.gifUrl];
    
    [self.webView loadRequest:request];
}


@end
