import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

/// This widget is the home page of the application.
class MapPage extends StatefulWidget {
  /// Initialize the instance of the [MapPage] class.
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  _MapPageState();

  List<Model> _data;
  MapShapeSource _mapSource;
  @override
  void initState() {
    _data = const <Model>[
      Model('Ariana', Color.fromRGBO(255, 215, 0, 1.0), '22%'),
      Model('Beja', Color.fromRGBO(255, 78, 66, 1.0), '14%'),
      Model('Sidi Bouzid', Color.fromRGBO(171, 56, 224, 0.75), '10%'),
      Model('Gabes', Color.fromRGBO(99, 164, 230, 1), '2%'),
      Model('Tataouine', Color.fromRGBO(79, 60, 201, 0.7), '19%'),
      // Model('Queensland', Color.fromRGBO(72, 209, 204, 1.0), 'Queensland'),
      // Model('Northern Territory', Color.fromRGBO(255, 78, 66, 1.0),
      //     'Northern\nTerritory'),
      // Model('Victoria', Color.fromRGBO(171, 56, 224, 0.75), 'Victoria'),
      // Model('South Australia', Color.fromRGBO(126, 247, 74, 0.75),
      //     'South Australia'),
      // Model('Western Australia', Color.fromRGBO(79, 60, 201, 0.7),
      //     'Western Australia'),
      // Model('Tasmania', Color.fromRGBO(99, 164, 230, 1), 'Tasmania'),
      // Model('Australian Capital Territory', Colors.teal, 'ACT')
    ];

    _mapSource = MapShapeSource.asset(
      'assets/maps/tn.json',
      shapeDataField: 'NAME_EN',
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].state,
      dataLabelMapper: (int index) => _data[index].stateCode,
      shapeColorValueMapper: (int index) => _data[index].color,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfMaps(
      title: const MapTitle('Poverty'),
      layers: <MapShapeLayer>[
        MapShapeLayer(
          onSelectionChanged: (int selected) {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    content: Column(
                      children: [
                        Text(
                          _data[selected].state +
                              " : " +
                              _data[selected].stateCode,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Info about " + _data[selected].state.toLowerCase())
                      ],
                    ),
                  );
                });
          },
          source: _mapSource,
          showDataLabels: true,
          legend: MapLegend(MapElement.shape),
          tooltipSettings: MapTooltipSettings(
              color: Colors.grey[700],
              strokeColor: Colors.white,
              strokeWidth: 2),
          strokeColor: Colors.white,
          strokeWidth: 0.5,
          shapeTooltipBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _data[index].stateCode,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          dataLabelSettings: MapDataLabelSettings(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.caption.fontSize)),
        ),
      ],
    );
  }
}

/// Collection of Australia state code data.
class Model {
  /// Initialize the instance of the [Model] class.
  const Model(this.state, this.color, this.stateCode);

  /// Represents the Australia state name.
  final String state;

  /// Represents the Australia state color.
  final Color color;

  /// Represents the Australia state code.
  final String stateCode;
}
