//
//  OthelloBoard.m
//  Othello
//
//  Created by Theo Voss on 7/1/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import "OthelloBoard.h"

@implementation OthelloBoard

#pragma mark - initialize board
-(id)initWithRows:(NSInteger)numberOfRows withColumns:(NSInteger)numberOfColumns
{
    self = [super initWithRows:numberOfRows columns:numberOfColumns];
    if (self) {
        self.EMPTY = @"EMPTY";
        self.UP = @"UP";
        self.DOWN = @"DOWN";
    
        _numberOfRows = numberOfRows;
        _numberOfColumns = numberOfColumns;
    
        [self initializeBoard];
        [self setStartPieces];
    }
    return self;
}

- (void) initializeBoard {
    NSLog(@"Initializing model board");
    for(NSInteger row = 0; row < self.numberOfRows; row++)
    {
        for(NSInteger column = 0; column < self.numberOfColumns; column++)
        {
            NSString * key = [self generateKey:row column:column];
            [self.board setObject:self.EMPTY forKey:key];
        }
    }
}

- (void) setStartPieces{
    NSLog(@"Setting Starting pieces");
    NSInteger middleRow = (self.numberOfRows / 2) - 1;
    NSInteger middleColumn = (self.numberOfColumns / 2) - 1;
    
    NSString *key = [self generateKey: middleRow column:middleColumn];
    [self.board setObject:self.UP forKey:key];
    
    key = [self generateKey:middleRow + 1 column:middleColumn + 1];
    [self.board setObject:self.UP forKey:key];
    
    key = [self generateKey: middleRow + 1 column:middleColumn];
    [self.board setObject:self.DOWN forKey:key];
    
    key = [self generateKey: middleRow column:middleColumn + 1];
    [self.board setObject:self.DOWN forKey:key];
    
}

#pragma mark - main functionality functions
- (BOOL) placePiece:(NSInteger) row column:(NSInteger)column orientation:(NSString*)orientation{
    if ([self isValidPlacement:row column:column orientation:orientation]){
        self.board[[self generateKey:row column:column]] = orientation;
        NSArray * piecesToFlip = [self findAllPiecesToFlip:row column:column orientation:orientation];
        [self flipPieces:piecesToFlip];
        return true;
    }
    return false;
}

- (BOOL) isValidPlacement:(NSInteger) row column:(NSInteger)column orientation:(NSString*)orientation{
    BOOL isEmpty = [self isEmpty:row column:column];
    BOOL isNextToOppositePiece = [self isNextToOppositePiece:row column:column orientation:orientation];
    NSArray *piecesToFlip = [self findAllPiecesToFlip:row column:column orientation:orientation];
    BOOL canFlipPieces = [piecesToFlip count] > 0;
    
    if (isEmpty && isNextToOppositePiece && canFlipPieces) {
        return true;
    }
    else{
        return false;
    }
}
#pragma mark - convenience functions

- (NSArray *) findAllPiecesToFlip:(NSInteger)row column:(NSInteger)column orientation:(NSString *)orientation{
    NSString * orientationToFlip = self.UP;
    if (orientation == self.UP)
    {
        orientationToFlip = self.DOWN;
    }
    NSArray * piecesToFlip;
    for (NSString* key in [self getAdjacentKeys:row column:column]) {
        if (self.board[key] != orientation && self.board[key] != self.EMPTY) {
            NSArray* piecesToAdd = [self findPiecesToFlipAlongPath:row column:column key:key orientationToFlip:orientationToFlip];
            piecesToFlip = [piecesToFlip arrayByAddingObjectsFromArray:piecesToAdd];
        }
    }
    return piecesToFlip;
}

- (NSArray *)findPiecesToFlipAlongPath:(NSInteger)row column:(NSInteger)column key:(NSString *)key orientationToFlip:(NSString *)orientationToFlip {
    NSMutableArray * piecesToFlip;
    NSInteger keyColumn = [self getColumnFromKey:key];
    NSInteger keyRow = [self getRowFromKey:key];
    
    NSInteger columnDiff = keyColumn - column;
    NSInteger rowDiff = keyRow - row;
    
    while (self.board[key] == orientationToFlip) {
        [piecesToFlip addObject:key];
        
        keyColumn = [self getColumnFromKey:key];
        keyRow = [self getRowFromKey:key];
        
        key = [self generateKey:keyRow + rowDiff column:keyColumn + columnDiff];
    }
    
    return piecesToFlip;
}

- (BOOL) flipPieces:(NSArray *) pieces{
    for (NSString *key in pieces) {
        if (self.board[key] == self.UP)
        {
            self.board[key] = self.DOWN;
        }
        else if (self.board[key] == self.DOWN){
            self.board[key] = self.UP;
        }
        else{
            // can't flip an empty piece
            return false;
        }
    }
    return true;
}

- (BOOL) isEmpty:(NSInteger)row column:(NSInteger)column{
    NSString *boardLocation = [self generateKey:row column:column];
    if (self.board[boardLocation] == self.EMPTY){
        return true;
    }
    else{
        return false;
    }
}

- (BOOL) isNextToOppositePiece:(NSInteger)row column:(NSInteger)column orientation:(NSString*) orientation{
    for (NSString * key in [self getAdjacentKeys:row column:column]) {
        if (self.board[key] != self.EMPTY && self.board[key] != orientation) {
            return true;
        }
    }
    return false;
}

- (NSArray *) getAdjacentKeys:(NSInteger) row column:(NSInteger)column{
    return [NSArray arrayWithObjects:
    [self generateKey:row + 1 column:column],
    [self generateKey:row - 1 column:column],
    [self generateKey:row column:column + 1],
    [self generateKey:row column:column - 1],
    
    [self generateKey:row + 1 column:column - 1],
    [self generateKey:row - 1 column:column - 1],
    [self generateKey:row + 1 column:column + 1],
    [self generateKey:row - 1 column:column + 1],
            nil];
}

- (NSString *) getOppositeOrientation:(NSString*) orientation
{
    if (orientation == self.UP) {
        return self.DOWN;
    }
    else if (orientation == self.DOWN){
        return self.UP;
    }
    else
    {
        return self.EMPTY;
    }
}

@end
