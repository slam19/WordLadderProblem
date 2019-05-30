//
//  WordNode.m
//  WordLadderProblem
//
//  Created by Simon Lam on 4/2/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordNode.h"

@implementation WordNode

-(id) init{
    self = [super init];
    if (self){
        self.word = nil;
        self.color = 0;
        self.oneStepList=nil;
    }
    return self;
}

-(id) initWithWord: (NSString *) str{
    self = [super init];
    if (self){
        self.word = str;
        self.color=0;
        self.oneStepList = [[NSMutableArray alloc]init];
    }
    return self;
}


-(void) addIndex:(int) i{
    [self.oneStepList addObject:[[NSNumber alloc]initWithInt:i]];
}
     
@end
