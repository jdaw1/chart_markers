Option Explicit

' To go in Module 'modCharts'



' Excel's built-in chart scaling is terrible, it being far too keen top include 0.
' Compute your own Min Max Major Minor, and this will do the work.
' Two strings specify chart; two Booleans specify axis; four numbers are the values.
' To make Min and Max use Excel's automatic, set minScale >= maxScale.
' To make Major and Minor use Excel's automatic, set minorStep > majorStep; or set either to <= 0.
Function Axis_Scale( _
	tabName As String, chartName As String, _
	xAxis As Boolean, primaryAxis As Boolean, _
	minScale As Double, maxScale As Double, majorStep As Double, minorStep As Double _
) As Double
	Dim ch as Chart
	If Len(tabName) > 0 Then
		Set ch = ThisWorkbook.Sheets(tabName).ChartObjects(chartName).Chart
	Else
		Set ch = ThisWorkbook.Charts(chartName)
	End If  ' Len(tabName) > 0
	With IIf(xAxis, _
		ch.Axes(xlCategory, IIf(primaryAxis, xlPrimary, xlSecondary)), _
		ch.Axes(xlValue, IIf(primaryAxis, xlPrimary, xlSecondary)) _
	)
		.MinimumScaleIsAuto = True
		.MaximumScaleIsAuto = True  ' In case of awkwardnesses such as New Min > Old Max
		.MajorUnitIsAuto = True
		.MinorUnitIsAuto = True  ' In case of awkwardnesses such as New Major < Old Minor
		If minScale < maxScale Then
			.MinimumScaleIsAuto = False: .MinimumScale = minScale
			.MaximumScaleIsAuto = False: .MaximumScale = maxScale
		End If  ' minScale < maxScale
		If minorStep <= majorStep Then
			If majorStep > 0 Then .MajorUnitIsAuto = False: .MajorUnit = majorStep
			If minorStep > 0 Then .MinorUnitIsAuto = False: .MinorUnit = minorStep
		End If  ' minorStep <= majorStep
	End With  ' Axis

	Axis_Scale = Now
End Function  ' Axis_Scale


' http://stackoverflow.com/questions/137845/determining-whether-an-object-is-a-member-of-a-collection-in-vba
Public Function ExistsInCollection(col As Variant, key As Variant) As Boolean
	On Error GoTo err
	IsObject (col.Item(key))
	ExistsInCollection = True: Exit Function
err:
	ExistsInCollection = False: Exit Function
End Function  ' ExistsInCollection


Function Series_NameString(ByVal fm As String, wks As Worksheet) As String
	' sr.Name might be stale. Alas, Excel seems not to update it when spreadsheet updates, not even with a Chart.Refresh.
	' Hence need for this 'manual' evaluation. Its hackerish necessity not liked, but, alas, Chart.Refresh doesn't work.
	' Parameter fm is a series formula, =SERIES(...)", so open-bracket is character 8.
	Dim strTemp As String, srName As Variant, charNum As Long
	If Mid(fm, 9, 1) = "'" Then
		' Do people really have tab names containing a comma?! Just in case.
		charNum = 1 + InStr(10, fm, "'", vbBinaryCompare)
	Else
		charNum = 9
	End If  ' single quote
	Do
		charNum = InStr(charNum, fm, ",", vbBinaryCompare)
		If charNum <= 9 Then Series_NameString = "": Exit Do
		strTemp = Mid(fm, 9, charNum - 9)
		srName = Application.Evaluate(strTemp)
		srName = Application.Evaluate(strTemp)
		If IsError(srName) Then Series_NameString = "": Exit Do
		Series_NameString = ("" & srName): Exit Do  ' It could be that sr.Name is numeric.
	Loop Until True
End Function  ' Series_NameString()


