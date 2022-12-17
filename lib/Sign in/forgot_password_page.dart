import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class forgotPasswordPage extends StatefulWidget{
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<forgotPasswordPage>{
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void dispose(){
    emailController.dispose();
  }
  Widget build(BuildContext context) =>Scaffold(
    resizeToAvoidBottomInset: false,
    appBar:AppBar(
      backgroundColor: Colors.deepOrange,
      title: Text("Reset Password"),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Container(
              height: 150.0,
              width: 150.0,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('assets/images/asa.png'),
              ),
            ),
            Text(
              "Receive an email to reset the password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Enter your Email:'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
               email!=null && !EmailValidator.validate(email)
               ? "Enter a valid email"
                : null,

            ),
            SizedBox(height: 20),
            ElevatedButton.icon( style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
              backgroundColor: Colors.deepOrange,
            ),
              icon: Icon(Icons.email_outlined),
              label: Text(
                "Reset Password",

                style: TextStyle(fontSize: 24),
              ),
              onPressed: resetPassword,
            ),
          ],
        ),
      ),

    ),
  );
  Future resetPassword() async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    }on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}