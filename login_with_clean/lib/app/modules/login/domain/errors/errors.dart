import 'package:login_with_clean/app/core/errors/errors.dart';

class ErrorLogin extends Failure {
  final String message;

  ErrorLogin({this.message});
}