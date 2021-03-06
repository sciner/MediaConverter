VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cFileFind"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long

Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
    Private Const MAX_PATH = 260
    Private Const MAXDWORD = &HFFFF
    Private Const INVALID_HANDLE_VALUE = -1
    Private Const FILE_ATTRIBUTE_READONLY = &H1
    Private Const FILE_ATTRIBUTE_HIDDEN = &H2
    Private Const FILE_ATTRIBUTE_SYSTEM = &H4
    Private Const FILE_ATTRIBUTE_DIRECTORY = &H10
    Private Const FILE_ATTRIBUTE_ARCHIVE = &H20
    Private Const FILE_ATTRIBUTE_ENCRYPTED = &H40
    Private Const FILE_ATTRIBUTE_NORMAL = &H80
    Private Const FILE_ATTRIBUTE_TEMPORARY = &H100
    Private Const FILE_ATTRIBUTE_SPARSE_FILE = &H200
    Private Const FILE_ATTRIBUTE_REPARSE_POINT = &H400
    Private Const FILE_ATTRIBUTE_COMPRESSED = &H800
    Private Const FILE_ATTRIBUTE_OFFLINE = &H1000
    Private Const FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = &H2000
    'own additional Parameter
    Private Const CUSTOM_FILE_ATTRIBUTE_FILE = &H8

Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
    End Type

Private Type WIN32_FIND_DATA
    dwFileAttributes As Long
    ftCreationTime As FILETIME
    ftLastAccessTime As FILETIME
    ftLastWriteTime As FILETIME
    nFileSizeHigh As Long
    nFileSizeLow As Long
    dwReserved0 As Long
    dwReserved1 As Long
    cFileName As String * MAX_PATH
    cAlternate As String * 14
    End Type


Public Enum File_Attribute
    ReadOnly = FILE_ATTRIBUTE_READONLY
    Hidden = FILE_ATTRIBUTE_HIDDEN
    System = FILE_ATTRIBUTE_SYSTEM
    File = CUSTOM_FILE_ATTRIBUTE_FILE
    DIRECTORY = FILE_ATTRIBUTE_DIRECTORY
    Archive = FILE_ATTRIBUTE_ARCHIVE
    Encrypted = FILE_ATTRIBUTE_ENCRYPTED
    Normal = FILE_ATTRIBUTE_NORMAL
    Temporary = FILE_ATTRIBUTE_TEMPORARY
    SparseFile = FILE_ATTRIBUTE_SPARSE_FILE
    ReparsePoint = FILE_ATTRIBUTE_REPARSE_POINT
    Compressed = FILE_ATTRIBUTE_COMPRESSED
    Offline = FILE_ATTRIBUTE_OFFLINE
    NotContentIndexed = FILE_ATTRIBUTE_NOT_CONTENT_INDEXED
End Enum

Event Search(ByVal Path As String)

Private m_Files() As Variant
Private m_FilesCount As Double
Private m_Size As Double

Public Property Get Size()
    Size = m_Size
End Property

Public Property Get Files(ByVal index As Double)
    Files = m_Files(index)
End Property

Public Property Get Count()
    Count = m_FilesCount
End Property

Public Function FindFiles(Path As String, Optional Wildcard As String = "*.*", _
    Optional FindAttribute As File_Attribute = File, _
    Optional SubFolder As Boolean = True)
    Dim WFD As WIN32_FIND_DATA
    Dim sFileTemp As String
    Dim sPathTemp As String
    Dim dSize As Double 'FinalSize
    Dim hSearch As Long 'API FindHandle
    Dim X As Double 'Counter
    Dim lTemp As Long '--
    ' -- TempVariablen for Binärcomparision
    '     of the Flags
    Dim lTemp2 As Long '--
    Dim sf() As String 'SubFolder Array
    Dim sfc As Double 'SubFolder Count
    'Dim ff() As Variant 'FindFinal Array
    Dim ffc As Double 'FindFinal Count
    'detect all Folders
    sfc = 1
    ReDim Preserve sf(1 To sfc)
    sf(sfc) = Path


    If SubFolder = True Then


        Do
            X = X + 1
            sPathTemp = Slash(sf(X))
            hSearch = FindFirstFile(sPathTemp & "*", WFD)


            If hSearch <> INVALID_HANDLE_VALUE Then


                Do
                    sFileTemp = StripNulls(WFD.cFileName)


                    If sFileTemp <> "." And sFileTemp <> ".." Then


                        If WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY Then
                            sfc = sfc + 1
                            ReDim Preserve sf(1 To sfc)
                            sf(sfc) = sPathTemp & sFileTemp
                            RaiseEvent Search(sf(sfc))
                        End If
                    End If
                Loop While FindNextFile(hSearch, WFD)
                FindClose hSearch
            End If
        Loop While X < sfc
    End If
    'pass all Folders


    For X = 1 To sfc
        sPathTemp = Slash(sf(X))
        hSearch = FindFirstFile(sPathTemp & Wildcard, WFD)


        If hSearch <> INVALID_HANDLE_VALUE Then
            'pass all Files and Folders in Current F
            '     older


            Do
                sFileTemp = StripNulls(WFD.cFileName)


                If WFD.dwFileAttributes And File_Attribute.DIRECTORY Then
                Else
                    WFD.dwFileAttributes = WFD.dwFileAttributes Or File_Attribute.File
                End If


                If sFileTemp <> "." And sFileTemp <> ".." Then
                    'move Files in the SearchMask
                    If FindAttribute And File_Attribute.File Then
                        lTemp = WFD.dwFileAttributes And FindAttribute
                        lTemp2 = FindAttribute Or DIRECTORY
                        lTemp2 = lTemp2 Xor File_Attribute.DIRECTORY
                        If lTemp = lTemp2 Then
                            ffc = ffc + 1
                            ReDim Preserve m_Files(1 To ffc)
                            m_Files(ffc) = sPathTemp & sFileTemp
                            dSize = dSize + WFD.nFileSizeLow
                            RaiseEvent Search(m_Files(ffc))
                        End If
                    End If
                    'move Folders in the SearchMask
                    If FindAttribute And File_Attribute.DIRECTORY Then
                        lTemp = WFD.dwFileAttributes And FindAttribute
                        lTemp2 = FindAttribute Or File
                        lTemp2 = lTemp2 Xor File_Attribute.File


                        If lTemp = lTemp2 Then
                            ffc = ffc + 1
                            ReDim Preserve m_Files(1 To ffc)
                            m_Files(ffc) = sPathTemp & sFileTemp
                            dSize = dSize + WFD.nFileSizeLow
                        End If
                    End If
                End If
            Loop While FindNextFile(hSearch, WFD)
            FindClose hSearch
        End If
    Next X
    'Write Output Array ,Counter and FinalSi
    '     ze
    m_FilesCount = ffc
    m_Size = dSize
End Function


Private Function Slash(Path As String) As String


    If Right(Path, 1) <> "\" Then
        Slash = Path & "\"
    Else
        Slash = Path
    End If
End Function


Private Function StripNulls(OriginalStr As String) As String


    If (InStr(OriginalStr, Chr(0)) > 0) Then
        OriginalStr = Left(OriginalStr, InStr(OriginalStr, Chr$(0)) - 1)
    End If
    StripNulls = OriginalStr
End Function
