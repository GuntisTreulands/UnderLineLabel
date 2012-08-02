//
//  UnderLineLabel.h
//  
//
//  Created by Guntis Treulands on 8/01/12.
//

#import <UIKit/UIKit.h>

@interface UnderLineLabel : UILabel
{
	BOOL shouldStrikeOut;
    
    BOOL shouldUnderline;
    
    int underLineOffset;
}

@property (nonatomic) BOOL shouldStrikeOut;

@property (nonatomic) BOOL shouldUnderline;

@property (nonatomic) int underLineOffset;

@end