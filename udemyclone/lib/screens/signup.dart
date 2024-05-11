import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/httpexception.dart';
import '/screens/login.dart';
import '/providers/auth.dart';

class Signup extends StatefulWidget {
  static const id = 'signup';

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  Map<String, String> _authdata = {'name': '', 'email': '', 'password': ''};

  bool _isloading = false;

  final passwordcontroller = TextEditingController();

  void _showerrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("An Error Occured"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("Okay"))
              ],
            ));
  }

  Future<void> submit() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _formkey.currentState!.save();
    setState(() {
      _isloading = true;
    });
    try {
      // await Provider.of<Auth>(context, listen: false)
      //     .login(_authdata['email']!, _authdata['password']!);
      // print("login success");
      // Navigator.pushReplacementNamed(
      //     context, ProductsoverviewScreen.routename);
      //  else {
      await Provider.of<Auth>(context, listen: false)
          .signup(_authdata['email']!, _authdata['password']!);
      // }
    } on HttpException catch (error) {
      var errormessage = "Authentication Failed";
      if (error.toString().contains('EMAIL_EXISTS')) {
        errormessage = "This email address is already in use";
      } else if (error.toString().contains("INVALID_EMAIL")) {
        errormessage = "This is not valid email address";
      } else if (error.toString().contains("WEAK_PASSWORD")) {
        errormessage = "This password is too weak";
      } else if (error.toString().contains("INVALID_LOGIN_CREDENTIALS")) {
        errormessage = "Could not find a user with that email";
        // } else if (error.toString().contains("INVALID_PASSWORD")) {
        //   errormessage = "Inavlid Password";
      }
      _showerrorDialog(errormessage);
    } catch (error) {
      const errormessage = "Could not authenticate. Please try again";
      _showerrorDialog(errormessage);
    }

    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 5,
        title: Image.asset(
          "assets/images/udemy_logo.jpg",
          scale: 4,
        ),
      ),
      body: Form(
        key: _formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Sign up and start learning",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    // textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                    child: TextFormField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Full Name",
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.all(8)),
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Invalid Name";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _authdata['name'] = newValue!;
                      },
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
                    child: TextFormField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.all(8)),
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "Invalid email";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _authdata['email'] = newValue!;
                      },
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
                    child: TextFormField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.all(8)),
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                      controller: passwordcontroller,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return "Password is too short";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _authdata['password'] = newValue!;
                      },
                    ),
                  ),
                ),
                if (_isloading)
                  const CircularProgressIndicator()
                else
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 164, 53, 240),
                          border: Border.all(color: Colors.black, width: 1.0)),
                      child: ListTile(
                        title: Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          submit();
                        },
                      ),
                    ),
                  ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(
                      width: 3,
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
          ),
        ),
      ),
    );
  }
}
