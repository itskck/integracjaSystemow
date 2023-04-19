List<String> getHeaders() =>
    ('nazwa producenta; przekątna ekranu; rozdzielczość ekranu; rodzaj powierzchni ekranu; czy ekran jest dotykowy; nazwa procesora; liczba rdzeni fizycznych; prędkość taktowania MHz; wielkość pamięci RAM; pojemność dysku; rodzaj dysku; nazwa układu graficznego; pamięć układu graficznego; nazwa systemu operacyjnego; rodzaj napędu fizycznego w komputerze')
        .split(';');

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }
  return int.tryParse(s) != null;
}
