import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/presentation/pages/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../getx/sign_up_controller.dart';
import '../../widgets/flux_image.dart';
import '../../widgets/oval_btn_widget.dart';

class SignUpPage extends StatelessWidget {
  static const String id = "/signUp";

  final logic = Get.put(SignUpController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var obscureText = true;

    return Scaffold(
      backgroundColor: kLightAccent,
      body: SafeArea(
        child: GetBuilder<SignUpController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    kCreateAccountTxt.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
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
                                alignment: Alignment.center,
                                child: InkWell(
                                  child: (controller.isAttached == false)
                                      ? FluxImage(
                                          imageUrl: kAvatarUserImg,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          logic.image,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                  onTap: () async {
                                    await controller.getImage();
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      /// full name
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: kFullNameTxt.tr,
                                          labelStyle: TextStyle(
                                              fontSize: 10,
                                              color: kLightAccent),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black12),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kLightAccent),
                                          ),
                                        ),
                                        controller: nameController,
                                      ),
                                      SizedBox(height: 10),

                                      /// phone
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: kPhoneText.tr,
                                          labelStyle: TextStyle(
                                              fontSize: 10,
                                              color: kLightAccent),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black12),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kLightAccent),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        controller: phoneController,
                                      ),
                                      SizedBox(height: 10),

                                      /// email
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: kEmailTxt.tr,
                                          labelStyle: TextStyle(
                                              fontSize: 10,
                                              color: kLightAccent),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black12),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kLightAccent),
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: emailController,
                                      ),
                                      SizedBox(height: 10),

                                      /// password
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: kPasswordTxt.tr,
                                          labelStyle: TextStyle(
                                              fontSize: 10,
                                              color: kLightAccent),
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
                                            borderSide: BorderSide(
                                                color: Colors.black12),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kLightAccent),
                                          ),
                                        ),
                                        autofocus: false,
                                        obscureText:
                                            controller.isHiddenPassword,
                                        controller: passwordController,
                                      ),
                                      SizedBox(height: 10),

                                      /// password confirm
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: kConfirmPasswordTxt.tr,
                                          labelStyle: TextStyle(
                                              fontSize: 10,
                                              color: kLightAccent),
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
                                            borderSide: BorderSide(
                                                color: Colors.black12),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kLightAccent),
                                          ),
                                        ),
                                        autofocus: false,
                                        obscureText:
                                            controller.isHiddenPassword,
                                        controller: passwordConfController,
                                      ),

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
                                          InkWell(
                                            child: Text(
                                              kSignInTxt.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(
                                                    color: kLightAccent,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                            onTap: () {
                                              Get.to(() => SignInPage());
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      if (controller.isLoading) ...[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator()
                                          ],
                                        ),
                                      ] else ...[
                                        OvalButtonWdgt(
                                            text: kSignUpTxt.tr.toUpperCase(),
                                            onPressed: () {
                                              if (!logic.isAttached) {
                                                Get.snackbar(kSignUpTxt,
                                                    "you must attached profile Image  ",
                                                    backgroundColor:
                                                        Colors.deepOrange);
                                                return;
                                              }
                                              bool isAllTextFill =
                                                  nameController
                                                          .text.isNotEmpty &&
                                                      phoneController
                                                          .text.isNotEmpty &&
                                                      emailController
                                                          .text.isNotEmpty &&
                                                      passwordConfController
                                                          .text.isNotEmpty &&
                                                      passwordController
                                                          .text.isNotEmpty;
                                              if (!isAllTextFill) {
                                                Get.snackbar(kSignUpTxt,
                                                    "you must write all information ",
                                                    backgroundColor:
                                                        Colors.deepOrange);
                                                return;
                                              }
                                              if (_formSignInKey.currentState!
                                                  .validate()) {
                                                if (passwordController.text ==
                                                    passwordConfController
                                                        .text) {
                                                  print(
                                                      "upload image path :${controller.image}");
                                                  controller.registerNewStudent(
                                                      RegisterModel(
                                                          name: nameController
                                                              .text,
                                                          email: emailController
                                                              .text,
                                                          phone: phoneController
                                                              .text,
                                                          password:
                                                              passwordController
                                                                  .text),
                                                      controller.image);
                                                } else {
                                                  Get.snackbar(kSignUpTxt,
                                                      "password not the same",
                                                      backgroundColor:
                                                          Colors.red);
                                                }
                                              }
                                            }),
                                      ],
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
          );
        }),
      ),
    );
  }
}
