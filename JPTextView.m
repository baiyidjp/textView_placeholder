//
//  JPTextView.m
//  01-新浪微博(UITabarButton)
//
//  Created by I Smile going on 15/8/6.
//  Copyright (c) 2015年 I Smile going. All rights reserved.
//

#import "JPTextView.h"
#import "NSString+Extonsion.h"
//字体大小
#define kFont(x) [UIFont systemFontOfSize:x]
@implementation JPTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //设置圆角
        self.layer.cornerRadius = 7;
        //设置边框颜色
        self.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
        //设置边框宽度
        self.layer.borderWidth = 1.5;
        
        //初始化站位文字的label
        UILabel *placeLabel = [[UILabel alloc]init];
        UILabel *numLabel = [[UILabel alloc]init];
        
        //设置文字颜色
        placeLabel.textColor = [UIColor grayColor];
        numLabel.textColor = [UIColor grayColor];
        
        //设置文字换行
        placeLabel.numberOfLines = 0;
        
        self.placeLabel = placeLabel;
        self.numLabel = numLabel;
        
        [self addSubview:numLabel];
        [self addSubview:placeLabel];
        
        //发送一个通知 当textview改变的时候调用
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    return self;
}

//重写setter方法 设置占位符的内容

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder =placeholder;
    
    self.placeLabel.text = placeholder;
    
}

//设置限制字数
- (void)setWordNum:(NSInteger)wordNum
{
    _wordNum = wordNum;
    
    self.numLabel.text = [NSString stringWithFormat:@"还有%zd字...",wordNum];
}

//设置font
- (void)setFontNum:(NSInteger)fontNum
{
    _fontNum = fontNum;
    self.font = kFont(fontNum);
    self.placeLabel.font = self.font;
    self.numLabel.font = self.font;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeLabel.x = 5;
    
    self.placeLabel.y = 8;
    
    CGSize consize = CGSizeMake(self.width - self.placeLabel.x * 2, MAXFLOAT);
    
    self.placeLabel.size = [self.placeLabel.text sizeWithFont:self.placeLabel.font constrainedToSize:consize];
    
    self.numLabel.size = [self.numLabel.text sizeWithFont:self.numLabel.font];
    
    self.numLabel.x = self.width - kMargin - self.numLabel.size.width;
    
    self.numLabel.y = self.height - kMargin - self.numLabel.size.height;
  
    
}

- (void)textViewChange
{
    self.placeLabel.hidden = self.text.length;
    
    if ([self.numLabel.text isEqualToString:@"还有0字..."]) {
        
        [self endEditing:YES];
    }else
    {
        self.numLabel.text = [NSString stringWithFormat:@"还有%zd字...",self.wordNum - self.text.length];
    }
    
}

//#pragma mark textViewdelegate //当字数到限制字数时结束编辑 写在引用的控制器中(遵守UITextViewDelegate)

//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
//{
//    if (range.location > kWordNum - 1) {
//        
//        return NO;
//    }
//    
//    return YES;
//}

@end
