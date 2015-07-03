//
//  Board.m
//  Othello
//
//  Created by Theo Voss on 7/1/15.
//  Copyright (c) 2015 Theo Voss. All rights reserved.
//

#import "Board.h"

@implementation Board

-(id)initWithName:(NSInteger)rows_ columns:(NSInteger)columns_
{
    self = [super init];
    if (self) {
        self.rows = rows_;
        self.columns = columns_;
    }
    return self;
}

- (NSString *) generateKey:(NSInteger) row column:(NSInteger)column
{
    NSString* retVal;
    NSArray *myStrings = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%li", (long)row], [NSString stringWithFormat:@"%li", (long)column], nil];
    retVal = [myStrings componentsJoinedByString:@"|"];
    return retVal;
}

- (NSInteger) getRowFromKey:(NSString*)key{
    return [[key componentsSeparatedByString:@"|"][0] intValue];
}

- (NSInteger) getColumnFromKey:(NSString*)key{
    return [[key componentsSeparatedByString:@"|"][1] intValue];
}

@end
