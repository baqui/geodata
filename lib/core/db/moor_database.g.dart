// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class GeoPoint extends DataClass implements Insertable<GeoPoint> {
  final int id;
  final DateTime createdAt;
  final double lng;
  final double lat;
  GeoPoint({@required this.id, this.createdAt, this.lng, this.lat});
  factory GeoPoint.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return GeoPoint(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      lng: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lng']),
      lat: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
    );
  }
  factory GeoPoint.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return GeoPoint(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lng: serializer.fromJson<double>(json['lng']),
      lat: serializer.fromJson<double>(json['lat']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lng': serializer.toJson<double>(lng),
      'lat': serializer.toJson<double>(lat),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<GeoPoint>>(bool nullToAbsent) {
    return GeoPointsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
    ) as T;
  }

  GeoPoint copyWith({int id, DateTime createdAt, double lng, double lat}) =>
      GeoPoint(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        lng: lng ?? this.lng,
        lat: lat ?? this.lat,
      );
  @override
  String toString() {
    return (StringBuffer('GeoPoint(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('lng: $lng, ')
          ..write('lat: $lat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(createdAt.hashCode, $mrjc(lng.hashCode, lat.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is GeoPoint &&
          other.id == id &&
          other.createdAt == createdAt &&
          other.lng == lng &&
          other.lat == lat);
}

class GeoPointsCompanion extends UpdateCompanion<GeoPoint> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<double> lng;
  final Value<double> lat;
  const GeoPointsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lng = const Value.absent(),
    this.lat = const Value.absent(),
  });
  GeoPointsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> createdAt,
      Value<double> lng,
      Value<double> lat}) {
    return GeoPointsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      lng: lng ?? this.lng,
      lat: lat ?? this.lat,
    );
  }
}

class $GeoPointsTable extends GeoPoints
    with TableInfo<$GeoPointsTable, GeoPoint> {
  final GeneratedDatabase _db;
  final String _alias;
  $GeoPointsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  GeneratedRealColumn _lng;
  @override
  GeneratedRealColumn get lng => _lng ??= _constructLng();
  GeneratedRealColumn _constructLng() {
    return GeneratedRealColumn(
      'lng',
      $tableName,
      true,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedRealColumn _lat;
  @override
  GeneratedRealColumn get lat => _lat ??= _constructLat();
  GeneratedRealColumn _constructLat() {
    return GeneratedRealColumn(
      'lat',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, createdAt, lng, lat];
  @override
  $GeoPointsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'geo_points';
  @override
  final String actualTableName = 'geo_points';
  @override
  VerificationContext validateIntegrity(GeoPointsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (createdAt.isRequired && isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.lng.present) {
      context.handle(_lngMeta, lng.isAcceptableValue(d.lng.value, _lngMeta));
    } else if (lng.isRequired && isInserting) {
      context.missing(_lngMeta);
    }
    if (d.lat.present) {
      context.handle(_latMeta, lat.isAcceptableValue(d.lat.value, _latMeta));
    } else if (lat.isRequired && isInserting) {
      context.missing(_latMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeoPoint map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GeoPoint.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(GeoPointsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.lng.present) {
      map['lng'] = Variable<double, RealType>(d.lng.value);
    }
    if (d.lat.present) {
      map['lat'] = Variable<double, RealType>(d.lat.value);
    }
    return map;
  }

  @override
  $GeoPointsTable createAlias(String alias) {
    return $GeoPointsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $GeoPointsTable _geoPoints;
  $GeoPointsTable get geoPoints => _geoPoints ??= $GeoPointsTable(this);
  GeoPointDao _geoPointDao;
  GeoPointDao get geoPointDao =>
      _geoPointDao ??= GeoPointDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [geoPoints];
}
