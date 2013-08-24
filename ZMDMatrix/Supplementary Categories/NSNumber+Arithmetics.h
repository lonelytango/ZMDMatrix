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

@end