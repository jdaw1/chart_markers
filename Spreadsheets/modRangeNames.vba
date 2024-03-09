Option Explicit

' To go in module 'modRangeNames'
' Source: https://github.com/jdaw1/chart_markers



Sub RangeNames_DeleteRef()
	Dim n As Name, s As String, i As Integer
	i = 0
	For Each n In ActiveWorkbook.Names
		If Left(n.RefersTo, 6) = "=#REF!" Or Right(n.RefersTo, 6) = "!#REF!" Then s = n.Name: i = i + 1: n.Delete
	Next n
	If i = 0 Then MsgBox "All " & ActiveWorkbook.Names.Count & " names are good: none deleted."
	If i = 1 Then MsgBox "One name deleted, that being " & s & " (" & ActiveWorkbook.Names.Count & " names remain)."
	If i > 1 Then MsgBox i & " names deleted, including " & s & " (" & ActiveWorkbook.Names.Count & " names remain)."
End Sub  ' RangeNames_DeleteRef


Sub RangeNames_DeleteBeginningWith()
	Dim n As Name, nameStart As String, s As String, i As Integer

	nameStart = InputBox( _
		prompt:="Delete all range names beginning with what string? ", _
		Title:="Starting characters of range names to be deleted", Default:="")

	If Len(nameStart) = 0 Then Exit Sub

	i = 0
	For Each n In ActiveWorkbook.Names
		If 0 = StrComp(Left(n.Name, Len(nameStart)), nameStart, 0) Then s = n.Name: i = i + 1: n.Delete
	Next n
	If i = 0 Then MsgBox "No names deleted."
	If i = 1 Then MsgBox "One name deleted, that being " & s & "."
	If i > 1 Then MsgBox i & " names deleted, including " & s & "."
End Sub  ' RangeNames_DeleteBeginningWith


Sub RangeNames_DeleteContaining()
	Dim n As Name, NameContains As String, s As String, i As Integer

	NameContains = InputBox( _
		prompt:="Delete all range names beginning with what string? ", _
		Title:="Starting characters of range names to be deleted", Default:="")

	If Len(NameContains) = 0 Then Exit Sub

	i = 0
	For Each n In ActiveWorkbook.Names
		If InStr(1, n.Name, NameContains, vbBinaryCompare) > 0 Then s = n.Name: i = i + 1: n.Delete
	Next n
	If i = 0 Then MsgBox "No names deleted."
	If i = 1 Then MsgBox "One name deleted, that being " & s & "."
	If i > 1 Then MsgBox i & " names deleted, including " & s & "."
End Sub  ' RangeNames_DeleteContaining



Sub RangeNames_DeDuplicate()
	Dim nm As Name, nms As Variant, exists As Variant, i As Integer, j As Integer, str As String, ans As Integer
	Set nms = ActiveWorkbook.Names
	For Each nm In ActiveWorkbook.Names
		If Left( nm.RefersTo, 6) = "=#REF!" _
		Or Right(nm.RefersTo, 6) = "!#REF!" _
		Or Right(nm.RefersTo, 7) = "!#REF!#" Then 
			nm.Delete
		End If  ' #REF!
	Next nm

	ReDim nms(1 To ActiveWorkbook.Names.Count) As Name, exists(1 To ActiveWorkbook.Names.Count) As Boolean
	For i = 1 To UBound(exists)
		Set nms(i) = ActiveWorkbook.Names(i)
		exists(i) = True
	Next i

	For i = 2 To UBound(nms)
		If exists(i) Then
			If nms(i).Visible Then
				For j = 1 To i - 1
					If exists(j) Then
						If nms(j).Visible Then
							If nms(i) = nms(j) Then
								On Error Resume Next
								nms(i).RefersToRange.Parent.Activate
								nms(i).RefersToRange.Select
								On Error GoTo 0
								str = "Yes = delete " & nms(i).Name & ";" _
									& Chr(10) & "No = delete " & nms(j).Name & ";" _
									& Chr(10) & "Cancel = keep both."
								ans = MsgBox(str, 3, "Duplicate name. Delete either?")
								If ans = 6 Then  ' Yes
									nms(i).Delete: exists(i) = False: Exit For
								ElseIf ans = 7 Then  ' No
									nms(j).Delete: exists(j) = False
								End If  ' ans = 6
							End If  ' Duplicate?
						End If  ' nms(j).Visible
					End If  ' exists(j)
				Next j
			End If  ' nms(i).Visible
		End If  ' exists(i)
	Next i
End Sub  ' RangeNames_DeDuplicate
