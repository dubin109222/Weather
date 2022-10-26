//
//  Macro.h
//  Weather
//
//  Created by 杜宾 on 2022/10/24.
//

#ifndef Macro_h
#define Macro_h



#pragma mark - 方法宏定义

#define WTAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define WTUserDefaults [NSUserDefaults standardUserDefaults]
#define WEAK_Self   __weak typeof(self)weakSelf = self;
#define STRONG_Self   __strong typeof(weakSelf)strongSelf = weakSelf;
#define STRONG_Self_AutoReturn   __strong typeof(weakSelf)strongSelf = weakSelf;\
if (!strongSelf) { return ;}


// iPhoneX 屏幕适配
#define WT_TARGET_IPHONE_X           WT_iPhoneX()
#define WT_NAV_BAR_HEIGHT            (WT_TARGET_IPHONE_X ? 88 : 64)
#define WT_STATUS_BAR_HEIGHT         (WT_TARGET_IPHONE_X ? 44 : 20)
#define WT_STATUS_BAR_TOP_MARGIN     (WT_TARGET_IPHONE_X ? 24 : 0)
#define WT_TOP_ESTIMATED_MARGIN      (WT_TARGET_IPHONE_X ? 30 : 0)
#define WT_STATUS_BAR_HEIGHT_ONLY_X  (WT_TARGET_IPHONE_X ? 44 : 0)
#define WT_STATUS_REDPACKBAR_HEIGHT         (WT_TARGET_IPHONE_X ? 32 : 20)
#define WT_STATUS_Gold        (CK_TARGET_IPHONE_X ? 50 : 40)
#define WT_TAB_BAR_HEIGHT            (WT_TARGET_IPHONE_X ? 83 : 49)
#define WT_TAB_BAR_BOTTOM_MARGIN     (WT_TARGET_IPHONE_X ? 34 : 0)
#define WT_CALCPX(x) [UIScreen mainScreen].bounds.size.width/375.0*(x)

/**
 *   屏幕 宽高
 */
#define WT_SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define WT_SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define WT_SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define WT_STT_OnePointHeight  (1/[UIScreen mainScreen].scale)
#define WT_SCREEN_SIZE_MIN     MIN(WT_SCREEN_HEIGHT,WT_SCREEN_WIDTH)
#define WT_SCREEN_SIZE_MAX     MAX(WT_SCREEN_HEIGHT,WT_SCREEN_WIDTH)
#define WT_TAB_BAR_BOTTOM_SAFE_MARGIN     (WT_TARGET_IPHONE_X ? 15 : 0)


#define WT_RGBA(r,g,b,a)           [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define WT_RandomColor           WT_RGBA((arc4random()%256), (arc4random()%256), (arc4random()%256), 1)
#define WT_ColorWithHexA(str,a)  [WT_ColorWithHex(str) colorWithAlphaComponent:a]
#define WT_ColorWithHex(str)       [UIColor colorWithRed:((float)((str & 0xFF0000) >> 16))/255.0 green:((float)((str & 0xFF00) >> 8))/255.0 blue:((float)(str & 0xFF))/255.0 alpha:1.0]


#endif /* Macro_h */



