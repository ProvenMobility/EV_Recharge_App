import 'package:evcharge/app/routes/app_routes.dart';
import 'package:evcharge/base/color_data.dart';
import 'package:evcharge/base/constant.dart';
import 'package:evcharge/base/resizer/fetch_pixels.dart';
import 'package:evcharge/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookSlot extends StatefulWidget {
  const BookSlot({Key? key}) : super(key: key);

  @override
  State<BookSlot> createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {
  void finish() {
    Constant.backToPrev(context);
  }

  var vehicle = ["BYD", "Hyundai", "Tesla"];
  var fuel = ["AC", "DC"];
  var connection = ["CCS", "CCS Combo", "Tesla"];
  var connectionType = "CCS";
  String fuelType = "DC";
  String vehicleName = "Hyundai";
  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();

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
              Get.toNamed(Routes.bookSlotDetailRoute);
            }, 16,
                weight: FontWeight.w700,
                buttonHeight: FetchPixels.getPixelHeight(56),
                borderRadius:
                    BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          ),
          body: SafeArea(
            child: getPaddingWidget(
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
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
                  getVerSpace(FetchPixels.getPixelHeight(23)),
                  Expanded(
                      flex: 1,
                      child: ListView(
                        primary: true,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          getCustomFont('Hello Nabil', 20, Colors.black, 1,
                              fontWeight: FontWeight.w500),
                          getVerSpace(FetchPixels.getPixelHeight(13)),
                          getMultilineCustomFont(
                              "Please fill all detail to start booking",
                              14,
                              subtext,
                              fontWeight: FontWeight.w400,
                              txtHeight: FetchPixels.getPixelHeight(1.5)),
                          getVerSpace(FetchPixels.getPixelHeight(30)),
                          getCustomFont(
                              "Select your vehicle type", 14, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(6)),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: FetchPixels.getPixelHeight(15)),
                            alignment: Alignment.center,
                            height: FetchPixels.getPixelHeight(56),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    FetchPixels.getPixelHeight(12)),
                                border: Border.all(
                                    color: borderColor,
                                    width: FetchPixels.getPixelHeight(1))),
                            child: DropdownButton<String>(
                              value: vehicleName,
                              items: vehicle.map((String e) {
                                return DropdownMenuItem(
                                    value: e,
                                    child: getCustomFont(e, 14, textColor, 1,
                                        fontWeight: FontWeight.w500));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  vehicleName = value!;
                                });
                              },
                              icon: getSvgImage("arrow_bottom.svg"),
                              isExpanded: true,
                              underline: Container(),
                            ),
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          getCustomFont(
                              "Select your vehicle model", 14, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(6)),
                          getsearchVehicle(
                              context, searchController, () {}, (value) {},
                              withPrefix: true),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          getCustomFont(
                              "Select your vehicle fuel", 14, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(6)),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: FetchPixels.getPixelHeight(15)),
                            alignment: Alignment.center,
                            height: FetchPixels.getPixelHeight(56),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    FetchPixels.getPixelHeight(12)),
                                border: Border.all(
                                    color: borderColor,
                                    width: FetchPixels.getPixelHeight(1))),
                            child: DropdownButton<String>(
                              value: fuelType,
                              items: fuel.map((String e) {
                                return DropdownMenuItem(
                                    value: e,
                                    child: getCustomFont(e, 14, textColor, 1,
                                        fontWeight: FontWeight.w500));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  fuelType = value!;
                                });
                              },
                              icon: getSvgImage("arrow_bottom.svg"),
                              isExpanded: true,
                              underline: Container(),
                            ),
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          getCustomFont(
                              "Select connection type", 14, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(6)),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: FetchPixels.getPixelHeight(15)),
                            alignment: Alignment.center,
                            height: FetchPixels.getPixelHeight(56),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    FetchPixels.getPixelHeight(12)),
                                border: Border.all(
                                    color: borderColor,
                                    width: FetchPixels.getPixelHeight(1))),
                            child: DropdownButton<String>(
                              value: connectionType,
                              items: connection.map((String e) {
                                return DropdownMenuItem(
                                    value: e,
                                    child: getCustomFont(e, 14, textColor, 1,
                                        fontWeight: FontWeight.w500));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  connectionType = value!;
                                });
                              },
                              icon: getSvgImage("arrow_bottom.svg"),
                              isExpanded: true,
                              underline: Container(),
                            ),
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(16)),
                          getCustomFont(
                              "Select date for your slot", 14, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(FetchPixels.getPixelHeight(6)),
                          getDefaultTextFiledWithLabel(
                              context, "Select date", dateController,
                              isEnable: false,
                              height: FetchPixels.getPixelHeight(56),
                              withprefix: false,
                              withSufix: true,
                              suffiximage: "calendar.svg"),
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
