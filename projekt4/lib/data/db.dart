import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

@DataClassName('Laptop')
class Laptops extends Table {
  TextColumn get manufacturer => text()();
  TextColumn get screenSize => text()();
  TextColumn get resolution => text()();
  TextColumn get screenType => text()();
  TextColumn get touchScreen => text()();
  TextColumn get cpuName => text()();
  IntColumn get cpuCores => integer()();
  IntColumn get cpuSpeed => integer()();
  TextColumn get ram => text()();
  TextColumn get discCapacity => text()();
  TextColumn get discType => text()();
  TextColumn get gpuName => text()();
  TextColumn get gpuVram => text()();
  TextColumn get osName => text()();
  TextColumn get opticalDriveName => text()();
}

extension LaptopExt on Laptop {
  String toStr() =>
      '$manufacturer;$screenSize;$resolution;$screenType;$touchScreen;$cpuName;$cpuCores;$cpuSpeed;$ram;$discCapacity;$discType;$gpuName;$gpuVram;$osName;$opticalDriveName;';
}

@DriftDatabase(tables: [Laptops])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(connect());

  @override
  int get schemaVersion => 1;

  Future<void> clearDatabase() async {
    await delete(laptops).go();
  }

  Future<void> saveLaptop(LaptopsCompanion entry) async {
    await into(laptops).insert(entry);
  }

  Future<List<Laptop>> getLaptops() async {
    final List<Laptop> lapList = await select(laptops).get();
    return lapList;
  }
}

Future<File> get databaseFile async {
  // We use `path_provider` to find a suitable path to store our data in.
  final appDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(appDir.path, 'laps.db');
  return File(dbPath);
}

/// Obtains a database connection for running drift in a Dart VM.
DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    return NativeDatabase.createBackgroundConnection(await databaseFile);
  }));
}
