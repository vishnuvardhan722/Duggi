import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  String _selectedFilter = "Day";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Users",
                        style: kPopinsBold.copyWith(
                            fontSize: 20, color: BconstantColors.txt2color),
                      ),
                      Icon(CupertinoIcons.calendar,
                          color: BconstantColors.black),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Pie Chart
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: isWide ? 400 : SizeConfig.screenWidth,
                      height: 280,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                      value: 88,
                                      color: Colors.green,
                                      title: '45.6%',
                                      radius: 40),
                                  PieChartSectionData(
                                      value: 67,
                                      color: Colors.yellow,
                                      title: '34.7%',
                                      radius: 40),
                                  PieChartSectionData(
                                      value: 28,
                                      color: Colors.pink,
                                      title: '14.5%',
                                      radius: 40),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              left: 40,
                              child: _buildPieLabel("64", "34.7%")),
                          Positioned(
                              top: 10,
                              right: 40,
                              child: _buildPieLabel("32", "14.5%")),
                          Positioned(
                              bottom: 0, child: _buildPieLabel("87", "45.6%")),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.center,
                    children: const [
                      LegendItem(
                          color: Colors.green, text: "Online", text1: "5,000"),
                      LegendItem(
                          color: Colors.yellow,
                          text: "Offline",
                          text1: "2,000"),
                      LegendItem(
                          color: Colors.pink,
                          text: "Deactivated",
                          text1: "1,000"),
                    ],
                  ),

                  SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("This Week Users",
                          style: kPopinsBold.copyWith(fontSize: 18)),
                      Wrap(
                        spacing: 8,
                        children: ["Day", "Month", "Year"]
                            .map((filter) => FilterChip(
                                  label: Text(filter),
                                  selected: _selectedFilter == filter,
                                  selectedColor: BconstantColors.buttonbgColor2,
                                  checkmarkColor: Colors.white,
                                  labelStyle: TextStyle(
                                    color: _selectedFilter == filter
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onSelected: (_) {
                                    setState(() => _selectedFilter = filter);
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  SizedBox(
                    height: 300,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 6,
                        minY: 0,
                        maxY: 100,
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.grey.shade300)),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              getTitlesWidget: (value, _) =>
                                  Text(value.toInt().toString()),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) {
                                const days = [
                                  'Sat',
                                  'Sun',
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri'
                                ];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(days[value.toInt()],
                                      style: const TextStyle(fontSize: 12)),
                                );
                              },
                            ),
                          ),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 68),
                              FlSpot(1, 58),
                              FlSpot(2, 53),
                              FlSpot(3, 94),
                              FlSpot(4, 85),
                              FlSpot(5, 87),
                              FlSpot(6, 97),
                            ],
                            isCurved: true,
                            color: Colors.indigo,
                            barWidth: 3,
                            dotData: const FlDotData(show: true),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPieLabel(String value, String percent) {
    return Column(
      children: [
        Text(value, style: kPopinsBold.copyWith(fontSize: 14)),
        Text(percent,
            style: kPopinsBold.copyWith(fontSize: 12, color: Colors.grey)),
      ],
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
    return Container(
      width: 120,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: kPopinsBold.copyWith(fontSize: 14)),
            Text(text1, style: kPopinsMedium.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
