//
//  ColumnView.m
//  Othello
//
//  Created by Theo Voss on 7/4/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import "ColumnView.h"

@implementation ColumnView

- (instancetype) initWithRows:(NSInteger)numberOfRows withPieceSize:(CGSize)pieceSize{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, pieceSize.width, pieceSize.height * numberOfRows);
        _rowViews = [[NSMutableArray alloc] init];
        self.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.25];
        
        for (NSInteger counter = 0; counter < numberOfRows; counter++) {
            CGRect pieceFrame = CGRectMake(0, counter*pieceSize.height, pieceSize.width, pieceSize.height);
            UIButton * piece = [[UIButton alloc] initWithFrame:pieceFrame];
//            can customize piece here. for default empty.
            [piece.layer setBorderWidth:1.0];
            [piece.layer setBorderColor:[[UIColor whiteColor] CGColor]];
            piece.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.25];
            [piece setTitle:@"Default" forState:UIControlStateNormal];
            [self addSubview:piece];
            [_rowViews addObject:piece];
            
//            TODO: add button press handler to code here?
        }
    }
    return self;
}

- (UIButton *) OthelloPieceAtRow:(NSInteger)row{
    if (row <= self.rowViews.count)
    {
        return self.rowViews[row];
    }
    else{
        NSLog(@"Row %li does not fit in array of length %lu", (long)row, (unsigned long)self.rowViews.count);
        return nil;
    }
}

- (void) SetPieceAtRow:(NSInteger)row withPiece:(UIButton*)piece{
    if (row <= self.rowViews.count)
    {
        self.rowViews[row] = piece;
    }
    else{
        NSLog(@"Can't add button at row %li array length is %lu", (long)row, (unsigned long)self.rowViews.count);
    }
}



@end
