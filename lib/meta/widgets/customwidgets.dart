import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

Widget customTitle({title, onclick}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title ?? "Short Session",
        style: kPopinsSemiBold.copyWith(
            fontSize: SizeConfig.screenWidth! * 0.047,
            color: BconstantColors.txt2color),
      ),
      TextButton(
        onPressed: onclick,
        child: Text('See all',
            style: kPopinsRegular.copyWith(
                fontSize: SizeConfig.screenWidth! * 0.039,
                color: BconstantColors.buttonbgColor3)),
      ),
    ],
  );
}
