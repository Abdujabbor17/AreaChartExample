import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<SalesData> chartData = [
    SalesData(2004, 0),
    SalesData(2005, 0.5),
    SalesData(2006, 4.9),
    SalesData(2007, 2.2),
    SalesData(2009, 5.9),
    SalesData(2010, 4.4),
    SalesData(2015, 3.2222222),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Scaffold(
          body: Center(
              child: Container(
                  child: SfCartesianChart(
                    enableAxisAnimation: true,
                      zoomPanBehavior: ZoomPanBehavior(
                        enablePinching: true
                      ),
                      tooltipBehavior: TooltipBehavior(
                        format:'point.y',
                        enable: true,
                        canShowMarker: false,
                        color: Colors.white,
                        textAlignment: ChartAlignment.center,
                        duration: 3000,
                        animationDuration: 300,
                        shared: true,
                        tooltipPosition: TooltipPosition.auto,
                        shadowColor:  Color(0xffC4C4C4),
                        textStyle: const TextStyle(
                          color: Color(0xff04009A),
                          fontSize: 14
                        ),
                      ),
                      title: ChartTitle(text: "Area Chart"),
                      series: <ChartSeries>[
                        AreaSeries<SalesData, double>(
                         // enableTooltip: true,
                          animationDuration: 100,
                          animationDelay: 0.5,
                          emptyPointSettings: EmptyPointSettings(
                            color: Colors.red,
                            borderWidth: 3.0
                          ),
                          borderWidth: 2,
                            borderColor:Color(0xff04009A),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xff21A2FF).withOpacity(0.73),
                              const Color(0xff21A2FF).withOpacity(0.0),
                            ],

                          ),
                            dataSource: chartData,
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales)
                      ])
              )
          )
      )
    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}