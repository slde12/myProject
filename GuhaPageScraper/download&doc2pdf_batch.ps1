python .\Scraper.py

#download directory
$documents_path = 'C:\Users\Frango\Desktop\TestFolder\file'

$word_app = New-Object -ComObject Word.Application

Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object {

    $document = $word_app.Documents.Open($_.FullName)

    $pdf_filename = "$($_.DirectoryName)\$($_.BaseName).pdf"

    $document.SaveAs([ref]$pdf_filename, [ref]17)

    $document.Close()
}

$word_app.Quit()

#not necessary, just practise the powershell command
Move-Item *.pdf C:\Users\Frango\Desktop\TestFolder\move

Remove-Item C:\Users\Frango\Desktop\TestFolder\file\*.doc 