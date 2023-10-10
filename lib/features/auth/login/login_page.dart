// ignore_for_file: prefer_const_constructors

import 'package:audit_app/features/home/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/ui_state.dart';
import '../../../providers/login_provider.dart';
import '../../../repositories/auth_repository.dart';
import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';
import '../../../widgets/green_button.dart';
import '../../../widgets/show_alert_dialog.dart';
import '../../../widgets/tab_bar_page.dart';
import '../../../widgets/text_input_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginProvider loginProvider = LoginProvider(authRepository: AuthRepository());
  bool _isHidden = true;
  String storedToken = '';
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String passErrorMessage = "";
  bool validatePassword(String value) {
    if (!(value.isNotEmpty)) {
      setState(() {
        passErrorMessage = "Password can't be empty";
      });
      return false;
    } else {
      setState(() {
        passErrorMessage = "";
      });
      return true;
    }
  }

  String emailErrorMessage = "";

  bool validateEmail(String value) {
    if (!(value.isNotEmpty)) {
      setState(() {
        emailErrorMessage = "Email can't be empty";
      });
      return false;
    } else {
      setState(() {
        emailErrorMessage = "";
      });
      return true;
    }
  }


  onLogin() async {
    final isValidEmail = validateEmail(emailController.text);
    final isValidPassword = validatePassword(passwordController.text);
    if (isValidEmail && isValidPassword) {
      await loginProvider.checkLogin(
          emailController.text, passwordController.text);
    }
  }

  void onCancelPressed() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
    loginProvider.initialState();
  }
  @override
  void initState() {
    loginProvider.initialState();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25, 30, 25, 10),
          child: Form(key: _formKey, child: loginWidget(context)),
        ),
      ),
    );
  }

  Widget loginWidget(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (ctx) {
        return loginProvider;
      },
      child: Consumer<LoginProvider>(
        builder: (ctx, data, _) {
          var state = data.getLoginLiveData().getValue();
          print(state);
          if (state is IsLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Center(
                child: CircularProgressIndicator(color: blueColor),
              ),
            );
          } else if (state is Initial) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/thumbnails/007/422/297/small/letter-ap-or-pa-initial-logo-design-template-illustration-vector.jpg',
                  ),
                ),
                Text(
                  'Login',
                  style: titleTextStyle,
                ),
                SizedBox(height: 36),
                buildTextFormField(
                    setState,
                    'Username',
                    'Enter Your Username',
                    emailErrorMessage,
                    false,
                    emailController),
                SizedBox(height: 12),
                buildTextField("Enter Password"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ForgotPassword()
                        //       // ForgotPassword()
                        //     ));
                      },
                      child: Text('Forgot Password?', style: titleTextStyle),
                    ),
                  ],
                ),
                SizedBox(height: 27),
                greenButton(context, 'Log In', false, onLogin),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Don' 't have an account? ',
                            style: titleTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Sign Up',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => SignUpPage()))
                                    })
                            ])),
                  ],
                ),
                SizedBox(height: 25),
                Center(
                  child: Image.network(
                    'https://pbs.twimg.com/profile_images/1605297940242669568/q8-vPggS_400x400.jpg',
                    height: 42,
                    width: 42,
                  ),
                ),
                SizedBox(height: 25),
                Center(
                    child: Text(
                      'By Continuing your confirm that you ',
                      style: titleTextStyle,
                    )),
                Center(
                    child: Text('agree with our Terms & Conditions',
                        style: titleTextStyle)),
              ],
            );
          } else if (state is Success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => TabViewPage()));
            });
            return SizedBox();
          } else if (state is Failure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAlertDialog(
                  context, "Error",
                  // '${loginModel.errorDescription}',
                  'Invalid Credentials',
                  "Cancel",
                  onCancelPressed);
            });
            return SizedBox();
          } else {
            return Container();
          }
        },
      ),
    );
  }
  Widget buildTextField(String hintText) {
    return TextField(
      controller: passwordController,
      style: titleTextStyle,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        isDense: true,
        hintText: hintText,
        errorText: passwordController.text == '' ? passErrorMessage : '',
        labelText: 'Password',
        fillColor: blackColor,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor, width: 1),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor, width: 1),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor, width: 1),
        ),
        suffixIcon: hintText == "Enter Password" ? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden ? Icon(Icons.visibility_off,color: blackColor) : Icon(Icons.visibility,color: blackColor),
        ) : null,
      ),
      obscureText: hintText == "Enter Password" ? _isHidden : false,
    );
  }
}
