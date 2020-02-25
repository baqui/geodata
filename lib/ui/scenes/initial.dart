import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;

import 'package:geoplugin/geoplugin.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';
import 'package:geodata/locator.dart';
import 'package:geodata/core/db/moor_database.dart';


class InitialView extends StatefulWidget {
  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {


  static void startServiceCallback(List<dynamic> args) {
    setupLocator();
    AppDatabase db = locator<AppDatabase>();
    db.geoPointDao.insertGeoPoint(
      GeoPointsCompanion(createdAt: moor.Value(DateTime.now()), lat: moor.Value(args[0]), lng: moor.Value(args[0]))
    );
  }

  @override
  void initState() {
    super.initState();
    Geoplugin.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Geoplugin.startService(startServiceCallback);
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(fontSize: 20)
                  ),
                  color: Colors.green
                ),
                RaisedButton(
                  onPressed: () {
                    Geoplugin.stopService();
                  },
                  child: Text(
                    'Stop',
                    style: TextStyle(fontSize: 20)
                  ),
                  color: Colors.red
                )
              ],
            ),
            Expanded(child: _buildPointsList(context)),
          ],
        )
      )
    );
  }
}

StreamBuilder<List<GeoPoint>> _buildPointsList(BuildContext context) {
    final AppDatabase db = locator<AppDatabase>();
    return StreamBuilder(
      stream: db.geoPointDao.watchAllGeopoints(),
      builder: (context, AsyncSnapshot<List<GeoPoint>> snapshot) {
        final points = snapshot.data ?? List();

        return ListView.builder(
          itemCount: points.length,
          itemBuilder: (_, index) {
            final point = points[index];
            return Container(
              height: 50,
              color: Colors.amber[600],
              child: Center(child: new Text(point.createdAt.toString())),
            );
          },
        );
      },
    );
  }