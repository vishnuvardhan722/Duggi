import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.02,
          vertical: SizeConfig.screenHeight! * 0.01,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.10,
              width: SizeConfig.screenWidth! * 0.18,
              child: Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth! * 0.05),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome to PAX-Z",
                      style: kPopinsSemiBold.copyWith(
                        fontSize: SizeConfig.screenWidth! * 0.06,
                        color: BconstantColors.txt1color,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 15),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your mental health matters",
                      style: kPopinsRegular.copyWith(
                        fontSize: SizeConfig.screenWidth! * 0.04,
                        fontWeight: FontWeight.w100,
                        color: BconstantColors.txt1color,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
