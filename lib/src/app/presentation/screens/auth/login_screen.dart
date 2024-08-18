
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:winlab/src/app/presentation/components/app_logo_widget.dart';
import 'package:winlab/src/app/presentation/components/custom_button.dart';
import 'package:winlab/src/app/presentation/components/global_text_field.dart';
import 'package:winlab/src/app/presentation/navbar/bottom_navbar.dart';
import 'package:winlab/src/app/presentation/routes/routes_navigator.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/consts.dart';
import 'package:winlab/src/app/presentation/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController healthController = TextEditingController();

  bool passwordVisibility = true;
  bool stayLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kbackgroundColor,
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal:kPadding * 6,vertical: kPadding * 2),
      //   child: Text.rich(
      //     TextSpan(
      //       text: "Bằng cách đăng nhập, bạn đồng ý với điều khoản sử dụng và  ",
      //       style: const TextStyle(
      //           fontSize: 15, fontWeight: FontWeight.w400, color: kBlackColor),
      //       children: [
      //         TextSpan(
      //           recognizer: TapGestureRecognizer()..onTap = () async {},
      //           text: "Chính sách bảo mật của winlab ",
      //           style: const TextStyle(
      //               fontSize: 15,
      //               fontWeight: FontWeight.w400,
      //               color: kPrimaryColor),
      //         )
      //       ],
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding * 2.5),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: kPadding * 15),

                  Center(
                    child: AppLogoWidget(
                      height: size.height / 100 * 10,
                    ),
                  ),
                  const SizedBox(height: kPadding * 10),

                  // <------------------------  EMAIL ------------------------>
                  GlobalTextField(
                    autofillHints: const [
                      AutofillHints.name,
                    ],
                    isFilled: true,
                    fieldTitle: "Tên đăng nhập",
                    controller: nameController,
                    hintText: "",
                    validator: (s) => Utils.validateInput(
                      s,
                    ),
                  ),
                  const SizedBox(height: kPadding * 3),

                  // <------------------------  PASSWORD ------------------------>
                  GlobalTextField(
                    autofillHints: const [
                      AutofillHints.password,
                    ],
                    controller: passwordController,
                    obscureText: passwordVisibility,
                    fieldTitle: "Mật khẩu",
                    hintText: "",
                    isFilled: true,
                    maxLine: 1,
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => passwordVisibility = !passwordVisibility,
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        passwordVisibility
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: kLightGreyColor,
                        size: 22.0,
                      ),
                    ),
                    validator: (s) => Utils.validateInput(s, minValue: 6),
                  ),
                  const SizedBox(height: kPadding * 3),

                  // <------------------------  Health ------------------------>
                  GlobalTextField(
                    autofillHints: const [
                      AutofillHints.name,
                    ],
                    controller: healthController,
                    hintText: "",
                    fieldTitle: "Cơ sở y tế",
                    maxLine: 1,
                    isFilled: true,
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: kGreyColor,
                      size: 22.0,
                    ),
                    validator: (s) => Utils.validateInput(s, minValue: 6),
                  ),
                
                  const SizedBox(height: kPadding * 3),

                  SizedBox(
                    height: size.height / 100 * 6,
                    child: CustomButton(
                        onPressed: () {
                          RouteNavigator.replacementroute(
                              context,
                              BottomNavBar(
                                selectedTab: 0,
                              ));
                        },
                        showLoadingIndicator: true,
                        text: "Đăng nhập"),
                  ),
                  const SizedBox(height: kPadding * 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
