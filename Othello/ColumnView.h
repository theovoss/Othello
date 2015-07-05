//
//  ColumnView.h
//  Othello
//
//  Created by Theo Voss on 7/4/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColumnView : UIView

@property NSMutableArray * rowViews;

- (instancetype) initWithRows:(NSInteger)numberOfRows withPieceSize:(CGSize)pieceSize;
- (UIButton *) OthelloPieceAtRow:(NSInteger)row;
- (void) SetPieceAtRow:(NSInteger)row withPiece:(UIButton*)piece;

@end
