$documents_path = 'C:\Users\Frango\Desktop\TestFolder\file'

$word_app = New-Object -ComObject Word.Application

Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object {

    $document = $word_app.Documents.Open($_.FullName)

    $pdf_filename = "$($_.DirectoryName)\$($_.BaseName).pdf"

    $document.SaveAs([ref]$pdf_filename, [ref]17)

    $document.Close()
}

$word_app.Quit()