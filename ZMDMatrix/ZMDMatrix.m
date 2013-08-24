//
//  ZMDMatrix.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ZMDMatrix.h"
#import "ZMDMatrix+Arithmetics.h"
#import "NSNumber+Arithmetics.h"

@interface ZMDMatrix ()
@property (nonatomic, strong, readwrite) NSMutableArray *matrixHead;   //Beginning of each row.
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


+ (id)randomMatrixWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize {
    return [[self alloc] initWithRowSize:rowSize columnSize:columnSize identityMatrix:NO randomize:YES];
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
        
        for (int i = 0; i < rowSize; i++) {
            
            NSMutableArray *row = [NSMutableArray new];
            
            for (int j = 0; j < columnSize; j++) {
                
                if (identityMatrix && i == j ) {
                    [row addObject:@(1)];
                
                } else if (randomize) {
                    [row addObject:@(arc4random() % 10)];
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
    return [self.matrixHead count];
}

- (NSUInteger)columnCount {
    if ([self rowCount] > 0) {
        return [self.matrixHead[0] count];
    }
    return 0;
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


#pragma mark - Data Assignment

- (void)assignNumber:(NSNumber *)number toRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex {
    
    NSAssert1(rowIndex >= 0, @"Row index cannot be nagative (%d)", rowIndex);
    NSAssert1(columnIndex >= 0, @"Column index cannot be nagative (%d)", columnIndex);
    NSAssert2(rowIndex < [self rowCount], @"Row index (%d) cannot exceed row count (%d)", rowIndex, [self rowCount]);
    NSAssert2(columnIndex < [self columnCount], @"Column index (%d) cannot exceed column count (%d)", columnIndex, [self columnCount]);
    
    NSMutableArray *rowArray = self.matrixHead[rowIndex];
    rowArray[columnIndex] = number;
}




#pragma mark - Comparison

- (BOOL)isSameSizeAs:(ZMDMatrix *)matrix {
    return [self columnCount] == [matrix columnCount] && [self rowCount] == [matrix rowCount];
}




#pragma mark - Characteristics

- (NSNumber *)determinant {
    
    int row = [self rowCount];
    int column = [self columnCount];
    int matrixSize = [self size];
    int sign = 1;
    
    NSAssert(row == column, @"Unable to find determinant of non-square matrix.");
    NSAssert(matrixSize != 0, @"Size of matrix cannot be 0");
    
    NSNumber *determinant = @(0);
    
    if (matrixSize == 1) {
        determinant = [self objectInRowIndex:0 columnIndex:0];
        
    } else {
        
        ZMDMatrix *subMatrix = [ZMDMatrix matrixWithSize:row-1];
        
        for (int x = 0; x < row; x++) {
            
            int p = 0;
            int q = 0;
            
            for (int i = 1; i < row; i++) {
                for (int j = 0; j < row; j++) {
                    //NSLog(@"i: %d, j: %d, p: %d, q: %d", i, j, p, q);
                    if (j != x) {
                        NSNumber *target = [self objectInRowIndex:i columnIndex:j];
                        [subMatrix assignNumber:target toRowIndex:p columnIndex:q];
                        q += 1;
                        
                        if (q % (row-1) == 0) {
                            p += 1;
                            q = 0;
                        }
                    }
                }
            }
            
            //Use the first row as for matrix permutation.
            NSNumber *permutationRoot = [self objectInRowIndex:0 columnIndex:x];
            NSNumber *subDeterminant = [NSNumber productOfNumber:permutationRoot and:[subMatrix determinant]];
            NSNumber *addSignSubDeterminant = [NSNumber productOfNumber:subDeterminant and:@(sign)];
            determinant = [NSNumber sumOfNumber:determinant and:addSignSubDeterminant];
            
            sign = -sign;
        }
    }
    
    return determinant;
}

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
