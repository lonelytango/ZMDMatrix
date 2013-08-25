//
//  NSNumber+Arithmetics.h
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Arithmetics)

+ (NSNumber *)sumOfNumber:(NSNumber *)a and:(NSNumber *)b;
+ (NSNumber *)differenceOfNumber:(NSNumber *)a and:(NSNumber *)b;
+ (NSNumber *)productOfNumber:(NSNumber *)a and:(NSNumber *)b;
+ (NSNumber *)quotientOfNumber:(NSNumber *)a and:(NSNumber *)b;
//Must be int values
+ (NSNumber *)remainderOfNumber:(NSNumber *)a and:(NSNumber *)b;

- (NSNumber *)add:(NSNumber *)number;
- (NSNumber *)subtract:(NSNumber *)number;
- (NSNumber *)multiply:(NSNumber *)number;
- (NSNumber *)divide:(NSNumber *)number;
- (NSNumber *)modular:(NSNumber *)number;


//Returns array of 4 items:
//real Root of 1st solution
//imaginary root of 1st solution,
//real Root of 2nd solution
//imaginary root of 2nd solution,

+ (NSArray *)rootsForQuadraticEq:(NSNumber *)param1 param2:(NSNumber *)param2 param3:(NSNumber *)param3;

@end