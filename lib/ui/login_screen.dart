import 'package:fashion_hub/core/widgets.dart';
import 'package:fashion_hub/ui/forget_password_screen.dart';
import 'package:fashion_hub/ui/phone_screen.dart';
import 'package:fashion_hub/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
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
                  width: double.infinity,
                  height: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                  'LOGIN',
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
                              child: Text('Sign in With'),
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
                                        style: TextStyle(
                                            color: Colors.black54),
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
                            Text("Don't have an account?"),
                            SizedBox(width: 4),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpScreen()));
                              },
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                    color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
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
