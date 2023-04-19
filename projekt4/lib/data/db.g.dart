// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $LaptopsTable extends Laptops with TableInfo<$LaptopsTable, Laptop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LaptopsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _manufacturerMeta =
      const VerificationMeta('manufacturer');
  @override
  late final GeneratedColumn<String> manufacturer = GeneratedColumn<String>(
      'manufacturer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _screenSizeMeta =
      const VerificationMeta('screenSize');
  @override
  late final GeneratedColumn<String> screenSize = GeneratedColumn<String>(
      'screen_size', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resolutionMeta =
      const VerificationMeta('resolution');
  @override
  late final GeneratedColumn<String> resolution = GeneratedColumn<String>(
      'resolution', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _screenTypeMeta =
      const VerificationMeta('screenType');
  @override
  late final GeneratedColumn<String> screenType = GeneratedColumn<String>(
      'screen_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _touchScreenMeta =
      const VerificationMeta('touchScreen');
  @override
  late final GeneratedColumn<String> touchScreen = GeneratedColumn<String>(
      'touch_screen', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cpuNameMeta =
      const VerificationMeta('cpuName');
  @override
  late final GeneratedColumn<String> cpuName = GeneratedColumn<String>(
      'cpu_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cpuCoresMeta =
      const VerificationMeta('cpuCores');
  @override
  late final GeneratedColumn<int> cpuCores = GeneratedColumn<int>(
      'cpu_cores', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cpuSpeedMeta =
      const VerificationMeta('cpuSpeed');
  @override
  late final GeneratedColumn<int> cpuSpeed = GeneratedColumn<int>(
      'cpu_speed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ramMeta = const VerificationMeta('ram');
  @override
  late final GeneratedColumn<String> ram = GeneratedColumn<String>(
      'ram', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discCapacityMeta =
      const VerificationMeta('discCapacity');
  @override
  late final GeneratedColumn<String> discCapacity = GeneratedColumn<String>(
      'disc_capacity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discTypeMeta =
      const VerificationMeta('discType');
  @override
  late final GeneratedColumn<String> discType = GeneratedColumn<String>(
      'disc_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gpuNameMeta =
      const VerificationMeta('gpuName');
  @override
  late final GeneratedColumn<String> gpuName = GeneratedColumn<String>(
      'gpu_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gpuVramMeta =
      const VerificationMeta('gpuVram');
  @override
  late final GeneratedColumn<String> gpuVram = GeneratedColumn<String>(
      'gpu_vram', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _osNameMeta = const VerificationMeta('osName');
  @override
  late final GeneratedColumn<String> osName = GeneratedColumn<String>(
      'os_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _opticalDriveNameMeta =
      const VerificationMeta('opticalDriveName');
  @override
  late final GeneratedColumn<String> opticalDriveName = GeneratedColumn<String>(
      'optical_drive_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        manufacturer,
        screenSize,
        resolution,
        screenType,
        touchScreen,
        cpuName,
        cpuCores,
        cpuSpeed,
        ram,
        discCapacity,
        discType,
        gpuName,
        gpuVram,
        osName,
        opticalDriveName
      ];
  @override
  String get aliasedName => _alias ?? 'laptops';
  @override
  String get actualTableName => 'laptops';
  @override
  VerificationContext validateIntegrity(Insertable<Laptop> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('manufacturer')) {
      context.handle(
          _manufacturerMeta,
          manufacturer.isAcceptableOrUnknown(
              data['manufacturer']!, _manufacturerMeta));
    } else if (isInserting) {
      context.missing(_manufacturerMeta);
    }
    if (data.containsKey('screen_size')) {
      context.handle(
          _screenSizeMeta,
          screenSize.isAcceptableOrUnknown(
              data['screen_size']!, _screenSizeMeta));
    } else if (isInserting) {
      context.missing(_screenSizeMeta);
    }
    if (data.containsKey('resolution')) {
      context.handle(
          _resolutionMeta,
          resolution.isAcceptableOrUnknown(
              data['resolution']!, _resolutionMeta));
    } else if (isInserting) {
      context.missing(_resolutionMeta);
    }
    if (data.containsKey('screen_type')) {
      context.handle(
          _screenTypeMeta,
          screenType.isAcceptableOrUnknown(
              data['screen_type']!, _screenTypeMeta));
    } else if (isInserting) {
      context.missing(_screenTypeMeta);
    }
    if (data.containsKey('touch_screen')) {
      context.handle(
          _touchScreenMeta,
          touchScreen.isAcceptableOrUnknown(
              data['touch_screen']!, _touchScreenMeta));
    } else if (isInserting) {
      context.missing(_touchScreenMeta);
    }
    if (data.containsKey('cpu_name')) {
      context.handle(_cpuNameMeta,
          cpuName.isAcceptableOrUnknown(data['cpu_name']!, _cpuNameMeta));
    } else if (isInserting) {
      context.missing(_cpuNameMeta);
    }
    if (data.containsKey('cpu_cores')) {
      context.handle(_cpuCoresMeta,
          cpuCores.isAcceptableOrUnknown(data['cpu_cores']!, _cpuCoresMeta));
    } else if (isInserting) {
      context.missing(_cpuCoresMeta);
    }
    if (data.containsKey('cpu_speed')) {
      context.handle(_cpuSpeedMeta,
          cpuSpeed.isAcceptableOrUnknown(data['cpu_speed']!, _cpuSpeedMeta));
    } else if (isInserting) {
      context.missing(_cpuSpeedMeta);
    }
    if (data.containsKey('ram')) {
      context.handle(
          _ramMeta, ram.isAcceptableOrUnknown(data['ram']!, _ramMeta));
    } else if (isInserting) {
      context.missing(_ramMeta);
    }
    if (data.containsKey('disc_capacity')) {
      context.handle(
          _discCapacityMeta,
          discCapacity.isAcceptableOrUnknown(
              data['disc_capacity']!, _discCapacityMeta));
    } else if (isInserting) {
      context.missing(_discCapacityMeta);
    }
    if (data.containsKey('disc_type')) {
      context.handle(_discTypeMeta,
          discType.isAcceptableOrUnknown(data['disc_type']!, _discTypeMeta));
    } else if (isInserting) {
      context.missing(_discTypeMeta);
    }
    if (data.containsKey('gpu_name')) {
      context.handle(_gpuNameMeta,
          gpuName.isAcceptableOrUnknown(data['gpu_name']!, _gpuNameMeta));
    } else if (isInserting) {
      context.missing(_gpuNameMeta);
    }
    if (data.containsKey('gpu_vram')) {
      context.handle(_gpuVramMeta,
          gpuVram.isAcceptableOrUnknown(data['gpu_vram']!, _gpuVramMeta));
    } else if (isInserting) {
      context.missing(_gpuVramMeta);
    }
    if (data.containsKey('os_name')) {
      context.handle(_osNameMeta,
          osName.isAcceptableOrUnknown(data['os_name']!, _osNameMeta));
    } else if (isInserting) {
      context.missing(_osNameMeta);
    }
    if (data.containsKey('optical_drive_name')) {
      context.handle(
          _opticalDriveNameMeta,
          opticalDriveName.isAcceptableOrUnknown(
              data['optical_drive_name']!, _opticalDriveNameMeta));
    } else if (isInserting) {
      context.missing(_opticalDriveNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Laptop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Laptop(
      manufacturer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}manufacturer'])!,
      screenSize: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}screen_size'])!,
      resolution: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resolution'])!,
      screenType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}screen_type'])!,
      touchScreen: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}touch_screen'])!,
      cpuName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cpu_name'])!,
      cpuCores: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cpu_cores'])!,
      cpuSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cpu_speed'])!,
      ram: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ram'])!,
      discCapacity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}disc_capacity'])!,
      discType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}disc_type'])!,
      gpuName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gpu_name'])!,
      gpuVram: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gpu_vram'])!,
      osName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}os_name'])!,
      opticalDriveName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}optical_drive_name'])!,
    );
  }

  @override
  $LaptopsTable createAlias(String alias) {
    return $LaptopsTable(attachedDatabase, alias);
  }
}

class Laptop extends DataClass implements Insertable<Laptop> {
  final String manufacturer;
  final String screenSize;
  final String resolution;
  final String screenType;
  final String touchScreen;
  final String cpuName;
  final int cpuCores;
  final int cpuSpeed;
  final String ram;
  final String discCapacity;
  final String discType;
  final String gpuName;
  final String gpuVram;
  final String osName;
  final String opticalDriveName;
  const Laptop(
      {required this.manufacturer,
      required this.screenSize,
      required this.resolution,
      required this.screenType,
      required this.touchScreen,
      required this.cpuName,
      required this.cpuCores,
      required this.cpuSpeed,
      required this.ram,
      required this.discCapacity,
      required this.discType,
      required this.gpuName,
      required this.gpuVram,
      required this.osName,
      required this.opticalDriveName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['manufacturer'] = Variable<String>(manufacturer);
    map['screen_size'] = Variable<String>(screenSize);
    map['resolution'] = Variable<String>(resolution);
    map['screen_type'] = Variable<String>(screenType);
    map['touch_screen'] = Variable<String>(touchScreen);
    map['cpu_name'] = Variable<String>(cpuName);
    map['cpu_cores'] = Variable<int>(cpuCores);
    map['cpu_speed'] = Variable<int>(cpuSpeed);
    map['ram'] = Variable<String>(ram);
    map['disc_capacity'] = Variable<String>(discCapacity);
    map['disc_type'] = Variable<String>(discType);
    map['gpu_name'] = Variable<String>(gpuName);
    map['gpu_vram'] = Variable<String>(gpuVram);
    map['os_name'] = Variable<String>(osName);
    map['optical_drive_name'] = Variable<String>(opticalDriveName);
    return map;
  }

  LaptopsCompanion toCompanion(bool nullToAbsent) {
    return LaptopsCompanion(
      manufacturer: Value(manufacturer),
      screenSize: Value(screenSize),
      resolution: Value(resolution),
      screenType: Value(screenType),
      touchScreen: Value(touchScreen),
      cpuName: Value(cpuName),
      cpuCores: Value(cpuCores),
      cpuSpeed: Value(cpuSpeed),
      ram: Value(ram),
      discCapacity: Value(discCapacity),
      discType: Value(discType),
      gpuName: Value(gpuName),
      gpuVram: Value(gpuVram),
      osName: Value(osName),
      opticalDriveName: Value(opticalDriveName),
    );
  }

  factory Laptop.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Laptop(
      manufacturer: serializer.fromJson<String>(json['manufacturer']),
      screenSize: serializer.fromJson<String>(json['screenSize']),
      resolution: serializer.fromJson<String>(json['resolution']),
      screenType: serializer.fromJson<String>(json['screenType']),
      touchScreen: serializer.fromJson<String>(json['touchScreen']),
      cpuName: serializer.fromJson<String>(json['cpuName']),
      cpuCores: serializer.fromJson<int>(json['cpuCores']),
      cpuSpeed: serializer.fromJson<int>(json['cpuSpeed']),
      ram: serializer.fromJson<String>(json['ram']),
      discCapacity: serializer.fromJson<String>(json['discCapacity']),
      discType: serializer.fromJson<String>(json['discType']),
      gpuName: serializer.fromJson<String>(json['gpuName']),
      gpuVram: serializer.fromJson<String>(json['gpuVram']),
      osName: serializer.fromJson<String>(json['osName']),
      opticalDriveName: serializer.fromJson<String>(json['opticalDriveName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'manufacturer': serializer.toJson<String>(manufacturer),
      'screenSize': serializer.toJson<String>(screenSize),
      'resolution': serializer.toJson<String>(resolution),
      'screenType': serializer.toJson<String>(screenType),
      'touchScreen': serializer.toJson<String>(touchScreen),
      'cpuName': serializer.toJson<String>(cpuName),
      'cpuCores': serializer.toJson<int>(cpuCores),
      'cpuSpeed': serializer.toJson<int>(cpuSpeed),
      'ram': serializer.toJson<String>(ram),
      'discCapacity': serializer.toJson<String>(discCapacity),
      'discType': serializer.toJson<String>(discType),
      'gpuName': serializer.toJson<String>(gpuName),
      'gpuVram': serializer.toJson<String>(gpuVram),
      'osName': serializer.toJson<String>(osName),
      'opticalDriveName': serializer.toJson<String>(opticalDriveName),
    };
  }

  Laptop copyWith(
          {String? manufacturer,
          String? screenSize,
          String? resolution,
          String? screenType,
          String? touchScreen,
          String? cpuName,
          int? cpuCores,
          int? cpuSpeed,
          String? ram,
          String? discCapacity,
          String? discType,
          String? gpuName,
          String? gpuVram,
          String? osName,
          String? opticalDriveName}) =>
      Laptop(
        manufacturer: manufacturer ?? this.manufacturer,
        screenSize: screenSize ?? this.screenSize,
        resolution: resolution ?? this.resolution,
        screenType: screenType ?? this.screenType,
        touchScreen: touchScreen ?? this.touchScreen,
        cpuName: cpuName ?? this.cpuName,
        cpuCores: cpuCores ?? this.cpuCores,
        cpuSpeed: cpuSpeed ?? this.cpuSpeed,
        ram: ram ?? this.ram,
        discCapacity: discCapacity ?? this.discCapacity,
        discType: discType ?? this.discType,
        gpuName: gpuName ?? this.gpuName,
        gpuVram: gpuVram ?? this.gpuVram,
        osName: osName ?? this.osName,
        opticalDriveName: opticalDriveName ?? this.opticalDriveName,
      );
  @override
  String toString() {
    return (StringBuffer('Laptop(')
          ..write('manufacturer: $manufacturer, ')
          ..write('screenSize: $screenSize, ')
          ..write('resolution: $resolution, ')
          ..write('screenType: $screenType, ')
          ..write('touchScreen: $touchScreen, ')
          ..write('cpuName: $cpuName, ')
          ..write('cpuCores: $cpuCores, ')
          ..write('cpuSpeed: $cpuSpeed, ')
          ..write('ram: $ram, ')
          ..write('discCapacity: $discCapacity, ')
          ..write('discType: $discType, ')
          ..write('gpuName: $gpuName, ')
          ..write('gpuVram: $gpuVram, ')
          ..write('osName: $osName, ')
          ..write('opticalDriveName: $opticalDriveName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      manufacturer,
      screenSize,
      resolution,
      screenType,
      touchScreen,
      cpuName,
      cpuCores,
      cpuSpeed,
      ram,
      discCapacity,
      discType,
      gpuName,
      gpuVram,
      osName,
      opticalDriveName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Laptop &&
          other.manufacturer == this.manufacturer &&
          other.screenSize == this.screenSize &&
          other.resolution == this.resolution &&
          other.screenType == this.screenType &&
          other.touchScreen == this.touchScreen &&
          other.cpuName == this.cpuName &&
          other.cpuCores == this.cpuCores &&
          other.cpuSpeed == this.cpuSpeed &&
          other.ram == this.ram &&
          other.discCapacity == this.discCapacity &&
          other.discType == this.discType &&
          other.gpuName == this.gpuName &&
          other.gpuVram == this.gpuVram &&
          other.osName == this.osName &&
          other.opticalDriveName == this.opticalDriveName);
}

class LaptopsCompanion extends UpdateCompanion<Laptop> {
  final Value<String> manufacturer;
  final Value<String> screenSize;
  final Value<String> resolution;
  final Value<String> screenType;
  final Value<String> touchScreen;
  final Value<String> cpuName;
  final Value<int> cpuCores;
  final Value<int> cpuSpeed;
  final Value<String> ram;
  final Value<String> discCapacity;
  final Value<String> discType;
  final Value<String> gpuName;
  final Value<String> gpuVram;
  final Value<String> osName;
  final Value<String> opticalDriveName;
  final Value<int> rowid;
  const LaptopsCompanion({
    this.manufacturer = const Value.absent(),
    this.screenSize = const Value.absent(),
    this.resolution = const Value.absent(),
    this.screenType = const Value.absent(),
    this.touchScreen = const Value.absent(),
    this.cpuName = const Value.absent(),
    this.cpuCores = const Value.absent(),
    this.cpuSpeed = const Value.absent(),
    this.ram = const Value.absent(),
    this.discCapacity = const Value.absent(),
    this.discType = const Value.absent(),
    this.gpuName = const Value.absent(),
    this.gpuVram = const Value.absent(),
    this.osName = const Value.absent(),
    this.opticalDriveName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LaptopsCompanion.insert({
    required String manufacturer,
    required String screenSize,
    required String resolution,
    required String screenType,
    required String touchScreen,
    required String cpuName,
    required int cpuCores,
    required int cpuSpeed,
    required String ram,
    required String discCapacity,
    required String discType,
    required String gpuName,
    required String gpuVram,
    required String osName,
    required String opticalDriveName,
    this.rowid = const Value.absent(),
  })  : manufacturer = Value(manufacturer),
        screenSize = Value(screenSize),
        resolution = Value(resolution),
        screenType = Value(screenType),
        touchScreen = Value(touchScreen),
        cpuName = Value(cpuName),
        cpuCores = Value(cpuCores),
        cpuSpeed = Value(cpuSpeed),
        ram = Value(ram),
        discCapacity = Value(discCapacity),
        discType = Value(discType),
        gpuName = Value(gpuName),
        gpuVram = Value(gpuVram),
        osName = Value(osName),
        opticalDriveName = Value(opticalDriveName);
  static Insertable<Laptop> custom({
    Expression<String>? manufacturer,
    Expression<String>? screenSize,
    Expression<String>? resolution,
    Expression<String>? screenType,
    Expression<String>? touchScreen,
    Expression<String>? cpuName,
    Expression<int>? cpuCores,
    Expression<int>? cpuSpeed,
    Expression<String>? ram,
    Expression<String>? discCapacity,
    Expression<String>? discType,
    Expression<String>? gpuName,
    Expression<String>? gpuVram,
    Expression<String>? osName,
    Expression<String>? opticalDriveName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (screenSize != null) 'screen_size': screenSize,
      if (resolution != null) 'resolution': resolution,
      if (screenType != null) 'screen_type': screenType,
      if (touchScreen != null) 'touch_screen': touchScreen,
      if (cpuName != null) 'cpu_name': cpuName,
      if (cpuCores != null) 'cpu_cores': cpuCores,
      if (cpuSpeed != null) 'cpu_speed': cpuSpeed,
      if (ram != null) 'ram': ram,
      if (discCapacity != null) 'disc_capacity': discCapacity,
      if (discType != null) 'disc_type': discType,
      if (gpuName != null) 'gpu_name': gpuName,
      if (gpuVram != null) 'gpu_vram': gpuVram,
      if (osName != null) 'os_name': osName,
      if (opticalDriveName != null) 'optical_drive_name': opticalDriveName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LaptopsCompanion copyWith(
      {Value<String>? manufacturer,
      Value<String>? screenSize,
      Value<String>? resolution,
      Value<String>? screenType,
      Value<String>? touchScreen,
      Value<String>? cpuName,
      Value<int>? cpuCores,
      Value<int>? cpuSpeed,
      Value<String>? ram,
      Value<String>? discCapacity,
      Value<String>? discType,
      Value<String>? gpuName,
      Value<String>? gpuVram,
      Value<String>? osName,
      Value<String>? opticalDriveName,
      Value<int>? rowid}) {
    return LaptopsCompanion(
      manufacturer: manufacturer ?? this.manufacturer,
      screenSize: screenSize ?? this.screenSize,
      resolution: resolution ?? this.resolution,
      screenType: screenType ?? this.screenType,
      touchScreen: touchScreen ?? this.touchScreen,
      cpuName: cpuName ?? this.cpuName,
      cpuCores: cpuCores ?? this.cpuCores,
      cpuSpeed: cpuSpeed ?? this.cpuSpeed,
      ram: ram ?? this.ram,
      discCapacity: discCapacity ?? this.discCapacity,
      discType: discType ?? this.discType,
      gpuName: gpuName ?? this.gpuName,
      gpuVram: gpuVram ?? this.gpuVram,
      osName: osName ?? this.osName,
      opticalDriveName: opticalDriveName ?? this.opticalDriveName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (manufacturer.present) {
      map['manufacturer'] = Variable<String>(manufacturer.value);
    }
    if (screenSize.present) {
      map['screen_size'] = Variable<String>(screenSize.value);
    }
    if (resolution.present) {
      map['resolution'] = Variable<String>(resolution.value);
    }
    if (screenType.present) {
      map['screen_type'] = Variable<String>(screenType.value);
    }
    if (touchScreen.present) {
      map['touch_screen'] = Variable<String>(touchScreen.value);
    }
    if (cpuName.present) {
      map['cpu_name'] = Variable<String>(cpuName.value);
    }
    if (cpuCores.present) {
      map['cpu_cores'] = Variable<int>(cpuCores.value);
    }
    if (cpuSpeed.present) {
      map['cpu_speed'] = Variable<int>(cpuSpeed.value);
    }
    if (ram.present) {
      map['ram'] = Variable<String>(ram.value);
    }
    if (discCapacity.present) {
      map['disc_capacity'] = Variable<String>(discCapacity.value);
    }
    if (discType.present) {
      map['disc_type'] = Variable<String>(discType.value);
    }
    if (gpuName.present) {
      map['gpu_name'] = Variable<String>(gpuName.value);
    }
    if (gpuVram.present) {
      map['gpu_vram'] = Variable<String>(gpuVram.value);
    }
    if (osName.present) {
      map['os_name'] = Variable<String>(osName.value);
    }
    if (opticalDriveName.present) {
      map['optical_drive_name'] = Variable<String>(opticalDriveName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LaptopsCompanion(')
          ..write('manufacturer: $manufacturer, ')
          ..write('screenSize: $screenSize, ')
          ..write('resolution: $resolution, ')
          ..write('screenType: $screenType, ')
          ..write('touchScreen: $touchScreen, ')
          ..write('cpuName: $cpuName, ')
          ..write('cpuCores: $cpuCores, ')
          ..write('cpuSpeed: $cpuSpeed, ')
          ..write('ram: $ram, ')
          ..write('discCapacity: $discCapacity, ')
          ..write('discType: $discType, ')
          ..write('gpuName: $gpuName, ')
          ..write('gpuVram: $gpuVram, ')
          ..write('osName: $osName, ')
          ..write('opticalDriveName: $opticalDriveName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $LaptopsTable laptops = $LaptopsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [laptops];
}
