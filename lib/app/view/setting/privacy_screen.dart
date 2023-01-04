import 'package:evcharge/base/color_data.dart';
import 'package:evcharge/base/constant.dart';
import 'package:evcharge/base/resizer/fetch_pixels.dart';
import 'package:evcharge/base/widget_utils.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  void finish() {
    Constant.backToPrev(context);
  }

  var horSpace = FetchPixels.getPixelHeight(20);

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
            child: getPaddingWidget(
              EdgeInsets.symmetric(horizontal: horSpace),
              Column(
                children: [
                  getVerSpace(FetchPixels.getPixelHeight(10)),
                  Row(
                    children: [
                      InkWell(
                        child: getSvgImage("arrow_left.svg"),
                        onTap: () {
                          finish();
                        },
                      ),
                      getHorSpace(FetchPixels.getPixelHeight(16)),
                      getCustomFont("Privacy Policy", 24, Colors.black, 1,
                          fontWeight: FontWeight.w700)
                    ],
                  ),
                  getVerSpace(FetchPixels.getPixelHeight(30)),
                  Expanded(
                      flex: 1,
                      child: ListView(
                        primary: true,
                        shrinkWrap: true,
                        children: [
                          getCustomFont("1. Types of Data we collect", 17,
                              Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          getMultilineCustomFont(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              14,
                              subtext,
                              fontWeight: FontWeight.w500,
                              txtHeight: FetchPixels.getPixelHeight(1.5)),
                          getVerSpace(FetchPixels.getPixelHeight(30)),
                          getCustomFont("2. Use of your personal Data", 17,
                              Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          getMultilineCustomFont(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              14,
                              subtext,
                              fontWeight: FontWeight.w500,
                              txtHeight: FetchPixels.getPixelHeight(1.5)),
                          getVerSpace(FetchPixels.getPixelHeight(30)),
                          getCustomFont("3.Disclosure of your personal Data",
                              17, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          getMultilineCustomFont(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              14,
                              subtext,
                              fontWeight: FontWeight.w500,
                              txtHeight: FetchPixels.getPixelHeight(1.5))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          finish();
          return false;
        });
  }
}
