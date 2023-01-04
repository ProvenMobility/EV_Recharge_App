import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evcharge/app/model/model_signup.dart';
import 'package:evcharge/app/routes/app_routes.dart';
import 'package:evcharge/base/color_data.dart';
import 'package:evcharge/base/constant.dart';
import 'package:evcharge/base/resizer/fetch_pixels.dart';
import 'package:evcharge/base/widget_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  void finish() {
    Constant.backToPrev(context);
  }
  String userID = FirebaseAuth.instance.currentUser!.uid;
  User? user = FirebaseAuth.instance.currentUser;

  SignUp currentuser = SignUp();
  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
    .collection('User').doc(user!.uid).get().then((value){
      this.currentuser = SignUp.fromMap(value.data());
      setState(() {});
    });
    super.initState();
    FirebaseAuth.instance.userChanges().asyncMap((User? user) =>
        FirebaseFirestore.instance
            .collection('User').doc(user!.uid).get().then((value){
          this.currentuser = SignUp.fromMap(value.data());
          setState(() {});
        })
    );
  }
  var horSpace = FetchPixels.getPixelHeight(20);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
                right: horSpace,
                left: horSpace,
                bottom: FetchPixels.getPixelHeight(30)),
            child: getButton(
              context,
              buttonColor,
              "Save Profile",
              Colors.white,
              () {
                // userUpdate(nameController.text, phoneController.text, emailController.text, userID);
                Get.toNamed(Routes.homeScreenRoute);
              },
              16,
              weight: FontWeight.w700,
              buttonHeight: FetchPixels.getPixelHeight(56),
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12)),
            ),
          ),
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
                      getCustomFont("Edit Profile", 24, Colors.black, 1,
                          fontWeight: FontWeight.w700)
                    ],
                  ),
                  getVerSpace(FetchPixels.getPixelHeight(20)),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      getAssetImage("nabil.png",
                          height: FetchPixels.getPixelHeight(100),
                          width: FetchPixels.getPixelHeight(100)),
                      Positioned(
                          child: Container(
                        padding: EdgeInsets.all(FetchPixels.getPixelHeight(7)),
                        width: FetchPixels.getPixelHeight(32),
                        height: FetchPixels.getPixelHeight(32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: containerShadow,
                                  blurRadius: 33,
                                  offset: const Offset(0, 7))
                            ],
                            borderRadius: BorderRadius.circular(
                                FetchPixels.getPixelHeight(20))),
                        child: getSvgImage("camera.svg"),
                      ))
                    ],
                  ),
                  getVerSpace(FetchPixels.getPixelHeight(30)),
                  getVerSpace(FetchPixels.getPixelHeight(30)),
                  getButtonWithIcon(
                      context, Colors.white, "Edit Name", Colors.black, () {
                    editname(context);
                  }, 14,
                      weight: FontWeight.w500,
                      buttonHeight: FetchPixels.getPixelHeight(56),
                      borderRadius:
                      BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                      boxShadow: [
                        BoxShadow(
                            color: containerShadow,
                            blurRadius: 33,
                            offset: const Offset(0, 7))
                      ],
                      prefixIcon: true,
                      prefixImage: "user.svg",
                      sufixIcon: true,
                      suffixImage: "arrow_right.svg"),
                  getVerSpace(FetchPixels.getPixelHeight(30)),
                  getButtonWithIcon(
                      context, Colors.white, "Edit Phone", Colors.black, () {
                    editphone(context);
                  }, 14,
                      weight: FontWeight.w500,
                      buttonHeight: FetchPixels.getPixelHeight(56),
                      borderRadius:
                      BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                      boxShadow: [
                        BoxShadow(
                            color: containerShadow,
                            blurRadius: 33,
                            offset: const Offset(0, 7))
                      ],
                      prefixIcon: true,
                      prefixImage: "user.svg",
                      sufixIcon: true,
                      suffixImage: "arrow_right.svg"),
                  getVerSpace(FetchPixels.getPixelHeight(30)),
                  getButtonWithIcon(
                      context, Colors.white, "Edit Email", Colors.black, () {
                    editemail(context);
                  }, 14,
                      weight: FontWeight.w500,
                      buttonHeight: FetchPixels.getPixelHeight(56),
                      borderRadius:
                      BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                      boxShadow: [
                        BoxShadow(
                            color: containerShadow,
                            blurRadius: 33,
                            offset: const Offset(0, 7))
                      ],
                      prefixIcon: true,
                      prefixImage: "user.svg",
                      sufixIcon: true,
                      suffixImage: "arrow_right.svg"),
                  // getDefaultTextFiledWithLabel(context, "${currentuser.name}", nameController,
                  //     isEnable: false,
                  //     height: FetchPixels.getPixelHeight(56),
                  //     withprefix: true,
                  //     image: "user.svg"),
                  // getVerSpace(FetchPixels.getPixelHeight(20)),
                  // getDefaultTextFiledWithLabel(
                  //     context, "${currentuser.phone}", phoneController,
                  //     isEnable: false,
                  //     height: FetchPixels.getPixelHeight(56),
                  //     withprefix: true,
                  //     image: "call_black.svg",
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.digitsOnly
                  //     ]),
                  // getVerSpace(FetchPixels.getPixelHeight(20)),
                  // getDefaultTextFiledWithLabel(
                  //     context, "${currentuser.email}", emailController,
                  //     isEnable: false,
                  //     height: FetchPixels.getPixelHeight(56),
                  //     withprefix: true,
                  //     image: "message.svg",
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.singleLineFormatter
                  //     ]),
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

  void editname(BuildContext e){
    String? name = currentuser.name;
    String cname = name!;

    final TextEditingController _nameController = TextEditingController();
    _nameController.value = TextEditingValue(
      text:name,
    );
    showModalBottomSheet(
        isScrollControlled:true,
        context: e,
        builder: (e) => Padding
          (padding: EdgeInsets.only(
            top:15,
            left:15,
            right:15,
            bottom: MediaQuery.of(e).viewInsets.bottom +15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () {
                updatename(_nameController.text, userID);
                Navigator.pop(context);
              },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                  )
                  , child: const Text('Submit'))
            ],
          ),
        )
    );
  }
  void editphone(BuildContext e){
    String? phone = currentuser.phone;
    String uphone = phone!;

    final TextEditingController _phoneController = TextEditingController();
    _phoneController.value = TextEditingValue(
      text:phone,
    );
    showModalBottomSheet(
        isScrollControlled:true,
        context: e,
        builder: (e) => Padding
          (padding: EdgeInsets.only(
            top:15,
            left:15,
            right:15,
            bottom: MediaQuery.of(e).viewInsets.bottom +15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () {
                updatephone(_phoneController.text, userID);
                Navigator.pop(context);
              },
                style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
              ), child: const Text('Submit'))
            ],
          ),
        )
    );
  }
  void editemail(BuildContext e){
    String? email = currentuser.email;
    String uemail = email!;

    final TextEditingController _emailController = TextEditingController();
    _emailController.value = TextEditingValue(
      text:email,
    );
    showModalBottomSheet(
        isScrollControlled:true,
        context: e,
        builder: (e) => Padding
          (padding: EdgeInsets.only(
            top:15,
            left:15,
            right:15,
            bottom: MediaQuery.of(e).viewInsets.bottom +15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () {
                updateemail(_emailController.text, userID);
                Navigator.pop(context);
              },style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
              ), child: const Text('Submit'))
            ],
          ),
        )
    );
  }

  void updatename(String name, String userID)async{
    final CollectionReference profile = FirebaseFirestore.instance.collection('User');
    return await profile.doc(userID).update({'name':name});
  }
  void updatephone(String phone, String userID)async{
    final CollectionReference profile = FirebaseFirestore.instance.collection('User');
    return await profile.doc(userID).update({'phone':phone});
  }
  void updateemail(String email, String userID)async{
    final CollectionReference profile = FirebaseFirestore.instance.collection('User');
    return await profile.doc(userID).update({'email':email});
  }
}
