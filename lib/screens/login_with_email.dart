import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sspos/Repositry/login_repo.dart';
import 'package:sspos/uttils/constant.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:sspos/uttils/widgets/button_global.dart';

class LogInEmail extends StatefulWidget {
  const LogInEmail(
      {Key? key, required this.isEmailLogin, required this.panelName})
      : super(key: key);

  static const String route = '/login';
  final bool isEmailLogin;
  final String panelName;

  @override
  State<LogInEmail> createState() => _LogInEmailState();
}

class _LogInEmailState extends State<LogInEmail> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // html.window.location

    html.window.onBeforeUnload.listen((event) async {
      if (event is html.BeforeUnloadEvent) event.returnValue = "Don't go!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkWhite,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: context.width() < 750
                  ? 750
                  : MediaQuery.of(context).size.width,
              height: context.height() < 500
                  ? 500
                  : MediaQuery.of(context).size.height,
              child: Consumer(builder: (context, ref, watch) {
                final loginProvider = ref.watch(logInProvider);
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/background.png")),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              width: context.width() < 940
                                  ? 477
                                  : MediaQuery.of(context).size.width * .50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 10.0),
                                  const SizedBox(
                                    height: 80,
                                    width: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text.rich(
                                            textAlign: TextAlign.center,
                                            TextSpan(
                                                text: '7SS',
                                                style: TextStyle(
                                                    color: kTitleColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: 'POS',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: kYellowColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ])),
                                        Text(
                                          "Amjad Shopping Mall",
                                          style: TextStyle(
                                              color: kTitleColor, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: kYellowColor.withOpacity(0.1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Form(
                                      key: globalKey,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10.0),
                                          AppTextField(
                                            showCursor: true,
                                            cursorColor: kTitleColor,
                                            textFieldType: TextFieldType.EMAIL,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Email can\'n be empty';
                                              } else if (!value.contains('@')) {
                                                return 'Please enter a valid email';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              loginProvider.email = value;
                                            },
                                            decoration:
                                                kInputDecoration.copyWith(
                                              labelText: "Email",
                                              labelStyle: kTextStyle.copyWith(
                                                  color: kTitleColor),
                                              hintText: "Enter email address",
                                              hintStyle: kTextStyle.copyWith(
                                                  color: kYellowColor),
                                              prefixIcon: const Icon(
                                                  FeatherIcons.mail,
                                                  color: kYellowColor),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          AppTextField(
                                            showCursor: true,
                                            cursorColor: kYellowColor,
                                            textFieldType:
                                                TextFieldType.PASSWORD,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Password can\'t be empty';
                                              } else if (value.length < 4) {
                                                return 'Please enter a bigger password';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              loginProvider.password = value;
                                            },
                                            decoration:
                                                kInputDecoration.copyWith(
                                              contentPadding: EdgeInsets.zero,
                                              labelText: "Password",
                                              labelStyle: kTextStyle.copyWith(
                                                  color: kTitleColor),
                                              hintText: "Enter Your Password",
                                              hintStyle: kTextStyle.copyWith(
                                                  color: kYellowColor),
                                              prefixIcon: const Icon(
                                                  FeatherIcons.lock,
                                                  color: kYellowColor),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          ButtonGlobal(
                                              buttontext: "Login",
                                              buttonDecoration:
                                                  kButtonDecoration.copyWith(
                                                      color: kYellowColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0)),
                                              onPressed: (() {
                                                if (validateAndSave()) {
                                                  loginProvider.signIn(context);
                                                }
                                              })),
                                          const SizedBox(height: 20.0)
                                              .visible(widget.isEmailLogin),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: ListTile(
                                                  onTap: () {},
                                                  // Navigator.pushNamed(
                                                  //     context,
                                                  //     ForgotPassword.route),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  horizontalTitleGap: 0,
                                                  leading: const Icon(
                                                    Icons.lock_outline_rounded,
                                                    color: kYellowColor,
                                                  ),
                                                  title: Text(
                                                    '  Forgot password?',
                                                    style: kTextStyle.copyWith(
                                                        color: kYellowColor),
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              // SizedBox(
                                              //   width: 130,
                                              //   child: ListTile(
                                              //     onTap: () {
                                              //       // print("signup details");
                                              //       // Navigator.pushNamed(
                                              //       //     context, SignUp.route);
                                              //     },
                                              //     contentPadding:
                                              //         EdgeInsets.zero,
                                              //     horizontalTitleGap: 0,
                                              //     leading: const Icon(
                                              //       Icons.how_to_reg,
                                              //       color: kYellowColor,
                                              //     ),
                                              //     title: Text(
                                              //       'Registration',
                                              //       style: kTextStyle.copyWith(
                                              //           color: kYellowColor),
                                              //       textAlign: TextAlign.end,
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ).visible(widget.isEmailLogin),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
