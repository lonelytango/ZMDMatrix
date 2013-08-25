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

+ (id)diagonalMatrixWithValues:(NSArray *)values;

- (NSUInteger)numberOfRows;
- (NSUInteger)numberOfColumns;
- (NSUInteger)size;
- (BOOL)isSquare;
- (BOOL)isEqual:(ZMDMatrix *)matrix;

//Data Retrival
- (id)objectInRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex;
- (NSArray *)rowAtIndex:(NSUInteger)index;
- (NSArray *)columnAtIndex:(NSUInteger)index;

//Data Assignment
- (void)assignNumber:(NSNumber *)number toRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex;


//Matrix Manipulation
- (void)addRow;     //Add row to the end of last row.
- (void)addColumn;  //Add column to the end of last column.
- (void)insertRowAtRowIndex:(NSUInteger)index;
- (void)insertColumnAtColumnIndex:(NSUInteger)index;

- (void)removeLastRow;
- (void)removeLastColumn;
- (void)removeRowAtIndex:(NSUInteger)index;
- (void)removeColumnAtIndex:(NSUInteger)index;


//Comparison
- (BOOL)isSameSizeAs:(ZMDMatrix *)matrix;


//Characteristics
- (NSNumber *)determinant;
- (NSNumber *)trace;
- (ZMDMatrix *)transpose;
- (ZMDMatrix *)adjunctMatrix;
- (ZMDMatrix *)inverseMatrix;

@end
