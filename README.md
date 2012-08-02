UnderLineLabel
==============


(https://github.com/GuntisTreulands/UnderLineLabel/blob/master/ImagePreview.png)

UILabel subclass with possibility to draw line under text (with offset)


To use:


    UnderLineLabel *mLabel = [[UnderLineLabel alloc] initWithFrame:CGRectMake(10,260,300,200)];
        
    [mLabel setFont:[UIFont systemFontOfSize:17]];
    
    [mLabel setBackgroundColor:[UIColor lightGrayColor]];
    
    [mLabel setNumberOfLines:0];
    
	[mLabel setShouldUnderline:YES]; //will underline text (if strikOut is also YES - it will be striked out instead.)

    [mLabel setShouldStrikeOut:YES]; //will strike out text
    
    [mLabel setUnderLineOffset:-1];//will set line offset
    
    [mLabel setTextAlignment:UITextAlignmentCenter]; //supports all three text alignments
    
    [mLabel setText:@"text"];
    
    [[self view] addSubview:mCustomStrikeOutLineLabel];
    
    [mLabel release];


2 Problems encountered
 - If string is out of label boundaries - it will not work;
 - If a word is longer than label width - it will not work; 

Currently - it calculates only using spaces between words. If it would extra check all symbols - it would loose it's speed.

For using in UITableViewCells (where it needs to be updated more often) - also call:
    [mLabel setNeedsDisplay];