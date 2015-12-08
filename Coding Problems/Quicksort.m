//
//  Quicksort.m
//  Coding Problems
//
//  Created by Ecil Teodoro on 12/6/15.
//  Copyright © 2015 Mobmee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quicksort.h"

@implementation Quicksort : NSObject

int iterations;

+ (void)sort {
    NSLog(@"quicksort");
    NSMutableArray* array = [@[@2, @2, @2, @7, @4, @9, @0 ,@2, @6, @1, @3, @8, @5] mutableCopy];
    NSLog(@"Before sorting: %@", [array description]);
    iterations = 0;
    [self quicksortArray:array p:0 r:12];
    NSLog(@"After sorting: %@", [array description]);
    NSLog(@"Iterations: %u", iterations);
}

+ (void)quicksortArray:(NSMutableArray *)array p:(int)p r:(int)r {
    if (p < r) {
        int q = [self partitionArray:array p:p r:r];
        [self quicksortArray:array p:p r:q - 1];
        [self quicksortArray:array p:q + 1 r:r];
    }
}

+ (int)partitionArray:(NSMutableArray*)array p:(int)p r:(int)r {
    NSNumber* pivot = array[r];
    int i = p - 1;
    for (int j = p; j < r; j++) {
        iterations++;
        if (array[j] <= pivot) {
            i++;
            NSNumber* tmp = array[i];
            array[i] = array[j];
            array[j] = tmp;
        }
    }
    NSNumber*tmp = array[i + 1];
    array[i + 1] = array[r];
    array[r] = tmp;
    return i + 1;
}

@end