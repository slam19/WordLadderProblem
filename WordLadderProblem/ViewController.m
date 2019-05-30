//
//  ViewController.m
//  WordLadderProblem
//
//  Created by Simon Lam on 3/28/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//
#import "WordLetterGraph.h"
#import "ViewController.h"

@implementation ViewController

int n = 1;//counter for multiple calculationns

- (IBAction)Calculate:(id)sender {
    NSString *num = [NSString stringWithFormat:@"%d",n];
    [self.Text.documentView insertText:num];
    [self.Text.documentView insertText:@": \n"];
    WordLetterGraph *graph = [[WordLetterGraph alloc] init];
    [graph readWords];
    [graph compileGraph];
    NSString* startWord = self.StartWord.stringValue;
    NSString* targetWord = self.TargetWord.stringValue;
    NSMutableArray *ladder = [graph breadthFirstSearchFrom:startWord To:targetWord];
    if(!ladder){
        [self.Text.documentView insertText:@"One or both of the words is/are not in the 4 letter word dictionary.\n" ];
    }else{
        for(int i = 0 ; i<ladder.count;i++){
            [self.Text.documentView insertText:[ladder objectAtIndex:i]];
            [self.Text.documentView insertText:@"\n"];
            
        }
        
    }
    n++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}




@end
