# Chart Markers #
 
Start by marvelling at the 
[gallery](Documentation/ChartMarkers_Gallery.md) 
(the [off-GitHub HTML version being more reliable](https://www.jdawiseman.com/papers/Chart_Markers/ChartMarkers_Gallery.html)), then read the 
[description](Documentation/ChartMarkers_Description.md). 
There is technical comment about the SVG 
[code](Documentation/ChartMarkers_Code.md), 
and an explanation of the available 
[files](Documentation/ChartMarkers_Files.md). 
Finally, a page about how to 
[grumble](Documentation/ChartMarkers_Grumbles.md) 
about a marker&rsquo;s design, and how not to grumble.

---

Charts in financial markets are a mess: $ or &euro; or &pound; or &yen; might be represented by different symbols on different charts. 
Indeed, sometimes different symbols in charts created by the same author and appearing on the same page.

A consistent set of markers would allow readers to focus more on the meaning of the data, and less on the distraction of attempting to decode the markers. 
Alas, many flags have details that are too small (e.g., 
[US](http://en.wikipedia.org/wiki/Flag_of_the_United_States), 
[CN](http://en.wikipedia.org/wiki/Flag_of_China), 
[HK](http://en.wikipedia.org/wiki/Flag_of_Hong_Kong), 
[MX](http://en.wikipedia.org/wiki/Flag_of_Mexico), 
[BR](http://en.wikipedia.org/wiki/Flag_of_Brazil), 
[EU](http://en.wikipedia.org/wiki/Flag_of_Europe)), or are not sufficiently different 
([IE](http://en.wikipedia.org/wiki/Flag_of_Ireland) &asymp; 
[IT](http://en.wikipedia.org/wiki/Flag_of_Italy) &asymp; 
[MX](http://en.wikipedia.org/wiki/Flag_of_Mexico) &asymp; 
[FR](http://en.wikipedia.org/wiki/Flag_of_France) &asymp; 
[RO](http://en.wikipedia.org/wiki/Flag_of_Romania) &asymp; 
[BE](http://en.wikipedia.org/wiki/Flag_of_Belgium) &asymp; 
[MD](http://en.wikipedia.org/wiki/Flag_of_Moldova)), 
or are asymmetrical so the centre = the datapoint isn&rsquo;t both obvious and unique 
([Nordics](http://en.wikipedia.org/wiki/Nordic_cross_flag), 
[TW](http://en.wikipedia.org/wiki/Flag_of_Taiwan), 
[MY](http://en.wikipedia.org/wiki/Flag_of_Malaysia), 
[ZA](http://en.wikipedia.org/wiki/Flag_of_South_Africa), 
[CL](http://en.wikipedia.org/wiki/Flag_of_Chile), 
[UY](http://en.wikipedia.org/wiki/Flag_of_Uruguay), 
[BH](http://en.wikipedia.org/wiki/Flag_of_Bahrain), 
[QA](http://en.wikipedia.org/wiki/Flag_of_Qatar)), 
or have much white at the edge 
([JP](http://en.wikipedia.org/wiki/Flag_of_Japan), 
[ID](http://en.wikipedia.org/wiki/Flag_of_Indonesia), 
[SG](http://en.wikipedia.org/wiki/Flag_of_Singapore), 
[IL](http://en.wikipedia.org/wiki/Flag_of_Israel), 
[PL](http://en.wikipedia.org/wiki/Flag_of_Poland), 
[BG](http://en.wikipedia.org/wiki/Flag_of_Bulgaria), 
[SK](http://en.wikipedia.org/wiki/Flag_of_Slovakia), 
[SI](http://en.wikipedia.org/wiki/Flag_of_Slovenia), 
[CY](http://en.wikipedia.org/wiki/Flag_of_Cyprus)).

**So a set of markers has been made, showcased in the [gallery](Documentation/ChartMarkers_Gallery.md)** ([HTML translation](https://www.jdawiseman.com/papers/Chart_Markers/ChartMarkers_Gallery.html)). E.g.: 
<nobr><span class="markerID">USD</span>&nbsp;=&nbsp;![USD](ChartMarkers/USD.svg)</nobr>&nbsp;&nbsp; 
<nobr><span class="markerID">EUR</span>&nbsp;=&nbsp;![EUR](ChartMarkers/EUR.svg)</nobr>&nbsp;&nbsp; 
<nobr><span class="markerID">GBP</span>&nbsp;=&nbsp;![GBP](ChartMarkers/GBP.svg)</nobr>&nbsp;&nbsp; 
<nobr><span class="markerID">JPY</span>&nbsp;=&nbsp;![JPY](ChartMarkers/JPY.svg)</nobr>&nbsp;&nbsp; 
<nobr><span class="markerID">CNY</span>&nbsp;=&nbsp;![CNY](ChartMarkers/CNY.svg)</nobr>&nbsp;&nbsp; 
<nobr><span class="markerID">DE</span>&nbsp;=&nbsp;![DE](ChartMarkers/DE.svg)</nobr>&nbsp;&nbsp; 
<nobr><span class="markerID">FR</span>&nbsp;=&nbsp;![FR](ChartMarkers/FR.svg)</nobr>&nbsp;&nbsp; 
<nobr><span class="markerID">IT</span>&nbsp;=&nbsp;![IT](ChartMarkers/IT.svg)</nobr>&nbsp;&nbsp;

If you and you alone use it, then you would be consistent for your readers: a good thing. 
If others also use it, it would be even easier for your readers: even better. 
And it&rsquo;s free, released under the very permissive [Boost Software Licence, Version&nbsp;1.0](https://opensource.org/license/bsl-1-0/).
