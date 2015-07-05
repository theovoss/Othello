//
//  OthelloBoard.h
//  Othello
//
//  Created by Theo Voss on 7/1/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@interface OthelloBoard : Board

@property NSString * UP;
@property NSString * DOWN;
@property NSString * EMPTY;

@property NSInteger numberOfRows;
@property NSInteger numberOfColumns;

- (instancetype) initWithRows:(NSInteger)numberOfRows withColumns:(NSInteger)numberOfColumns;
- (void) initializeBoard;
- (void) setStartPieces;

#pragma mark - functional functions
- (BOOL) placePiece:(NSInteger) row column:(NSInteger)column orientation:(NSString*)orientation;

#pragma mark - convenience functions
- (BOOL) isValidPlacement:(NSInteger) row column:(NSInteger)column orientation:(NSString*)orientation;
- (NSArray *) findAllPiecesToFlip:(NSInteger) row column:(NSInteger)column orientation:(NSString*)orientation;

- (NSArray *)findPiecesToFlipAlongPath:(NSInteger)row column:(NSInteger)column key:(NSString *)key orientationToFlip:(NSString *)orientationToFlip;
- (BOOL) flipPieces:(NSArray *) pieces;

- (BOOL) isEmpty:(NSInteger)row column:(NSInteger)column;
- (BOOL) isNextToOppositePiece:(NSInteger)row column:(NSInteger)column orientation:(NSString*) orientation;
- (NSArray *) getAdjacentKeys:(NSInteger) row column:(NSInteger)column;
- (NSString *) getOppositeOrientation:(NSString*) orientation;

@end
