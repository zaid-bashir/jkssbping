// ignore_for_file: avoid_print, prefer_final_fields, deprecated_member_use, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jkssbping/common/theme_helper.dart';
import 'package:jkssbping/model/authmodels/login_user.dart';
import 'package:jkssbping/provider/auth_provider.dart';
import 'package:jkssbping/screens/navbar/navbar.dart';
import 'package:jkssbping/services/api_services.dart';
import 'package:jkssbping/utils/connect.dart';
import 'package:jkssbping/utils/sharedpreference_helper.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'forgot_password_page.dart';
import 'registration_page.dart';
import '../../widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _headerHeight = 250;
  var _formKey = GlobalKey<FormState>();

  //?TextEditingControllers For the Registration Form
  //*================================================
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();

  //?Logger Instance
  //*===============
  var log = Logger();

  _getLoginResponse(LoginUser obj) async {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    var response = await ApiServices.loginUser(obj);
    if (response.isSuccessful) {
      provider.setLoginResponse(response.data);
      provider.setMessage(response.message ?? "Congracts Login Successful");
      provider.setResponseCode(response.responseCode);
    } else {
      provider.setMessage(response.message);
      provider.setResponseCode(response.responseCode);
    }
    provider.setIsProcessing(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(
                  _headerHeight,
                  true,
                  Icons.login_rounded,
                ), //let's create a common header widget
              ),
              SafeArea(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: const EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        const Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Signin into your account',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 30.0),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    controller: emailCont,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'User Email', 'Enter your Email'),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (!Connect.isEmail(val)) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 30.0),
                                Container(
                                  child: TextFormField(
                                    controller: passwordCont,
                                    obscureText: true,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return "Please enter your password";
                                      }
                                      return null;
                                    },
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'Password', 'Enter your password'),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 15.0),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgotPasswordPage()),
                                      );
                                    },
                                    child: const Text(
                                      "Forgot your password?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: ThemeHelper()
                                      .buttonBoxDecoration(context),
                                  child: Consumer<AuthProvider>(
                                    builder: (_, authProvider, __) {
                                      return ElevatedButton(
                                        style: ThemeHelper().buttonStyle(),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 10, 40, 10),
                                          child: Text(
                                            'Sign In'.toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            print(emailCont.text +
                                                passwordCont.text);
                                            await _getLoginResponse(LoginUser(
                                                identifier: emailCont.text,
                                                password: passwordCont.text));
                                            log.i(authProvider.getIsProcessing);
                                            log.i(authProvider.getLoginResponse
                                                .toString());
                                            log.i(authProvider.getMessage);
                                            log.i(authProvider.getResponseCode);
                                            if (authProvider.getIsProcessing) {
                                              log.i("Loading...");
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            } else if (authProvider
                                                    .getResponseCode ==
                                                200) {
                                                Preference.setString("jwtToken", authProvider.getLoginResponse["jwt"]);
                                                Preference.setString("username", authProvider.getLoginResponse["user"]["username"]);
                                                Preference.setString("email", authProvider.getLoginResponse["user"]["email"]);
                                                log.i(Preference.getString("jwtToken").toString() +
                                                    Preference.getString("email").toString()+
                                                    Preference.getString("username").toString());
                                                Alert(
                                                  context: context,
                                                  type: AlertType.success,
                                                  title: "JKSSBPing.in",
                                                  closeFunction: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const NavbarCustum()),
                                                            (Route<dynamic>
                                                                    route) =>
                                                                false);
                                                  },
                                                  desc: authProvider.getMessage,
                                                  buttons: [
                                                    DialogButton(
                                                      child: const Text(
                                                        "Continue",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                      onPressed: () => {
                                                        Navigator.of(context)
                                                            .pushAndRemoveUntil(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const NavbarCustum()),
                                                                (Route<dynamic>
                                                                        route) =>
                                                                    false),
                                                      },
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 179, 134, 1.0),
                                                    ),
                                                  ],
                                                ).show();
                                            } else {
                                                Alert(
                                                  context: context,
                                                  type: AlertType.error,
                                                  title: "JKSSBPing.in",
                                                  closeFunction: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  desc: authProvider.getMessage,
                                                  buttons: [
                                                    DialogButton(
                                                      child: const Text(
                                                        "Continue",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                      onPressed: () => {
                                                        Navigator.of(context)
                                                            .pop(),
                                                      },
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 179, 134, 1.0),
                                                    ),
                                                  ],
                                                ).show();
                                            }
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "Don\'t have an account? "),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegistrationPage()));
                                        },
                                      // ignore: deprecated_member_use
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ])),
                                ),
                              ],
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
