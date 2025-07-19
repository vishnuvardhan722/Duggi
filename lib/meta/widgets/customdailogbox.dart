import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

void customshowDialog(
    {required BuildContext context, title, describe, btxt1, btxt2, onpressed}) {
  SizeConfig().init(context);
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Close Icon
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              // Title
              Text(
                title ?? "Log Out",
                style: kPopinsSemiBold.copyWith(
                  fontSize: SizeConfig.screenWidth! * 0.055,
                  color: BconstantColors.txt2color,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 2,
              ),
              // Message
              Text(
                describe ?? "Do you want to log out?",
                style: kPopinsRegular.copyWith(
                    fontSize: SizeConfig.screenWidth! * 0.039,
                    color: BconstantColors.txt2color),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 6,
              ),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        btxt1 ?? "Cancel",
                        style: kPopinsSemiBold.copyWith(
                          fontSize: SizeConfig.screenWidth! * 0.035,
                          color: BconstantColors.txt2color,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 2,
                  ),
                  // Log Out Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onpressed ??
                          () {
                            // Handle log out logic
                            Navigator.of(context).pop();
                          },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BconstantColors.buttonbgColor2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        btxt2 ?? "Log Out",
                        style: kPopinsSemiBold.copyWith(
                          fontSize: SizeConfig.screenWidth! * 0.035,
                          color: BconstantColors.txt1color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
