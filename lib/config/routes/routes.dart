import 'package:flutter/material.dart';
import 'package:obour/features/auth/add_buyer/presentation/pages/add_buyer.dart';
import 'package:obour/features/auth/add_carrier/presentation/pages/add_carrier.dart';
import 'package:obour/features/auth/add_supplier/presentation/pages/add_supplier.dart';
import 'package:obour/features/auth/login/presentation/pages/login_role_screen.dart';
import 'package:obour/features/auth/login/presentation/pages/login_screen.dart';
import 'package:obour/features/auth/sign_up/presentation/pages/roles_screen.dart';
import 'package:obour/features/auth/reset_password/presentation/pages/reset_password_screen.dart';
import 'package:obour/features/auth/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:obour/features/auth/sign_up/presentation/pages/sign_up_second_screen.dart';
import 'package:obour/features/home/presentation/pages/home_screen.dart';
import 'package:obour/features/intro_pages/presentation/pages/first_intro_screen.dart';
import 'package:obour/features/intro_pages/presentation/pages/second_intro_screen.dart';
import 'package:obour/features/splash/presentation/pages/splash_screen.dart';

class RoutesName {
  static const String splashScreen = "/";
  static const String firstIntroScreen = "firstIntroScreen";
  static const String secondIntroScreen = "secondIntroScreen";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String secondSignUp = "secondSignUp";
  static const String loginRole = "loginRole";
  static const String rolesScreen = "rolesScreen";
  static const String resetPassScreen = "resetPassScreen";
  static const String addBuyer = "addBuyer";
  static const String addSupplier="addSupplier";
  static const String addCarrier = "addCarrier";
  static const String home = "home";
}

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case RoutesName.firstIntroScreen:
        return MaterialPageRoute(
          builder: (context) => FirstIntroScreen(),
        );
      case RoutesName.secondIntroScreen:
        return MaterialPageRoute(
          builder: (context) => SecondIntroScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RoutesName.loginRole:
        return MaterialPageRoute(
          builder: (context) => LoginRoleScreen(),
        );
      case RoutesName.rolesScreen:
        return MaterialPageRoute(
          builder: (context) => RolesScreen(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case RoutesName.secondSignUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => SignUpSecondScreen(),
        );
      case RoutesName.resetPassScreen:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
        );
      case RoutesName.addBuyer:
        return MaterialPageRoute(
          builder: (context) => AddBuyer(),
        );
      case RoutesName.addSupplier:
        return MaterialPageRoute(
          builder: (context) => AddSupplier(),
        );
      case RoutesName.addCarrier:
        return MaterialPageRoute(
          builder: (context) => AddCarrier(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
        default:
          return MaterialPageRoute(
            builder: (context) => UnDefineScreen(),
          );
    }
  }
  static Widget UnDefineScreen(){
    return Scaffold(
      appBar: AppBar(
          title: Text("Undefine page"),
      ),
      body: Center(
        child: Text("Page not found"),
      ),
    );
  }
}
