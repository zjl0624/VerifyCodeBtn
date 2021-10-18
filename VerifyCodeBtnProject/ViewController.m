//
//  ViewController.m
//  VerifyCodeBtnProject
//
//  Created by zjl on 2021/10/18.
//

#import "ViewController.h"
#import "VerifyCodeBtn.h"

@interface ViewController ()
@property (nonatomic,strong) VerifyCodeBtn *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _btn = [[VerifyCodeBtn alloc] initWithFrame:CGRectMake(100, 100, 150, 60) clickBlock:^{
        
    }];
    [self.view addSubview:_btn];
    _btn.normalColor = [UIColor redColor];
    _btn.clickColor = [UIColor greenColor];
    _btn.totalSec = 30;
}


@end
