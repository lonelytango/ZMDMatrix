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


+ (NSArray *)rootsForQuadraticEq:(NSNumber *)param1 param2:(NSNumber *)param2 param3:(NSNumber *)param3 {
    
    double a = [param1 doubleValue];
    double b = [param2 doubleValue];
    double c = [param3 doubleValue];
    
    //double sol1 = (-b + sqrt(b*b - 4*a*c)) / 2*a;
    //double sol2 = (-b - sqrt(b*b - 4*a*c)) / 2*a;
    
    double sol1real, sol1img, sol2real, sol2img;
    
    double discriminant = b*b - 4*a*c;
    
    if (discriminant >= 0) {
        sol1real = (-b + sqrt(discriminant)) / 2*a;
        sol1img = 0;
        sol2real = (-b - sqrt(discriminant)) / 2*a;
        sol2img = 0;
        
    } else {
        sol1real = -b / 2*a;
        sol1img  = sqrt(abs(discriminant)) / 2*a;
        sol2real = -b / 2*a;
        sol2img  = -sqrt(abs(discriminant)) / 2*a;
    }
    
    
    NSLog(@"Sol 1r: %f, Sol 1i: %f, Sol 2r: %f, Sol 2r: %f", sol1real, sol1img, sol2real, sol2img);
    
    return @[@(sol1real), @(sol1img), @(sol2real), @(sol2img)];
}

@end