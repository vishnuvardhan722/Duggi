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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: BconstantColors.basecolor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth =
              constraints.maxWidth > 1200 ? 1000 : constraints.maxWidth * 0.95;
          double spacing = constraints.maxWidth > 1000 ? 24 : 16;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Padding(
                padding: EdgeInsets.all(spacing),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Revenue",
                            style: kPopinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 2,
                              color: BconstantColors.txt2color,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.calendar,
                            color: BconstantColors.black,
                            size: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                        ],
                      ),
                      SizedBox(height: spacing),

                      // Pie Chart
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.28,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                        value: 70,
                                        color: Colors.green,
                                        title: '45.6%',
                                        radius: 40),
                                    PieChartSectionData(
                                        value: 20,
                                        color: Colors.pink,
                                        title: '34.7%',
                                        radius: 40),
                                    PieChartSectionData(
                                        value: 10,
                                        color: Colors.yellow,
                                        title: '14.5%',
                                        radius: 40),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: _buildPieLabel("64", "34.7%"),
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: _buildPieLabel("32", "14.5%"),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: _buildPieLabel("87", "45.6%"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing * 1.5),

                      // Legend
                      Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        alignment: WrapAlignment.center,
                        children: [
                          LegendItem(
                              color: Colors.green,
                              text: "Profit",
                              text1: "5,000"),
                          LegendItem(
                              color: Colors.pink, text: "Loss", text1: "2,000"),
                          LegendItem(
                              color: Colors.yellow,
                              text: "Recovery",
                              text1: "1,000"),
                        ],
                      ),
                      SizedBox(height: spacing * 1.5),

                      // Line Chart Header + Filters
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Week Revenue",
                            style: kPopinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 2,
                              color: BconstantColors.txt2color,
                            ),
                          ),
                          Row(
                            children: ["Day", "Month", "Year"]
                                .map((filter) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: FilterChip(
                                        label: Text(filter),
                                        selected: _selectedFilter == filter,
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _selectedFilter = filter;
                                          });
                                        },
                                        selectedColor:
                                            BconstantColors.buttonbgColor2,
                                        labelStyle: TextStyle(
                                          color: _selectedFilter == filter
                                              ? BconstantColors.whitecolor
                                              : BconstantColors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                      SizedBox(height: spacing),

                      // Line Chart
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.35,
                        child: LineChart(
                          LineChartData(
                            minX: 0,
                            maxX: 6,
                            maxY: 100,
                            minY: 0,
                            gridData: FlGridData(
                                show: false, drawHorizontalLine: true),
                            borderData: FlBorderData(
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1),
                            ),
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 20,
                                  getTitlesWidget: (value, _) =>
                                      Text('${value.toInt()}'),
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, _) {
                                    final days = [
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
                                belowBarData: BarAreaData(show: false),
                                dotData: FlDotData(show: true),
                              ),
                            ],
                            lineTouchData: LineTouchData(
                              touchTooltipData: LineTouchTooltipData(
                                getTooltipItems: (touchedSpots) =>
                                    touchedSpots.map((spot) {
                                  final days = [
                                    'Sat',
                                    'Sun',
                                    'Mon',
                                    'Tue',
                                    'Wed',
                                    'Thu',
                                    'Fri'
                                  ];
                                  final value = spot.y;
                                  final percentage =
                                      (value / 350 * 100).toStringAsFixed(1);
                                  return LineTooltipItem(
                                    '${days[spot.x.toInt()]}: ${value.toInt()} ($percentage%)',
                                    TextStyle(
                                      color: BconstantColors.whitecolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: spacing),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPieLabel(String count, String percent) {
    return Column(
      children: [
        Text(count,
            style: kPopinsBold.copyWith(
                fontSize: 16, color: BconstantColors.txt2color)),
        Text(percent,
            style: kPopinsBold.copyWith(
                fontSize: 14,
                color: BconstantColors.txt2color.withOpacity(0.7))),
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final String text1;

  const LegendItem({
    super.key,
    required this.color,
    required this.text,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              style: kPopinsBold.copyWith(
                  fontSize: 16, color: BconstantColors.txt2color)),
          Text(text1,
              style: kPopinsBold.copyWith(
                  fontSize: 14,
                  color: BconstantColors.txt2color.withOpacity(0.5))),
        ],
      ),
    );
  }
}
