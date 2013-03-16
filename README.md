UnderLineLabel
==============


![PreviewImage](https://github.com/GuntisTreulands/UnderLineLabel/blob/master/ImagePreview.png?raw=true)

UILabel subclass with possibility to draw line under text (with offset)


To use:


    UnderLineLabel *mLabel = [[UnderLineLabel alloc] initWithFrame:CGRectMake(10,260,300,200)];
        
    [mLabel setFont:[UIFont systemFontOfSize:17]];
    
    [mLabel setBackgroundColor:[UIColor lightGrayColor]];
    
    [mLabel setNumberOfLines:0];
    
	[mLabel setShouldUnderline:YES]; //will underline text (if strikOut is also YES - it will be striked out instead.)

    [mLabel setShouldStrikeOut:YES]; //will strike out text
    
    [mLabel setUnderLineOffset:-1];//will set (strike out or underline) line Y offset
    
    [mLabel setTextAlignment:UITextAlignmentCenter]; //supports all three text alignments
    
    [mLabel setText:@"text"];
    
    [[self view] addSubview:mCustomStrikeOutLineLabel];
    
    [mLabel release];


2 Problems encountered
 - If string is out of label boundaries - it will not work;
 - If a word is longer than label width - it will not work; 

Currently - it calculates only using spaces and newline symbols between words. If it would extra check all symbols - it would loose it's speed.

For using in UITableViewCells (where it needs to be updated more often) - also call:
    [mLabel setNeedsDisplay];




BSD license
===

	Copyright (c) 2012 Guntis Treulands.
	All rights reserved.

	Redistribution and use in source and binary forms are permitted
	provided that the above copyright notice and this paragraph are
	duplicated in all such forms and that any documentation,
	advertising materials, and other materials related to such
	distribution and use acknowledge that the software was developed
	by Guntis Treulands.  The name of the
	University may not be used to endorse or promote products derived
	from this software without specific prior written permission.
	THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
	IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
	