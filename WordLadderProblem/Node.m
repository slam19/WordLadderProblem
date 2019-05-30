//
//  Node.m
//  LinkedList
//
//  Created by Simon Lam on 10/9/18.
//  Copyright © 2018 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@implementation Node
-(id) init{
    self = [super init];
    if (self){
        self.index = -1;
        self.next = nil;
        self.previous = nil;
    }
    return self;
}

-(id) initWithIndex: (int) i{
    self = [super init];
    if (self){
        self.index = i;
        self.next = nil;
        self.previous = nil;
    }
    return self;
}




@end
