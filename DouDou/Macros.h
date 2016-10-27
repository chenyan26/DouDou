//
//  Macros.h
//  DouDou
//
//  Created by chenyan on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

//********************** 尺寸 *************************//
#define SCREEN_BOUNDS       [UIScreen mainScreen].bounds
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

//login、add、edit中的高度
//#define HEIGHT_LOGINCELL	50


//********************** 颜色 *************************//

//MBHUD dim背景色
//#define     DEFAULT_DIM_COLOR             CYColor(26, 26, 26, 0.6)

//********************** Path *************************//

//Document
#define     PATH_DOCUMENT                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//********************** key *************************//

#endif
