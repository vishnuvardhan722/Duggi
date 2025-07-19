import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';
import 'package:paxzadmin/meta/screens/admin/doctoradmin/funds_screen.dart';
import 'package:paxzadmin/meta/screens/admin/doctoradmin/overview_screen.dart';
import 'package:paxzadmin/meta/screens/admin/doctoradmin/psychologist_screen.dart';

class PsychologistAdminScreen extends StatefulWidget {
  const PsychologistAdminScreen({super.key});

  @override
  State<PsychologistAdminScreen> createState() =>
      _PsychologistAdminScreenState();
}

class _PsychologistAdminScreenState extends State<PsychologistAdminScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  final List<String> topics = ["Overview", "Doctors", "Funds"];

  @override
  void initState() {
    tabController = TabController(length: topics.length, vsync: this);
    super.initState();
  }

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
                child: Column(
                  children: [
                    SizedBox(height: spacing / 1.5),

                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo.jpg',
                          height: SizeConfig.screenHeight! * 0.08,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "Psychologist Admin",
                          style: kPopinsSemiBold.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.035,
                            color: BconstantColors.txt1color,
                          ),
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: SizeConfig.screenWidth! * 0.05,
                        ),
                      ],
                    ),

                    SizedBox(height: spacing),

                    // TabBar
                    TabBar(
                      controller: tabController,
                      isScrollable: true,
                      indicatorWeight: 3,
                      indicatorColor: BconstantColors.tabtxtColor,
                      labelColor: BconstantColors.tabtxtColor,
                      unselectedLabelColor: Colors.grey.shade400,
                      labelStyle: kPopinsMedium.copyWith(
                        fontSize: SizeConfig.screenWidth! * 0.018,
                      ),
                      unselectedLabelStyle: kPopinsMedium.copyWith(
                        fontSize: SizeConfig.screenWidth! * 0.016,
                      ),
                      tabs: topics
                          .map((text) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(text),
                              ))
                          .toList(),
                    ),

                    SizedBox(height: spacing),

                    // TabBarView
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          OverviewScreen(),
                          PsychologistScreen(),
                          FundsScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
