//
//  ZMDMatrix.h
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMDMatrix : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *matrixHead;   //Beginning of each row.

//Initialization methods.
+ (id)matrixWithSize:(NSUInteger)size;
+ (id)matrixWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize;

+ (id)identityMatrixWithSize:(NSUInteger)size;

+ (id)randomMatrixWithSize:(NSUInteger)size;
+ (id)randomMatrixWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize;

- (NSUInteger)rowCount;
- (NSUInteger)columnCount;
- (NSUInteger)size;

//Data Retrival
- (id)objectInRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex;
- (void)assignNumber:(NSNumber *)number toRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex;

//Comparison
- (BOOL)isSameSizeAs:(ZMDMatrix *)matrix;

//Characteristics
- (NSNumber *)determinant;

@end
