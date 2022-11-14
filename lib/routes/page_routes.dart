import 'package:dant/UI/auth/login.dart';
import 'package:dant/UI/auth/register.dart';
import 'package:dant/UI/pages/about.dart';
import 'package:dant/UI/pages/add_todo.dart';
import 'package:dant/UI/pages/home.dart';
import 'package:dant/UI/splash_screen.dart';
import 'package:dant/routes/route_names.dart';
import 'package:get/get.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RouteName.login, page: () => const Login()),
    GetPage(name: RouteName.register, page: () => const Register()),
    GetPage(name: RouteName.home, page: () => const Home()),
    GetPage(name: RouteName.addTodo, page: () => const AddTodo()),
    GetPage(name: RouteName.about, page: () => const About()),
  ];
}
