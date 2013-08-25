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
    
    ZMDMatrix *matrix = [ZMDMatrix randomMatrixWithSize:6];
    NSLog(@"Original Matrix: %@ - %d x %d", matrix, [matrix rowCount], [matrix columnCount]);
    
    [matrix addRow];
    NSLog(@"Added Row Matrix: %@ - %d x %d", matrix, [matrix rowCount], [matrix columnCount]);
    
    [matrix addColumn];
    NSLog(@"Added Column Matrix: %@ - %d x %d", matrix, [matrix rowCount], [matrix columnCount]);
    
    [matrix insertRowAtRowIndex:3];
    NSLog(@"Added Row Matrix: %@ - %d x %d", matrix, [matrix rowCount], [matrix columnCount]);
    
    [matrix insertColumnAtColumnIndex:4];
    NSLog(@"Added Column Matrix: %@ - %d x %d", matrix, [matrix rowCount], [matrix columnCount]);
}
@end
