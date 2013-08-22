//
//  ZMDMatrix.m
//  ZMDMatrixDemo
//
//  Created by Zian Chen on 8/22/13.
//  Copyright (c) 2013 Zian Mobile Development. All rights reserved.
//

#import "ZMDMatrix.h"

@interface ZMDMatrix ()
@property (nonatomic, strong) NSMutableArray *column;
@end

@implementation ZMDMatrix

+ (instancetype)identityMatrixWithSize:(NSUInteger)size {
    return [[self alloc] initWithIdentityMatrixWithSize:size];
}

- (id)initWithSize:(NSInteger)size {
    NSAssert(size != 0, @"Size of matrix cannot be 0");
    return [self initWithRowSize:size columnSize:size];
}

- (id)initWithIdentityMatrixWithSize:(NSUInteger)size {
    return [self initWithRowSize:size columnSize:size identityMatrix:YES];
}

- (id)initWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize {
    return [self initWithRowSize:rowSize columnSize:columnSize identityMatrix:NO];
}

- (id)initWithRowSize:(NSUInteger)rowSize columnSize:(NSUInteger)columnSize identityMatrix:(BOOL)identityMatrix {
    
    NSAssert((rowSize > 0) && (columnSize > 0), @"Row or column in matrix cannot be 0");
    
    self = [super init];
    
    if (self) {
        _column = [NSMutableArray array];
        
        for (int i = 0; i < columnSize; i++) {
            
            NSMutableArray *row = [NSMutableArray new];
            
            for (int j = 0; j < rowSize; j++) {
                
                if (identityMatrix && i == j ) {
                    [row addObject:@(1)];
                } else {
                    [row addObject:@(0)];
                }
            }
            
            [_column addObject:row];
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
        return [self.column[0] count];
    }
    return 0;
}

- (NSUInteger)columnCount {
    return [self.column count];
}

- (NSString *)description {
    
    NSMutableString *descriptionString = [[NSMutableString alloc] initWithString:@"\n"];
    for (NSArray *row in _column) {
        for (int j = 0; j < [row count]; j++) {
            [descriptionString appendFormat:@"%@%@", row[j], ((j < [row count] - 1) ? @" " : @"\n")];
        }
    }
    
    return [NSString stringWithFormat:@"%@", descriptionString];
}


@end
