//
//  VerifyCodeBtn.m
//  VerifyCodeBtnProject
//
//  Created by zjl on 2021/10/18.
//

#import "VerifyCodeBtn.h"
@interface VerifyCodeBtn()
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger currentSec;
@end
@implementation VerifyCodeBtn
@synthesize normalColor = _normalColor;
@synthesize clickColor = _clickColor;
@synthesize totalSec = _totalSec;
- (instancetype)initWithFrame:(CGRect)frame clickBlock:(void(^)(void))clickBlock {
    self = [super initWithFrame:frame];
    if (self) {
        _clickVerifyCodeBtnBlock = clickBlock;
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)clickBtn {
    _clickVerifyCodeBtnBlock();
    self.enabled = NO;
    [self setTitleColor:self.clickColor forState:UIControlStateNormal];
    [self setTitle:[NSString stringWithFormat:@"还剩%ld秒",self.totalSec] forState:UIControlStateNormal];
    _currentSec = self.totalSec;
    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timeClick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timeClick {
    _currentSec--;
    if (_currentSec > 0) {
        [self setTitle:[NSString stringWithFormat:@"还剩%ld秒",_currentSec] forState:UIControlStateNormal];
    }else {
        [_timer invalidate];
        _timer = nil;
        self.enabled = YES;
        [self setTitleColor:self.normalColor forState:UIControlStateNormal];
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}

- (UIColor *)normalColor {
    if (_normalColor) {
        return _normalColor;
    }else {
        return [UIColor blueColor];
    }
}

- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    [self setTitleColor:_normalColor forState:UIControlStateNormal];
}

- (UIColor *)clickColor {
    if (_clickColor) {
        return _clickColor;
    }else {
        return [UIColor lightGrayColor];
    }
}

- (void)setClickColor:(UIColor *)clickColor {
    _clickColor = clickColor;
}

- (NSInteger)totalSec {
    if (_totalSec == 0) {
        return 60;
    }else {
        return _totalSec;
    }
}

- (void)setTotalSec:(NSInteger)totalSec {
    _totalSec = totalSec;
}


- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
}
@end
