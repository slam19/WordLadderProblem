//
//  Node.h
//  LinkedList
//
//  Created by Simon Lam on 10/9/18.
//  Copyright © 2018 Simon Lam. All rights reserved.
//

#ifndef Node_h
#define Node_h
#import <Foundation/Foundation.h>
@interface Node<ObjectType>: NSObject

@property int index;
@property Node *next;
@property Node *previous;

-(id) initWithIndex: (int) i;
@end
#endif /* Node_h */
