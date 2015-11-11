# textView_placeholder
自定义textview的占位符和提示文本
//设置font＜/br＞
@property(nonatomic,assign) NSInteger fontNum;＜/br＞
//设置占位字符＜/br＞
@property(nonatomic,weak)UILabel  *placeLabel;＜/br＞
//占位字符的内容＜/br＞
@property(nonatomic,copy)NSString *placeholder;＜/br＞
//设置提示文本＜/br＞
@property(nonatomic,weak)UILabel  *numLabel;＜/br＞
//设置提示剩余多少字＜/br＞
@property(nonatomic,assign) NSInteger wordNum;＜/br＞
