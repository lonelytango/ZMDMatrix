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
#import "ZMDMatrix+Operations.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    ZMDMatrix *matrix = [ZMDMatrix randomMatrixWithRowSize:5 columnSize:3];
    ZMDMatrix *transMatrix = [matrix transpose];
    
    NSLog(@"Matrix: %@", matrix);
    NSLog(@"Trans matrix: %@", transMatrix);
    
    
    //ZMDMatrix *matrix2 = [ZMDMatrix randomMatrixWithRowSize:10 columnSize:5];
    
    //ZMDMatrix *matrix = [ZMDMatrix randomMatrixWithRowSize:20 columnSize:10];
    //ZMDMatrix *matrix2 = [ZMDMatrix randomMatrixWithRowSize:10 columnSize:20];
    //ZMDMatrix *diffMatrix = [ZMDMatrix differenceOfMatrix:matrix and:matrix2];
    
    //ZMDMatrix *productMatris = [ZMDMatrix productOfMatrix:matrix and:matrix2];
    //ZMDMatrix *sumMatrix = [ZMDMatrix productOfMatrix:matrix and:matrix2];
    
    //NSLog(@"Product Matrix: %@", sumMatrix);
    
    /*
    NSLog(@"Row Count: %d", [matrix rowCount]);
    NSLog(@"Column Count: %d", [matrix columnCount]);
    NSLog(@"Matrix size: %d", [matrix size]);
    NSLog(@"Object at [1][2]: %@", [matrix objectInRowIndex:1 columnIndex:2]);
     */
}

@end
