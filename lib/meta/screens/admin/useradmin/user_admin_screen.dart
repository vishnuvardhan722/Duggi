import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';
import 'package:paxzadmin/meta/screens/admin/useradmin/funds_screen.dart';
import 'package:paxzadmin/meta/screens/admin/useradmin/overview_screen.dart';
import 'package:paxzadmin/meta/screens/admin/useradmin/users_screen.dart';

class UserAdminScreen extends StatefulWidget {
  const UserAdminScreen({super.key});

  @override
  State<UserAdminScreen> createState() => _UserAdminScreenState();
}

class _UserAdminScreenState extends State<UserAdminScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  final List<String> topics = ["Overview", "Users", "Funds"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: topics.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: BconstantColors.basecolor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double maxWidth = width > 1200 ? 1100 : width * 0.95;
          double fontSize = width > 1000 ? 18 : 14;
          double spacing = width > 1000 ? 24 : 16;
          double iconSize = width > 1000 ? 28 : 22;
          double titleFont = fontSize + 6;

          final Shader linearGradient1 = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              BconstantColors.tabtxtColor,
              BconstantColors.txt2color,
            ],
          ).createShader(Rect.fromLTWH(0, 0, width, 100));

          final Shader linearGradient2 = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              BconstantColors.tabtxtColor,
              BconstantColors.tabtxtColor,
            ],
          ).createShader(Rect.fromLTWH(0, 0, width, 100));

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                children: [
                  SizedBox(height: spacing * 0.8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.jpg',
                          height: 45,
                          width: 45,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: spacing),
                        Expanded(
                          child: Text(
                            "User Admin",
                            textAlign: TextAlign.center,
                            style: kPopinsSemiBold.copyWith(
                              fontSize: titleFont,
                              color: BconstantColors.txt1color,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: iconSize,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing),
                    child: TabBar(
                      controller: tabController,
                      isScrollable: true,
                      indicatorWeight: 3.5,
                      indicatorSize: TabBarIndicatorSize.label,
                      dividerColor: Colors.transparent,
                      indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: BconstantColors.tabtxtColor,
                            width: 2.7,
                          ),
                        ),
                      ),
                      labelPadding: EdgeInsets.symmetric(horizontal: spacing),
                      labelStyle: kPopinsMedium.copyWith(
                        fontSize: fontSize,
                        foreground: Paint()..shader = linearGradient2,
                      ),
                      unselectedLabelStyle: kPopinsMedium.copyWith(
                        fontSize: fontSize * 0.95,
                        foreground: Paint()..shader = linearGradient1,
                      ),
                      tabs: topics
                          .map((t) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  t,
                                  style: kPopinsSemiBold.copyWith(
                                      fontSize: fontSize),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: spacing / 2),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        OverviewScreen(),
                        UsersScreen(),
                        FundsScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
