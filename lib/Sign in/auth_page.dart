import 'package:flutter/material.dart';
import 'package:signin/Sign%20in/signup_widget.dart';

import 'login.dart';

class AuthPage extends StatefulWidget{
  @override
  _AuthPageState createState() => _AuthPageState();
}
class _AuthPageState extends State<AuthPage>{
    bool isLogin = true;

    Widget build(BuildContext context) => isLogin
        ? LoginWidget(onClickedSignUp:toggle)
        : SignUpWidget(onClickedSignIn:toggle);

    void toggle() => setState(() => isLogin = !isLogin);
}
