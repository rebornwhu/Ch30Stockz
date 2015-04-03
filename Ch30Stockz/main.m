//
//  main.m
//  Ch30Stockz
//
//  Created by Xiao Lu on 4/2/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *stock;
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"AAPL"
                  forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200]
                  forKey:@"shares"];
        [stocks addObject:stock];
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"GOOG"
                  forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:160]
                  forKey:@"shares"];
        [stocks addObject:stock];
        
        [stocks writeToFile:@"/tmp/stocks.plist"
                 atomically:YES];
        
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        for (NSDictionary *d in stockList) {
            NSLog(@"I have %@ shares of %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
        }
    }
    return 0;
}
