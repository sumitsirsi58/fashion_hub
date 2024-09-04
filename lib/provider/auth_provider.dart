import 'package:fashion_hub/core/storage_helper.dart';
import 'package:fashion_hub/service/auth_service.dart';
import 'package:fashion_hub/ui/login_screen.dart';
import 'package:fashion_hub/ui/otp-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  final StorageHelper storageHelper;
  bool isLoggedIn = false;
  int? resendToken;

  final AuthService authService = Get.find();

  AuthenticationProvider(this.storageHelper);

  Future login(String phoneNumber, {bool resend = false}) async {
    try {
      showLoader();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          hideLoader();
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Verification Failed', e.message.toString());
          hideLoader();
        },
        codeSent: (String verificationId, int? resendToken) {
          this.resendToken = resendToken;
          hideLoader();
          if (!resend) {
            Get.to(OTPScreen(
              phoneNumber: phoneNumber,
              verificationId: verificationId,
            ));
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          hideLoader();
        },
        forceResendingToken: resend ? resendToken : null,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      hideLoader();
    }
  }

  Future verifyOTP({
    required String otp,
    required String verificationId,
  }) async {
    try {
      showLoader();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      UserCredential cred =
      await FirebaseAuth.instance.signInWithCredential(credential);
      String? uid = cred.user?.uid;
      if (uid != null) {
        storageHelper.saveUserId(uid);
      }
      hideLoader();
    } on FirebaseAuthException catch (e) {
      hideLoader();
      Get.snackbar('Error', e.message.toString());
    }
  }

  Future loadLoggedStatus() async {
    showLoader();
    String? uid = await storageHelper.getUserId();
    isLoggedIn = uid != null;
    hideLoader();
  }

  Future googleLogin() async {
    try {
      isError = false;
      isLoading = true;
      notifyListeners();

      final result = await authService.googleLogin();
      if (result != null) {
        final userId = result.user?.uid;
        if (userId != null) {
          await storageHelper.saveUserId(userId);
        }
        Fluttertoast.showToast(msg: 'Google sign in successful');
      } else {
        throw Exception('Google sign in failed');
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isError = true;
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: 'Google sign in failed: $e');
    }
  }

  Future resetPassword(String email) async {
    try {
      isLoading = true;
      notifyListeners();

      await authService.resetPassword(email);
      Fluttertoast.showToast(msg: 'Password reset email sent');

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isError = true;
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: 'Password reset failed: $e');
    }
  }

  Future logout() async {
    await storageHelper.clearUserId();
    Get.off(LoginScreen());
  }

  void showLoader() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoader() {
    isLoading = false;
    notifyListeners();
  }
}
