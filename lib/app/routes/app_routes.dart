part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
  static const CREATE = _Paths.CREATE;
  static const UPDATE = _Paths.UPDATE;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const AUTH = _Paths.AUTH;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const RESET_PASSWORD = '/reset-password';
  static const CREATE = '/create';
  static const UPDATE = '/update';
  static const SPLASH_SCREEN = '/splash-screen';
  static const AUTH = '/auth';
}
