// import 'package:evcharge/app/routes/app_routes.dart';
// import 'package:evcharge/base/color_data.dart';
// import 'package:evcharge/base/constant.dart';
// import 'package:evcharge/base/pref_data.dart';
// import 'package:evcharge/base/resizer/fetch_pixels.dart';
// import 'package:evcharge/base/widget_utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   void finishView() {
//     Constant.closeApp();
//   }
//   final auth = FirebaseAuth.instance;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   var ispass = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: backGroundColor,
//           bottomNavigationBar: Container(
//             padding: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(30)),
//             child: GestureDetector(
//               onTap: () {
//                 Constant.sendToNext(context, Routes.signupRoute);
//               },
//               child: getRichText(
//                   "Don’t have an Account ? ",
//                   Colors.black,
//                   FontWeight.w400,
//                   16,
//                   "Sign up",
//                   buttonColor,
//                   FontWeight.w600,
//                   16),
//             ),
//           ),
//           body: SafeArea(
//             child: getPaddingWidget(
//               EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
//               Column(
//                 children: [
//                   getVerSpace(FetchPixels.getPixelHeight(46)),
//                   getCustomFont("Login", 24, Colors.black, 1,
//                       fontWeight: FontWeight.w700),
//                   getVerSpace(FetchPixels.getPixelHeight(37)),
//                   getDefaultTextFiledWithLabel(
//                       context, "Email", emailController,
//                       isEnable: false,
//                       height: FetchPixels.getPixelHeight(56),
//                       withprefix: true,
//                       image: "message.svg",
//                   ),
//                   getVerSpace(FetchPixels.getPixelHeight(20)),
//                   getDefaultTextFiledWithLabel(
//                       context, "Password", passwordController,
//                       isEnable: false,
//                       height: FetchPixels.getPixelHeight(56),
//                       withprefix: true,
//                       image: "lock.svg",
//                       withSufix: true,
//                       suffiximage: "eye.svg",
//                       isPass: ispass, imagefunction: () {
//                     setState(() {
//                       !ispass ? ispass = true : ispass = false;
//                     });
//                   }),
//                   getVerSpace(FetchPixels.getPixelHeight(20)),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: GestureDetector(
//                       onTap: () {
//                         Constant.sendToNext(context, Routes.forgotRoute);
//                       },
//                       child: getCustomFont(
//                           "Forgot Password?", 16, Colors.black, 1,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   getVerSpace(FetchPixels.getPixelHeight(30)),
//                   getButton(context, buttonColor, "Login", Colors.white, () {
//                     PrefData.setLogIn(true);
//                     Constant.sendToNext(context, Routes.homeScreenRoute);
//                   }, 16,
//                       weight: FontWeight.w700,
//                       buttonHeight: FetchPixels.getPixelHeight(56),
//                       borderRadius: BorderRadius.circular(
//                           FetchPixels.getPixelHeight(12))),
//                   getVerSpace(FetchPixels.getPixelHeight(20)),
//                   getCustomFont("Or Sign in With", 16, Colors.black, 1,
//                       fontWeight: FontWeight.w400, textAlign: TextAlign.center),
//                   getVerSpace(FetchPixels.getPixelHeight(30)),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: getButton(
//                           context,
//                           Colors.white,
//                           "Google",
//                           Colors.black,
//                           () {},
//                           16,
//                           weight: FontWeight.w500,
//                           isIcon: true,
//                           image: "google.svg",
//                           borderRadius: BorderRadius.circular(
//                               FetchPixels.getPixelHeight(12)),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: shadowColor,
//                                 blurRadius: 33,
//                                 offset: const Offset(0, 7))
//                           ],
//                           buttonHeight: FetchPixels.getPixelHeight(53),
//                         ),
//                       ),
//                       getHorSpace(FetchPixels.getPixelHeight(25)),
//                       Expanded(
//                         child: getButton(context, Colors.white, "Facebook",
//                             Colors.black, () {}, 16,
//                             weight: FontWeight.w500,
//                             isIcon: true,
//                             image: "facebook.svg",
//                             borderRadius: BorderRadius.circular(
//                                 FetchPixels.getPixelHeight(12)),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: shadowColor,
//                                   blurRadius: 33,
//                                   offset: const Offset(0, 7))
//                             ],
//                             buttonHeight: FetchPixels.getPixelHeight(53)),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         onWillPop: () async {
//           finishView();
//           return false;
//         });
//   }
// }

import 'package:evcharge/app/routes/app_routes.dart';
import 'package:evcharge/base/color_data.dart';
import 'package:evcharge/base/constant.dart';
import 'package:evcharge/base/pref_data.dart';
import 'package:evcharge/base/resizer/fetch_pixels.dart';
import 'package:evcharge/base/widget_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  final Function( String? email, String? password)? onSubmitted;

  const LoginScreen({this.onSubmitted, Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  late String email, password;
  String? emailError, passwordError;
  Function(String? email, String? password)? get onSubmitted => widget.onSubmitted;


  @override
  void initState() {
    super.initState();
    email = "";
    password = "";

    emailError = null;
    passwordError = null;
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      setState(() {
        emailError = "Email is invalid";
      });
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = "Please enter a password";
      });
      isValid = false;
    }

    return isValid;
  }


  Future<void> submit() async{

    if (validate()){
      final users = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(users != null){
        Constant.sendToNext(context, Routes.homeScreenRoute);

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .075),
            const Text(
              "Welcome,",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              "Sign in to continue!",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black.withOpacity(.6),
              ),
            ),

            SizedBox(height: screenHeight * .05),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: "Email",
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              onSubmitted: (val) => submit(),
              labelText: "Password",
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: screenHeight * .075,
            ),
            ElevatedButton.icon(style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity,50),
            ),
              icon: const FaIcon(FontAwesomeIcons.google,color:Colors.red),
              label: const Text('Or login with Google'),
              //change page here after already login
              onPressed: () async {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
                Constant.sendToNext(context, Routes.homeScreenRoute);

              },
            ),
            FormButton(
                text: "Log In",
                onPressed: submit
            ),
            SizedBox(height: screenHeight * .05,),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                  Constant.sendToNext(
                      context, Routes.signupRoute),
              ),
              child: RichText(
                text: const TextSpan(
                  text: "I'm a new user, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
      ])
    ));
  }
}

class FormButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  const FormButton({this.text = "", this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;
  const InputField(
      {this.labelText,
        this.onChanged,
        this.onSubmitted,
        this.errorText,
        this.keyboardType,
        this.textInputAction,
        this.autoFocus = false,
        this.obscureText = false,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

Widget customSwitch(String text, bool val, Function onChangeMethod) {
  return Padding (
    padding: const EdgeInsets.only (top: 20.0, left: 10.0, right: 150.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            color: Colors.black
        )), // TextStyle, Text
        const Spacer(),
        CupertinoSwitch(
            trackColor: Colors.grey,
            activeColor: Colors.blue,
            value: val,
            onChanged: (newValue) {
              onChangeMethod(newValue);
            }
        )
      ],
    ),
  );
}