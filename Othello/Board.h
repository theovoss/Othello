//
//  Board.h
//  Othello
//
//  Created by Theo Voss on 7/1/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject

@property NSMutableDictionary *board;
@property NSInteger rows;
@property NSInteger columns;

- (NSString *) generateKey:(NSInteger)row column:(NSInteger)column;
- (NSInteger) getRowFromKey:(NSString*)key;
- (NSInteger) getColumnFromKey:(NSString*)key;

@end
