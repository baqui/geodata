import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import './geopoints_dao.dart';

// Moor works by source gen. This file will all the generated code.
part 'moor_database.g.dart';

@UseMoor(tables: [GeoPoints], daos: [GeoPointDao])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;
}