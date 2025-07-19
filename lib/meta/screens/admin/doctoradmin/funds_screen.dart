import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class FundsScreen extends StatefulWidget {
  const FundsScreen({super.key});

  @override
  State<FundsScreen> createState() => _FundsScreenState();
}

class _FundsScreenState extends State<FundsScreen> {
  String _selectedFilter = "Day";

  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Revenue",
                    style: kPopinsBold.copyWith(
                        fontSize: SizeConfig.screenWidth! * 0.039,
                        color: BconstantColors.txt2color),
                  ),
                  Icon(
                    CupertinoIcons.calendar,
                    color: BconstantColors.black,
                    size: SizeConfig.screenWidth! * 0.06,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 3,
              ),
              // Pie Chart
              SizedBox(
                height: SizeConfig.screenHeight! * 0.28,
                width: SizeConfig.screenWidth,
                child: Stack(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.24,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                value: 70,
                                color: Colors.green,
                                title: '45.6%',
                                radius: 40,
                              ),
                              PieChartSectionData(
                                value: 20,
                                color: Colors.pink,
                                title: '34.7%',
                                radius: 40,
                              ),
                              PieChartSectionData(
                                value: 10,
                                color: Colors.yellow,
                                title: '14.5%',
                                radius: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.blockSizeVertical! * 4,
                      right: SizeConfig.blockSizeHorizontal! * 15,
                      child: Column(
                        children: [
                          Text(
                            "32",
                            style: kPopinsBold.copyWith(
                                fontSize: SizeConfig.screenWidth! * 0.04,
                                color: BconstantColors.txt2color),
                          ),
                          Text(
                            '14.5%',
                            style: kPopinsBold.copyWith(
                                fontSize: SizeConfig.screenWidth! * 0.03,
                                color:
                                    BconstantColors.txt2color.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.blockSizeVertical! * 4,
                      left: SizeConfig.blockSizeHorizontal! * 15,
                      child: Column(
                        children: [
                          Text(
                            "64",
                            style: kPopinsBold.copyWith(
                                fontSize: SizeConfig.screenWidth! * 0.04,
                                color: BconstantColors.txt2color),
                          ),
                          Text(
                            '34.7%',
                            style: kPopinsBold.copyWith(
                                fontSize: SizeConfig.screenWidth! * 0.03,
                                color:
                                    BconstantColors.txt2color.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            "87",
                            style: kPopinsBold.copyWith(
                                fontSize: SizeConfig.screenWidth! * 0.04,
                                color: BconstantColors.txt2color),
                          ),
                          Text(
                            "45.6%",
                            style: kPopinsBold.copyWith(
                                fontSize: SizeConfig.screenWidth! * 0.03,
                                color:
                                    BconstantColors.txt2color.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 12,
              ),

              // Legend
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LegendItem(
                    color: const Color.fromARGB(255, 75, 228, 80),
                    text: "Profit",
                    text1: "5,000",
                  ),
                  LegendItem(
                    color: const Color.fromARGB(255, 235, 76, 129),
                    text: "Loss",
                    text1: "2,000",
                  ),
                  LegendItem(
                    color: const Color.fromARGB(255, 250, 247, 63),
                    text: "Recovery",
                    text1: "1,000",
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 9,
              ),

              // Line Chart Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Week Revenue",
                    style: kPopinsBold.copyWith(
                        fontSize: SizeConfig.screenWidth! * 0.039,
                        color: BconstantColors.txt2color),
                  ),
                  Row(
                    children: [
                      FilterChip(
                        checkmarkColor: BconstantColors.whitecolor,
                        label: Text("Day"),
                        selected: _selectedFilter == "Day",
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedFilter = "Day";
                          });
                        },
                        selectedColor: BconstantColors.buttonbgColor2,
                        labelStyle: TextStyle(
                          color: _selectedFilter == "Day"
                              ? BconstantColors.whitecolor
                              : BconstantColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      FilterChip(
                        checkmarkColor: BconstantColors.whitecolor,
                        label: Text("Month"),
                        selected: _selectedFilter == "Month",
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedFilter = "Month";
                          });
                        },
                        selectedColor: BconstantColors.buttonbgColor2,
                        labelStyle: TextStyle(
                          color: _selectedFilter == "Month"
                              ? BconstantColors.whitecolor
                              : BconstantColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      FilterChip(
                        checkmarkColor: BconstantColors.whitecolor,
                        label: Text("Year"),
                        selected: _selectedFilter == "Year",
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedFilter = "Year";
                          });
                        },
                        selectedColor: BconstantColors.buttonbgColor2,
                        labelStyle: TextStyle(
                          color: _selectedFilter == "Year"
                              ? BconstantColors.whitecolor
                              : BconstantColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 9,
              ),

              SizedBox(
                height: SizeConfig.screenHeight! * 0.35,
                width: SizeConfig.screenWidth,
                child:
                    // Line Chart
                    LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 6,
                    maxY: 100,
                    minY: 0,
                    gridData: FlGridData(
                      show: false,
                      drawHorizontalLine: true,
                      drawVerticalLine: false,
                    ),
                    borderData: FlBorderData(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),

                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      // rightTitles: const AxisTitles(
                      //     sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 20,
                          getTitlesWidget: (value, _) {
                            return Text('${value.toInt()}');
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            switch (value.toInt()) {
                              case 0:
                                return Text('Sat',
                                    style: TextStyle(fontSize: 12));
                              case 1:
                                return Text('Sun',
                                    style: TextStyle(fontSize: 12));
                              case 2:
                                return Text('Mon',
                                    style: TextStyle(fontSize: 12));
                              case 3:
                                return Text('Tue',
                                    style: TextStyle(fontSize: 12));
                              case 4:
                                return Text('Wed',
                                    style: TextStyle(fontSize: 12));
                              case 5:
                                return Text('Thu',
                                    style: TextStyle(fontSize: 12));
                              case 6:
                                return Text('Fri',
                                    style: TextStyle(fontSize: 12));
                              default:
                                return Text('');
                            }
                          },
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 68), // Sat
                          FlSpot(1, 58), // Sun
                          FlSpot(2, 53), // Mon
                          FlSpot(3, 94), // Tue
                          FlSpot(4, 85), // Wed
                          FlSpot(5, 87), // Thu
                          FlSpot(6, 97), // Fri
                        ],
                        isCurved: true,
                        color: Colors.indigo,
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                        dotData: FlDotData(show: true),
                      ),
                    ],
                    // Fixing the ShowingTooltipIndicators issue
                    // showingTooltipIndicators: List.generate(
                    //   7, // Total data points
                    //   (index) => ShowingTooltipIndicators(
                    //     [
                    //       LineBarSpot(
                    //         // LineChartBarData index (0 as there's only one line chart)
                    //         LineChartBarData(
                    //           spots: [
                    //             FlSpot(0, 68), // Sat
                    //             FlSpot(1, 58), // Sun
                    //             FlSpot(2, 53), // Mon
                    //             FlSpot(3, 94), // Tue
                    //             FlSpot(4, 85), // Wed
                    //             FlSpot(5, 87), // Thu
                    //             FlSpot(6, 97), // Fri
                    //           ],
                    //           isCurved: true,
                    //           color: Colors.indigo,
                    //           barWidth: 3,
                    //           belowBarData: BarAreaData(show: false),
                    //           dotData: FlDotData(show: true),
                    //         ),
                    //         index,
                    //         FlSpot(
                    //             index.toDouble(),
                    //             [
                    //               68.0,
                    //               58.0,
                    //               53.0,
                    //               94.0,
                    //               85.0,
                    //               87.0,
                    //               97.0
                    //             ][index]),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        // tooltipBgColor: Colors.indigo.shade50,
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((touchedSpot) {
                            final weekdayValues = {
                              0: 'Sat',
                              1: 'Sun',
                              2: 'Mon',
                              3: 'Tue',
                              4: 'Wed',
                              5: 'Thu',
                              6: 'Fri',
                            };
                            final value = touchedSpot.y;
                            final percentage =
                                (value / 350 * 100).toStringAsFixed(1);
                            return LineTooltipItem(
                              '${weekdayValues[touchedSpot.x.toInt()]}: ${value.toInt()} ($percentage%)',
                              TextStyle(
                                color: BconstantColors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            );
                          }).toList();
                        },
                      ),
                      touchCallback: (touchEvent, touchResponse) {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final String text1;

  const LegendItem(
      {super.key,
      required this.color,
      required this.text,
      required this.text1});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child: Container(
            width: SizeConfig.screenWidth! * 0.25,
            height: 60,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: kPopinsBold.copyWith(
                      fontSize: SizeConfig.screenWidth! * 0.04,
                      color: BconstantColors.txt2color),
                ),
                Text(
                  text1,
                  style: kPopinsBold.copyWith(
                      fontSize: SizeConfig.screenWidth! * 0.03,
                      color: BconstantColors.txt2color.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
