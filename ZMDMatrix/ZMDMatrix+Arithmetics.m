//
//  ZMDMatrix+Arithmetics.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ZMDMatrix+Arithmetics.h"
#import "NSNumber+Arithmetics.h"

@implementation ZMDMatrix (Arithmetics)

+ (ZMDMatrix *)sumOfMatrix:(ZMDMatrix *)matrix1 and:(ZMDMatrix *)matrix2 {
    
    NSAssert([matrix1 isSameSizeAs:matrix2], @"In order to add matrices, they must be in same size.");
    
    ZMDMatrix *totalMatrix = [ZMDMatrix matrixWithRowSize:[matrix1 numberOfRows] columnSize:[matrix1 numberOfColumns]];
    
    NSLog(@"Matrix: %d, %d", [totalMatrix numberOfRows], [totalMatrix numberOfColumns]);
    
    for (int i = 0; i < [matrix1 numberOfRows]; i++) {
        
        for (int j = 0; j < [matrix1 numberOfColumns]; j++) {
            
            NSNumber *sum = [NSNumber sumOfNumber:[matrix1 objectInRowIndex:i columnIndex:j] and:[matrix2 objectInRowIndex:i columnIndex:j]];
            [totalMatrix assignNumber:sum toRowIndex:i columnIndex:j];
        }
    }
    
    return totalMatrix;
}


+ (ZMDMatrix *)differenceOfMatrix:(ZMDMatrix *)matrix1 and:(ZMDMatrix *)matrix2 {
    
    NSAssert([matrix1 isSameSizeAs:matrix2], @"In order to add matrices, they must be in same size.");
    
    ZMDMatrix *diffMatrix = [ZMDMatrix matrixWithRowSize:[matrix1 numberOfRows] columnSize:[matrix1 numberOfColumns]];
    
    for (int i = 0; i < [matrix1 numberOfRows]; i++) {
        
        for (int j = 0; j < [matrix1 numberOfColumns]; j++) {
            
            NSNumber *difference = [NSNumber differenceOfNumber:[matrix1 objectInRowIndex:i columnIndex:j] and:[matrix2 objectInRowIndex:i columnIndex:j]];
            [diffMatrix assignNumber:difference toRowIndex:i columnIndex:j];
        }
    }
    
    return diffMatrix;
}



+ (ZMDMatrix *)productOfMatrix:(ZMDMatrix *)matrix1 and:(ZMDMatrix *)matrix2 {
    
    int rowMatrix1 = [matrix1 numberOfRows];
    int colMatrix1 = [matrix1 numberOfColumns];
    int rowMatrix2 = [matrix2 numberOfRows];
    int colMatrix2 = [matrix2 numberOfColumns];
    
    //NSLog(@"Matrix1 row = %d, column = %d, Matrix2 row = %d, column = %d", rowMatrix1, colMatrix1, rowMatrix2, colMatrix2);
    
    NSAssert(colMatrix1 == rowMatrix2, @"In order to multiply matrices, the col count of matrix1 has to equal to row count matrix2.");
    
    ZMDMatrix *productMatrix = [ZMDMatrix matrixWithRowSize:rowMatrix1 columnSize:colMatrix2];
    
    //Outer loop to get all the products...
    
    
    for (int i = 0; i < rowMatrix1; i++) {
        
        for (int j = 0; j < colMatrix2; j++) {
            
//            NSLog(@"===============================");
//            NSLog(@"Product for C(%d, %d)", i, j);
            
            //NSNumber *target = [productMatrix objectInRowIndex:i columnIndex:j];
            NSNumber *newProductSum = @(0);
            
            for (int k = 0; k < colMatrix1; k++) {
                
                NSNumber *op1 = [matrix1 objectInRowIndex:i columnIndex:k];
                NSNumber *op2 = [matrix2 objectInRowIndex:k columnIndex:j];
                NSNumber *newProduct = [NSNumber productOfNumber:op1 and:op2];
                
                //NSLog(@"A(%d, %d) * B(%d, %d) = %f * %f = %f", i, k, k, j, [op1 floatValue], [op2 floatValue], [newProduct floatValue]);
                
                newProductSum = [newProductSum add:newProduct];
            }
            
            [productMatrix assignNumber:newProductSum toRowIndex:i columnIndex:j];
            
            //NSLog(@"Product for C(%d, %d) ends", i, j);
        }
        
    }
    
    return productMatrix;
}


+ (ZMDMatrix *)multiplyMatrix:(ZMDMatrix *)matrix byValue:(NSNumber *)multiplier {
    
    NSInteger row = [matrix numberOfRows];
    NSInteger column = [matrix numberOfColumns];
    
    ZMDMatrix *resultMatrix = [ZMDMatrix matrixWithRowSize:row columnSize:column];
    
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < column; j++) {
            NSNumber *target = [matrix objectInRowIndex:i columnIndex:j];
            NSNumber *productTarget = [target multiply:multiplier];
            [resultMatrix assignNumber:productTarget toRowIndex:i columnIndex:j];
        }
    }
    
    return resultMatrix;
}


@end
