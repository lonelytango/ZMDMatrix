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

- (id)copyWithZone:(NSZone *)zone
{
    ZMDMatrix *matrixCopy = [ZMDMatrix allocWithZone:zone];
    [matrixCopy setMatrixHead:[self.matrixHead mutableCopy]];
    return matrixCopy;
}

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
    return [[self alloc] initWithRowSize:size columnSize:size identityMatrix:NO randomize:YES diagonalArray:nil];
}

+ (id)randomMatrixWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize {
    return [[self alloc] initWithRowSize:rowSize columnSize:columnSize identityMatrix:NO randomize:YES diagonalArray:nil];
}

+ (id)diagonalMatrixWithValues:(NSArray *)values {
    return [[self alloc] initWithRowSize:[values count] columnSize:[values count] identityMatrix:NO randomize:NO diagonalArray:values];
}

- (id)initWithSize:(NSInteger)size {
    NSAssert(size != 0, @"Size of matrix cannot be 0");
    return [self initWithRowSize:size columnSize:size];
}

- (id)initWithIdentityMatrixWithSize:(NSUInteger)size {
    return [self initWithRowSize:size columnSize:size identityMatrix:YES randomize:NO diagonalArray:nil];
}

- (id)initWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize {
    return [self initWithRowSize:rowSize columnSize:columnSize identityMatrix:NO randomize:NO diagonalArray:nil];
}

- (id)initWithRowSize:(NSUInteger)rowSize
           columnSize:(NSUInteger)columnSize
       identityMatrix:(BOOL)identityMatrix
            randomize:(BOOL)randomize
        diagonalArray:(NSArray *)diagonalArray{
    
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
                
                } else if ([diagonalArray count] > 0 && i == j) {
                    [row addObject:diagonalArray[i]];
                    
                } else {
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
    return [self numberOfColumns] * [self numberOfRows];
}

- (NSUInteger)numberOfRows {
    return [self.matrixHead count];
}

- (NSUInteger)numberOfColumns {
    if ([self numberOfRows] > 0) {
        return [self.matrixHead[0] count];
    }
    return 0;
}

- (BOOL)isSquare {
    return [self numberOfRows] == [self numberOfColumns];
}

- (BOOL)isEqual:(ZMDMatrix *)matrix {
    
    if ([self numberOfRows] != [matrix numberOfRows] || [self numberOfColumns] != [matrix numberOfColumns]) {
        return NO;
    }
    
    for (int i = 0; i < [self numberOfRows]; i++) {
        for (int j = 0; j < [self numberOfColumns]; j++) {
            if ([[self objectInRowIndex:i columnIndex:j] compare:[matrix objectInRowIndex:i columnIndex:j]] != NSOrderedSame) {
                return NO;
            }
        }
    }
    return YES;
}

- (NSString *)description {
    
    NSMutableString *descriptionString = [NSMutableString stringWithString:@"\n"];
    
    for (NSArray *row in self.matrixHead) {
        for (int j = 0; j < [row count]; j++) {
            [descriptionString appendFormat:@"%@%@", row[j], ((j < [row count] - 1) ? @" " : @"\n")];
        }
    }
    
    return descriptionString;
}





#pragma mark - Data Retrival

- (id)objectInRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex  {
    NSAssert(self != nil, @"Matrix cannot be nil");
    NSAssert1(columnIndex < [self numberOfColumns], @"Column index exceeded bound : %d", [self numberOfColumns]);
    NSAssert1(rowIndex < [self numberOfRows], @"Row index exceeded bound : %d", [self numberOfRows]);
    
    return self.matrixHead[rowIndex][columnIndex];
}

- (NSArray *)rowAtIndex:(NSUInteger)index {
    NSAssert(index < [self numberOfRows], @"Row index has to less than number of rows.");
    
    return [[self.matrixHead objectAtIndex:index] copy];
}

- (NSArray *)columnAtIndex:(NSUInteger)index {
    NSAssert(index < [self numberOfColumns], @"Column index has to less than number of columns.");
    
    NSMutableArray *column = [NSMutableArray new];
    
    for (NSMutableArray *row in self.matrixHead) {
        [column addObject:row[index]];
    }
    
    return [column copy];
}





#pragma mark - Data Assignment

- (void)assignNumber:(NSNumber *)number toRowIndex:(NSUInteger)rowIndex columnIndex:(NSUInteger)columnIndex {
    
    NSAssert1(rowIndex >= 0, @"Row index cannot be nagative (%d)", rowIndex);
    NSAssert1(columnIndex >= 0, @"Column index cannot be nagative (%d)", columnIndex);
    NSAssert2(rowIndex < [self numberOfRows], @"Row index (%d) cannot exceed row count (%d)", rowIndex, [self numberOfRows]);
    NSAssert2(columnIndex < [self numberOfColumns], @"Column index (%d) cannot exceed column count (%d)", columnIndex, [self numberOfColumns]);
    
    NSMutableArray *rowArray = self.matrixHead[rowIndex];
    rowArray[columnIndex] = number;
}




#pragma mark - Matrix Manipulation

- (void)addRow {
    [self insertRowAtRowIndex:[self numberOfRows]];
}