Sub Chart_SeriesFormatStandardised( _
	tabName As String, _
	chartName As String, _
	applyMarkers As Boolean, _
	applyLines As Boolean, _
	Optional seriesNames As Variant, _
	Optional rngNameLog As String = "" _
)
	' ignoredParam is to shape recalculation tree.
	Dim wksCF As Worksheet, wksThis As Worksheet, ch As Chart, rngName As String
	Dim srNum As Long, sr As Series, srNumPrev As Long, aliasRowNumProto As Long, srName As Variant
	Dim thisID As String, chartLineRowNum As Long, ErrorTooFewSeries As String, numSeriesNeeded As Long
	Dim CMD As String, CMS As String, cl As Range, arrayPosn As Long, isGood As Boolean, isChosen As Boolean
	Dim sfaSeriesName As Range, sfaID As Range, clt_T As Range, clt_EW As Range
	Dim clRN As Range, clID As Range, clNI As Range, clIN As Range, clR As Range, clG As Range, clB As Range, clTT As Range
	Dim instanceNum As Variant, numInstances As Variant, prevInstance As Variant, aliasRowNum As Variant
	Dim outputLog As Boolean, outputRange As Range

	If "" = rngNameLog Then
		outputLog = False
	Else
		outputLog = True
		If ExistsInCollection(ThisWorkbook.Names, rngNameLog) Then
			Set outputRange = ThisWorkbook.Names(rngNameLog).RefersToRange
		Else
			MsgBox "Missing name '" & rngNameLog & "'."
		End If  ' ExistsInCollection(ThisWorkbook.Names, rngNameLog)
	End If  ' IsMissing(rngNameLog)

	If ExistsInCollection(ThisWorkbook.Sheets, "ChartFormats") Then  ' wksCF"
		Set wksCF = ThisWorkbook.Worksheets("ChartFormats")
	Else
		If outputLog Then outputRange = "Error: tab 'ChartFormats' does not exist."
		Exit Sub
	End If

	If ExistsInCollection(ThisWorkbook.Sheets, tabName) Then  ' wksThis
		Set wksThis = ThisWorkbook.Sheets(tabName)
	Else
		If outputLog Then outputRange = "Error: tab '" & tabName & "' does not exist."
		Exit Sub
	End If

	If ExistsInCollection(wksThis.ChartObjects, chartName) Then  ' ch
		Set ch = wksThis.ChartObjects(chartName).Chart
	Else
		If outputLog Then outputRange = "Error: chart '" & chartName & "' does not exist on tab '" & tabName & "'."
		Exit Sub
	End If

	rngName = "ChartMarkers.Directory"  ' CMD
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		CMD = ThisWorkbook.Names(rngName).RefersToRange.Value
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartMarkers.Suffix"  ' CMS
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		CMS = ThisWorkbook.Names(rngName).RefersToRange.Value
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "SeriesFormatAlias.SeriesName"  ' sfaSeriesName
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set sfaSeriesName = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "SeriesFormatAlias.ID"  ' sfaID
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set sfaID = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines_Thicknesses.Text"  ' clt_T
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clt_T = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines_Thicknesses.ExcelWeight"  ' clt_EW
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clt_EW = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines.RowNum"  ' clRN
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clRN = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines.ID"  ' clID
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clID = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines.NumInstances"  ' clNI
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clNI = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines.InstanceNum"  ' clIN
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clIN = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines.R"  ' clR
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clR = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines.G"  ' clG
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clG = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines.B"  ' clB
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clB = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	rngName = "ChartLines.ThicknessText"  ' clTT
	If ExistsInCollection(ThisWorkbook.Names, rngName) Then
		Set clTT = ThisWorkbook.Names(rngName).RefersToRange
	Else
		If outputLog Then outputRange = "Error: tab '" & wksCF.Name & "' does not contain range '" & rngName & "'."
		Exit Sub
	End If  ' ExistsInCollection(ThisWorkbook.Names, rngName)

	If ch.SeriesCollection.Count < 1 Then If outputLog Then outputRange = "Error: chart has no series.": Exit Sub

	DoEvents: ch.Refresh: DoEvents: ch.Refresh

	ReDim instanceNum(1 To ch.SeriesCollection.Count) As Long
	ReDim numInstances(1 To ch.SeriesCollection.Count) As Long
	ReDim prevInstance(1 To ch.SeriesCollection.Count) As Long
	ReDim aliasRowNum(1 To ch.SeriesCollection.Count) As Long
	For srNum = 1 To ch.SeriesCollection.Count
		Set sr = ch.SeriesCollection(srNum)
		instanceNum(srNum) = -1: numInstances(srNum) = -1:  prevInstance(srNum) = -1
		aliasRowNum(srNum) = -srNum  ' Pairwise distinct
		Do
			srName = "" & Series_NameString(sr.Formula, wksThis)
			If Application.IsError(srName) Then Exit Do  ' In theory an series name = alias could be a number, or even a Boolean.
			If Len(srName) = 0 Then Exit Do

			' Populate instanceNum() and prevInstance(), and start on numInstances().
			aliasRowNumProto = -1
			On Error Resume Next
			aliasRowNumProto = Application.Match(srName, sfaSeriesName, 0)
			On Error GoTo 0
			If Not IsNumeric(aliasRowNumProto) Then Exit Do
			If aliasRowNumProto <= 0 Then Exit Do
			aliasRowNum(srNum) = aliasRowNumProto
			instanceNum(srNum) = 1: numInstances(srNum) = 1
			For srNumPrev = srNum - 1 To 1 Step -1
				If aliasRowNum(srNum) = aliasRowNum(srNumPrev) Then
					instanceNum(srNum) = 1 + instanceNum(srNumPrev)
					numInstances(srNum) = instanceNum(srNum)  ' Only last of numInstances() sequence will be correct. Fixed later.
					prevInstance(srNum) = srNumPrev
					Exit For  ' srNumPrev
				End If  ' aliasRowNum(srNum) = aliasRowNum(srNumPrev)
			Next srNumPrev

			' If seriesNames is a parameter, check with that.
			If IsMissing(seriesNames) Then
				isChosen = True
			Else
				isChosen = False
				If IsNumeric(seriesNames) Then
					If srName = srNum Then isGood = True
				ElseIf VarType(seriesNames) = vbString Then
					If srName = seriesNames Then isGood = True
				ElseIf TypeOf seriesNames Is Range Then
					For Each cl In seriesNames
						If Not Application.WorksheetFunction.IsError(cl) Then
							If srName = cl.Value Then isChosen = True: Exit For
						End If  ' Not ... IsError
						If IsNumeric(cl) Then
							If srNum = cl.Value Then isChosen = True: Exit For
						End If  ' IsNumeric
					Next cl
				ElseIf VarType(seriesNames) >= vbArray Then
					For arrayPosn = LBound(seriesNames) To UBound(seriesNames)
						If Not Application.WorksheetFunction.IsError(seriesNames(arrayPosn)) Then
							If seriesNames(arrayPosn) = srName Then isChosen = True: Exit For
						End If  ' Not ... IsError
						If IsNumeric(seriesNames(arrayPosn)) Then
							If seriesNames(arrayPosn) = srNum Then isChosen = True: Exit For
						End If  ' IsNumeric
					Next arrayPosn
				End If  ' IsNumeric | vbString | vbArray | Range
			End If  ' IsMissing(seriesNames)
	  
		Loop Until True  ' This structure because Exit'able
	Next srNum
	For srNum = ch.SeriesCollection.Count To 1 Step -1  ' Fixing numInstances()
		If prevInstance(srNum) > 0 Then numInstances(prevInstance(srNum)) = numInstances(srNum)
	Next srNum

	ErrorTooFewSeries = ""
	For srNum = 1 To ch.SeriesCollection.Count
		Set sr = ch.SeriesCollection(srNum)
		If aliasRowNum(srNum) > 0 Then
			thisID = sfaID.Cells(aliasRowNum(srNum), 1).Value

			If applyLines And numInstances(srNum) > 0 And instanceNum(srNum) <= 2 Then
				chartLineRowNum = Application.WorksheetFunction.MinIfs( _
					clRN, _
					clID, thisID, _
					clIN, instanceNum(srNum) _
				)  ' chartLineRowNum
				If chartLineRowNum > 0 Then
					If isChosen Then
						numSeriesNeeded = clNI.Cells(chartLineRowNum, 1).Value + IIf(applyMarkers, 1, 0)
						If clIN.Cells(chartLineRowNum, 1).Value = 1 _
						And numInstances(srNum) < numSeriesNeeded Then
							ErrorTooFewSeries = IIf(Len(ErrorTooFewSeries) > 0, ErrorTooFewSeries & "; ", "") _
								& "'" & thisID & "' needs " & numSeriesNeeded & " but only " _
								& clNI.Cells(chartLineRowNum, 1).Value
						End If  ' Too few

						sr.MarkerStyle = xlMarkerStyleNone
						With sr.Format.Line
							.Style = msoLineSingle
							.Transparency = 0
							.Visible = msoTrue
							.Weight = clt_EW.Cells( _
								Application.WorksheetFunction.Match( _
								clTT.Cells(chartLineRowNum, 1).Value, _
								clt_T, _
								0 _
							), 1).Value
							.ForeColor.RGB = RGB( _
								clR.Cells(chartLineRowNum, 1).Value, _
								clG.Cells(chartLineRowNum, 1).Value, _
								clB.Cells(chartLineRowNum, 1).Value _
							)
						End With  ' sr.Format.Line
					Else
						sr.Format.Line.Visible = msoFalse
					End If  ' isChosen
				Else
					sr.Format.Line.Visible = msoFalse
				End If  ' chartLineRowNum > 0
			End If  ' applyLines  ... And instanceNum(srNum) <= 2

			If applyMarkers And instanceNum(srNum) = Application.WorksheetFunction.Min(numInstances(srNum), 3) Then
				If isChosen Then
					Dim svgPath As String
					svgPath = CMD & thisID & CMS
					If Len(Dir(svgPath)) > 0 Then  ' I.e., if file exists
						' http://stackoverflow.com/questions/74659795/shape-copy-series-paste-without-touching-clipboard
						sr.MarkerStyle = xlMarkerStyleNone
						sr.MarkerBackgroundColor = xlColorIndexAutomatic
						sr.MarkerBackgroundColorIndex = xlColorIndexAutomatic
						sr.Format.Line.Visible = msoTrue
						sr.Format.Line.Weight = 0#
						sr.Format.Line.Transparency = 1
						sr.MarkerSize = 8
						sr.Format.Fill.Visible = msoTrue
						sr.MarkerStyle = xlMarkerStylePicture
						sr.Format.Fill.UserPicture PictureFile:=svgPath
					Else
						If outputLog Then outputRange = "Error: missing file '" & svgPath & "'."
						Exit Sub
					End If  ' Len(Dir(svgPath)) > 0
				Else
					If instanceNum(srNum) >= 3 Then sr.Format.Line.Visible = msoFalse
					sr.MarkerStyle = xlMarkerStyleNone
					If instanceNum(srNum) >= 3 Then sr.Format.Line.Visible = msoFalse
				End If  ' isChosen
			End If  ' applyMarkers ...

		End If  ' aliasRowNum(srNum) > 0
	Next srNum
	ch.Refresh
	If outputLog Then
		If Len(ErrorTooFewSeries) = 0 Then
			outputRange = "Good at " & Format(Now, "HH:MM:SS\ \o\n\ Ddd DD Mmm YYYY")
		Else
			outputRange = "Error, too few of some series: " & ErrorTooFewSeries
		End If  ' Len(ErrorTooFewSeries) = 0
	End If  ' outputLog
End Sub  ' Chart_SeriesFormatStandardised
