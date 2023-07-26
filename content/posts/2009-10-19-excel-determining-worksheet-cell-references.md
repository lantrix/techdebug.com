---
title: Excel – Determining worksheet cell references
author: Tech Debug
type: post
date: 2009-10-19T05:55:10+00:00
url: /blog/2009/10/19/excel-determining-worksheet-cell-references/
categories:
  - apps
  - microsoft
tags:
  - cell
  - excel
  - find
  - formula
  - function
  - reference
  - windows
  - worksheet

---
### Worksheet names in Excel Cells

If you are working in Excel, and you want to show the worksheet name in a Cell on that worksheet, you can use the _CELL_ function to do so.  
By default the _CELL_ function will return the current document name, if used with the filename info_type:

`=CELL("filename")`

This provides a full path to the spreadsheet, with the worksheet of the current Cell at the end, e.g:  
`C:\folder\[myfile.xls]Sheet1` 

You can easily get just the worksheet name by using the _FIND_ and _MID_ functions to do the hard work. You need to find the location of the last square bracket, and find achieves this as shown:  
`=FIND("]",CELL("filename"))`

This would return the position of the last bracket. In this case it is at position 22 of the text that _CELL(&#8220;filename&#8221;)_ returns. The _MID_ function can extract text starting at a location for _n_ length, where _n_ is an arbitrary number. So we would combine _MID_, _FIND_ and _CELL_ functions to return just the worksheet name like this:

`=MID(CELL("filename"),FIND("]",CELL("filename"))+1,255)`

The reason we add a +1 is because we want to start extracting the text one character AFTER the right square bracket, e.g. at the start of the Worksheet name. Our result is:  
`Sheet1` 

### Worksheet names from another Worksheet

So far so good, and how is this any different than any other blog post or forum post on the net explaining this? So far it&#8217;s not, but here comes the fun part.

What if you have multiple Worksheets, and you do this:

  1. Have a cell with content, **Sheet1!B2**
  2. **Sheet1!B2** displays the content of **OtherSheet!H5**, i.e.:  
    `=OtherSheet!H5` 
  3. You want **Sheet1!B1** to _display the worksheet name_ where the _CONTENT_ of **Sheet1!B2** comes from.

You could try using the MID/FIND/CELL function combination to try this. In **Sheet1!B1** you would enter:

`=MID(CELL("filename",B2),FIND("]",CELL("filename",B2))+1,255)`

However this would yield the worksheet name of B2 itself, not the worksheet where you are taking your content from:  
`Sheet1` 

Not what we wanted. Somehow you need to get the Value of the formula used _=OtherSheet!H5_ and look up the worksheet name for _OtherSheet!H5_

### The Solution

To do this you ware going to need to do two things:

  1. Make a new function to display the formula, sans the equal sign
  2. Make your _CELL_ function use the result of your function to lookup the filename info_type

We can use the Excel VB Editor to create a new function, and call it _GetLocation_:

`<br />
Function GetLocation(Cell As Range) As String<br />
   GetLocation = Mid(Cell.Formula, 2)<br />
End Function<br />
` 

But we can&#8217;t just use _GetLocation_ to directly feed the _CELL_ function. We need to use another handy function _INDIRECT_. This allows us to return the result of the _GetLocation_ function as a Reference. This then allows the _CELL_ function to evaluate the filename/Worksheet details for the destination cell in the other worksheet:

`=MID(CELL("filename",INDIRECT(GetLocation(B2))),FIND("]",CELL("filename",INDIRECT(GetLocation(B2))))+1,256)`

This now provides the Worksheet name of the cell that **Sheet1!B1** is using to get it&#8217;s content from which is **OtherSheet!H5**:  
`OtherSheet` 

This is very handy when you need to show on a master worksheet which other worksheet your data is actually coming from. Windows Excel only, not Mac I&#8217;m afraid &#8211; until they bring back VB. Enjoy!