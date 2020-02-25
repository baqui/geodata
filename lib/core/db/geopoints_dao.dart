import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import './moor_database.dart';

part 'geopoints_dao.g.dart';
// Moor works by source gen. This file will all the generated code.

class GeoPoints extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  DateTimeColumn get createdAt => dateTime().nullable()();

  RealColumn get lng => real().nullable()();

  RealColumn get lat => real().nullable()();
}

// Denote which tables this DAO can access
@UseDao(tables: [GeoPoints])
class GeoPointDao extends DatabaseAccessor<AppDatabase> with _$GeoPointDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  GeoPointDao(this.db) : super(db);

  Future<List<GeoPoint>> getAllGeoPoints() => select(geoPoints).get();
  Stream<List<GeoPoint>> watchAllGeopoints() => select(geoPoints).watch();
  Future insertGeoPoint(GeoPointsCompanion geopoint) => into(geoPoints).insert(geopoint);
  Future updateGeoPoint(GeoPoint geopoint) => update(geoPoints).replace(geopoint);
  Future deleteGeoPoint(GeoPoint geopoint) => delete(geoPoints).delete(geopoint);
}