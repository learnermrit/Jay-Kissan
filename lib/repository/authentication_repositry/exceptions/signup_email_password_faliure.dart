import 'package:get/get.dart';

class SignUpWithEmailAndPasswordFaliure {
  final String message;

  const SignUpWithEmailAndPasswordFaliure(
      [this.message = "An Unknown error occured"]);

  factory SignUpWithEmailAndPasswordFaliure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFaliure('Please enter a stronger password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFaliure('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFaliure('An account already exists for thet email');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFaliure('Please contact Support Operation not allowed');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFaliure('This User has been disabled. Please Contact Support for help');

      default:
        return  const SignUpWithEmailAndPasswordFaliure();
    }
  }
}
