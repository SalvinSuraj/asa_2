import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:signin/main.dart';

class SignUpWidget extends StatefulWidget{
  final Function()  onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }):super(key:key);
 _SignUpWidgetState createState() => _SignUpWidgetState();

}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign Up Page"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),

          child: Form(
             key:formKey,
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
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Enter your email:'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                       : null,
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Enter your password:'),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:(value) =>
                         value != null && value.length > 6
                         ?'Enter min 6. characters'
                         :null,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.deepOrange
                ),
                icon: Icon(Icons.lock_open, size: 32),
                label: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                ),

                onPressed: SignUp,
              ),
              SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  text: "Already have an account? ",
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Log In',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue
                      ),
                    ),
                  ],
                ),)
            ],
          ),)
      ),
    );
  }
  Future SignUp() async{
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),);
    } on FirebaseAuthException catch (e) {
      print(e);

    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
