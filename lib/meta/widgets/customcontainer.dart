import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

Widget customContainer({
  child,
}) {
  return Container(
      height: SizeConfig.screenHeight! * 0.81,
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: child);
}

Widget custombannerContainer({height, width, imagepath}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: BconstantColors.whitecolor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(
              imagepath,
            ),
            fit: BoxFit.contain),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ]),
  );
}
