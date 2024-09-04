import 'package:fashion_hub/core/widgets.dart';
import 'package:fashion_hub/ui/forget_password_screen.dart';
import 'package:fashion_hub/ui/phone_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'FASHION HUB',
                style: GoogleFonts.vt323(
                  textStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Card(
                color: Colors.blue,
                elevation: 20,
                child: Container(
                  height: 440,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFiled(
                            hintText: 'Nick Name',
                            controller: nickNameController,
                            keyboardType: TextInputType.name,
                            obscured: false),
                        SizedBox(height: 10),
                        CustomTextFiled(
                            hintText: 'Email',
                            controller: emailController,
                            keyboardType: TextInputType.name,
                            obscured: false),
                        SizedBox(height: 10),
                        CustomTextFiled(
                            hintText: 'Password',
                            controller: passwordController,
                            keyboardType: TextInputType.name,
                            obscured: true),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPasswordScreen()));
                                },
                                child: Text('Forget Password')),
                          ],
                        ),
                        SizedBox(height: 14),
                        CustomContainer(
                            width: double.infinity,
                            height: 44,
                            color: Colors.blueAccent,
                            child: Center(
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                                  color: Colors.black54,
                                )),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8),
                              child: Text('SignUp With'),
                            ),
                            Expanded(
                                child: Divider(
                                  color: Colors.black54,
                                )),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: CustomContainer(
                                  width: double.infinity,
                                  height: 40,
                                  color: Colors.grey.shade200,
                                  child: Center(
                                    child: Text(
                                      'Google',
                                      style:
                                      TextStyle(color: Colors.black54),
                                    ),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PhoneScreen()));
                                },
                                child: CustomContainer(
                                    width: double.infinity,
                                    height: 40,
                                    color: Colors.grey.shade200,
                                    child: Center(
                                      child: Text(
                                        'Phone',
                                        style:
                                        TextStyle(color: Colors.black54),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            SizedBox(width: 4),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'LogIn',
                                  style: TextStyle(
                                      color: Colors.blueAccent),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
