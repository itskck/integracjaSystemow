import 'dart:io';
import 'dart:convert';
import 'package:dolumns/dolumns.dart';

Future<void> main(List<String> arguments) async {
  final File content = File('katalog.txt');
  final File headersFile = File('headers.txt');

  final List<String> headers = (await headersFile.readAsString()).split(';');
  final Stream<String> stream =
      content.openRead().transform(utf8.decoder).transform(LineSplitter());
  final List<List<String>> columns = [];
  final Map<String, int> companies = {};

  headers.insert(0, ' ');
  columns.add(headers);
  int i = 1;

  await for (var line in stream) {
    List<String> components = line.split(';');
    components.removeLast();
    components.insert(0, i.toString());

    final String companyName = components[1];

    companies.update(
      companyName,
      (value) => value + 1,
      ifAbsent: () => 1,
    );

    i++;

    for (var component in components) {
      if (component.trim().isEmpty) {
        components[components.indexOf(component)] = 'brak';
      }
    }
    columns.add(components);
  }

  final columnsToPrint = dolumnify(
    columns,
    columnSplitter: '|',
    headerIncluded: true,
    headerSeparator: '_',
  );
  print(columnsToPrint);

  print('Liczba laptopów poszczególnych firm:');
  for (var map in companies.entries) {
    print('${map.key} : ${map.value}');
  }
  exit(0);
}
