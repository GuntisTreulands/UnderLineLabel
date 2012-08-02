UnderLineLabel
==============

UILabel subclass with possibility to draw line under text (with offset)

(UnderLineLabel)

To use:


UnderLineLabel *mCustomStrikeOutLineLabel = [[UnderLineLabel alloc] initWithFrame:CGRectMake(10,260,300,200)];
        
    [mCustomStrikeOutLineLabel setFont:[UIFont systemFontOfSize:17]];
    
    [mCustomStrikeOutLineLabel setBackgroundColor:[UIColor lightGrayColor]];
    
    [mCustomStrikeOutLineLabel setNumberOfLines:0];
    
	[mCustomStrikeOutLineLabel setShouldUnderline:YES]; //will underline text (if strikOut is also YES - it will be striked out instead.)

    [mCustomStrikeOutLineLabel setShouldStrikeOut:YES]; //will strike out text
    
    [mCustomStrikeOutLineLabel setUnderLineOffset:-1];//will set line offset
    
    [mCustomStrikeOutLineLabel setTextAlignment:UITextAlignmentCenter]; //supports all three text alignments
    
    [mCustomStrikeOutLineLabel setText:@"text"];
    
    [[self view] addSubview:mCustomStrikeOutLineLabel];
    
    [mCustomStrikeOutLineLabel release];
