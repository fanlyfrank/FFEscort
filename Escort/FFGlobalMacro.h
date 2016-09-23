//
//  FFGlobalMacro.h
//  FFEscort
//
//  Created by fanly frank on 4/15/16.
//  Copyright © 2016 fanly frank. All rights reserved.
//

#ifndef FFGlobalMacro_h
#define FFGlobalMacro_h

#pragma mark -- global color setting

#define FFRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]// RGB色

#define FFRandomColor FFRGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))// 随机色

#define UIColorFromRGB(rgbValue) UIColorFromRGBWithAlpha(rgbValue, 1.0f)

#define UIColorFromRGBWithAlpha(rgbValue, alpha1) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alpha1]//十六进制转RGB色

#define FFMainColor FFRGBColor(74, 144, 226)
#define FFWarningColor FFRGBColor(249, 142, 79)

#define FFHighlightColor FFRGBColor(4, 169, 255)
#define FFLowlightColor FFRGBColor(130, 130, 130)

#define FFNormalColor FFRGBColor(0, 0, 0)
#define FFDarkColor FFRGBColor(151, 151, 151)

#define FFBackColor FFRGBColor(240, 240, 240)

#pragma mark -- screen size

#define FFScreenW [UIScreen mainScreen].bounds.size.width
#define FFScreenH [UIScreen mainScreen].bounds.size.height

#pragma mark -- font size

#define FFBigFont [UIFont systemFontOfSize:15]
#define FFNormalFont [UIFont systemFontOfSize:13]
#define FFSmallFont [UIFont systemFontOfSize:11.5]
#define FFTinyFont [UIFont systemFontOfSize:10]

#endif /* FFGlobalMacro_h */
