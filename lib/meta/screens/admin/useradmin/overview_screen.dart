import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth =
              constraints.maxWidth > 1000 ? 1000 : constraints.maxWidth * 0.95;
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today Income",
                            style: kPopinsBold.copyWith(
                              fontSize: 28,
                              color: BconstantColors.txt2color,
                            ),
                          ),
                          const Icon(CupertinoIcons.calendar,
                              color: Colors.black, size: 26),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹3,342.0",
                                style: kPopinsBold.copyWith(
                                  fontSize: 32,
                                  color: BconstantColors.txt2color,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "01-30 September 2024",
                                style: kPopinsMedium.copyWith(
                                  fontSize: 18,
                                  color: BconstantColors.txt2color
                                      .withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              _buildTimeFilter("W", true),
                              const SizedBox(width: 16),
                              _buildTimeFilter("M", false),
                              const SizedBox(width: 16),
                              _buildTimeFilter("Y", false),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildDivider("10,000"),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: CustomPaint(
                          painter: BarChartPainter(
                            data: [3, 5, 2, 7, 9, 6, 4],
                            barColor: BconstantColors.buttonbgColor2,
                            labels: [
                              'Sat',
                              'Sun',
                              'Mon',
                              'Tue',
                              'Wed',
                              'Thu',
                              'Fri'
                            ],
                          ),
                          child: Container(),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black54.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatsCard("Online", "5,000"),
                              _divider(),
                              _buildStatsCard("Offline", "2,000"),
                              _divider(),
                              _buildStatsCard("Deactivated", "1,000"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Customers",
                                style: kPopinsBold.copyWith(
                                    fontSize: 26,
                                    color: BconstantColors.txt2color),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "1,000",
                                style: kPopinsMedium.copyWith(
                                  fontSize: 18,
                                  color: BconstantColors.txt2color
                                      .withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Online",
                                  style: kPopinsMedium.copyWith(
                                      fontSize: 16,
                                      color: BconstantColors.green1)),
                              const SizedBox(width: 12),
                              Text("Offline",
                                  style: kPopinsMedium.copyWith(
                                      fontSize: 15,
                                      color: BconstantColors.txt2color
                                          .withOpacity(0.4))),
                              const SizedBox(width: 12),
                              Text("Deactivated",
                                  style: kPopinsMedium.copyWith(
                                      fontSize: 15,
                                      color: BconstantColors.txt2color
                                          .withOpacity(0.4))),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildDivider("1,000"),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 500,
                        child: CustomPaint(
                          painter: BarChartPainter(
                            data: [6, 4, 3, 7, 8, 5, 6],
                            barColor: BconstantColors.green1,
                            labels: [
                              'Sat',
                              'Sun',
                              'Mon',
                              'Tue',
                              'Wed',
                              'Thu',
                              'Fri'
                            ],
                          ),
                          child: Container(),
                        ),
                      ),
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

  Widget _buildTimeFilter(String label, bool isActive) {
    return Text(
      label,
      style: kPopinsBold.copyWith(
        fontSize: 18,
        color: isActive
            ? BconstantColors.buttonbgColor2
            : BconstantColors.txt2color.withOpacity(0.5),
      ),
    );
  }

  Widget _buildStatsCard(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: kPopinsSemiBold.copyWith(
              fontSize: 14, color: BconstantColors.txt2color.withOpacity(0.5)),
        ),
        Text(
          value,
          style: kPopinsBold.copyWith(
              fontSize: 16, color: BconstantColors.txt2color),
        ),
      ],
    );
  }

  Widget _divider() {
    return const SizedBox(
      height: 40,
      child: VerticalDivider(thickness: 0.8, color: Colors.grey),
    );
  }

  Widget _buildDivider(String centerLabel) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 0.5, color: Colors.grey)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(centerLabel, style: const TextStyle(fontSize: 14)),
          ),
          Expanded(child: Divider(thickness: 0.5, color: Colors.grey)),
        ],
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<int> data;
  final Color barColor;
  final List<String> labels;

  BarChartPainter(
      {required this.data, required this.barColor, required this.labels});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = barColor;
    final barWidth = size.width / data.length;
    final maxBarHeight = size.height - 20;

    for (int i = 0; i < data.length; i++) {
      final barHeight =
          (data[i] / data.reduce((a, b) => a > b ? a : b)) * maxBarHeight;
      final barRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(i * barWidth, size.height - barHeight - 20,
            barWidth * 0.7, barHeight),
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      );
      canvas.drawRRect(barRect, paint);

      final textSpan = TextSpan(
          text: labels[i],
          style: const TextStyle(color: Colors.black, fontSize: 12));
      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr)
            ..layout(maxWidth: barWidth);

      textPainter.paint(
          canvas,
          Offset(i * barWidth + (barWidth - textPainter.width) / 4,
              size.height - 17));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
