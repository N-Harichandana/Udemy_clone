import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/login.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  bool _isPasswordReset = false;
  bool _userpresent = true;
  String _email = " ";
  // _resetPassword() {
  //   // Validate email
  //   // String _email = " ";
  //   if (isValidEmail(_email)) {
  //     setState(() {
  //       _isPasswordReset = true;
  //     });
  //   } else {
  //     setState(() {
  //       _userpresent = true;
  //     });
  //   }
  // }

  // bool isValidEmail(String email) {
  //   // Simple email validation
  //   return email.contains('@');
  // }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      print(_emailController.text);
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      _isPasswordReset = true;
    } on FirebaseAuthException catch (e) {
      print(e);
      _userpresent = false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 5,
        title: Image.asset(
          "assets/logo/logou.png",
          scale: 4,
        ),
      ),
      body: _isPasswordReset
          ? Center(
              child: Container(
                margin: EdgeInsets.all(16),
                color: const Color.fromARGB(255, 119, 153, 171),
                height: 170,
                child: ListTile(
                  leading: Icon(Icons.check_circle_rounded),
                  title: Text(
                    '''Reset Password Email Sent You should soon receive an email allowing you to reset your password. Please make sure to check your spam and trash if you can't find the email.''',
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if (_isPasswordReset)

                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Forgot Password"),
                ),
                if (!_userpresent)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Color.fromARGB(255, 219, 149, 92)),
                      child: ListTile(
                        leading: Icon(Icons.error_rounded),
                        title: Text(
                            '''Sorry,something went wrong. Please try again'''),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.all(8)),
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black),
                      controller: _emailController,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 164, 53, 240),
                        border: Border.all(color: Colors.black, width: 1.0)),
                    child: ListTile(
                      title: Text(
                        "Reset Password",
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        passwordReset();
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("or"),
                    const SizedBox(
                      width: 2,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return Login();
                          }));
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                              color: Color.fromARGB(255, 175, 91, 201),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Color.fromARGB(255, 164, 53, 240)),
                        ))
                  ],
                ),
              ],
            ),
    );
  }
}
