//
//  UnderLineLabel.m
//  
//
//  Created by Guntis Treulands on 8/01/12.
//

#import "UnderLineLabel.h"

@implementation UnderLineLabel

@synthesize shouldStrikeOut,
            shouldUnderline,
            underLineOffset;

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        shouldStrikeOut = FALSE;

        underLineOffset = 0;
    }
    
    return self;
}

- (void) drawRect:(CGRect) rect
{
    if (shouldUnderline || shouldStrikeOut)
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();

        CGContextSetStrokeColorWithColor(ctx, self.textColor.CGColor);

        CGContextSetLineWidth(ctx, 1.5f);


        //calculate line height for some random simbol using its own font.
        int lineHeight = [@"a" sizeWithFont:self.font constrainedToSize:self.frame.size].height;

        float mPartOfTextStringWidth = 0.0;

        //text part between two spaces, for checking if it is in one line.
        NSString* mPartOfTextString = @"";


        //we add a space for easier calculations
        NSString* mTotalTextString = [NSString stringWithFormat:@"%@ ", self.text];


        //corresponding line we are in.
        int mCurrentLine = 1;


        //space char counter
        int mSpaceChar = 0;


        //break char counter
        int mBreakChar = 0;


        //in case its not Aligned to left side
        int extraSpaceFromBeginning = 0;


        //topOffset, if label height is bigger than text height
        int topOffset = (self.frame.size.height - [mTotalTextString sizeWithFont:self.font
            constrainedToSize:self.frame.size].height) / 2;

        if (shouldStrikeOut)//offset to top by 1/3 of line height (but its not 100% perfect..)
        {
            topOffset -= lineHeight / 3;
        }

        //--- go through text and search for spaces
        for (int i = 0; i < [mTotalTextString length]; i++)
        {
            if ([mTotalTextString characterAtIndex:i] == '\n')
            {
                mSpaceChar = i;

                //get string from last break char to last space char
                mPartOfTextString = [[mTotalTextString substringToIndex:i] substringFromIndex:mBreakChar];

                //calculate precise width
                mPartOfTextStringWidth = [mPartOfTextString sizeWithFont:self.font
                    constrainedToSize:CGSizeMake(self.frame.size.width, 9999)].width;

                //--- set extra space from beginning
                if (self.textAlignment == UITextAlignmentCenter)
                {
                    extraSpaceFromBeginning = (self.frame.size.width - mPartOfTextStringWidth) / 2;
                }
                else if (self.textAlignment == UITextAlignmentRight)
                {
                    extraSpaceFromBeginning = self.frame.size.width - mPartOfTextStringWidth;
                }
                //===

                CGContextMoveToPoint(ctx, extraSpaceFromBeginning,
                    lineHeight * mCurrentLine - 1 + underLineOffset + topOffset);

                CGContextAddLineToPoint(ctx, extraSpaceFromBeginning + mPartOfTextStringWidth,
                    lineHeight * mCurrentLine - 1 + underLineOffset + topOffset);

                mCurrentLine++;

                mBreakChar = mSpaceChar; //break char is last space char +1.

                i = mBreakChar; //go back to check again from last breakpoint.
            }
            else if ([mTotalTextString characterAtIndex:i] == ' ')
            {
                //get string from break char to current character (break char is when new line encountered
                mPartOfTextString = [[mTotalTextString substringToIndex:i] substringFromIndex:mBreakChar];


                //calculate width (total width - so we know, it should break!
                mPartOfTextStringWidth = [mPartOfTextString sizeWithFont:self.font
                    constrainedToSize:CGSizeMake(9999, 9999)].width;


                //this means that it will not break
                if (mPartOfTextStringWidth < self.frame.size.width - 1)
                {
                    mSpaceChar = i;
                }
                else //it breaks!!!!
                {
                    //in case a word is longer than label width - disable underlines.
                    if (mSpaceChar == mBreakChar - 1)
                    {
                        mPartOfTextString = @"";
                    }
                    else
                    {
                        //get string from last break char to last space char
                        mPartOfTextString = [[mTotalTextString substringToIndex:mSpaceChar] substringFromIndex:mBreakChar];
                    }

                    //calculate precise width
                    mPartOfTextStringWidth = [mPartOfTextString sizeWithFont:self.font
                        constrainedToSize:CGSizeMake(self.frame.size.width, 9999)].width;

                    //--- set extra space from beginning
                    if (self.textAlignment == UITextAlignmentCenter)
                    {
                        extraSpaceFromBeginning = (self.frame.size.width - mPartOfTextStringWidth) / 2;
                    }
                    else if (self.textAlignment == UITextAlignmentRight)
                    {
                        extraSpaceFromBeginning = self.frame.size.width - mPartOfTextStringWidth;
                    }
                    //===

                    CGContextMoveToPoint(ctx, extraSpaceFromBeginning,
                        lineHeight * mCurrentLine - 1 + underLineOffset + topOffset);

                    CGContextAddLineToPoint(ctx, extraSpaceFromBeginning + mPartOfTextStringWidth,
                        lineHeight * mCurrentLine - 1 + underLineOffset + topOffset);

                    mCurrentLine++;

                    mBreakChar = mSpaceChar + 1; //break char is last space char +1.

                    i = mBreakChar; //go back to check again from last breakpoint.
                }
            }
            if (i == [mTotalTextString length] - 1)//last line - draw from last break to this char.
            {
                //get string from last break char to last space char
                mPartOfTextString = [[mTotalTextString substringToIndex:i] substringFromIndex:mBreakChar];


                //calculate precise width
                mPartOfTextStringWidth = [mPartOfTextString sizeWithFont:self.font
                    constrainedToSize:CGSizeMake(self.frame.size.width, 9999)].width;


                //--- set extra space from beginning
                if (self.textAlignment == UITextAlignmentCenter)
                {
                    extraSpaceFromBeginning = (self.frame.size.width - mPartOfTextStringWidth) / 2;
                }
                else if (self.textAlignment == UITextAlignmentRight)
                {
                    extraSpaceFromBeginning = self.frame.size.width - mPartOfTextStringWidth;
                }
                //===

                CGContextMoveToPoint(ctx, extraSpaceFromBeginning,
                    lineHeight * mCurrentLine - 1 + underLineOffset + topOffset);

                CGContextAddLineToPoint(ctx, extraSpaceFromBeginning + mPartOfTextStringWidth,
                    lineHeight * mCurrentLine - 1 + underLineOffset + topOffset);
            }
        }
        //===


        CGContextStrokePath(ctx);
    }

    [super drawRect:rect];
}


@end