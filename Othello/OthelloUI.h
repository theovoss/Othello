//
//  OthelloUI.h
//  Othello
//
//  Created by Theo Voss on 7/4/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class OthelloBoard;

@interface OthelloUIView : UIView

@property OthelloBoard* othelloBoard;
@property NSMutableArray* columnViews;
@property NSString* currentOrientation;

- (instancetype) initWithColumns:(NSInteger)numberOfColumns withRows:(NSInteger)numberOfRows withPieceSize:(CGSize)pieceSize;

- (void) updateUI;
- (void) placePiece:(NSInteger)row column:(NSInteger)column;

- (IBAction)buttonCallback:(UIButton *)sender;

- (NSInteger)getRowFromIndex:(NSInteger)index;
- (NSInteger)getRowFromIndex:(NSInteger)index;

@end
