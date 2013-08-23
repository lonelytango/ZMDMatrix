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

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ZMDMatrix *matrix = [ZMDMatrix randomMatrixWithRowSize:1 columnSize:2];
    
    ZMDMatrix *matrix2 = [ZMDMatrix randomMatrixWithRowSize:2 columnSize:1];
    
    //ZMDMatrix *sumMatrix = [ZMDMatrix sumOfMatrix:matrix and:matrix2];
    //ZMDMatrix *diffMatrix = [ZMDMatrix differenceOfMatrix:matrix and:matrix2];
    ZMDMatrix *productMatris = [ZMDMatrix productOfMatrix:matrix and:matrix2];
    
    NSLog(@"Product Matrix: %@", productMatris);
    
    /*
    NSLog(@"Row Count: %d", [matrix rowCount]);
    NSLog(@"Column Count: %d", [matrix columnCount]);
    NSLog(@"Matrix size: %d", [matrix size]);
    NSLog(@"Object at [1][2]: %@", [matrix objectInRowIndex:1 columnIndex:2]);
     */
}

@end
