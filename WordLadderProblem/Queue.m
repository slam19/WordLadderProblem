//
//  Queue.m
//  Sudoku
//
//  Created by Simon Lam on 11/8/18.
//  Copyright © 2018 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

@implementation Queue: NSObject {
    
}
-(void) enqueue: (int) value withPrevious: (Node *)p{
    Node *n = [[Node alloc] initWithIndex: value];
    if (!self.head) {
        self.head = n;
        self.tail = n;
        n.previous = p;
        n.next = nil;
    } else {
        self.tail.next = n;
        n.previous = p;
        self.tail = n;
    }
}

-(Node*) dequeue {
    Node *head = self.head;
    self.head = self.head.next;
    if(!self.head){
        self.tail=nil;
    }
    return head;
}

-(bool) isEmpty {
    return !(self.head);
}

@end
