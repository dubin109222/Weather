//
//  RequestDefine.h
//  Weather
//
//  Created by 杜宾 on 2022/10/24.
//

#ifndef RequestDefine_h
#define RequestDefine_h

#pragma mark -- Host
//1 测试环境 0 正式
#if ISRELEASE == 1

#elif ISRELEASE == 0  //正式环境

#endif



#pragma mark -- User & Login

//获取钻石列表
//#define CSDiamondList  CS_HOST_BUY@"api/diamond/list"


#pragma mark -- 用户协议&隐私政策
//隐私政策
//#define CSPravicyUrl @"https://www.crazysnake.io/privacy_agreement.html"

//用户协议
//#define CSServiceUrl @"https://www.crazysnake.io/user_agreement.html"


#endif /* CSRequestDefine_h */

