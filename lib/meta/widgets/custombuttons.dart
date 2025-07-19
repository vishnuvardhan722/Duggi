import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class Custombutton1 extends StatelessWidget {
  final GestureTapCallback voidCallback;
  final double height;
  final double width;
  final String string;
  final Color? color;
  final double? radius;
  final TextStyle textstyle;
  const Custombutton1(
      {super.key,
      required this.height,
      required this.width,
      required this.string,
      required this.textstyle,
      required this.voidCallback,
      this.color,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? BconstantColors.buttonbgColor,
            borderRadius: BorderRadius.circular(radius ?? 20),
          ),
          child: Text(
            string,
            style: textstyle,
          ),
        ),
      ),
    );
  }
}

class VerifyButton extends StatefulWidget {
  final VoidCallback voidCallback;
  final double height;
  final double width;
  final String text1;
  final String text2;
  final String text3;
  final Color? color;
  final double? radius;
  final TextStyle textstyle;
  final bool? isLoading;
  final bool? isSuccess;
  const VerifyButton(
      {super.key,
      required this.voidCallback,
      required this.height,
      required this.width,
      required this.text1,
      this.color,
      this.radius,
      required this.textstyle,
      this.isLoading = false,
      this.isSuccess = false,
      required this.text2,
      required this.text3});
  @override
  VerifyButtonState createState() => VerifyButtonState();
}

class VerifyButtonState extends State<VerifyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.voidCallback,
      // () async {
      //   widget.voidCallback;
      //   setState(() {
      //     isLoading = true;
      //   });

      //   devtools.log("loading is called ");
      //   await Future.delayed(const Duration(seconds: 3));
      //   devtools.log("done is called ");
      //   setState(() {
      //     isLoading = false;
      //     isSuccess = true;
      //   });
      //   devtools.log("done ");
      // },
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.isSuccess!
              ? BconstantColors.green
              : widget.isLoading!
                  ? BconstantColors.buttonbgColor2.withOpacity(0.5)
                  : BconstantColors.buttonbgColor2,
          borderRadius: BorderRadius.circular(widget.radius ?? 20),
        ),
        // onPressed: isLoading ? null : startVerification,
        child: Center(
          child: widget.isLoading!
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.text2,
                      style: widget.textstyle,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.15,
                      height: SizeConfig.screenHeight! * 0.035,
                      // color: Colors.amber,
                      child: const LinearLoadingIndicator(),
                    ),
                  ],
                )
              : widget.isSuccess!
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.check_mark_circled_solid,
                            size: SizeConfig.screenWidth! * 0.04,
                            color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          widget.text3,
                          style: widget.textstyle,
                        ),
                      ],
                    )
                  : Text(
                      widget.text1,
                      style: widget.textstyle,
                    ),
        ),
      ),
    );
  }
}

class LinearLoadingIndicator extends StatefulWidget {
  const LinearLoadingIndicator({super.key});
  @override
  LinearLoadingIndicatorState createState() => LinearLoadingIndicatorState();
}

class LinearLoadingIndicatorState extends State<LinearLoadingIndicator> {
  int _activeDotIndex = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (context.mounted) {
        setState(() {
          _activeDotIndex = (_activeDotIndex + 1) % 3;
        });
      }
    });
  }

  @override
  void dispose() {
    _activeDotIndex = 0;
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _activeDotIndex == index ? 12 : 8,
          height: _activeDotIndex == index ? 12 : 8,
          decoration: BoxDecoration(
            color: _activeDotIndex == index
                ? BconstantColors.whitecolor
                : BconstantColors.whitecolor.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
