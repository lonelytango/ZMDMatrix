//
//  NSNumber+Arithmetics.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "NSNumber+Arithmetics.h"

@implementation NSNumber (Arithmetics)

+ (NSNumber *)sumOfNumber:(NSNumber *)a and:(NSNumber *)b {
    return @([a floatValue] + [b floatValue]);
}

+ (NSNumber *)differenceOfNumber:(NSNumber *)a and:(NSNumber *)b {
    return @([a floatValue] - [b floatValue]);
}

+ (NSNumber *)productOfNumber:(NSNumber *)a and:(NSNumber *)b {
    return @([a floatValue] * [b floatValue]);
}

+ (NSNumber *)quotientOfNumber:(NSNumber *)a and:(NSNumber *)b {
    return @([a floatValue] / [b floatValue]);
}

+ (NSNumber *)remainderOfNumber:(NSNumber *)a and:(NSNumber *)b {
    return @([a integerValue] % [b integerValue]);
}

@end