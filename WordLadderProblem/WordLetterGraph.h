//
//  WordLetterGraph.h
//  WordLadderProblem
//
//  Created by Simon Lam on 3/28/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef WordLetterGraph_h
#define WordLetterGraph_h
#import "Queue.h"
#import "WordNode.h"

@interface WordLetterGraph<ObjectType>: NSObject

@property NSMutableArray *adjList;
@property NSMutableArray *graph;
@property NSMutableDictionary *dictionary;

-(void) readWords;
-(void) buildDictionary;
-(void) compileGraph;
-(NSMutableArray *)breadthFirstSearchFrom:(NSString *)startWord To:(NSString *)endWord;


@end

#endif /* WordLetterGraph_h */
