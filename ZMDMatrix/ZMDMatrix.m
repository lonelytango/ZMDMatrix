//
//  ZMDMatrix.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ZMDMatrix.h"

@interface ZMDMatrix ()
@property (nonatomic, strong) NSMutableArray *matrixHead;   //Beginning of each row.
@end

@implementation ZMDMatrix

#pragma mark - Initializations

+ (id)matrixWithSize:(NSUInteger)size {
    return [[ZMDMatrix alloc] initWithSize:size];
}

+ (id)matrixWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize {
    return [[self alloc] initWithRowSize:rowSize columnSize:columnSize];
}

+ (id)identityMatrixWithSize:(NSUInteger)size {
    return [[self alloc] initWithIdentityMatrixWithSize:size];
}

+ (id)randomMatrixWithSize:(NSUInteger)size {
    return [[self alloc] initWithRowSize:size columnSize:size identityMatrix:NO randomize:YES];
}


- (id)initWithSize:(NSInteger)size {
    NSAssert(size != 0, @"Size of matrix cannot be 0");
    return [self initWithRowSize:size columnSize:size];
}

- (id)initWithIdentityMatrixWithSize:(NSUInteger)size {
    return [self initWithRowSize:size columnSize:size identityMatrix:YES randomize:NO];
}

- (id)initWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize {
    return [self initWithRowSize:rowSize columnSize:columnSize identityMatrix:NO randomize:NO];
}

- (id)initWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize identityMatrix:(BOOL)identityMatrix randomize:(BOOL)randomize {
    
    NSAssert((rowSize > 0) && (columnSize > 0), @"Row or column in matrix cannot be 0");
    
    NSAssert((identityMatrix && randomize) == NO, @"Identity and randomize are mutually exclusive.");
    
    self = [super init];
    
    if (self) {
        _matrixHead = [NSMutableArray array];
        
        for (int i = 0; i < columnSize; i++) {
            
            NSMutableArray *row = [NSMutableArray new];
            
            for (int j = 0; j < rowSize; j++) {
                
                if (identityMatrix && i == j ) {
                    [row addObject:@(1)];
                
                } else if (randomize) {
                    [row addObject:@(arc4random() % 100)];
                }
                
                else {
                    [row addObject:@(0)];
                }
            }
            
            [_matrixHead addObject:row];
        }
    }
    return self;
}






#pragma mark - Basic Methods

- (NSUInteger)size {
    return [self columnCount] * [self rowCount];
}

- (NSUInteger)rowCount {
    if ([self columnCount] > 0) {
        return [self.matrixHead[0] count];
    }
    return 0;
}

- (NSUInteger)columnCount {
    return [self.matrixHead count];
}

- (NSString *)description {
    
    NSMutableString *descriptionString = [[NSMutableString alloc] initWithString:@"\n"];
    for (NSArray *row in self.matrixHead) {
        for (int j = 0; j < [row count]; j++) {
            [descriptionString appendFormat:@"%@%@", row[j], ((j < [row count] - 1) ? @" " : @"\n")];
        }
    }
    
    return [NSString stringWithFormat:@"%@", descriptionString];
}




#pragma mark - Data Retrival

- (id)objectInRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex  {
    NSAssert(self != nil, @"Matrix cannot be nil");
    
    NSAssert1(columnIndex < [self columnCount], @"Column index exceeded bound : %d", [self columnCount]);
    
    NSAssert1(rowIndex < [self rowCount], @"Row index exceeded bound : %d", [self rowCount]);
    
    return self.matrixHead[rowIndex][columnIndex];
}



#pragma mark - Comparison

- (BOOL)isSameSizeAs:(ZMDMatrix *)matrix {
    return [self columnCount] == [matrix columnCount] && [self rowCount] == [matrix rowCount];
}


@end
