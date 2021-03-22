import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onagri/views/map.dart';

class Indicators extends StatefulWidget {
  @override
  _IndicatorsState createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators> {
  List<charts.Series<Insecrurity, String>> _seriesData;
  List<charts.Series<Exportation, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Insecrurity("Dec'14", 33),
      new Insecrurity("Dec'15", 26),
      new Insecrurity("Dec'16", 35),
    ];
    var data2 = [
      new Insecrurity("Dec'14", 6),
      new Insecrurity("Dec'15", 5),
      new Insecrurity("Dec'16", 8),
    ];

    var piedata = [
      new Exportation("Huile d'olive vierge lampante et ses fractions", 2.0,
          Color(0xff3366cc)),
      new Exportation("Huile d'olive vierge extra et ses fractions", 2.1,
          Color(0xff990099)),
      new Exportation(
          "Huile d'olive vierge extra et ses fractions (entre 1 et 5 litres)",
          0.3,
          Color(0xff109618)),
      new Exportation("Huile d'olive vierge extra et ses fractions (en vrac)",
          14.8, Color(0xfffdbe19)),
      new Exportation(
          "Huile d'olive vierge et ses fractions", 0.6, Color(0xffff9900)),
      new Exportation("Autres huile d'olive vierge et ses fractions (en vrac)",
          0.2, Color(0xffdc3912)),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Insecrurity insecurity, _) => insecurity.date,
        measureFn: (Insecrurity insecurity, _) => insecurity.quantity,
        id: "Insécurité sévere",
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Insecrurity insecrurity, _) =>
            charts.ColorUtil.fromDartColor(Colors.red[800]),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Insecrurity insecrurity, _) => insecrurity.date,
        measureFn: (Insecrurity insecrurity, _) => insecrurity.quantity,
        id: "Insécurité modérée",
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Insecrurity insecrurity, _) =>
            charts.ColorUtil.fromDartColor(Colors.red[400]),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Exportation exportation, _) => exportation.name,
        measureFn: (Exportation exportation, _) => exportation.value,
        colorFn: (Exportation exportation, _) =>
            charts.ColorUtil.fromDartColor(exportation.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Exportation row, _) => '${row.value}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _seriesData = List<charts.Series<Insecrurity, String>>();
    // ignore: deprecated_member_use
    _seriesPieData = List<charts.Series<Exportation, String>>();
    // ignore: deprecated_member_use
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff336633),
          //backgroundColor: Color(0xff308e1c),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
              Tab(icon: Icon(FontAwesomeIcons.chartPie)),
              Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              Tab(icon: Icon(FontAwesomeIcons.map)),
            ],
          ),
          title: Text('Indicators'),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Tendances de la situation d'insécurité alimentaire",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: charts.BarChart(
                          _seriesData,
                          animate: true,
                          barGroupingType: charts.BarGroupingType.grouped,
                          //behaviors: [new charts.SeriesLegend()],
                          animationDuration: Duration(seconds: 5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Evolution des quantités exportées de l'huile d'olive tunisienne au cours du mois de novembre 2020",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child: charts.PieChart(_seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
                              new charts.DatumLegend(
                                outsideJustification:
                                    charts.OutsideJustification.endDrawArea,
                                horizontalFirst: false,
                                cellPadding: new EdgeInsets.only(
                                    right: 4.0, bottom: 4.0),
                                entryTextStyle: charts.TextStyleSpec(
                                    color: charts
                                        .MaterialPalette.purple.shadeDefault,
                                    fontFamily: 'Georgia',
                                    fontSize: 11),
                              )
                            ],
                            defaultRenderer: new charts.ArcRendererConfig(
                                arcWidth: 100,
                                arcRendererDecorators: [
                                  new charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.inside)
                                ])),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Sales for the first 5 years',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: charts.LineChart(_seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
                              new charts.ChartTitle('Years',
                                  behaviorPosition:
                                      charts.BehaviorPosition.bottom,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              new charts.ChartTitle('Sales',
                                  behaviorPosition:
                                      charts.BehaviorPosition.start,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              new charts.ChartTitle(
                                'Departments',
                                behaviorPosition: charts.BehaviorPosition.end,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 10,
                child: Center(child: MapPage()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Insecrurity {
  String date;
  int quantity;

  Insecrurity(this.date, this.quantity);
}

class Exportation {
  String name;
  double value;
  Color colorval;

  Exportation(this.name, this.value, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
