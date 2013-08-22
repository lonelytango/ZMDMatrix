//
//  ZMDMatrix+Arithmetics.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ZMDMatrix+Arithmetics.h"

@implementation ZMDMatrix (Arithmetics)

- (void)addMatrix:(ZMDMatrix *)matrix {
    NSAssert([self isSameSizeAs:matrix], @"In order to add matrices, they must be in same size");
    
    for (int i = 0; i < [self columnCount]; i++) {
        
        for (int j = 0; j < [self rowCount]; j++) {
            
        }
        
    }
}

@end
