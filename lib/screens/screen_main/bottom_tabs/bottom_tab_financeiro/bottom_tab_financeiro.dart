import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BottomTabFinanceiro extends StatefulWidget{
  const BottomTabFinanceiro({super.key});
  @override State<StatefulWidget> createState() => _BottomTabFinanceiro();
}
class _BottomTabFinanceiro extends State<BottomTabFinanceiro>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdf9f6),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 9, right: 9, bottom: 10),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xfffaefe7),
                borderRadius: BorderRadius.circular(10)
              ),
              child:
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsetsGeometry.only(left: 10, top: 10),
                        child: Text('Lucro Presumido', style: TextStyle(fontFamily: 'MontSerratRegular'),)
                      )
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 30),
                        child: Text('R\$ 8950,00', style: TextStyle(fontFamily: 'MontSerratSemiBold', fontSize: 30))
                      )
                    ),
                  ]
                )
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 12, left: 9, right: 9),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xfffefdfb),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 5),
                            child: Text('Receita', style: TextStyle(fontFamily: 'MontSerratRegular', color: Color(0xFF8F7F6F)))
                          )
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text('R\$ 12000,00', style: TextStyle(fontFamily: 'MontSerratSemiBold', fontSize: 15),)
                          )
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xfffefdfb),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 5),
                            child: Text('Despesas', style: TextStyle(fontFamily: 'MontSerratRegular', color: Color(0xFF8F7F6F)))
                          )
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text('R\$ 3500,00', style: TextStyle(fontFamily: 'MontSerratSemiBold', fontSize: 15),)
                          )
                        )
                      ],
                    ),
                  ),
                ) 
              ]
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 9),
              child: Text('Visão Geral', style: TextStyle(fontFamily: 'MontSerratSemiBold', fontSize: 18),)
            )
          ),
          Container(
            padding: EdgeInsets.all(16),
            height: 200,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                    fitInsideHorizontally: true,
                    fitInsideVertically: true,
                    getTooltipItems: (List<LineBarSpot> touchedSpot){
                      return touchedSpot.map((spot){
                        return LineTooltipItem('R\$ ${spot.y.toStringAsFixed(2).replaceAll('.', ',')}', TextStyle(color: Colors.white));
                      }).toList();
                    }
                  ),
                  getTouchedSpotIndicator: (barData, indicators) {
                  return indicators.map((index) {
                    return TouchedSpotIndicatorData(
                      FlLine(color: const Color.fromARGB(132, 0, 0, 0), strokeWidth: 1),
                      FlDotData(show: false),
                    );
                  }).toList();
                },
                touchCallback: (event, response) {
                  // você pode capturar eventos aqui também se quiser
                  print('passou');
                  print(event.localPosition);
                },
                touchSpotThreshold: 25, // aumenta o "alcance" entre os pontos
                ),
                gridData: FlGridData(
                  horizontalInterval: 2000, //Intervalo
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withOpacity(0.2),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value ~/ 1000}k',
                          style: TextStyle(color: const Color.fromARGB(255, 107, 107, 107), fontSize: 12, fontFamily: 'MontSerratSemiBold'),
                        );
                      },
                      interval: 2000, //Intervalo
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      interval: 1,
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (value, _) {
                        switch (value) {
                          case 0:
                            return Container(
                              padding: EdgeInsets.only(left: 22),
                              child: Text('Jan', style: TextStyle(fontFamily: 'MontSerratRegular'))
                            );
                          case 1:
                            return Text('Fev', style: TextStyle(fontFamily: 'MontSerratRegular'));
                          case 2:
                            return Text('Mar', style: TextStyle(fontFamily: 'MontSerratRegular'));
                          case 3:
                            return Transform.translate(
                              offset: Offset(-12, 0),
                              child: Text('Abr', style: TextStyle(fontFamily: 'MontSerratRegular')
                              )
                            );
                          default:
                            return Text('');
                        }
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 0,
                        
                minY: 0,
                maxY: 10000, // Máximo de faturamento do cliente
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.deepPurpleAccent,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      //color: const Color.fromRGBO(68, 0, 255, 1).withOpacity(0.2),
                      gradient: LinearGradient(colors: [Color.fromRGBO(68, 0, 255, 1).withOpacity(0.2), Colors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    ),
                    dotData: FlDotData(show: true),
                    spots: [
                      FlSpot(0, 4000),
                      FlSpot(1, 4500),
                      FlSpot(2, 8000),
                      FlSpot(3, 4200),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
