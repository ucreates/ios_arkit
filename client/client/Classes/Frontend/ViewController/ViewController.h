// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef ViewController_h
#define ViewController_h
#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>
#import "IconBehaviour.h"
@interface ViewController : UIViewController {
    IconBehaviour* behaviour;
    NSTimeInterval lastTime;
    BOOL enableTouch;
}
@end
#endif /* ViewController_h */
