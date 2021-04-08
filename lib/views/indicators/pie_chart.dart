import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChart extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  List<charts.Series<Exportation, String>> _seriesPieData;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _seriesPieData = List<charts.Series<Exportation, String>>();
    generateData();
  }

  generateData() {
    var piedata = [
      new Exportation("Huile d'olive vierge lampante et ses fractions", 2.0,
          Color(0xff3366cc)),
      new Exportation("Huile d'olive vierge extra et ses fractions", 2.1,
          Color(0xff990099)),
      new Exportation(
          "Huile d'olive vierge extra et ses fractions (entre 1 et 5 litres)",
          3,
          Color(0xff109618)),
      new Exportation("Huile d'olive vierge extra et ses fractions (en vrac)",
          14.8, Color(0xfffdbe19)),
      new Exportation(
          "Huile d'olive vierge et ses fractions", 0.6, Color(0xffff9900)),
      new Exportation("Autres huile d'olive vierge et ses fractions (en vrac)",
          5, Color(0xffdc3912)),
    ];

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
                "Evolution des quantités exportées de l'huile d'olive tunisienne au cours du mois de novembre 2020",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                        cellPadding:
                            new EdgeInsets.only(right: 4.0, bottom: 4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 11),
                      )
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Exportation {
  String name;
  double value;
  Color colorval;

  Exportation(this.name, this.value, this.colorval);
}
