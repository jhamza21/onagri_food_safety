import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatefulWidget {
  final String annee;
  final String gouv;
  final RangeValues range;
  BarChart(this.annee, this.gouv, this.range);
  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  var dataKairaouen = [
    new Insecrurity("Kairaouen", "2014", 0.5),
    new Insecrurity("Kairaouen", "2015", 1),
    new Insecrurity("Kairaouen", "2016", 0.35),
    new Insecrurity("Kairaouen", "2017", 0.15),
    new Insecrurity("Kairaouen", "2018", 0.10),
  ];
  var dataBouzid = [
    new Insecrurity("Sidi Bouzid", "2014", 0.6),
    new Insecrurity("Sidi Bouzid", "2015", 0.88),
    new Insecrurity("Sidi Bouzid", "2016", 0.80),
    new Insecrurity("Sidi Bouzid", "2017", 0.30),
    new Insecrurity("Sidi Bouzid", "2018", 0.60),
  ];
  var dataKasserine = [
    new Insecrurity("Kasserine", "2014", 0.18),
    new Insecrurity("Kasserine", "2015", 0.5),
    new Insecrurity("Kasserine", "2016", 0.50),
    new Insecrurity("Kasserine", "2017", 0.34),
    new Insecrurity("Kasserine", "2018", 0.16),
  ];
  List<charts.Series<Insecrurity, String>> _seriesData;
  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _seriesData = List<charts.Series<Insecrurity, String>>();
    filterData();
    generateData();
  }

  filterData() {
    //filter année
    if (widget.annee != "") {
      //kairaouen
      List<Insecrurity> _filtredData = [];
      for (int i = 0; i < dataKairaouen.length; i++) {
        if (dataKairaouen[i].date == widget.annee)
          _filtredData.add(dataKairaouen[i]);
      }
      dataKairaouen = _filtredData;
      //SidiBouzid
      _filtredData = [];
      for (int i = 0; i < dataBouzid.length; i++) {
        if (dataBouzid[i].date == widget.annee) _filtredData.add(dataBouzid[i]);
      }
      dataBouzid = _filtredData;
      //Kasserine
      _filtredData = [];
      for (int i = 0; i < dataKasserine.length; i++) {
        if (dataKasserine[i].date == widget.annee)
          _filtredData.add(dataKasserine[i]);
      }
      dataKasserine = _filtredData;
    }

    //filter gouv
    if (widget.gouv != "") {
      //kairaouen
      List<Insecrurity> _filtredData = [];
      for (int i = 0; i < dataKairaouen.length; i++) {
        if (dataKairaouen[i].gouv == widget.gouv)
          _filtredData.add(dataKairaouen[i]);
      }
      dataKairaouen = _filtredData;
      //SidiBouzid
      _filtredData = [];
      for (int i = 0; i < dataBouzid.length; i++) {
        if (dataBouzid[i].gouv == widget.gouv) _filtredData.add(dataBouzid[i]);
      }
      dataBouzid = _filtredData;
      //Kasserine
      _filtredData = [];
      for (int i = 0; i < dataKasserine.length; i++) {
        if (dataKasserine[i].gouv == widget.gouv)
          _filtredData.add(dataKasserine[i]);
      }
      dataKasserine = _filtredData;
    }

    //filter taux
    if (widget.range.start.toInt() != 1 || widget.range.end.toInt() != 100) {
      List<Insecrurity> _filtredData = [];
      //kairaouen
      for (int i = 0; i < dataKairaouen.length; i++) {
        if (dataKairaouen[i].quantity * 100 >= widget.range.start.toInt() &&
            dataKairaouen[i].quantity * 100 <= widget.range.end.toInt())
          _filtredData.add(dataKairaouen[i]);
      }
      dataKairaouen = _filtredData;
      //SidiBouzid
      _filtredData = [];
      for (int i = 0; i < dataBouzid.length; i++) {
        if (dataBouzid[i].quantity * 100 >= widget.range.start.toInt() &&
            dataBouzid[i].quantity * 100 <= widget.range.end.toInt())
          _filtredData.add(dataBouzid[i]);
      }
      dataBouzid = _filtredData;
      //Kasserine
      _filtredData = [];
      for (int i = 0; i < dataKasserine.length; i++) {
        if (dataKasserine[i].quantity * 100 >= widget.range.start.toInt() &&
            dataKasserine[i].quantity * 100 <= widget.range.end.toInt())
          _filtredData.add(dataKasserine[i]);
      }
      dataKasserine = _filtredData;
    }
  }

  generateData() {
    _seriesData.add(
      charts.Series(
        domainFn: (Insecrurity insecurity, _) => insecurity.date,
        measureFn: (Insecrurity insecurity, _) => insecurity.quantity,
        id: "Kairaouen",
        colorFn: (Insecrurity insecrurity, _) =>
            charts.ColorUtil.fromDartColor(Colors.red[800]),
        data: dataKairaouen,
        fillColorFn: (Insecrurity insecrurity, _) =>
            charts.ColorUtil.fromDartColor(Colors.red[800]),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Insecrurity insecrurity, _) => insecrurity.date,
        measureFn: (Insecrurity insecrurity, _) => insecrurity.quantity,
        id: "Sidi Bouzid",
        colorFn: (Insecrurity insecrurity, _) =>
            charts.ColorUtil.fromDartColor(Colors.green),
        data: dataBouzid,
        fillColorFn: (Insecrurity insecrurity, _) =>
            charts.ColorUtil.fromDartColor(Colors.green),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Insecrurity insecrurity, _) => insecrurity.date,
        measureFn: (Insecrurity insecrurity, _) => insecrurity.quantity,
        id: "Kasserine",
        colorFn: (Insecrurity insecrurity, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
        data: dataKasserine,
        fillColorFn: (Insecrurity insecrurity, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Tendances de la situation d'insécurité alimentaire",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: new charts.BarChart(
                  _seriesData,
                  // animate: true,
                  barGroupingType: charts.BarGroupingType.grouped,
                  behaviors: [
                    // new charts.PercentInjector(
                    //     totalType: charts.PercentInjectorTotalType.domain),
                    new charts.SeriesLegend(
                      position: charts.BehaviorPosition.bottom,
                    )
                  ],
                  // Configure the axis spec to show percentage values.
                  primaryMeasureAxis: new charts.PercentAxisSpec(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Insecrurity {
  String gouv;
  String date;
  double quantity;

  Insecrurity(this.gouv, this.date, this.quantity);
}
