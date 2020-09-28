import 'package:flutter/material.dart';
//import libs
import 'package:charts_flutter/flutter.dart' as charts;
//import apis
import 'package:ludescovid/apis/covid_api.dart';

class TotalPage extends StatefulWidget {
  final Widget child;

  TotalPage({Key key, this.child}) : super(key: key);

  _TotalPageState createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData(var mypiedata) {
    var piedata = mypiedata;

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<int>>(
        future: CovidApi().fetchCovidTotal(),
        builder: (context, snapshot) {
          _seriesPieData = List<charts.Series<Task, String>>();
          List<int> listResult = snapshot.data;
          if (listResult == null) {
            return Center(child: Text('Loading'));
          }
          var mypiedata = [
            new Task('Positif', listResult[0].toDouble(), Colors.yellow),
            new Task('Sembuh', listResult[1].toDouble(), Colors.green),
            new Task('Meninggal', listResult[2].toDouble(), Colors.red),
          ];
          _generateData(mypiedata);
          return charts.PieChart(
            _seriesPieData,
            animate: true,
            animationDuration: Duration(seconds: 1),
            behaviors: [
              new charts.DatumLegend(
                showMeasures: true,
                legendDefaultMeasure: charts.LegendDefaultMeasure.lastValue,
                outsideJustification: charts.OutsideJustification.endDrawArea,
                horizontalFirst: false,
                desiredMaxRows: 2,
                cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.purple.shadeDefault,
                    fontFamily: 'Georgia',
                    fontSize: 11),
              )
            ],
          );
        },
      ),
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