- (void)addColumn {
    //NSLog(@"Column Count: %d", [self numberOfColumns]);
    
    [self insertColumnAtColumnIndex:[self numberOfColumns]];
}

- (void)insertRowAtRowIndex:(NSUInteger)index {
    NSAssert2(index <= [self numberOfRows], @"Insertion index (%d) cannot larger than number of rows (%d).", index, [self numberOfRows]);
    
    NSMutableArray *row = [NSMutableArray new];
    for (int i = 0; i < [self numberOfRows]; i++) {
        [row addObject:@(0)];
    }
    
    [self.matrixHead insertObject:row atIndex:index];
}

- (void)insertColumnAtColumnIndex:(NSUInteger)index {
    NSAssert2(index <= [self numberOfColumns], @"Insertion index (%d) cannot be larger than number of columns (%d).", index, [self numberOfColumns]);
    
    for (NSMutableArray *row in self.matrixHead) {
        [row insertObject:@(0) atIndex:index];
    }
}

- (void)removeLastRow {
    [self removeRowAtIndex:([self numberOfRows]-1)];
}

- (void)removeLastColumn {
    [self removeColumnAtIndex:([self numberOfColumns] - 1)];
}

- (void)removeRowAtIndex:(NSUInteger)index {
    NSAssert2(index < [self numberOfRows], @"Deletion index (%d) cannot be larger than number of rows(%d).", index, [self numberOfRows]);
    
    [self.matrixHead removeObjectAtIndex:index];
}

- (void)removeColumnAtIndex:(NSUInteger)index {
    NSAssert2(index < [self numberOfColumns], @"Deletion index (%d) must be less than number of rows (%d).", index, [self numberOfColumns]);
    
    for (NSMutableArray *row in self.matrixHead) {
        [row removeObjectAtIndex:index];
    }
}





#pragma mark - Comparison

- (BOOL)isSameSizeAs:(ZMDMatrix *)matrix {
    return [self numberOfColumns] == [matrix numberOfColumns] && [self numberOfRows] == [matrix numberOfRows];
}




#pragma mark - Characteristics

- (NSNumber *)determinant {
    
    int row = [self numberOfRows];
    int column = [self numberOfColumns];
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
            NSNumber *subDeterminant = [[permutationRoot multiply:[subMatrix determinant]] multiply:@(sign)];
            determinant = [determinant add:subDeterminant];
            
            sign = -sign;
        }
    }
    
    return determinant;
}


- (NSNumber *)trace {
    
    NSAssert([self isSquare], @"Unable to find trace in non-square matrix");
    
    NSNumber *trace = @(0);
    for (int i = 0; i < [self numberOfRows]; i++) {
        for (int j = 0; j < [self numberOfColumns]; j++) {
            if (i == j) {
                trace = [trace add:[self objectInRowIndex:i columnIndex:j]];
            }
        }
    }
    return trace;
}


- (ZMDMatrix *)transpose {
    
    NSInteger row = [self numberOfRows];
    NSInteger column = [self numberOfColumns];
    
    ZMDMatrix *transposeMatrix = [ZMDMatrix matrixWithRowSize:column columnSize:row];
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < column; j++) {
            NSNumber *target = [self objectInRowIndex:i columnIndex:j];
            [transposeMatrix assignNumber:target toRowIndex:j columnIndex:i];
        }
    }
    return transposeMatrix;
}

- (ZMDMatrix *)adjunctMatrix {
    int row = [self numberOfRows];
    int column = [self numberOfColumns];
    int matrixSize = [self size];
    int sign = 1;
    
    NSAssert(row == column, @"Unable to find determinant of non-square matrix.");
    NSAssert(matrixSize != 0, @"Size of matrix cannot be 0");
    
    ZMDMatrix *coefficientMatrix = [ZMDMatrix matrixWithSize:row];
    
    if (matrixSize == 1) {
        return self;
        
    } else {
        
        ZMDMatrix *subMatrix = [ZMDMatrix matrixWithSize:row-1];
        
        for (int x = 0; x < row; x++) {
            
            for (int y = 0; y < row; y++) {
                
                int p = 0;
                int q = 0;
                
                //NSLog(@"================================");
                //NSLog(@"x: %d, y: %d", x, y);
                
                for (int i = 0; i < row; i++) {
                    
                    for (int j = 0; j < row; j++) {
                        if (i != x && j != y) {
                            //NSLog(@"i: %d, j: %d, p: %d, q: %d", i, j, p, q);
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
                NSNumber *subMatrixDeterminant = [[subMatrix determinant] multiply:@(sign)];
                [coefficientMatrix assignNumber:subMatrixDeterminant toRowIndex:x columnIndex:y];
                sign = -sign;
            }
        }
    }
    
    return [coefficientMatrix transpose];
}

- (ZMDMatrix *)inverseMatrix {
    
    ZMDMatrix *adjunctMatrix = [self adjunctMatrix];
    NSNumber *determinant = [self determinant];
    
    return [ZMDMatrix multiplyMatrix:adjunctMatrix byValue:[@(1) divide:determinant]];
}

@end
