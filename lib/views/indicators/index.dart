import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onagri/helper/widgets.dart';
import 'package:onagri/views/indicators/bar_chart.dart';
import 'package:onagri/views/indicators/line_chart.dart';
import 'package:onagri/views/indicators/map.dart';
import 'package:onagri/views/indicators/pie_chart.dart';

class Indicators extends StatefulWidget {
  @override
  _IndicatorsState createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentTab = 0;
  RangeValues _mapRangeValues = RangeValues(1, 100);
  RangeLabels _mapRangeLabels = RangeLabels('1', "100");
  RangeValues _barRangeValues = RangeValues(1, 100);
  RangeLabels _barRangeLabels = RangeLabels('1', "100");
  String _barYear = "";
  String _barGouvernerat = "";

  bool _isLoading = false;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(() {
      print(_tabController.index.toString());
      setState(() {
        _currentTab = _tabController.index;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.filter_list_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                if (_currentTab == 0) {
                  setState(() {
                    _isLoading = true;
                  });
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            title: Text("Filtrer par :"),
                            content: Container(
                              height: 180,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Année : "),
                                      DropdownButton<String>(
                                        value: _barYear,
                                        items: <String>[
                                          '',
                                          '2014',
                                          '2015',
                                          '2016',
                                          '2017',
                                          '2018'
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (x) {
                                          setState(() {
                                            _barYear = x;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Gouvernerat : "),
                                      DropdownButton<String>(
                                        value: _barGouvernerat,
                                        items: <String>[
                                          '',
                                          'Kairaouen',
                                          'Sidi Bouzid',
                                          'Kasserine',
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (x) {
                                          setState(() {
                                            _barGouvernerat = x;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Taux d'insécurité : "),
                                      RangeSlider(
                                          activeColor: Colors.green[700],
                                          inactiveColor: Colors.green[300],
                                          divisions: 10,
                                          labels: _barRangeLabels,
                                          min: 1,
                                          max: 100,
                                          values: _barRangeValues,
                                          onChanged: (values) {
                                            setState(() {
                                              _barRangeValues = values;
                                              _barRangeLabels = RangeLabels(
                                                  "${values.start.toInt().toString()}%",
                                                  "${values.end.toInt().toString()}%");
                                            });
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ).then((value) => setState(() {
                        _isLoading = false;
                      }));
                } else if (_currentTab == 3) {
                  setState(() {
                    _isLoading = true;
                  });
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            title: Text("Filtrer par taux d'insécurité :"),
                            content: SafeArea(
                              child: Container(
                                height: 40,
                                child: RangeSlider(
                                    activeColor: Colors.green[700],
                                    inactiveColor: Colors.green[300],
                                    divisions: 10,
                                    labels: _mapRangeLabels,
                                    min: 1,
                                    max: 100,
                                    values: _mapRangeValues,
                                    onChanged: (values) {
                                      setState(() {
                                        _mapRangeValues = values;
                                        _mapRangeLabels = RangeLabels(
                                            "${values.start.toInt().toString()}%",
                                            "${values.end.toInt().toString()}%");
                                      });
                                    }),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ).then((value) => setState(() {
                        _isLoading = false;
                      }));
                }
              },
            )
          ],
          centerTitle: true,
          backgroundColor: Color(0xff336633),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
              Tab(icon: Icon(FontAwesomeIcons.chartPie)),
              Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              Tab(icon: Icon(FontAwesomeIcons.map)),
            ],
          ),
          title: Text('Indicateurs'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _isLoading
                ? waitingScreen()
                : BarChart(_barYear, _barGouvernerat, _barRangeValues),
            _isLoading ? waitingScreen() : PieChart(),
            _isLoading ? waitingScreen() : LineChart(),
            _isLoading ? waitingScreen() : MapPage(_mapRangeValues)
          ],
        ),
      ),
    );
  }
}
