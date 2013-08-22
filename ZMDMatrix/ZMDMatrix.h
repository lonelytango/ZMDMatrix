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
+ (id)matrixWithSize:(NSUInteger)size;
+ (id)matrixWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize;
+ (id)identityMatrixWithSize:(NSUInteger)size;
+ (id)randomMatrixWithSize:(NSUInteger)size;

- (NSUInteger)rowCount;
- (NSUInteger)columnCount;
- (NSUInteger)size;

//Data Retrival
- (id)objectInRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex;

//Comparison
- (BOOL)isSameSizeAs:(ZMDMatrix *)matrix;

@end
