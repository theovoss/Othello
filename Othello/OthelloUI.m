//
//  OthelloUI.m
//  Othello
//
//  Created by Theo Voss on 7/4/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import "OthelloUI.h"
#import "OthelloBoard.h"
#import "ColumnView.h"
@implementation OthelloUIView

- (instancetype) initWithColumns:(NSInteger)numberOfColumns withRows:(NSInteger)numberOfRows withPieceSize:(CGSize)pieceSize
{
    self = [super init];
    if (self) {
        _othelloBoard = [[OthelloBoard alloc] initWithRows:numberOfRows withColumns:numberOfColumns];
        _currentOrientation = _othelloBoard.UP;
        _columnViews = [[NSMutableArray alloc] init];

        for (NSInteger column = 0; column < numberOfColumns; column++) {
            CGRect columnFrame = CGRectMake(column*pieceSize.width, 0, pieceSize.width, pieceSize.height);
            ColumnView * view = [[ColumnView alloc] initWithRows:numberOfRows withPieceSize:pieceSize];
            view.frame = columnFrame;
            [self addSubview:view];
            [_columnViews addObject:view];
        }
        [self updateUI];
    }
    return self;
}

- (void) updateUI
{
    NSLog(@"Updating UI");
    for (NSInteger column = 0; column < self.columnViews.count; column++) {
        ColumnView *columnView = self.columnViews[column];
        for (NSInteger row = 0; row < columnView.rowViews.count; row++) {
            NSString *key = [self.othelloBoard generateKey:row column:column];
            
            UIButton *piece = [columnView OthelloPieceAtRow:row];
            NSString *title = self.othelloBoard.board[key];
            NSLog(@"Title is:");
            NSLog(title);
            [piece setTitle:title forState:UIControlStateNormal];
            [columnView SetPieceAtRow:row withPiece:piece];
        }
    }
}

- (void) placePiece:(NSInteger)row column:(NSInteger)column
{
    BOOL success = [self.othelloBoard placePiece:row column:column orientation:self.currentOrientation];
    if (success == true)
    {
        self.currentOrientation = [self.othelloBoard getOppositeOrientation:self.currentOrientation];
        [self updateUI];
    }
}

@end
