# <a name="top">Currency and Issuer Chart Markers</a> #

Documentation links: 
&#9654;&#xFE0E;&nbsp;[Gallery](ChartMarkers_Gallery.md)
&#9655;&#xFE0E;&nbsp;Description
&#9654;&#xFE0E;&nbsp;[Code](ChartMarkers_Code.md)
&#9654;&#xFE0E;&nbsp;[Grumbles](ChartMarkers_Grumbles.md)
&#9654;&#xFE0E;&nbsp;[Files](ChartMarkers_Files.md) incl. [JSON data asset](../ChartMarkers.json) ([raw](https://raw.githubusercontent.com/jdaw1/chart_markers/main/ChartMarkers.json))

--- 

## Description ##

Financial market charts often show a similar type of thing for many currencies or countries. 
E.g., swap curves, or bond yields, or an implied volatility for the dominant equity index. Marking these consistently would allow more immediate and lower-effort recognition of which series means what. 

The &lsquo;obvious choice&rsquo; might be flags. 
Alas flags don&rsquo;t work. 
Many have details that are too small (e.g., 
[US](http://en.wikipedia.org/wiki/Flag_of_the_United_States), 
[CN](http://en.wikipedia.org/wiki/Flag_of_China), 
[HK](http://en.wikipedia.org/wiki/Flag_of_Hong_Kong), 
[MX](http://en.wikipedia.org/wiki/Flag_of_Mexico), 
[BR](http://en.wikipedia.org/wiki/Flag_of_Brazil), 
[EU](http://en.wikipedia.org/wiki/Flag_of_Europe)), 
or are not sufficiently different 
([IE](http://en.wikipedia.org/wiki/Flag_of_Ireland) 
&asymp;&nbsp;[IT](http://en.wikipedia.org/wiki/Flag_of_Italy) 
&asymp;&nbsp;[MX](http://en.wikipedia.org/wiki/Flag_of_Mexico) 
&asymp;&nbsp;[FR](http://en.wikipedia.org/wiki/Flag_of_France) 
&asymp;&nbsp;[RO](http://en.wikipedia.org/wiki/Flag_of_Romania) 
&asymp;&nbsp;[MD](http://en.wikipedia.org/wiki/Flag_of_Moldova) 
&asymp;&nbsp;[BE](http://en.wikipedia.org/wiki/Flag_of_Belgium)), 
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

So a set of markers has been made, such that there is a consistent mapping markers&longleftrightarrow;meaning. 
E.g., 
<nobr>&lsquo;<span class="markerID">SEK</span>&lsquo;&nbsp;![SEK](../ChartMarkers/SEK.svg),</nobr> 
<nobr>&lsquo;<span class="markerID">CNY</span>&rsquo;&nbsp;![CNY](../ChartMarkers/CNY.svg),</nobr> and others for eurozone issuers such as 
<nobr>&lsquo;<span class="markerID">DE</span>&rsquo;&nbsp;![DE](../ChartMarkers/DE.svg),</nobr> 
<nobr>&lsquo;<span class="markerID">FR</span>&rsquo;&nbsp;![FR](../ChartMarkers/FR.svg),</nobr> 
<nobr>&lsquo;<span class="markerID">IT</span>&rsquo;&nbsp;![IT](../ChartMarkers/IT.svg),</nobr> 
<nobr>&lsquo;<span class="markerID">ES</span>&rsquo;&nbsp;![ES](../ChartMarkers/ES.svg),</nobr> 
<nobr>&lsquo;<span class="markerID">NL</span>&rsquo;&nbsp;![NL](../ChartMarkers/NL.svg).</nobr> 

This is a set of standard markers for this purpose, all of which are shown in the [Gallery](ChartMarkers_Gallery.md).

This set of markers is &copy;&nbsp;[J.&#8239;D.&#8239;A.&#8239;Wiseman](http://www.jdawiseman.com/author.html) 1998&ndash;2024, he having created and re-worked and improved and added to them since 1998. 
It is available from [GitHub](http://github.com/jdaw1/), under the [Boost Software Licence, Version&nbsp;1.0](https://opensource.org/license/bsl-1-0/). 
(If your lawyers have a genuine need for a different [licence](https://github.com/jdaw1/chart_markers/blob/main/LICENSE)&mdash;not lawyers not bothering to read, actual genuine need&mdash;explain and it might be done.)

There is a public good in consistency. 
It is not an enforceable public good, but it is a public good, so please do be consistent. 
E.g., if plotting a chart of eurozone bond yields, do use the correct markers. 
But within this consistency there could be some appropriate variation of size. 
E.g. if these markers are being used by a central bank, it would be natural to enlarge the home currency&rsquo;s marker, and slightly enlarge those of important trading partners.

Please don&rsquo;t use these markers for a different meaning.
If plotting implied volatilities of, say, the S&amp;P500 and the Russell and the Nasdaq, please don&rsquo;t mark with one of these currency/territory symbols, because that isn&rsquo;t their meaning.
Deliberately, none of these are triangles, nor diamonds, so please use those for other meanings.

It has been coded in [SVG](http://en.wikipedia.org/wiki/Scalable_Vector_Graphics), from which have been produced [PNG](http://en.wikipedia.org/wiki/Portable_Network_Graphics)s (with alpha channel: transparent &ne;&nbsp;white). 
SVG is usable by most or all plotting and charting software.



## <a name="desiderata"></a>Design desiderata for Markers ##

The design of the markers was guided by multiple desiderata &asymp;&nbsp;constraints.

1. <a name="N-Small_details"></a>Because these markers are shown small, typically about 2mm across, they cannot have small sub-features. 
Many flags have features that are small relative to the whole flag. 
Yes, those features may well inspire passion in patriotic citizens of such countries, but nonetheless, there isn&rsquo;t space. 
E.g.,&nbsp;the US Stars &amp; Stripes has fifty stars, here simplified to just 
<nobr>one&nbsp;![USD](USD_baseline.svg).</nobr> 
E.g.,&nbsp;Germany&rsquo;s Brandeburg Gate actually has six columns, here simplified to 
<nobr>four&nbsp;![DE](../ChartMarkers/DE.svg).</nobr> 
E.g.,&nbsp;the stars in the flag of China are small relative to the flag, and would be imperceptible at the required 
<nobr>size&nbsp;![CNY](../ChartMarkers/CNY.svg).</nobr> 
So things must be simplified: perhaps by rearrangement of the whole; perhaps the whole represented by a detail; often, both.

2. <a name="memorability"></a>There must be an easy means of remembering the meaning of each marker. 
Each must have a &lsquo;story&rsquo; enabling it to be identified. 
E.g.,&nbsp;the UK is one of the few countries with a diagonal 
<nobr>cross&nbsp;![GBP](../ChartMarkers/GBP.svg).</nobr> 
E.g.,&nbsp;the euro logo has been symmetrified and simplified to a circle with a horizontal 
<nobr>line&nbsp;![EUR](../ChartMarkers/EUR.svg).</nobr> 
E.g.,&nbsp;the map of France resembles a 
<nobr>hexagon&nbsp;![FR](../ChartMarkers/FR.svg).</nobr> 
E.g.,&nbsp;China&rsquo;s flag is one of the few with stars that point neither vertically nor horizontally&nbsp;![CNY](../ChartMarkers/CNY.svg).

3. <a name="distinctive"></a>Markers must be distinctive.
They cannot differ only by a shade of a colour; nor by only a small shape change.
E.g., the flags of both [China](http://en.wikipedia.org/wiki/Flag_of_China) and [Vietnam](http://en.wikipedia.org/wiki/Flag_of_Vietnam) have gold stars on a red field, and only a rotational difference would have been insufficient.
So the economically smaller country uses the oval from the logo of its central 
<nobr>bank&nbsp;![VND](../ChartMarkers/VND.svg).</nobr> 
But for most symbols there was no need to force a difference.

4. <a name="centre"></a>Markers must have a well-defined centre.
This is true of shapes with rotational symmetry of order &ge;&#8239;2, and also of any shape with multiple lines of symmetry. 
It is also true of markers that comprise several shapes, each with rotational symmetry, all having the same centre. 
Contrast with, for example, an &lsquo;L&rsquo; which lacks an obvious centre. 
Canada&rsquo;s [maple&nbsp;leaf](http://commons.wikimedia.org/wiki/File:Flag_of_Canada_(construction_sheet_-_leaf_geometry).svg) has a definite horizontal centre, but not an unambiguous vertical centre, and hence was vigorously 
<nobr>reshaped&nbsp;![CAD](../ChartMarkers/CAD.svg).</nobr> 
(Place images at the centre of the SVG&rsquo;s bounding box. 
A cropped odd-rotational shape and its bounding box might have different centres ([examples](ChartMarkers_Code.md#centres)): use the centre of the SVG&rsquo;s bounding box.)

5. <a name="symmetrical"></a>As well as a well-defined centre, markers should be symmetrical, even to people of different colour perception. 
In particular, this constrains the possibilities for tricolour flags with outside colours that are not the same. 
One exception has been allowed: 
<nobr><span class="markerID">KRW</span>&nbsp;![KRW](../ChartMarkers/KRW.svg).</nobr>

6. <a name="aspect"></a>Aspect ratios must be in the range &frac12; to 2. 
This constraint was relevant for 
<nobr><span class="markerID">LU</span>&nbsp;![LU](../ChartMarkers/LU.svg),</nobr> which would otherwise have had an aspect ratio of 4&ratio;9&nbsp;=&nbsp;1&ratio;2&frac14;, and <nobr><span class="markerID">GYD</span>&nbsp;![GYD](../ChartMarkers/GYD.svg).

7. <a name="contiguous"></a>Markers must be contiguous, both topologically and optically, and also not hollow. 
The optically-contiguous constraint requires that markers not comprise large pieces joined by long thin connectors. 
Pieces may not be hollow: the interior must be filled, for some meaning filled white. 
E.g.:
<nobr><span class="markerID">UYU</span>&nbsp;![UYU](../ChartMarkers/UYU.svg).</nobr>

8. <a name="num_colours"></a>Markers might appear many times in close proximity. 
Many nearby copies of a marker that is a solid block of colour would collectively form a shapeless blob of that colour, indistinguishable from blobs caused by other markers of similar hue. 
Hence markers use at least two colours (and not more than four, as used by 
<nobr><span class="markerID">KWD</span>&nbsp;![KWD](../ChartMarkers/KWD.svg)</nobr> and 
<nobr><span class="markerID">PS</span>&nbsp;![PS](../ChartMarkers/PS.svg)).</nobr>

9. <a name="dark_edge"></a>For most of the markers the outermost colour is dark, or at least darker than some of the inner colours. 
So markers are best against a pale background such as white, or a light pastel such as [FT&nbsp;pink](https://aboutus.ft.com/company/ft-pink-130).

10. <a name="no_movement"></a>These markers must work on a screen in Excel and Mathematica and Cairo and other software capable of plotting data, in a PDF, and on physical dead-tree paper. 
Hence: no animations; no blinking; no movement.


## IDs ##

A unique ID has been assigned to each marker, these IDs generally being of one of five types.

* A three-alpha [ISO&nbsp;4217](http://en.wikipedia.org/wiki/ISO_4217) currency code, most of these markers also being usable for the issuing territory. 

* A two-alpha [ISO&nbsp;3166&#8209;1](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code (not necessarily permanently assigned, e.g. <nobr><span class="markerID">XK</span>&nbsp;![XK](../ChartMarkers/XK.svg))</nobr>, typically for countries using a multinational currency. 

* Some markers have an alternate ID ending &ldquo;<span class="markerID">\_2</span>&rdquo;. 
Each of these alternates is merely a recoloured version of the main ID. 
Mostly these are for &lsquo;alternate bond product&rsquo;: green bonds, bonds linked to a different inflation index, etc. 
But the alternates can be used for other purposes, such as for a large geographic sub-region of the main.

* There are codes based on the [ISO&nbsp;3166&#8209;2](https://en.wikipedia.org/wiki/ISO_3166-2) sub-divisions of [GB](https://en.wikipedia.org/wiki/ISO_3166-2:GB), except that an underscore (&ldquo;<span class="markerID">\_</span>&rdquo;) replaces the dash (&ldquo;<span class="markerID">&#8209;</span>&rdquo;): 
<nobr><span class="markerID">GB\_ENG</span>&nbsp;![GB\_ENG](../ChartMarkers/GB_ENG.svg),</nobr> 
<nobr><span class="markerID">GB\_SCT</span>&nbsp;![GB\_SCT](../ChartMarkers/GB_SCT.svg),</nobr> 
<nobr><span class="markerID">GB\_WLS</span>&nbsp;![GB\_WLS](../ChartMarkers/GB_WLS.svg),</nobr> 
<nobr><span class="markerID">GB\_NIR</span>&nbsp;![GB\_NIR](../ChartMarkers/GB_NIR.svg),</nobr> 
<nobr><span class="markerID">GB\_EAW</span>&nbsp;![GB\_EAW](../ChartMarkers/GB_EAW.svg).</nobr> 
Why just the UK? Sometimes data is reported for England and/or Scotland, rather than for the UK as a whole ([e.g.](http://twitter.com/jdaw1/status/1665068365403115520)), and some sports are organised at the same level. Of these the <nobr><span class="markerID">GB\_EAW</span>&nbsp;![GB\_EAW](../ChartMarkers/GB_EAW.svg)</nobr> marker should be used for green gilts, and perhaps also for the old-style 8-month index-linked gilts first issued &le;&#8239;2002.

* For development banks and similar institutions, an invented ID, beginning with an underscore, followed by a few alpha characters, typically being an acronym of the institution&rsquo;s name. 
Of these IDs the eight shortest 
<nobr>(<span class="markerID">\_ECB</span>&nbsp;![_ECB](../ChartMarkers/_ECB.svg),</nobr> 
<nobr><span class="markerID">\_ADB</span>&nbsp;![_ADB](../ChartMarkers/_ADB.svg),</nobr> 
<nobr><span class="markerID">\_CDB</span>&nbsp;![_CDB](../ChartMarkers/_CDB.svg),</nobr> 
<nobr><span class="markerID">\_EIB</span>&nbsp;![_EIB](../ChartMarkers/_EIB.svg),</nobr> 
<nobr><span class="markerID">\_ESM</span>&nbsp;![_ESM](../ChartMarkers/_ESM.svg),</nobr> 
<nobr><span class="markerID">\_KfW</span>&nbsp;![_KfW](../ChartMarkers/_KfW.svg),</nobr> 
<nobr><span class="markerID">\_NDB</span>&nbsp;![_NDB](../ChartMarkers/_NDB.svg),</nobr> 
<nobr><span class="markerID">\_NIB</span>&nbsp;![_NIB](../ChartMarkers/_NIB.svg))</nobr> 
are of length 1&#8239;+&#8239;3&#8239;=&#8239;4 characters; the longest 
<nobr>(<span class="markerID">\_AfExIm</span>&nbsp;![_AfExIm](../ChartMarkers/_AfExIm.svg))</nobr> 
is of length 1&#8239;+&#8239;6&#8239;=&#8239;7 characters.


## Which symbols exist? ##

Symbols have been made for several overlapping sets.

* Currencies and sovereign credits seen by this analyst in financial markets.

* EU members, non-tiny &euro; adopters, and accession candidates 
<nobr>=&nbsp;{<span class="markerID">TRY</span>&nbsp;![TRY](../ChartMarkers/TRY.svg),</nobr> 
<nobr><span class="markerID">MKD</span>&nbsp;![MKD](../ChartMarkers/MKD.svg),</nobr> 
<nobr><span class="markerID">ME</span>&nbsp;![ME](../ChartMarkers/ME.svg),</nobr> 
<nobr><span class="markerID">ALL</span>&nbsp;![ALL](../ChartMarkers/ALL.svg),</nobr> 
<nobr><span class="markerID">RSD</span>&nbsp;![RSD](../ChartMarkers/RSD.svg),</nobr> 
<nobr><span class="markerID">UAH</span>&nbsp;![UAH](../ChartMarkers/UAH.svg),</nobr> 
<nobr><span class="markerID">MDL</span>&nbsp;![MDL](../ChartMarkers/MDL.svg)}.</nobr>

* Some others with non-small economies such as 
<nobr><span class="markerID">IRR</span>&nbsp;![IRR](../ChartMarkers/IRR.svg)</nobr> and 
<nobr><span class="markerID">IQD</span>&nbsp;![IQD](../ChartMarkers/IQD.svg).</nobr> 
(There are markers for the top 100 countries in [wikipedia&rsquo;s list of countries by GDP](http://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)), so all 
<nobr>&ge;&nbsp;Nepal&nbsp;![NPR](../ChartMarkers/NPR.svg).)</nobr>

* Some others with large populations such as 
<nobr><span class="markerID">CDF</span>&nbsp;![CDF](../ChartMarkers/CDF.svg),</nobr> 
<nobr><span class="markerID">SDG</span>&nbsp;![SDG](../ChartMarkers/SDG.svg),</nobr> and 
<nobr><span class="markerID">YER</span>&nbsp;![YER](../ChartMarkers/YER.svg).</nobr>

* Those with a substantial presence in global news: 
<nobr><span class="markerID">KPW</span>&nbsp;![KPW](../ChartMarkers/KPW.svg),</nobr> and 
<nobr><span class="markerID">PS</span>&nbsp;![PS](../ChartMarkers/PS.svg).</nobr>

* Some highly rated supranational bond issuers, including 
<nobr><span class="markerID">\_ESM</span>&nbsp;![\_ESM](../ChartMarkers/\_ESM.svg),</nobr> 
<nobr><span class="markerID">\_EIB</span>&nbsp;![\_EIB](../ChartMarkers/\_EIB.svg),</nobr> 
<nobr><span class="markerID">\_EBRD</span>&nbsp;![\_EBRD](../ChartMarkers/\_EBRD.svg),</nobr> 
<nobr><span class="markerID">\_KfW</span>&nbsp;![\_KfW](../ChartMarkers/\_KfW.svg),</nobr> 
<nobr><span class="markerID">\_ADB</span>&nbsp;![\_ADB](../ChartMarkers/\_ADB.svg),</nobr> 
<nobr><span class="markerID">\_AIIB</span>&nbsp;![\_AIIB](../ChartMarkers/\_AIIB.svg),</nobr> 
<nobr><span class="markerID">\_IADB</span>&nbsp;![\_IADB](../ChartMarkers/\_IADB.svg),</nobr> and 
<nobr><span class="markerID">\_IBRD</span>&nbsp;![\_IBRD](../ChartMarkers/\_IBRD.svg).</nobr> 

* The quasi-currencies 
<nobr><span class="markerID">XDR</span>&nbsp;![XDR](../ChartMarkers/XDR.svg),</nobr> 
<nobr><span class="markerID">XAU</span>&nbsp;![XAU](../ChartMarkers/XAU.svg),</nobr> 
<nobr><span class="markerID">XAG</span>&nbsp;![XAG](../ChartMarkers/XAG.svg),</nobr> and 
<nobr><span class="markerID">XPT</span>&nbsp;![XPT](../ChartMarkers/XPT.svg).</nobr>

So missing are many tiny currencies and countries, and the quasi-sovereign corporates.

Also missing are the [cryptocurrencies](http://en.wikipedia.org/wiki/Cryptocurrency). 
There are thousands of cryptocurrencies[&dagger;](http://www.statista.com/statistics/863917/)[&Dagger;](http://coinmarketcap.com/all/views/all/), many of which have enthusiasts, and many of which have people paid to pretend to be enthusiasts. 
So crypto would be a much more difficult mess to adjudicate &mdash; and, notwithstanding the [grumbles](ChartMarkers_Grumbles.md) page, a noisier mess to adjudicate. 
Further, the commercial nature of many cryptocurrencies could lead to accusations that sponsors had paid me to include their cryptocurrencies. 
(Indeed, if they were to pay me lots to do the work then I would &mdash; but as yet nobody has offered.) 
Hence as of writing this project does not include cryptocurrencies. 
But it might be that somebody who thinks that this is a good project decides to do likewise for the relevant cryptocurrencies. 
If so, excellent: do a good job; do a fair job; do a job that well applies the fairness, principles, desiderata, constraints, and style of what has already been done here.



## <a name="changes"></a>Changes ##

As yet, there is not a fixed set of rules about changes. 
It is anticipated that the following will be true, at least mostly. 
While this project has few users, its creator feels at liberty to make changes great or small, frequently or rarely. 

* After the userbase becomes substantial, changes would need to be preceded by explanation in an issue, and weight given to arguments posted therein.

* If a territory&rsquo;s currency should be replaced (e.g., <nobr>[ARL](http://en.wikipedia.org/wiki/Argentine_peso#Peso_ley,_1970%E2%80%931983)&#10141;ARP&#10141;ARA&#10141;<span class="markerID">ARS</span>),</nobr> then the same marker will apply to the new currency. The marker would be updated to reflect its new ID: updated ID in documentation; updated filename; within the SVG updated <nobr><code>id='&hellip;'</code>.</nobr> 

* If a country&rsquo;s 3166 code should change because of a country rename (e.g., [ZR](http://en.wikipedia.org/wiki/Zaire)&#10141;[CD](http://en.wikipedia.org/wiki/ISO_3166-2:CD)), then the same marker will apply, with the small updates in the previous bullet.

* If there should be a change in the source of the design of a marker (flag, coat of arms, development bank logo, etc), then the marker might and might not be updated. If the new source admits of a better marker (especially if the new marker would be more distinctive), that would increase the likelihood of an update.

* If a country&rsquo;s 3166 code should change because of a merger or a split, then the marker might and might not be updated, with the better-distinctive preference in the previous bullet.



## <a name="lines"></a>Lines ##

<div align="centre">

| &nbsp;&nbsp;&nbsp;ID&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;Line&nbsp;&nbsp; | Marker |
|:--------------:|:----------------:|:----------------:|
| CHF | ![CHF](../ChartLines/CHF_line.svg) | ![CHF](../ChartMarkers/CHF.svg) |
| HKD | ![HKD](../ChartLines/HKD_line.svg) | ![HKD](../ChartMarkers/HKD.svg) |
| IDR | ![IDR](../ChartLines/IDR_line.svg) | ![IDR](../ChartMarkers/IDR.svg) |
| GEL | ![GEL](../ChartLines/GEL_line.svg) | ![GEL](../ChartMarkers/GEL.svg) |
| AT  | ![AT](../ChartLines/AT_line.svg)   | ![AT](../ChartMarkers/AT.svg)   |
| JPY | ![JPY](../ChartLines/JPY_line.svg) | ![JPY](../ChartMarkers/JPY.svg) |
| TND | ![TND](../ChartLines/TND_line.svg) | ![TND](../ChartMarkers/TND.svg) |
| TRY | ![TRY](../ChartLines/TRY_line.svg) | ![TRY](../ChartMarkers/TRY.svg) |
| DKK | ![DKK](../ChartLines/DKK_line.svg) | ![DKK](../ChartMarkers/DKK.svg) |
| PLN | ![PLN](../ChartLines/PLN_line.svg) | ![PLN](../ChartMarkers/PLN.svg) |
| BYN | ![BYN](../ChartLines/BYN_line.svg) | ![BYN](../ChartMarkers/BYN.svg) |
| MT  | ![MT](../ChartLines/MT_line.svg)   | ![MT](../ChartMarkers/MT.svg)   |
| PEN | ![PEN](../ChartLines/PEN_line.svg) | ![PEN](../ChartMarkers/PEN.svg) |

</div>

It has not been possible to make line patterns satisfying all the markers&rsquo; constraints. 
Without the optical space afforded by shape, colour alone is insufficient to make 166 lines that are individually memorable and pairwise distinct (many flags have no dominant colours other than red, white, and blue). 
So the distinctness standard has been weakened: lines within a &lsquo;group&rsquo; are different.

But lines from different groups might be similar or identical. 
So a chart, lines no markers, that compares Switzerland, Hong Kong, Indonesia, Georgia, Austria, Japan, Tunisia, T&uuml;rkiye, Denmark, Poland, Belarus, Malta, and Peru, would be a mess of white and barely distinguishable shades of red. 
In that situation, apply judgement and make changes, a near-minimal set of changes, such that lines are distinct. 
In practice, alas, custom line colours would be needed for some charts&rsquo; particular sets of countries.

But for many circumstances, perhaps most circumstances, the default line colourations should be satisfactory.
