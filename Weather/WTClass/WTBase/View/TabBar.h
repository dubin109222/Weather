//
//  TabBar.h
//  Weather
//
//  Created by 杜宾 on 2022/10/25.
//

#import <UIKit/UIKit.h>

@class TabBar;
@protocol TabBarDelegate <NSObject>

- (void)tabbar:(TabBar *)tabbar clickedFrom:(int)from To:(int)to;

@end

@interface TabBar : UIView

/**
 *  传入中英文标题创建按钮
 *
 *  @param imageName  未选中图片
 *  @param selectedName 选中图片
 *  @param enTitle 英文标题
 */
-(void)addButtonWithCnImageName:(NSString *)imageName withSelectedImgaeName:(NSString *)selectedName EnTitle:(NSString *)enTitle;

/**
 *  代理属性
 */
@property (nonatomic ,weak ) id<TabBarDelegate> delegate;
@end


