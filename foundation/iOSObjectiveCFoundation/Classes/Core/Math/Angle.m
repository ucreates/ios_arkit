// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import <Foundation/Foundation.h>
#import "Angle.h"
@implementation Angle
+ (float)toDegree:(float)radian {
    return radian * 180.0f / M_PI;
}
+ (float)toRadian:(float)degree {
    return degree * M_PI / 180.0f;
}
@end
