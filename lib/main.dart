import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:klinik_shoes_project/core.dart';
import 'depedency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final fcmService = FCMService();
  fcmService.init();

  // Initialize the Dependency Injection  
  DependencyInjection.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getX.GetMaterialApp(
      title: 'Klinik Shoes Project',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: AppRoutes.getHomeRoute(),  // Set the initial route based on your routing setup
      getPages: AppRoutes.routes,  // Set up your page routes from AppRoutes
    );
  }
}
