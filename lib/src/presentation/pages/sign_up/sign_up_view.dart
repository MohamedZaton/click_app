import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../getx/sign_up_controller.dart';
import '../../widgets/flux_image.dart';
import '../../widgets/oval_btn_widget.dart';

class SignUpPage extends StatelessWidget {
  static const String id = "/signUp";

  final logic = Get.put(SignUpController());
  final _formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var obscureText = true;

    return Scaffold(
      backgroundColor: kLightAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  kCreateAccountTxt,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),

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
                            Align(
                              child: FluxImage(
                                  imageUrl: "assets/images/avatar_sign_up.png"),
                              alignment: Alignment.center,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: kFullNameTxt,
                                        labelStyle: TextStyle(
                                            fontSize: 20, color: kLightAccent),
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
                                        labelText: kEmailTxt,
                                        labelStyle: TextStyle(
                                            fontSize: 20, color: kLightAccent),
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
                                        labelText: kPasswordTxt,
                                        labelStyle: TextStyle(
                                            fontSize: 20, color: kLightAccent),
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
                                    SizedBox(height: 16),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: kConfirmPasswordTxt,
                                        labelStyle: TextStyle(
                                            fontSize: 20, color: kLightAccent),
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
                                            kForgotPasswordTxt,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          kInitAccountText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: kDarkGray),
                                        ),
                                        InkWell(
                                          child: Text(
                                            kSignInText,
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
                                            /// tap forget password
                                          },
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    OvalButtonWdgt(
                                        text: kSignUpText.toUpperCase(),
                                        onPressed: () {}),
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
      ),
    );
  }
}
