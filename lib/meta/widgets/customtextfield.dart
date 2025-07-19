import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final String text;
  final bool isPassword;
  final bool isobscure;
  final Widget? prefixIcon;
  final VoidCallback? ontap;
  final TextEditingController textcontroller;

  const CustomTextField(
      {super.key,
      required this.hinttext,
      required this.text,
      required this.textcontroller,
      this.isPassword = false,
      this.isobscure = false,
      this.ontap,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.07,
      //  color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            // Text field container with rounded border
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: BconstantColors.basecolor),
                  ),
                  child: TextField(
                    controller: textcontroller,
                    obscureText: isobscure,
                    decoration: InputDecoration(
                        hintText: hinttext,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                        suffixIcon: isPassword
                            ? GestureDetector(
                                onTap: ontap,
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                              )
                            : null,
                        prefixIcon: prefixIcon),
                  ),
                ),
              ),
            ),
            // Positioned label
            Positioned(
              left: 12,
              top: -SizeConfig.blockSizeHorizontal! * 2,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.white,
                  child: Text(
                    text,
                    style: kPopinsSemiBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        fontWeight: FontWeight.w600,
                        color: BconstantColors.txt2color),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
