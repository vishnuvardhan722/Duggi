import 'package:flutter/widgets.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onclick;
  final double height;
  final double width;
  const GoogleSignInButton(
      {super.key,
      required this.onclick,
      required this.height,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: BconstantColors.basecolor), // Border color
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Google Logo
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 11),
              child: Image.asset(
                'assets/images/google.png',
                height: 24,
                width: 24,
              ),
            ),
            SizedBox(
                width: SizeConfig.blockSizeHorizontal! *
                    3), // Spacing between logo and text
            // Button Text
            Text(
              'Continue with Google',
              style: kPopinsSemiBold.copyWith(
                  fontSize: SizeConfig.screenWidth! * 0.03,
                  color: BconstantColors.txt2color),
            ),
          ],
        ),
      ),
    );
  }
}
