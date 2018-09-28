// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "Parameter.h"
@implementation Parameter
@synthesize parmeterDictionary;
- (id)init {
    self->parmeterDictionary = [[NSMutableDictionary<NSString*, id> alloc] init];
    return self;
}
- (NSObject*)get:(NSString*)name {
    NSObject* ret = nil;
    if (NO != [self->parmeterDictionary.allKeys containsObject:name]) {
        ret = [self->parmeterDictionary objectForKey:name];
    }
    return ret;
}
- (void)set:(NSString*)name parameter:(id)parameter {
    if (NO != [self->parmeterDictionary.allKeys containsObject:name]) {
        return;
    }
    [self->parmeterDictionary setObject:parameter forKey:name];
    return;
}
@end
