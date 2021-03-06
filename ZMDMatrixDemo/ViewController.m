//
//  ViewController.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ViewController.h"
#import "ZMDMatrix.h"
#import "ZMDMatrix+Arithmetics.h"
#import "NSNumber+Arithmetics.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self polynomialDemo];
    
    [self matrixDemo];
}

- (void)polynomialDemo {
    NSArray *roots = [NSNumber rootsForQuadraticEq:@(1) param2:@(3) param3:@(4)];
    NSLog(@"Roots: %@", roots);
}

- (void)matrixDemo {
    //ZMDMatrix *matrix = [ZMDMatrix randomMatrixWithRowSize:5 columnSize:3];
    //ZMDMatrix *productMatrix = [ZMDMatrix multiplyMatrix:matrix byValue:@(2)];
    
    ZMDMatrix *matrix = [ZMDMatrix randomMatrixWithSize:10];
    ZMDMatrix *matrix2 = [ZMDMatrix randomMatrixWithSize:10];
    ZMDMatrix *sameMatrix = [matrix copy];
    
    [matrix addRow];
    [sameMatrix addRow];
    NSLog(@"matrix: %@, matrix copy: %@", matrix, sameMatrix);
    NSLog(@"Matrix same?, %d", ([matrix isEqual:sameMatrix]));
    //NSLog(@"Matrix same?, %d", ([matrix isEqual:matrix2]));
    
//    NSLog(@"Row 4: %@", [matrix rowAtIndex:4]);
//    NSLog(@"Column 5: %@", [matrix columnAtIndex:5]);
}
@end
