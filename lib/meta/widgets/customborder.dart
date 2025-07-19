import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.grey, // Color of the left divider
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "or",
            style: kPopinsSemiBold.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                fontWeight: FontWeight.w600,
                color: BconstantColors.txt2color),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Colors.grey, // Color of the right divider
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
