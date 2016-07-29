//
//  Macros.h
//  DouDou
//
//  Created by echo on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#ifndef DD_Macros_h
#define DD_Macros_h

#define CYColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

#pragma mark - Frame
#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height

#define HEIGHT_LOGINCELL	60
#define MARGIN_CELL         20.0f

//#define HEIGHT_STATUSBAR	20
//#define HEIGHT_TABBAR       49
//#define HEIGHT_NAVBAR       44

#pragma mark - Color
#define     DEFAULT_NAVBAR_COLOR             CYColor(54.0, 153.0, 161.0, 1.0)
//#define     DEFAULT_BACKGROUND_COLOR         CYColor(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_BACKGROUND_COLOR         CYColor(234.0, 236.0, 241.0, 1.0)

#define     DEFAULT_SEARCHBAR_COLOR          CYColor(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_GREEN_COLOR              CYColor(2.0, 187.0, 0.0, 1.0f)
#define     DEFAULT_TEXT_GRAY_COLOR         [UIColor grayColor]
#define     DEFAULT_LINE_GRAY_COLOR          CYColor(188.0, 188.0, 188.0, 0.6f)

#pragma mark - Path
#define     PATH_DOCUMENT                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#define mark - Key

#endif
