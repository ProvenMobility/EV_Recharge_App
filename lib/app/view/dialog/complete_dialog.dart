import 'package:evcharge/app/routes/app_routes.dart';
import 'package:evcharge/base/color_data.dart';
import 'package:evcharge/base/constant.dart';
import 'package:evcharge/base/resizer/fetch_pixels.dart';
import 'package:evcharge/base/widget_utils.dart';
import 'package:flutter/material.dart';

class CompleteDialog extends StatefulWidget {
  const CompleteDialog({Key? key}) : super(key: key);

  @override
  State<CompleteDialog> createState() => _CompleteDialogState();
}

class _CompleteDialogState extends State<CompleteDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return ScaleTransition(
      scale: scaleAnimation,
      child: Dialog(
        insetPadding:
        EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(FetchPixels.getPixelHeight(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getVerSpace(FetchPixels.getPixelHeight(48)),
            getSvgImage("frame.svg"),
            getVerSpace(FetchPixels.getPixelHeight(16)),
            getCustomFont("Sucessfully !", 24, Colors.black, 1,
                fontWeight: FontWeight.w700),
            getVerSpace(FetchPixels.getPixelHeight(27)),
            getPaddingWidget(
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(39)),
              getMultilineCustomFont(
                  "You have been sucessfully completed for Sign in",
                  16,
                  Colors.black,
                  fontWeight: FontWeight.w500,
                  txtHeight: FetchPixels.getPixelHeight(1.3),
                  textAlign: TextAlign.center),
            ),
            getVerSpace(FetchPixels.getPixelHeight(35)),
            getPaddingWidget(
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(65)),
              getButton(context, buttonColor, "Ok", Colors.white, () {
                Constant.sendToNext(context, Routes.loginRoute);
              }, 16,
                  weight: FontWeight.w700,
                  buttonHeight: FetchPixels.getPixelHeight(56),
                  borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
            ),
            getVerSpace(FetchPixels.getPixelHeight(48)),
          ],
        ),
      ),
    );
  }
}
