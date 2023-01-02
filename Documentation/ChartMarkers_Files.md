# <a name="top"></a>Files #

Documentation links: 
&#9654;&#xFE0E;&nbsp;[Gallery](ChartMarkers_Gallery.md)
&#9654;&#xFE0E;&nbsp;[Description](ChartMarkers_Description.md)
&#9654;&#xFE0E;&nbsp;[Code](ChartMarkers_Code.md)
&#9654;&#xFE0E;&nbsp;[Grumbles](ChartMarkers_Grumbles.md)
&#9655;&#xFE0E;&nbsp;Files

--- 

<div style="background-color: #CCFFCC;  border: 2px solid #009900;  padding-left: 1em;  padding-right: 1em;">

## <a name="draft"></a>Draft until April 2023 ##

Until Friday 31st March 2023 this set of markers is deemed to be in draft form. 
Until then, for a change to happen, the standard is only that &ldquo;*the proposed new be better than the old*&rdquo;. 
Please do suggest possible improvements in an [issue](https://github.com/jdaw1/chart_markers/issues/), and do so before this deadline.

For [issues](https://github.com/jdaw1/chart_markers/issues/) raised after Friday 31st March 2023 the standard toughens: &ldquo;*the proposed new must be better than the old, and better by a margin large enough to justify that there be any change at all*&rdquo;. 
That is, post draft, there will be a reluctance to make changes.

It is intended that [issues](https://github.com/jdaw1/chart_markers/issues/) raised by Friday 31st March 2023 will be processed (rejected, or accepted and implemented) by the end of the Easter weekend, so by Monday 10th April 2023 (intended, not quite promised). 
When that work is complete, these draft-period notices will be removed, and subsequent changes will be infrequent.

</div>

Many files are available. 

## <a name="The_SVGs"></a>The SVGs ##

The SVGs are available individually, in  
* [github.com/jdaw1/chart_markers/tree/main/ChartMarkers/](http://github.com/jdaw1/chart_markers/tree/main/ChartMarkers/)  

Alas GitHub&rsquo;s web interface doesn&rsquo;t allow downloading a single directory, so they are also in  
* [github.com/jdaw1/chart_markers/tree/main/CompressedDownloads/SVG_ChartMarkers.zip](http://github.com/jdaw1/chart_markers/tree/main/CompressedDownloads/SVG_ChartMarkers.zip)

Excel needs slightly different SVGs, because otherwise it mangles the sizes. These are in  
* [github.com/jdaw1/chart_markers/tree/main/ChartMarkers_Excel/](http://github.com/jdaw1/chart_markers/tree/main/ChartMarkers_Excel/)  

and also in  
* [github.com/jdaw1/chart_markers/tree/main/CompressedDownloads/SVG_ChartMarkers_Excel.zip](http://github.com/jdaw1/chart_markers/tree/main/CompressedDownloads/SVG_ChartMarkers_Excel.zip)



## PNGs ##

Please don&rsquo;t use PNGs. 
Even at 72d.p.i., so 1&times; resolution, PNGs are more bytes than the SVG, and much worse visual appearance (average size is about 12 pixels a side: rubbish). 
So please use the SVGs instead of PNGs. 
Please don&rsquo;t use PNGs.

Oh hell, you&rsquo;re going to insist. 
There are [PNGs](http://github.com/jdaw1/chart_markers/tree/main/PNGs) at 1&times;, 2&times;, 4&times;, 8&times;, and 16&times; the natural 72d.p.i. resolution, and a single [.zip](http://github.com/jdaw1/chart_markers/tree/main/CompressedDownloads/PNGs.zip) containing them all. 
(Made with GraphicConverter build 5711, using the SVG&nbsp;SDK library because the WebKit library fails to process `<defs>...</defs><use ...'/>`.)

Please don&rsquo;t use the PNGs.



## <a name="excel"></a>Excel ##

It might be that you want to use these efficiently in Excel, so a template file has been made:  
* [github.com/jdaw1/chart_markers/tree/main/Spreadsheets/ChartMarkers.xls**m**](http://github.com/jdaw1/chart_markers/tree/main/Spreadsheets/ChartMarkers.xlsm)

That is an xls**m**, containing macros, and it might be that your (employer&rsquo;s) security policy prohibits downloading macro-laden Excel files. 
(Such prohibition is actually a good thing, so this is not an objection.) 
Hence also available without the macros, as an xls**x**,  
* [github.com/jdaw1/chart_markers/tree/main/Spreadsheets/ChartMarkers.xls**x**](http://github.com/jdaw1/chart_markers/tree/main/Spreadsheets/ChartMarkers.xlsx)

The VBA to be added to the xlsx is available from  
* [github.com/jdaw1/chart_markers/tree/main/Spreadsheets/modCharts.vba](http://github.com/jdaw1/chart_markers/tree/main/Spreadsheets/modCharts.vba)

and while we&rsquo;re here, also useful in any organised spreadsheet can be  
* [github.com/jdaw1/chart_markers/tree/main/Spreadsheets/modRangeNames.vba](http://github.com/jdaw1/chart_markers/tree/main/Spreadsheets/modRangeNames.vba)

Obviously, you should read the VBA before pasting it into modules. 
Obviously, you should not assume that others have done so.

Some explanation might help.

### <a name="Chart_SeriesFormatStandardised"></a>Chart_SeriesFormatStandardised() ###


**`Chart_SeriesFormatStandardised()`** formats the lines and markers to those of the standard currency / territory / issuer. 
It doesn&rsquo;t work as a function &mdash; some parts seem blocked by Excel&rsquo;s imperfect implementation of a functionality constraint, so must be a `Sub`.

It requires the tab `ChartFormats`, and within that the ranges `SeriesFormatAlias.SeriesName` and `SeriesFormatAlias.ID`, and also the `ChartLines` table. 
For each series in the chart, it looks for the name of the series in the `SeriesFormatAlias.SeriesName` range. 
If not there, that series ignored. 
If there, the relevant marker is that from the same row in the `SeriesFormatAlias.ID` range. 
This indirection allows series to have names such as Deutschland | Frankreich | Italien | Spanien, these being mapped to <span class="markerID">DE</span> | <span class="markerID">FR</span> | <span class="markerID">IT</span> | <span class="markerID">ES</span>. 
Having found the correct ID, and hence the correct rows of the ChartLines.&hellip; table, those ChartLines rows are then applied. 

Markers come from outside the spreadsheet. 
Your corporate build should include a standard place for the SVGs (read access being sufficient), that location being stored in the range `ChartMarkers.Directory`. 
For Windows machines, such a place might be C:\ChartMarkers_Excel\\ (with the trailing directory separator). 

The SVGs used in Excel are not quite the standard set. 
The primary SVGs have varying height and width, chosen to give each approximately equal visual prominence. 
Excel seems to mangle these sizes. 
So instead all the Excel-compatible SVGs have the same width and height (15&times;15), the re-sizing strain being taken by the amount of this box that is painted.

`Chart_SeriesFormatStandardised()` can need three series for each currency / territory / issuer. 
Assume three series with name &ldquo;CAD&rdquo;. First would be formatted as a thick red line; second as a thin black line; third would hold the marker. 
(No, the second series cannot hold both the thin line and the marker, as that would require settings available to the user but not exposed to VBA.) 
If a name has too few series, that error is reported in the log range.

`Chart_SeriesFormatStandardised()` takes up to six parameters, the last two being optional. 

1\. String: Name of tab on which chart sits.

2\. String: Name of chart. (Name your charts!)

3\. Boolean ApplyMarkers. If True markers applied.

4\. Boolean ApplyLines: if True lines applied.

5\. Optional String or Integer or Array (of strings or integers) or Range (of ditto): this function applied only to these series names / numbers

6\. Optional string, being the name of the range to which errors are to be logged. 

On the example sheet the button is assigned the macro: 
`ChartMarkers.xlsm!'Chart_SeriesFormatStandardised "Test", "Chart_Test", True, True, , "TestData.ChartFormatLog"'`: 
on tab `Test`, chart named `Chart_Test`, apply markers, apply lines, to all valid series, reporting errors to cell named `TestData.ChartFormatLog`.


### <a name="Axis_Scale"></a>Axis_Scale() ###

**`Axis_Scale()`** exists because Excel&rsquo;s built-in chart scaling is terrible, it being far too keen to include 0, and flabby about its bounds. 
This is a function, which directly applies to a chart axis values that have been computed by the user, presumably in normal Excel. 
It is a function because it can be, so can be called by Excel&rsquo;s calculation tree rather than manually. 
Even without these markers, it is a very useful function.

`Axis_Scale()` takes eight parameters. 
 
1\. String, Name of tab on which chart sits.

2\. String, Name of chart. (Name your charts!)

3\. Boolean: True is x axis, False is y axis.

4\. Boolean: True is primary axis, False is secondary axis. Almost always you want True.

5&ndash;8\. Numerics: <var>Min</var>, <var>Max</var>, <var>MajorStep</var>, <var>MinorStep</var>. If <var>Min</var>&nbsp;&ge;&nbsp;<var>Max</var> then their &hellip;`IsAuto` are set to `True`. 
Likewise if <var>MinorStep</var>&nbsp;&gt;&nbsp;<var>MajorStep</var>, and also if either &le;&nbsp;0. 
To set all to automatic values set these four numerics all = &minus;1, or all = 0. 
Typically the <var>Min</var> is computed with a function that does the equivalent of `Floor(MinIfs(...), Major)`, and the Max by `Ceiling(MaxIfs(...), Minor)`, but this work is entirely for the user.

For any given axis on any chart, `Axis_Scale()` should be called at most once. If called more times, perhaps from multiple cells, the result would depend on the timing of the invocations &mdash; which in theory could even overlap. 



## <a name="other_languages"></a>Other languages ##

Users of other languages might want to use these markers (indeed, should want to use). 
If you write code in other languages that displays these SVGs, please share. 
As I might not be able to judge the merit (or safety) of such code, it won&rsquo;t go in this repo. 
Please upload it to GitHub or equivalent, and then a link to it can go here.

Users of such code: it might well be fabulous, but I cannot promise that.


<a name="end"></a>
