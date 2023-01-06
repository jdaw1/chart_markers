# <a name="top">Currency and Issuer Chart Markers</a> #

Documentation links: 
&#9654;&#xFE0E;&nbsp;[Gallery](ChartMarkers_Gallery.md)
&#9654;&#xFE0E;&nbsp;[Description](ChartMarkers_Description.md)
&#9655;&#xFE0E;&nbsp;Code
&#9654;&#xFE0E;&nbsp;[Grumbles](ChartMarkers_Grumbles.md)
&#9654;&#xFE0E;&nbsp;[Files](ChartMarkers_Files.md)

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

# The SVG code #

## <a name="validation"></a>Validation ##

All the SVGs pass the [W3C&nbsp;validator](http://validator.w3.org/). 
The validator warns about the absence of a character encoding, but an encoding would be redundant as the files are pure ASCII, using only characters in the range decimal 10&nbsp;(=&nbsp;line&nbsp;feed) to 121&nbsp;(=&nbsp;&lsquo;y&rsquo;).


## <a name="concision"></a>Concision ##

<div style="float: right;">

| &nbsp;ID&nbsp; | Marker | &nbsp;Bytes |
|:--:|:-:|-----:|
| JPY | ![JPY](../ChartMarkers/JPY.svg) | 156 |
| |  |  &numsp;&vellip;&numsp; |
| \_ESM | ![\_ESM](../ChartMarkers/\_ESM.svg) | 259 |
| SK | ![SK](../ChartMarkers/SK.svg) | 259 |
| LT | ![LT](../ChartMarkers/LT.svg) | 259 |
| |  |  &numsp;&vellip;&numsp; |
| INR | ![INR](../ChartMarkers/INR.svg) | 563 |
| \_NDB | ![\_NDB](../ChartMarkers/\_NDB.svg) | 564 |
| IQD | ![IQD](../ChartMarkers/IQD.svg) | 596 |
| GEL | ![GEL](../ChartMarkers/GEL.svg) | 610 |
| \_IBRD | ![\_IBRD](../ChartMarkers/\_IBRD.svg) | 617 |

</div>

In coding these markers, priority has been given to compactness and execution efficiency, often at the expense of legiblity of the SVG code to humans. 

So the SVG files are concise, ranging from a minimum of 156 bytes (<span class="markerID">JPY</span>), to a median of 259 bytes, to a maximum of 617 bytes (<span class="markerID">\_IBRD</span>). 
Of the 131 markers, only five &asymp;&#8239;4% exceed 500 bytes: these are included in the nearby table.

From the [SVG standard](http://svgwg.org/svg2-draft/single-page.html): &ldquo;*Superfluous white space &hellip; may be eliminated &hellip; Thus, in the string "M&nbsp;100&#8209;200", the first coordinate for the "moveto" consumes the characters "100" and stops upon encountering the minus sign because the minus sign cannot follow a digit in the production of a "coordinate". The result is that the first coordinate will be "100" and the second coordinate will be "-200".*&rdquo;

Alas!, Excel (at least version 16.0 on Windows and 16.43 on macOS) fails to tokenise such character sequences, needing more white space. 
So the SVGs here have slightly more spaces than the standard requires. 
This Excel failure will be around for ages: version&nbsp;16.43 is the highest version installable on [macOS&nbsp;10.13](http://en.wikipedia.org/wiki/MacOS_High_Sierra), which is the highest macOS installable on some 2009&ndash;&rsquo;12 Macs. 
Hence even if Microsoft were to repair this bug today, many users would still not escape it.


## <a name="overlap"></a>Overlapping ##

The SVG is robust to (at least some) imperfections in rasterisation.  
* Adjacents blocks of colour overlap, so that colour beneath cannot leak through a zero-width gap.  
* Similarly, stacked blocks of colour do not share an edge, so that a lower colour cannot leak around a shared edge.

In multiple Apple Mac applications I have seen problems with lower stacked colours leaking around a shared clip boundary (e.g.&nbsp;[pdf](http://www.jdawiseman.com/2018/20180508_Sixties.pdf#Circle_00_00_04)&#10141;[png](http://www.jdawiseman.com/2018/20180508_Sixties_F63_3.png)), so these concerns are not entirely idle.

## <a name="speed"></a>Execution speed ##

Some printers, some rasterisation engines, seem to struggle with clipping &mdash; it can be very slow. 
(Admittedly, the [clipping done](http://github.com/jdaw1/placemat/blob/main/Documentation/fonts_glasses_decoration.md#filltexts) had complicated paths.) 
Any one marker might be used many times, perhaps thousands of times, on one chart. 
As things should not be slow to paint on screen, clipping is not used.

For some markers (incl. 
<nobr><span class="markerID">\_NDB</span> ![_NDB](../ChartMarkers/_NDB.svg),</nobr> 
<nobr><span class="markerID">IQD</span> ![IQD](../ChartMarkers/IQD.svg),</nobr> 
<nobr><span class="markerID">GEL</span> ![GEL](../ChartMarkers/GEL.svg))</nobr> 
the natural PostScript painting would have resembled `[make path] closepath gsave [set colour] fill grestore clipsave clip [set colour and double line width] 1 setlinejoin stroke cliprestore`. 
Instead, the boundaries of the inner regions have been explicitly pre&#8209;computed, paths filled from outer to inner.


## <a name="centres"></a>Centres ##

Four stars follow, with workings shown.  
* In dark blue are the diagonals of SVG&rsquo;s bounding box, and a subset of the bounding box itself.  
* In bright green are the diagonals of the star.  
* In cyan are circles going through the outer and inner points of the star(s).  
* In brown is the part of the SVG&rsquo;s bounding box that is not in the star&rsquo;s bounding box (except <span class="markerID">DZD</span>, for which it is most of the green part of the marker).

<div align="center">

![USD](USD_annotated.svg) ![CNY](CNY_annotated.svg) ![PKR](PKR_annotated.svg) ![DZD](DZD_annotated.svg)

</div>

Observe that the centres coincide: the centre of the SVG&rsquo;s bounding box is the centre of the star. 
**Markers should be placed such that centre of the SVG&rsquo;s bounding box is at the datapoint.** 
Charting software should not look &lsquo;deep inside&rsquo; the SVG: the `svg`&rsquo;s `width` and `height` suffice for placement.

But this means that some markers do not position well as text items. 
E.g., the 
<nobr><span class="markerID">USD</span> star ![USD](../ChartMarkers/USD.svg)</nobr>
seems to sit above the line by the height of its brown rectangle &asymp;&nbsp;0.1&#8239;&times;&#8239;its width, whereas 
<nobr><span class="markerID">CNY</span> ![CNY](../ChartMarkers/CNY.svg),</nobr> 
<nobr><span class="markerID">PKR</span> ![PKR](../ChartMarkers/PKR.svg),</nobr> and 
<nobr><span class="markerID">DZD</span> ![DZD](../ChartMarkers/DZD.svg)</nobr> sit neatly on the line.


## <a name="precision"></a>Precision ##

For many points, full precision must be algabraic (but none are transcendental). 
E.g., for one point in a vertical unit 5/2 star, <nobr>*x*&nbsp;=&nbsp;&frac14;&#8239;&radic;(50&#8239;&minus;&#8239;22&radic;5)</nobr> <nobr>&asymp;&nbsp;0.22451398828979268622.</nobr> 
Unlike PostScript, SVG cannot accept formulae: it needs numbers written in base&nbsp;10. 
For these numbers, how much numerical precision is needed? 
The wanted standard is &lsquo;*too&nbsp;much, but not excessively too&nbsp;much*&rsquo;.

Of course, if these are used only as tiny chart markers, then little precision is needed. 
But for some purpose they might be shown large. 
Let&rsquo;s test five decimal places for an SVG drawn on a `viewBox` that is of size 2, which is typical. 
At 1&times; scaling each point would be correct to within <nobr>&plusmn;&#8239;&frac12;&#8239;&middot;&#8239;10&#8315;&#8309;pt.</nobr> 
At 2000&times; scaling the worst error would become &plusmn;&#8239;0.01pt which is &plusmn;&#8239;half a pixel on a 3600d.p.i. printer; and the size would be 4000pt &asymp;&nbsp;4&prime;8&Prime; &asymp;&nbsp;1.4&nbsp;metres. 
So if such an SVG were enlarged to fill any plausible paper type, it would still be pixel-perfect on a quality printer.

If rounded to one fewer decimal places, it might cease to be pixel-perfect if bigger than 400pt &asymp;&nbsp;141mm &asymp;&nbsp;5.6&Prime;. 
Hence: three decimal places (size&#8239;&#10885;&#8239;14mm&#8239;&asymp;&#8239;0.6&Prime;) might and might not be too few; four would be enough; so, wanting a standard of &lsquo;*too&nbsp;much*&rsquo;, five it is. 
Some shapes are drawn on a canvas significantly larger than 2 across (e.g. 
<nobr><span class="markerID">XAG</span> ![XAG](../ChartMarkers/XAG.svg)</nobr> 
on 442&times;544), for which the number of decimal places has been commensurately lessened.

For those markers with many values &in;&#8239;&Qopf;&smallsetminus;&Zopf;, the `viewBox` has been enlarged by a factor of the [LCM](http://en.wikipedia.org/wiki/Least_common_multiple) of the denominators, making those values integer &DoubleLongRightArrow; fewer bytes yet more precision.

So the dominant numerical errors will come from elsewhere. 
E.g., in [PostScript](http://en.wikipedia.org/wiki/PostScript), and in [PDF which inherited the PostScript graphics model](http://en.wikipedia.org/wiki/PDF#PostScript_language), a [90&deg; arc of a circle is rendered as a single B&eacute;zier cubic](http://groups.google.com/g/comp.lang.postscript/c/B23RW2QpIjU). 
If distilled with [Adobe Distiller](http://en.wikipedia.org/wiki/Adobe_Distiller) then the absolute error of the radius averages &asymp;&#8239;116 parts per million; at 90&deg;&times;<i>n</i>&nbsp;&plusmn;&nbsp;18&deg; the error being near-maximal at just over 211ppm (if with [GhostScript](http://en.wikipedia.org/wiki/Ghostscript), &plusmn;&#8239;18&deg;&nbsp;&DoubleLongRightArrow;&nbsp;&asymp;&#8239;270ppm). 
The error at &plusmn;&#8239;18&deg; could cause a slight misfit, no worse than radius&#8239;&divide;&#8239;3704, between a vertical 5/2 star and its bounding circle, perhaps relevant for 
<nobr><span class="markerID">NZD</span> ![NZD](../ChartMarkers/NZD.svg),</nobr> 
<nobr><span class="markerID">SGD</span> ![SGD](../ChartMarkers/SGD.svg),</nobr> 
<nobr><span class="markerID">ETB</span> ![ETB](../ChartMarkers/ETB.svg).</nobr> 
So Adobe&rsquo;s B&eacute;zier&rsquo;s circle is materially worse than precision truncation, by a factor fairly describable as 42&times;. 
Note that a B&eacute;zier cubic itself is rendered only to within an accuracy no worse than the `setflat` value, which defaults to 1.0 output device pixels, and which is bounded in the range 0.2&ndash;100 ([PLRM3](http://www.adobe.com/jp/print/postscript/pdfs/PLRM.pdf), p669). 
Further, printers are physical machines with physical inaccuracies, likely to be significantly larger than these digital errors.
