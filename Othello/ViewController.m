//
//  ViewController.m
//  Othello
//
//  Created by Theo Voss on 7/1/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import "ViewController.h"
#import "OthelloUI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSInteger numberOfRows = 8;
    NSInteger numberOfColumns = 8;
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    NSInteger pieceWidth = frame.size.width/numberOfColumns;
    NSInteger pieceHeight = frame.size.height/numberOfRows;
    if (pieceHeight > pieceWidth) {
        pieceHeight = pieceWidth;
    }
    else{
        pieceWidth = pieceHeight;
    }
    CGSize pieceSize = CGSizeMake(pieceWidth, pieceHeight);
    self.view = [[OthelloUIView alloc] initWithColumns:numberOfColumns withRows:numberOfRows withPieceSize:pieceSize];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
