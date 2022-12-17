import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:signin/Sign%20in/forgot_password_page.dart';
import 'package:signin/home_page.dart';
import 'package:signin/main.dart';

class LoginWidget extends StatefulWidget {

  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key:key);
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose()
  {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.deepOrange,
      ),
      body:SingleChildScrollView(
    padding: EdgeInsets.all(20),

    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 250.0,
          width: 250.0,
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
          ),
          child: Center(
            child: Image.asset('assets/images/asa.png'),
          ),
        ),
        SizedBox(height: 40),
        TextField(
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Enter your email:'),
        ),
        SizedBox(height: 5),
        TextField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(labelText: 'Enter your password:'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
            backgroundColor: Colors.deepOrange
          ) ,
          icon: Icon(Icons.lock_open,size:32),
          label: Text(
            'Sign In',
            style: TextStyle(fontSize: 24),
          ),

          onPressed: signIn,
        ),
        SizedBox(height: 24),
        GestureDetector(
          child:Text('Forgot Password',style: TextStyle(
              decoration: TextDecoration.underline,
               color: Theme.of(context).colorScheme.secondary,
          fontSize: 20,
          ),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => forgotPasswordPage(),
          )),
        ),
        SizedBox(height: 16,),
        RichText(
            text:TextSpan(
              style: TextStyle(color: Colors.black,fontSize: 25),
              text: "No Account? ",
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignUp,
                  text: 'Sign Up',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue
                  ),
                ),
              ],
            ) ,)
      ],
    )
  ),);
  }
Future signIn() async{

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()));

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
  on FirebaseAuthException catch(e){
    print(e);
  }

  navigatorKey.currentState!.popUntil((route) => route.isFirst);

}
}
