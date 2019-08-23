//
//  ViewController.m
//  Demo
//
//  Created by wkcloveYang on 2019/8/23.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "ViewController.h"
#import <WKCStickerView.h>
#import <WKCTextEditView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    WKCStickerView * stickerView = [[WKCStickerView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    stickerView.deleteImage = [UIImage imageNamed:@"1"];
    stickerView.rorationImage = [UIImage imageNamed:@"1"];
    stickerView.leftBottomImage = [UIImage imageNamed:@"1"];
    stickerView.rightTopImage = [UIImage imageNamed:@"1"];
    stickerView.contentImage = [UIImage imageNamed:@"1"];
    
    WKCTextEditView * textView = [[WKCTextEditView alloc] initWithFrame:CGRectMake(100, 300, 150, 150)];
    textView.deleteImage = [UIImage imageNamed:@"1"];
    textView.rorationImage = [UIImage imageNamed:@"1"];
    textView.leftBottomImage = [UIImage imageNamed:@"1"];
    textView.rightTopImage = [UIImage imageNamed:@"1"];
    textView.contentText = @"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
    
    [self.view addSubview:stickerView];
    [self.view addSubview:textView];
}


@end
