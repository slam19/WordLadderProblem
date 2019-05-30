//
//  WordNode.h
//  WordLadderProblem
//
//  Created by Simon Lam on 4/2/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef WordNode_h
#define WordNode_h

@interface WordNode<ObjectType>: NSObject

@property NSString *word;
@property int color;
@property NSMutableArray *oneStepList;

-(id) initWithWord: (NSString *) str;
@end

#endif /* WordNode_h */
