//
//  VerifyCodeBtn.h
//  VerifyCodeBtnProject
//
//  Created by zjl on 2021/10/18.
//

#import <UIKit/UIKit.h>
typedef void(^ClickVerifyCodeBtnBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface VerifyCodeBtn : UIButton
@property (nonatomic,assign) NSInteger totalSec;//倒计时总数 默认是60
@property (nonatomic,strong) ClickVerifyCodeBtnBlock clickVerifyCodeBtnBlock; //点击按钮的回调block
@property (nonatomic,strong) UIColor *normalColor;//获取验证码字体颜色
@property (nonatomic,strong) UIColor *clickColor;//点击之后倒计时字体颜色
- (instancetype)initWithFrame:(CGRect)frame clickBlock:(void(^)(void))clickBlock;
@end

NS_ASSUME_NONNULL_END
