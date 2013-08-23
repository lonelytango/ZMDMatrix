//
//  ZMDMatrix+Operations.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/23/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ZMDMatrix+Operations.h"

@implementation ZMDMatrix (Operations)

- (ZMDMatrix *)transpose {
    
    NSInteger row = [self rowCount];
    NSInteger column = [self columnCount];
    
    ZMDMatrix *transposeMatrix = [ZMDMatrix matrixWithRowSize:column columnSize:row];
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < column; j++) {
            NSNumber *target = [self objectInRowIndex:i columnIndex:j];
            [transposeMatrix assignNumber:target toRowIndex:j columnIndex:i];
        }
    }
    return transposeMatrix;
}

@end
