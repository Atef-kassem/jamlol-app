import 'package:flutter/material.dart';
import 'package:obour/features/intro_pages/presentation/pages/first_intro_screen.dart';
import 'package:obour/features/intro_pages/presentation/pages/second_intro_screen.dart';
import 'package:obour/features/login/presentation/pages/login_screen.dart';
import 'package:obour/features/login/presentation/pages/login_role_screen.dart';
import 'package:obour/features/login/presentation/pages/roles_screen.dart';
import 'package:obour/features/reset_password/presentation/pages/reset_password_screen.dart';
import 'package:obour/features/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:obour/features/splash/presentation/pages/splash_screen.dart';

class RoutesName {
  static const String splashScreen = "/";
  static const String firstIntroScreen = "firstIntroScreen";
  static const String secondIntroScreen = "secondIntroScreen";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String loginRole = "loginRole";
  static const String rolesScreen = "rolesScreen";
  static const String resetPassScreen = "resetPassScreen";
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
      case RoutesName.resetPassScreen:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
        );
      /*
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case RoutesName.signature:
    return MaterialPageRoute(
          builder: (context) => SignatureScreen(),
        );
      case RoutesName.holidayDetails:
        HolidayEntityData data =
        settings.arguments as HolidayEntityData;
        return MaterialPageRoute(
          builder: (context) => HolidayDetailsScreen(args: data),
        );
      case RoutesName.addHoliday:
        return MaterialPageRoute(
          builder: (context) => AddHolidayScreen(),
        );
      case RoutesName.editHoliday:
        HolidayEntityData data =
        settings.arguments as HolidayEntityData;
        return MaterialPageRoute(
          builder: (context) => EditHolidayScreen(args: data,),
        );*/
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
