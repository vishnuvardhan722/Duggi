import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paxzadmin/app/constants/app_route_constants.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';
import 'package:paxzadmin/meta/widgets/customappbar.dart';
import 'package:paxzadmin/meta/widgets/custombuttons.dart';
import 'package:paxzadmin/meta/widgets/customcontainer.dart';
import 'dart:developer' as devtools show log;

class AdminSelectionScreen extends StatefulWidget {
  const AdminSelectionScreen({super.key});

  @override
  State<AdminSelectionScreen> createState() => _AdminSelectionScreenState();
}

class _AdminSelectionScreenState extends State<AdminSelectionScreen> {
  bool isLoading = false;
  bool isSuccess = false;
  String? selectedAdmin;

  static const String userAdmin = 'User Admin';
  static const String psychologistAdmin = 'Psychologist Admin';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;

    return Scaffold(
      backgroundColor: BconstantColors.basecolor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 700,
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const CustomAppbar(),
                        const SizedBox(height: 20),
                        Expanded(
                          child: customContainer(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Select Your Admin",
                                    textAlign: TextAlign.center,
                                    style: kPopinsSemiBold.copyWith(
                                      fontSize: isWide ? 26 : 20,
                                      color: BconstantColors.txt2color,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  _buildAdminButton(
                                    label: userAdmin,
                                    isSelected: selectedAdmin == userAdmin,
                                    onTap: () {
                                      setState(() {
                                        selectedAdmin = userAdmin;
                                        isLoading = false;
                                        isSuccess = false;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  _buildAdminButton(
                                    label: psychologistAdmin,
                                    isSelected:
                                        selectedAdmin == psychologistAdmin,
                                    onTap: () {
                                      setState(() {
                                        selectedAdmin = psychologistAdmin;
                                        isLoading = false;
                                        isSuccess = false;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  // Responsive image height
                                  Flexible(
                                    child: custombannerContainer(
                                      height: 200,
                                      width: double.infinity,
                                      imagepath: 'assets/images/passw.png',
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  VerifyButton(
                                    isLoading: isLoading,
                                    isSuccess: isSuccess,
                                    radius: 30,
                                    height: 55,
                                    width: double.infinity,
                                    text1: "Next",
                                    text2: "Loading...",
                                    text3: "Done",
                                    color: BconstantColors.buttonbgColor2,
                                    textstyle: kPopinsSemiBold.copyWith(
                                      fontSize: 16,
                                      color: BconstantColors.txt1color,
                                    ),
                                    voidCallback: () async {
                                      devtools.log("Next button clicked");
                                      if (selectedAdmin == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Please select an admin type'),
                                          ),
                                        );
                                        return;
                                      }
                                      setState(() => isLoading = true);
                                      await Future.delayed(
                                          const Duration(seconds: 2));
                                      if (!mounted) return;
                                      setState(() {
                                        isLoading = false;
                                        isSuccess = true;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      if (!mounted) return;
                                      setState(() => isSuccess = false);
                                      if (selectedAdmin == userAdmin) {
                                        context.pushNamed(MyAppRouteConstants
                                            .useradminRouteName);
                                      } else {
                                        context.pushNamed(MyAppRouteConstants
                                            .doctoradminRouteName);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }

  Widget _buildAdminButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        backgroundColor:
            isSelected ? BconstantColors.buttonbgColor2 : Colors.white,
        side: const BorderSide(color: BconstantColors.buttonbgColor2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
      ),
      child: Text(
        label,
        style: kPopinsSemiBold.copyWith(
          fontSize: 18,
          color: isSelected ? Colors.white : BconstantColors.buttonbgColor2,
        ),
      ),
    );
  }
}
