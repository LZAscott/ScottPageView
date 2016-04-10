//
//  ViewController.m
//  ScottPageViewDemo
//
//  Created by Scott_Mr on 16/4/10.
//  Copyright © 2016年 Scott_Mr. All rights reserved.
//

#import "ViewController.h"
#import "ScottPageView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ScottPageView *pageView;

@property (nonatomic, strong) ScottPageView *pageViewCode;

@property (nonatomic, strong) NSArray *picArrs;



@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)picArrs {
    if (!_picArrs) {
        _picArrs = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"1.jpg"], @"https://file27.mafengwo.net/M00/52/F2/wKgB6lO_PTyAKKPBACID2dURuk410.jpeg", @"https://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg",[UIImage imageNamed:@"2.jpg"], nil];
    }
    return _picArrs;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self createWithXib];
    
    [self createWithCode];
}

#pragma mark - 代码创建
- (void)createWithCode {
    _pageViewCode = [ScottPageView pageViewWithImageArr:self.picArrs andImageClickBlock:^(NSInteger index) {
        NSLog(@"点击代码创建的第%ld张图片",index+1);
    }];
    _pageViewCode.frame = CGRectMake(0, self.view.frame.size.height-230, self.view.frame.size.width, 180);
    _pageViewCode.time = 1;
    [self.view addSubview:_pageViewCode];
}

#pragma mark - xib创建
- (void)createWithXib {
    
    NSMutableArray *desArr = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<self.picArrs.count; i++) {
        NSString *tempDesc = [NSString stringWithFormat:@"这是第%ld张图片描述",i+1];
        [desArr addObject:tempDesc];
    }
    
    self.pageView.imageArr = self.picArrs;
    self.pageView.describeArray = desArr;
    self.pageView.time = 2;
    self.pageView.imageClickBlock = ^(NSInteger index){
        NSLog(@"点击了第%ld张图片",index+1);
    };
}


- (IBAction)startBtnClick:(UIButton *)sender {
    [self.pageView startTimer];
}

- (IBAction)stopBtnClick:(UIButton *)sender {
    [self.pageView stopTimer];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect originFrame = self.pageView.pageControl.frame;
    originFrame.origin.y = CGRectGetHeight(self.pageView.frame) - 30;
    self.pageView.pageControl.frame = originFrame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
