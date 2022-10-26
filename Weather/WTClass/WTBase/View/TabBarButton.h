//
//  TabBarButton.h
//  Weather
//
//  Created by 杜宾 on 2022/10/25.
//

#import <UIKit/UIKit.h>



@interface TabBarButton : UIButton
@property (nonatomic ,copy ) NSString *imageNameStr;
@property (nonatomic ,copy ) NSString *selectedNameStr;

-(void)setTitle:(NSString *)title withImageName:(NSString *)imageName withSelectedImage:(NSString *)selectedName;

@end


