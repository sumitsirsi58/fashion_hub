import 'package:fashion_hub/core/custom_button.dart';
import 'package:fashion_hub/core/custom_loader.dart';
import 'package:fashion_hub/core/otp_widget.dart';
import 'package:fashion_hub/dashboard/ui/home_screen.dart';
import 'package:fashion_hub/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);

  final String verificationId;
  final String phoneNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with CodeAutoFill {
  TextEditingController otpController = TextEditingController();
  FocusNode otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    listenForCode();
  }

  @override
  void dispose() {
    otpController.dispose();
    otpFocusNode.dispose();
    cancel();
    super.dispose();
  }

  @override
  void codeUpdated() {
    String otp = code ?? '';
    if (otp.length == 6) {
      context
          .read<AuthenticationProvider>()
          .verifyOTP(
        otp: otp,
        verificationId: widget.verificationId,
      )
          .then((_) {
        Navigator.of(context).pushReplacementNamed('/home');
      }).catchError((error) {
        print("OTP verification failed: $error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthenticationProvider>(
        builder: (context, authProvider, child) {
          return CustomLoader(
            showLoader: authProvider.isLoading,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    shadowColor: Colors.blue,
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),
                            OtpWidget(
                              otpController: otpController,
                              focusNode: otpFocusNode,
                            ),
                            CustomButton(
                              onPressed: () {
                                String otp = otpController.text;
                                if (otp.length == 6) {
                                  authProvider
                                      .verifyOTP(
                                    otp: otp,
                                    verificationId: widget.verificationId,
                                  )
                                      .then((_) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  }).catchError((error) {
                                    print("OTP verification failed: $error");
                                  });
                                }
                              },
                              name: 'CONTINUE',
                              buttonColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
