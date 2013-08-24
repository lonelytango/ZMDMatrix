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




- (NSNumber *)add:(NSNumber *)number {
    return @([self floatValue] + [number floatValue]);
}

- (NSNumber *)subtract:(NSNumber *)number {
    return @([self floatValue] - [number floatValue]);
}

- (NSNumber *)multiply:(NSNumber *)number {
    return @([self floatValue] * [number floatValue]);
}

- (NSNumber *)divide:(NSNumber *)number {
    return @([self floatValue] / [number floatValue]);
}

- (NSNumber *)modular:(NSNumber *)number {
    return @([self integerValue] % [number integerValue]);
}

@end