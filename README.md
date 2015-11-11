# textView_placeholder
自定义textview的占位符和提示文本   
//设置font   
@property(nonatomic,assign) NSInteger fontNum;   
//设置占位字符   
@property(nonatomic,weak)UILabel  *placeLabel;   
//占位字符的内容   
@property(nonatomic,copy)NSString *placeholder;   
//设置提示文本   
@property(nonatomic,weak)UILabel  *numLabel;   
//设置提示剩余多少字   
@property(nonatomic,assign) NSInteger wordNum;    

使用中传入这几个参数就可以创建一个自定义的textView

关于到达限制字数不可编辑的实现 请看控制器中的 代码直接复制即可  

  #pragma mark 创建一个文本输入框   
- (void)addTextView{   
-    
  JPTextView *textView = [[JPTextView alloc]init];
    
    self.textView = textView;    
    
    //光标的位置初始在左上角(不加这句会向下偏移64)   
    self.automaticallyAdjustsScrollViewInsets = NO;   
    
    textView.frame = CGRectMake(kMargin, kMargin+64, kScreenW - 2*kMargin, kScreenH/4);   
    
    textView.delegate = self;//设置代理      
    
    textView.placeholder = @"请详细描述您的问题...";   
    
    textView.wordNum = 150;   
    
    textView.fontNum = 14;   
    
    [textView becomeFirstResponder];   
    
    [self.view addSubview:textView];   
    }   
          
    #pragma mark textViewdelegate   
  - (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text   
  {   
    if (range.location > kWordNum - 1) {//当字数到限制字数时结束编辑   
           
        return NO;   
    }   
    
    return YES;   
  }   
