// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "Quadratic.h"
@implementation Quadratic
+ (float)easeIn:(float)currentTime totalTime:(float)totalTime start:(float)start end:(float)end {
    float rate = currentTime / totalTime;
    float diff = end - start;
    if (1.0f <= rate) {
        rate = 1.0f;
    }
    return diff * powf(rate, 2.0f) + start;
}
+ (float)easeOut:(float)currentTime totalTime:(float)totalTime start:(float)start end:(float)end {
    float rate = currentTime / totalTime;
    float diff = end - start;
    if (1.0f <= rate) {
        rate = 1.0f;
    }
    return -1.0f * diff * rate * (rate - 2) + start;
}
+ (float)easeInOut:(float)currentTime totalTime:(float)totalTime start:(float)start end:(float)end {
    bool switchType = currentTime / totalTime >= 0.5f;
    if (false == switchType) {
        return [Quadratic easeIn:currentTime totalTime:totalTime start:start end:end];
    } else {
        return [Quadratic easeOut:currentTime totalTime:totalTime start:start end:end];
    }
}
@end
