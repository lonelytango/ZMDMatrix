//
//  ZMDMatrix+Arithmetics.h
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ZMDMatrix.h"

@interface ZMDMatrix (Arithmetics)

+ (ZMDMatrix *)sumOfMatrix:(ZMDMatrix *)matrix1 and:(ZMDMatrix *)matrix2;
+ (ZMDMatrix *)differenceOfMatrix:(ZMDMatrix *)matrix1 and:(ZMDMatrix *)matrix2;
+ (ZMDMatrix *)productOfMatrix:(ZMDMatrix *)matrix1 and:(ZMDMatrix *)matrix3;
+ (ZMDMatrix *)multiplyMatrix:(ZMDMatrix *)matrix byValue:(NSNumber *)multiplier;

@end
