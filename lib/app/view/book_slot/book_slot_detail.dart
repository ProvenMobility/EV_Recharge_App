import 'package:evcharge/app/routes/app_routes.dart';
import 'package:evcharge/base/color_data.dart';
import 'package:evcharge/base/constant.dart';
import 'package:evcharge/base/resizer/fetch_pixels.dart';
import 'package:evcharge/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookSlotDetail extends StatefulWidget {
  const BookSlotDetail({Key? key}) : super(key: key);

  @override
  State<BookSlotDetail> createState() => _BookSlotDetailState();
}

class _BookSlotDetailState extends State<BookSlotDetail> {
  void finish() {
    Constant.backToPrev(context);
  }

  var horSpace = FetchPixels.getPixelHeight(20);
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
                bottom: FetchPixels.getPixelHeight(30),
                right: FetchPixels.getPixelHeight(20),
                left: FetchPixels.getPixelHeight(20)),
            child: getButton(context, buttonColor, "Next", Colors.white, () {
              Get.toNamed(Routes.bookSlotPaymentRoute);
            }, 16,
                weight: FontWeight.w700,
                buttonHeight: FetchPixels.getPixelHeight(56),
                borderRadius:
                    BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          ),
          body: SafeArea(
            child: getPaddingWidget(
              EdgeInsets.symmetric(horizontal: horSpace),
              Column(
                children: [
                  getVerSpace(FetchPixels.getPixelHeight(10)),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          finish();
                        },
                        child: getSvgImage("arrow_left.svg"),
                      ),
                      getHorSpace(FetchPixels.getPixelHeight(16)),
                      getCustomFont("Book Slot", 24, Colors.black, 1,
                          fontWeight: FontWeight.w700)
                    ],
                  ),
                  getVerSpace(FetchPixels.getPixelHeight(34)),
                  Expanded(
                      flex: 1,
                      child: ListView(
                        primary: true,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          getAssetImage("ioniq-circle.png",
                              width: FetchPixels.getPixelHeight(350),
                              height: FetchPixels.getPixelHeight(213)),
                          getVerSpace(FetchPixels.getPixelHeight(30)),
                          getCustomFont("Hyundai Ioniq 5", 22, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont("Battery", 14, Colors.black, 1,
                                  fontWeight: FontWeight.w700),
                              getCustomFont("2.9Kwh", 14, textColor, 1,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont("Slot Date", 14, Colors.black, 1,
                                  fontWeight: FontWeight.w700),
                              getCustomFont("10 December,2022", 14, textColor, 1,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont("Slot time", 14, Colors.black, 1,
                                  fontWeight: FontWeight.w700),
                              getCustomFont("6:00 PM", 14, textColor, 1,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont(
                                  "Connection Type", 14, Colors.black, 1,
                                  fontWeight: FontWeight.w700),
                              getCustomFont("CCS2", 14, textColor, 1,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomFont("Battery", 14, Colors.black, 1,
                                      fontWeight: FontWeight.w700),
                                  getVerSpace(FetchPixels.getPixelHeight(8)),
                                  getCustomFont("2.9Kwh", 14, textColor, 1,
                                      fontWeight: FontWeight.w700)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomFont("Time", 14, Colors.black, 1,
                                      fontWeight: FontWeight.w700),
                                  getVerSpace(FetchPixels.getPixelHeight(8)),
                                  getCustomFont("45 min", 14, textColor, 1,
                                      fontWeight: FontWeight.w700)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomFont("Price", 14, Colors.black, 1,
                                      fontWeight: FontWeight.w700),
                                  getVerSpace(FetchPixels.getPixelHeight(8)),
                                  getCustomFont("\RM1.20 / min", 14, textColor, 1,
                                      fontWeight: FontWeight.w700)
                                ],
                              )
                            ],
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(22)),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: FetchPixels.getPixelHeight(16)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    FetchPixels.getPixelHeight(12)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: shadowColor,
                                      blurRadius: 33,
                                      offset: const Offset(0, 7))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getVerSpace(FetchPixels.getPixelHeight(16)),
                                getCustomFont("Set fix amount of charging", 14,
                                    Colors.black, 1,
                                    fontWeight: FontWeight.w700),
                                getVerSpace(FetchPixels.getPixelHeight(8)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SliderTheme(
                                        data: SliderThemeData(
                                            trackHeight:
                                                FetchPixels.getPixelHeight(6),
                                            thumbShape: RoundSliderThumbShape(
                                                enabledThumbRadius:
                                                    FetchPixels.getPixelHeight(
                                                        8)),
                                            overlayShape:
                                                SliderComponentShape.noThumb),
                                        child: Slider(
                                          value: _value.toDouble(),
                                          min: 0.0,
                                          max: 500.0,
                                          activeColor: buttonColor,
                                          inactiveColor: progressColor,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              _value = newValue.round();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    getHorSpace(FetchPixels.getPixelHeight(22)),
                                    getCustomFont(
                                        "\RM$_value", 14, Colors.black, 1,
                                        fontWeight: FontWeight.w600)
                                  ],
                                ),
                                getVerSpace(FetchPixels.getPixelHeight(19)),
                              ],
                            ),
                          )
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
