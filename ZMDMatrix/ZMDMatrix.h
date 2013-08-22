//
//  ZMDMatrix.h
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMDMatrix : NSObject

//Initialization methods.

+ (instancetype)identityMatrixWithSize:(NSUInteger)size;

- (id)initWithSize:(NSInteger)size;
- (id)initWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize;
- (id)initWithIdentityMatrixWithSize:(NSUInteger)size;


- (NSUInteger)rowCount;
- (NSUInteger)columnCount;
- (NSUInteger)size;

@end
