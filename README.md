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
