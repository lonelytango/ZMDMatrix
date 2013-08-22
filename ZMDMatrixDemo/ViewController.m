//
//  ViewController.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ViewController.h"
#import "ZMDMatrix.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ZMDMatrix *matrix = [ZMDMatrix randomMatrixWithSize:5];
    NSLog(@"Matrix: %@", matrix);
    NSLog(@"Row Count: %d", [matrix rowCount]);
    NSLog(@"Column Count: %d", [matrix columnCount]);
    NSLog(@"Matrix size: %d", [matrix size]);
    NSLog(@"Object at [1][2]: %@", [matrix objectInRowIndex:1 columnIndex:2]);
}

@end
