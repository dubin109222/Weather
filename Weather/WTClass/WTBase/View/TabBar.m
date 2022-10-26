//
//  TabBar.m
//  Weather
//
//  Created by 杜宾 on 2022/10/25.
//

#import "TabBar.h"
#import "TabBarButton.h"


@interface TabBar()
/**
 *  上一个点击的按钮
 */
@property (nonatomic ,weak ) TabBarButton *clickedBtn;
/**
 *  自定义按钮数组
 */
@property (nonatomic ,strong ) NSMutableArray *tabbarBtnsArr;



@end


@implementation TabBar
/**
 *  懒加载
 */
- (NSMutableArray *)tabbarBtnsArr
{
    if (!_tabbarBtnsArr) {
        _tabbarBtnsArr = [NSMutableArray array];
    }
    return _tabbarBtnsArr;
}
/**
 *  创建tabbar时创建里面的按钮
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

-(void)addButtonWithCnImageName:(NSString *)imageName withSelectedImgaeName:(NSString *)selectedName EnTitle:(NSString *)enTitle{
    
    TabBarButton *button = [[TabBarButton alloc] init];
//    button.backgroundColor = WT_RandomColor;
    [self addSubview:button];
    [self.tabbarBtnsArr addObject:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:enTitle withImageName:imageName withSelectedImage:selectedName];
    button.imageNameStr = imageName;
    button.selectedNameStr = selectedName;
    // 5.设置默认点击按钮为第一个按钮
    if (self.tabbarBtnsArr.count == 1) {
//        self.clickedBtn = button;
        [self buttonClick:button];
    }
   
}
-(void)buttonClick:(TabBarButton *)button{
    
    // 实现代理方法
    if ([self.delegate respondsToSelector:@selector(tabbar:clickedFrom:To:)]) {
        [self.delegate tabbar:self clickedFrom:(int)self.clickedBtn.tag To:(int)button.tag];
    }
    // 设置按钮状态
    self.clickedBtn.selected = NO;
    button.selected = YES;
    self.clickedBtn = button;
 

}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    // 2.1算出按钮宽度
    CGFloat buttonW = self.frame.size.width /self.tabbarBtnsArr.count;
    // 2.2按钮高度
    CGFloat buttonH = self.frame.size.height;
    
    // 取出数组中的按钮
    for (int index = 0; index < self.tabbarBtnsArr.count; index ++) {
        // 1.取出按钮数组中的第i个按钮
        UIButton *button = self.tabbarBtnsArr[index];
        // 2.计算frame
        // 2.3按钮Y值
        CGFloat buttonY = 0;
        // 2.4按钮X值
        CGFloat buttonX = index * buttonW;
        // 3.设置frame
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        // 4.设置按钮tag
        button.tag = index;
    }
    
}
@end
