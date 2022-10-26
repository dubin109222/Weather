//
//  MainViewController.m
//  Weather
//
//  Created by 杜宾 on 2022/10/25.
//

#import "MainViewController.h"
#import "BaseNavViewController.h"
#import "TabBar.h"
#import "HomeViewController.h"
#import "MeViewController.h"
#import "DHGuidePageHUD.h"


@interface MainViewController ()<TabBarDelegate>
/**
 *  自定义tabbar
 */
@property (nonatomic , weak) TabBar *myTabbar;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置自定义tabbar
    if (![[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
        // 静态引导页
        [self setStaticGuidePage];
        
        // 动态引导页
        // [self setDynamicGuidePage];
        
        // 视频引导页
        // [self setVideoGuidePage];
    }
    
    [self setupTabbar];
    
    // 设置子控制器
    [self setupChildViewController];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 去除自带tabbarbutton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
/**
 *  创建自定义tabbar
 */
- (void)setupTabbar
{
    // 创建自定义tabbar
    TabBar *mytabbar = [[TabBar alloc] initWithFrame:self.tabBar.bounds];
    // 添加到自带tabbar里去
    [self.tabBar addSubview:mytabbar];
    // 设置代理
    mytabbar.delegate = self;
    
    self.myTabbar = mytabbar;
    
}

/**
 *  添加子控制器
 */
-(void)setupChildViewController
{
    // 添加天气预报界面
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    [self setChildVc:homeVc cnImageTitle:@"nav_01" withSecletedImageName:@"nav_02" enTitle:@"首页"];
    
//    // 添加生活界面
//    LifeController *lifeVc = [[LifeController alloc] init];
//    [self setChildVc:lifeVc cnTitle:@"生活" enTitle:@"Life"];
//    
//    // 添加实景界面
//    LiveController *liveVc = [[LiveController alloc] init];
//    [self setChildVc:liveVc cnTitle:@"实景" enTitle:@"Live"];
    
    // 添加我界面
    MeViewController *meVc = [[MeViewController alloc] init];
    [self setChildVc:meVc cnImageTitle:@"nav_03" withSecletedImageName:@"nav_04" enTitle:@"我的"];
}

/**
 *  设置子控制器
 */
- (void)setChildVc:(UIViewController *)childVc cnImageTitle:(NSString *)cnImageTitle withSecletedImageName:(NSString *)selectedName enTitle:(NSString *)enTitle
{
//    childVc.title = cnTitle;
    // 通过中文标题及英文标题创建自定义tabbar的按钮
    [self.myTabbar addButtonWithCnImageName:cnImageTitle withSelectedImgaeName:selectedName EnTitle:enTitle];
    // 包装导航栏
    BaseNavViewController  *nav = [[BaseNavViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
}

/**
 *  实现代理方法
 */
- (void)tabbar:(TabBar *)tabbar clickedFrom:(int)from To:(int)to
{
    // 点击哪个按钮就去哪个界面
    self.selectedIndex = to;
}

#pragma mark - 设置APP静态图片引导页
- (void)setStaticGuidePage {
    NSArray *imageNameArray = @[@"guideImage1.jpg",@"guideImage2.jpg",@"guideImage3.jpg",@"guideImage4.jpg",@"guideImage5.jpg"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:NO];
    guidePage.slideInto = YES;
    [self.view addSubview:guidePage];
}

#pragma mark - 设置APP动态图片引导页
- (void)setDynamicGuidePage {
    NSArray *imageNameArray = @[@"guideImage6.gif",@"guideImage7.gif",@"guideImage8.gif"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
    guidePage.slideInto = YES;
    [self.view addSubview:guidePage];
}

#pragma mark - 设置APP视频引导页
- (void)setVideoGuidePage {
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"guideMovie1" ofType:@"mov"]];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.bounds videoURL:videoURL];
    [self.view addSubview:guidePage];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
