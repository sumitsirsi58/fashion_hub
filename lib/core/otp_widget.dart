import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    Key? key,
    required this.otpController,
    required FocusNode focusNode,
  }) : super(key: key);

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: otpController,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      length: 6,
      defaultPinTheme: PinTheme(
        width: 100,
        height: 70,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.blue),
        ),
      ),
      onCompleted: (pin) {
        // Handle completed PIN input if needed
      },
    );
  }
}
