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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 2,
              ),
              // Income Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today Income",
                    style: kPopinsBold.copyWith(
                        fontSize: SizeConfig.screenWidth! * 0.05,
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
                height: SizeConfig.blockSizeHorizontal! * 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹3,342.0",
                        style: kPopinsBold.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.054,
                            color: BconstantColors.txt2color),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal! * 1,
                      ),
                      Text(
                        "01-30 September 2024",
                        style: kPopinsMedium.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.034,
                            color: BconstantColors.txt2color.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: SizeConfig.blockSizeVertical! * 2,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "W",
                          style: kPopinsBold.copyWith(
                              fontSize: SizeConfig.screenWidth! * 0.044,
                              color: BconstantColors.buttonbgColor2),
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeVertical! * 2,
                        ),
                        Text(
                          "M",
                          style: kPopinsBold.copyWith(
                              fontSize: SizeConfig.screenWidth! * 0.04,
                              color:
                                  BconstantColors.txt2color.withOpacity(0.5)),
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeVertical! * 2,
                        ),
                        Text(
                          "Y",
                          style: kPopinsBold.copyWith(
                              fontSize: SizeConfig.screenWidth! * 0.04,
                              color:
                                  BconstantColors.txt2color.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 4,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey),
                        height: 0.5,
                        margin: EdgeInsets.all(4),
                      ),
                    ),
                    Text(
                      "10,000",
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey),
                        height: 0.5,
                        margin: EdgeInsets.all(4),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 2,
              ),
              // Income Chart
              SizedBox(
                height: SizeConfig.screenHeight! * 0.25,
                child: CustomPaint(
                  painter: BarChartPainter(
                    data: [3, 5, 2, 7, 9, 6, 4], // Example data for income
                    barColor: BconstantColors.buttonbgColor2,
                    labels: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
                  ),
                  child: Container(), // Required to trigger painting
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 7,
              ),
              // Customer Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.screenWidth! * 0.7,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54.withOpacity(0.5),
                        width: 1.0,
                      ),
                      borderRadius:
                          BorderRadius.circular(7.0), // Uniform radius
                    ),
                    child: Center(
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatsCard("Online", "5,000"),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 9),
                              child: VerticalDivider(
                                thickness: 0.8,
                                color: Colors.grey,
                              ),
                            ),
                            _buildStatsCard("Offline", "2,000"),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 9),
                              child: VerticalDivider(
                                thickness: 0.8,
                                color: Colors.grey,
                              ),
                            ),
                            _buildStatsCard("Deactivated", "1,000"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 7,
              ),

              // Customer Chart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Customers",
                        style: kPopinsBold.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.05,
                            color: BconstantColors.txt2color),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal! * 1,
                      ),
                      Text(
                        "1,000",
                        style: kPopinsMedium.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.034,
                            color: BconstantColors.txt2color.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Online",
                          style: kPopinsMedium.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.036,
                            color: BconstantColors.green1,
                          ),
                        ),
                        Text(
                          "Offline",
                          style: kPopinsMedium.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.034,
                            color: BconstantColors.txt2color.withOpacity(0.3),
                          ),
                        ),
                        Text(
                          "Deactivated",
                          style: kPopinsMedium.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.034,
                            color: BconstantColors.txt2color.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 5,
              ),

              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey),
                        height: 0.5,
                        margin: EdgeInsets.all(4),
                      ),
                    ),
                    Text(
                      "1,000",
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey),
                        height: 0.5,
                        margin: EdgeInsets.all(4),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 2,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.25,
                child: CustomPaint(
                  painter: BarChartPainter(
                    data: [6, 4, 3, 7, 8, 5, 6], // Example data for customers
                    barColor: BconstantColors.green1,
                    labels: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
                  ),
                  child: Container(), // Required to trigger painting
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Column(
        children: [
          Text(
            label,
            style: kPopinsSemiBold.copyWith(
              fontSize: SizeConfig.screenWidth! * 0.034,
              color: BconstantColors.txt2color.withOpacity(0.5),
            ),
          ),
          Text(
            value,
            style: kPopinsBold.copyWith(
              fontSize: SizeConfig.screenWidth! * 0.044,
              color: BconstantColors.txt2color,
            ),
          ),
        ],
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<int> data;
  final Color barColor;
  final List<String> labels;

  BarChartPainter({
    required this.data,
    required this.barColor,
    required this.labels,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = barColor
      ..style = PaintingStyle.fill;

    final barWidth = size.width / data.length;
    final maxBarHeight = size.height - 20; // Leave space for labels

    for (int i = 0; i < data.length; i++) {
      final barHeight =
          (data[i] / (data.reduce((a, b) => a > b ? a : b))) * maxBarHeight;
      final barRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(i * barWidth, size.height - barHeight - 20,
            barWidth * 0.7, barHeight),
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      );

      canvas.drawRRect(barRect, paint);

      // Draw labels
      final textSpan = TextSpan(
        text: labels[i],
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: barWidth);

      textPainter.paint(
        canvas,
        Offset(i * barWidth + (barWidth - textPainter.width) / 4,
            size.height - 17),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
