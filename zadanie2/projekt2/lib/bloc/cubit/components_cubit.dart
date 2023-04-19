import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projekt2/bloc/cubit/components_state.dart';
import 'package:xml/xml.dart';

class ComponentsCubit extends Cubit<ComponentsState> {
  ComponentsCubit() : super(const ComponentsState.initial());

  Future<void> loadData() async {
    try {
      emit(const ComponentsState.loading());
      final File file = File('katalog.txt');
      final lines = file.readAsLinesSync();

      List<TextEditingController> controllers = [];
      for (var line in lines) {
        if (!line.contains(';')) {
          throw Exception();
        }
        var tab = line.split(';')..removeLast();

        for (var c in tab) {
          controllers.add(
            TextEditingController(
                text: c.trim().isNotEmpty ? c : 'brak danych'),
          );
        }
      }

      emit(ComponentsState.loaded(
        componentsList: lines,
        controllers: controllers,
      ));
    } catch (error) {
      log('Error while loading data');
      emit(const ComponentsState.initial());
    }
  }

  Future<void> saveData() async {
    try {
      final File file = File('katalog.txt');
      String s = '';
      file.openWrite();
      state.mapOrNull(loaded: (value) {
        for (var c in value.controllers) {
          s += c.text;
          s += ';';
          if ((value.controllers.indexOf(c) + 1) % 15 == 0) {
            s += '\n';
          }
        }
        file.writeAsString(s);
      });
    } catch (error) {
      log('Error while saving data');
      emit(const ComponentsState.initial());
    }
  }

  Future<void> saveAsXml() async {
    try {
      final File xmlFile = File('katalog.xml');
      xmlFile.openWrite();
      await xmlFile.writeAsString(
        '<laptops moddate="${DateTime.now().toIso8601String()}">\n',
      );
      List<String> rows = [];
      String s = '';

      state.mapOrNull(loaded: (value) {
        for (var c in value.controllers) {
          s += c.text;
          s += ';';
          if ((value.controllers.indexOf(c) + 1) % 15 == 0) {
            rows.add(s);
            s = '';
          }
        }
      });
      int index = 1;
      for (var row in rows) {
        final List<String> laptopData = row.split(';');
        await xmlFile.writeAsString(
          ' <laptop id="$index">\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '   <manufacturer>${laptopData[0]}</manufacturer>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '   <screen touch="${laptopData[4]}">\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    <size>${laptopData[1]}</size>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    <resolution>${laptopData[2]}</resolution>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    <type>${laptopData[3]}</type>\n',
          mode: FileMode.writeOnlyAppend,
        );

        await xmlFile.writeAsString(
          '   </screen>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '   <procesor>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '     <name>${laptopData[5]}</name>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '     <physical_cores>${laptopData[6]}</physical_cores>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '     <clock_speed>${laptopData[7]}</clock_speed>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '   </procesor>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '   <ram>${laptopData[8]}</ram>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    <disc type="${laptopData[10]}">\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '     <storage>${laptopData[9]}</storage>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    </disc>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    <graphic_card>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '      <name>${laptopData[11]}</name>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '      <memory>${laptopData[12]}</memory>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    </graphic_card>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    <os>${laptopData[13]}</os>\n',
          mode: FileMode.writeOnlyAppend,
        );
        await xmlFile.writeAsString(
          '    <disc_reader>${laptopData[14]}</disc_reader>\n',
          mode: FileMode.writeOnlyAppend,
        );
        index++;
        await xmlFile.writeAsString(
          ' </laptop>\n',
          mode: FileMode.writeOnlyAppend,
        );
      }

      await xmlFile.writeAsString('</laptops>', mode: FileMode.writeOnlyAppend);
    } catch (error) {
      log('Error while saving to xml');
      emit(const ComponentsState.initial());
    }
  }

  Future<void> loadFromXML() async {
    try {
      emit(const ComponentsState.loading());
      final File file = File('katalog.xml');
      final String content = file.readAsStringSync();
      final XmlDocument doc = XmlDocument.parse(content);
      final laptopsNode = doc.findAllElements('laptop').toList();

      List<TextEditingController> controllers = [];
      List<String> lines = [];

      for (var laptop in laptopsNode) {
        String s = '';
        s += laptop.findElements('manufacturer').first.text;
        s += ';';
        s += laptop.findAllElements('size').first.text;
        s += ';';
        s += laptop.findAllElements('resolution').first.text;
        s += ';';
        s += laptop.findAllElements('type').first.text;
        s += ';';
        s += laptop.findAllElements('screen').first.getAttribute('touch')!;
        s += ';';
        s += laptop.findAllElements('procesor').first.getElement('name')!.text;
        s += ';';
        s += laptop.findAllElements('physical_cores').first.text;
        s += ';';
        s += laptop.findAllElements('clock_speed').first.text;
        s += ';';
        s += laptop.findAllElements('ram').first.text;
        s += ';';
        s += laptop.findAllElements('storage').first.text;
        s += ';';
        s += laptop.findAllElements('disc').first.getAttribute('type')!;
        s += ';';
        s += laptop
            .findAllElements('graphic_card')
            .first
            .getElement('name')!
            .text;
        s += ';';
        s += laptop.findAllElements('memory').first.text;
        s += ';';
        s += laptop.findAllElements('os').first.text;
        s += ';';
        s += laptop.findAllElements('disc_reader').first.text;
        s += ';';

        lines.add(s);
      }

      for (var line in lines) {
        if (!line.contains(';')) {
          throw Exception();
        }
        var tab = line.split(';')..removeLast();

        for (var c in tab) {
          controllers.add(
            TextEditingController(
                text: c.trim().isNotEmpty ? c : 'brak danych'),
          );
        }
      }

      emit(ComponentsState.loaded(
        componentsList: lines,
        controllers: controllers,
      ));
    } catch (error) {
      log('Error while loading data', error: error);
      emit(const ComponentsState.initial());
    }
  }
}
