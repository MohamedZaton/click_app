import 'package:click_app/src/core/utils/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/all_models.dart';
import '../../getx/sign_in_controller.dart';
import '../../widgets/oval_btn_widget.dart';
import '../sign_up/sign_up_view.dart';

class SignInPage extends StatelessWidget {
  static const String id = "/signIn";

  final logic = Get.put(SignInController());
  final _formSignInKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    GetBuilder<SignInController>(builder: (controller) {
                      return Form(
                        key: _formSignInKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(25),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    /// email input field
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
                                      controller: emailController,
                                    ),
                                    SizedBox(height: 16),

                                    /// password input field
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: kPasswordTxt.tr,
                                        labelStyle: TextStyle(
                                            fontSize: 15, color: kLightAccent),
                                        suffixIcon: InkWell(
                                          child: Icon(
                                            controller.isHiddenPassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: kLightAccent,
                                          ),
                                          onTap: () {
                                            controller.setPasswordHidden(
                                                !controller.isHiddenPassword);
                                          },
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
                                      obscureText: controller.isHiddenPassword,
                                      controller: passwordController,
                                    ),
/*                                  SizedBox(height: 20),
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
                                  ),*/
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          kInitAccountTxt.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: kDarkGray),
                                        ),

                                        /// tap  Sign up button
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
                                          },
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    if (!controller.isLoading) ...[
                                      OvalButtonWdgt(
                                        text: kSignInTxt.tr.toUpperCase(),
                                        onPressed: () {
                                          bool isAllTextFill =
                                              emailController.text.isNotEmpty &&
                                                  passwordController
                                                      .text.isNotEmpty;
                                          if (!isAllTextFill) {
                                            Get.snackbar(kSignInTxt,
                                                "you must write all information ",
                                                backgroundColor:
                                                    Colors.deepOrange);
                                            return;
                                          }
                                          if (_formSignInKey.currentState!
                                              .validate()) {
                                            controller.loginUser(
                                              LogInModel(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text),
                                            );
                                          }
                                        },
                                      ),
                                    ] else ...[
                                      Container(
                                        child: CircularProgressIndicator(
                                            color: kDarkAccent),
                                      ),
                                    ],
                                  ]),
                            )
                          ],
                        ),
                      );
                    }),
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
