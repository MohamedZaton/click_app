import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../getx/sign_in_controller.dart';
import '../../widgets/oval_btn_widget.dart';
import '../sign_up/sign_up_view.dart';

class SignInPage extends StatelessWidget {
  static const String id = "/signIn";

  final logic = Get.put(SignInController());
  final _formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var obscureText = true;

    return Scaffold(
      backgroundColor: kLightAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ScreenDevices.heigth(context) * 0.05,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                kHelloLogInTxt.tr,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              /// form login edit text and buttons
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formSignInKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: kEmailTxt.tr,
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: kLightAccent),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kLightAccent),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: kPasswordTxt.tr,
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: kLightAccent),
                                      suffixIcon: Icon(
                                        true
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: kLightAccent,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kLightAccent),
                                      ),
                                    ),
                                    autofocus: false,
                                    obscureText: obscureText,
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        child: Text(
                                          kForgotPasswordTxt.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: kLightAccent),
                                        ),
                                        onTap: () {
                                          /// tap forget password
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        kInitAccountTxt.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(color: kDarkGray),
                                      ),
                                      InkWell(
                                        child: Text(
                                          kSignUpTxt.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                color: kLightAccent,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                        onTap: () {
                                          Get.to(SignUpPage());

                                          /// tap forget password
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  OvalButtonWdgt(
                                      text: kSignInTxt.tr.toUpperCase(),
                                      onPressed: () {
                                        Get.to(() => HomePage());
                                      }),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
