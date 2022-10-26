//
//  TabBarButton.m
//  Weather
//
//  Created by 杜宾 on 2022/10/25.
//

#import "TabBarButton.h"

@interface TabBarButton()
/**
 *  中文标题
 */
@property (nonatomic ,strong ) UIImageView *cnImage;
/**
 *  英文标题
 */
@property (nonatomic ,strong) UILabel *enLable;
@end


@implementation TabBarButton
/**
 *  初始化按钮并创建自定义标签
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self creatUI];
    }
    return self;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        [self.cnImage setImage:[UIImage imageNamed:self.selectedNameStr]];
        self.enLable.textColor = [UIColor redColor];
        
    }else{
        [self.cnImage setImage:[UIImage imageNamed:self.imageNameStr]];
        self.enLable.textColor = [UIColor blackColor];

    }
}

-(void)creatUI{
    
    // 创建中文标题标签
    UIImageView *cnImage = [[UIImageView alloc] init];
    [self addSubview:cnImage];
    [cnImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.height.width.mas_equalTo(30);
    }];
    self.cnImage = cnImage;
    
    // 创建英文标题标签
    UILabel *enLable = [[UILabel alloc] init];
    enLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:enLable];
    [enLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    self.enLable = enLable;
}

-(void)setTitle:(NSString *)title withImageName:(NSString *)imageName withSelectedImage:(NSString *)selectedName{
    //        未选中
    [self.cnImage setImage:[UIImage imageNamed:imageName]];
    self.enLable.text = title;
}


/**
 *  去除自带高亮效果
 */
- (void)setHighlighted:(BOOL)highlighted{}


@end
