//
//  WordLetterGraph.m
//  WordLadderProblem
//
//  Created by Simon Lam on 3/28/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordLetterGraph.h"


@implementation WordLetterGraph

-(void) readWords{
    NSString *myFilePath = [[NSBundle mainBundle] pathForResource:@"FourLetterDictionary"ofType:@"txt"];
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:myFilePath encoding:NSUTF8StringEncoding error:nil];
    self.adjList = [[NSMutableArray alloc]init];
    NSMutableArray *words = //array of string lines
    [[fileContent componentsSeparatedByCharactersInSet:
      [NSCharacterSet newlineCharacterSet]]mutableCopy];
    [words removeObject:@""];
    for(int i = 0; i<words.count;i++){
        WordNode *n = [[WordNode alloc]initWithWord:[words objectAtIndex:i]];
        [self.adjList addObject:n];
    }
    [self buildDictionary];
}

-(void) buildDictionary{
    self.dictionary = [[NSMutableDictionary alloc] init];
    for (int i =0; i<self.adjList.count;i++){
        WordNode *n = [self.adjList objectAtIndex:i];
        NSString *word = n.word;
        for (int j = 0; j<4; j++){
            NSString *bucketLabel= [word stringByReplacingCharactersInRange:NSMakeRange(j, 1) withString:@"_"];
            NSMutableArray *bucket = [self.dictionary objectForKey: bucketLabel];
            if(!bucket){
                NSMutableArray *newBucket = [[NSMutableArray alloc]init]; //creating buckets for each 3 letter combination, and distributing all words to their respective possible 3 letter combinations.
                [newBucket addObject: [[NSNumber alloc]initWithInt:i]];
                [self.dictionary setObject:newBucket forKey:bucketLabel];
            }else{
                [bucket addObject: [[NSNumber alloc]initWithInt:i]];
            }
        }
    }
}

-(void) compileGraph{
    for(int a = 0; a< self.adjList.count; a++){
        WordNode *n = [self.adjList objectAtIndex:a];
        NSString *word = n.word ;
        for (int i = 0; i<4; i++){
            NSString *bucketLabel= [word stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"_"];
            NSMutableArray *bucket = [self.dictionary objectForKey:bucketLabel];
            for(int j = 0; j<bucket.count;j++){
                WordNode *n = [self.adjList objectAtIndex:a];
                int wordIndexInBucket = [[bucket objectAtIndex:j] intValue];
                if(a!=wordIndexInBucket){
                    [n.oneStepList addObject: [bucket objectAtIndex:j]]; //use the buckets to fill up adjacency list of words. Each word is now connected to words that are one step (one letter change) away.
                }
            }
        }
    }
}

-(int)indexOfWord: (NSString *)word{
    int i = 0;
    while(i<self.adjList.count){
        WordNode *n = [self.adjList objectAtIndex:i];
        if([word isEqualToString:n.word]){
            return i;
        }
        i++;
    }
    return -1;
}

//BFS through adjacency list to compute the shortest possible path between words.
-(NSMutableArray *)breadthFirstSearchFrom:(NSString *)startWord To:(NSString *)endWord{
    startWord = [startWord uppercaseString];
    endWord = [endWord uppercaseString];
    NSMutableArray *results;
    int b =[self indexOfWord:startWord];
    int a = [self indexOfWord:endWord];
    if(a != -1 && b!=-1){
        int pointer = a;
        Queue *queue = [[Queue alloc]init];
        [queue enqueue:a withPrevious:nil];
        while(true){
            Node *head= [queue dequeue];
            pointer = [head index];
            if(pointer ==b){
                results =[[NSMutableArray alloc]init];
                Node *temp = head;
                while(temp){
                    WordNode *wordNode = [self.adjList objectAtIndex:temp.index];
                    printf("%s, ", [wordNode.word UTF8String]);
                    [results addObject:wordNode.word];
                    temp = temp.previous;
                }
                break;
            }
            WordNode *n = [self.adjList objectAtIndex:pointer];
            for(int i = 0; i< n.oneStepList.count;i++){
                NSNumber *temp= [n.oneStepList objectAtIndex:i];
                int tempIndex = [temp intValue];
                WordNode *tempNode = [self.adjList objectAtIndex:tempIndex];
                if(tempNode.color!=-1){
                    [queue enqueue: tempIndex withPrevious:head];//enqueue previous/parent node, not the tail, to keep track of path.
                }
                n.color = -1;
            }
        }
    }
    return results;
}



@end
