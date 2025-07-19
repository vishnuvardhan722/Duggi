import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';
import 'package:paxzadmin/meta/widgets/custombuttons.dart';
import 'package:paxzadmin/meta/widgets/customcontainer.dart';

class Custominto extends StatelessWidget {
  final String introimage;
  final String title;
  final String description;
  final String buttontxt;
  final bool isFirst;
  final VoidCallback onclick;

  const Custominto(
      {super.key,
      required this.introimage,
      required this.title,
      required this.description,
      required this.buttontxt,
      required this.onclick,
      required this.isFirst});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 8.3,
          ),
          Container(
            height: SizeConfig.screenHeight! * 0.27,
            width: SizeConfig.screenWidth! * 0.85,
            decoration: BoxDecoration(
                color: BconstantColors.whitecolor,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(introimage
                        // 'assets/images/intro1.jpg',
                        ),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]),
            // child: Image.asset(
            //   introimage,
            //   height: SizeConfig.screenHeight! * 0.25,
            //   width: SizeConfig.screenWidth! * 0.8,
            // ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 17,
          ),
          Container(
            height: SizeConfig.screenHeight! * 0.38,
            width: SizeConfig.screenWidth! * 0.85,
            decoration: BoxDecoration(
                color: BconstantColors.whitecolor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal! * 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // First Dot
                    Container(
                      width: isFirst ? 16 : 12,
                      height: 9,
                      decoration: BoxDecoration(
                          color: isFirst
                              ? BconstantColors.basecolor
                              : Colors.grey.shade400, // Dark blue color
                          borderRadius: BorderRadius.circular(9)),
                    ),
                    const SizedBox(width: 4), // Space between the dots
                    // Second Dot
                    Container(
                      width: isFirst ? 12 : 16,
                      height: 9,
                      decoration: BoxDecoration(
                          color: isFirst
                              ? Colors.grey.shade400
                              : BconstantColors.basecolor, // Light grey color
                          borderRadius: BorderRadius.circular(9)),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal! * 15,
                ),
                Text(
                  title,
                  style: kPopinsBold.copyWith(
                      fontSize: SizeConfig.screenWidth! * 0.05,
                      color: BconstantColors.txt2color),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal! * 3,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: description,
                    style: kPopinsRegular.copyWith(
                        fontSize: SizeConfig.screenWidth! * 0.034,
                        color: BconstantColors.txt2color),
                    children: [
                      TextSpan(
                        text: ' Anytime, Anywhere',
                        style: kPopinsSemiBold.copyWith(
                            fontSize: SizeConfig.screenWidth! * 0.034,
                            color: BconstantColors.txt2color),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal! * 15,
                ),
                Custombutton1(
                  height: SizeConfig.screenHeight! * 0.049,
                  width: SizeConfig.screenWidth! * 0.6,
                  string: "Continue",
                  textstyle: kPopinsSemiBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      fontWeight: FontWeight.w600,
                      color: BconstantColors.txt1color),
                  voidCallback: onclick
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const MainScreen(),
                  //   ),
                  // );
                  ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
