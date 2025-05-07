import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_page_main.dart';

import 'screens/camera_live_screen.dart';

import 'package:graduation_project/HomeScreens/AITools.dart';
import 'package:graduation_project/HomeScreens/home.dart';
import 'package:graduation_project/PlantData/CreateNewPlant.dart';
import 'package:graduation_project/PlantData/DeletePlant.dart';
import 'package:graduation_project/SigningPages/Login.dart';
import 'package:graduation_project/SigningPages/SignUp.dart';
import 'package:graduation_project/SplashScreen.dart';
import 'package:graduation_project/WelcomePages/Welcome1.dart';
import 'package:graduation_project/WelcomePages/Welcome2.dart';
import 'package:graduation_project/WelcomePages/Welcome3.dart';
import 'package:graduation_project/WelcomePages/WelcomePlanTecho.dart';
import 'package:graduation_project/PlantData/PlantManagementDashboard.dart';
import 'package:graduation_project/screens/camera_live_screen.dart';

void main() {
  runApp(const PlanTecho()); //running the app
}

class PlanTecho extends StatelessWidget {
  const PlanTecho({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // the next line is added
      home: LiveDetectionScreen(),    
      debugShowCheckedModeBanner: false,
      initialRoute: '/camera_live_screen',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/welcome1': (context) => const WelcomescreenMonitoringYourPlant(),
        '/welcome2': (context) => const WelcomescreenInfectedPlant(),
        '/welcome3': (context) => const WelcomescreenChatBot(),
        '/welcome4': (context) => const WelcomescreenPlanTecho(),
        '/signup':(context)=> SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/chatbot':(context) => ChatBotWidget(),
        '/CreateNewPlant':(context) => CreateNewPlant(),
        '/DeletePlant':(context) => DeletePlant(),
        '/plantDashboard':(context) => PlantManagementdashboardWidget(),
        '/camera_live_screen':(context) =>LiveDetectionScreen(),
        '/home_main':(context) =>HomePageMainWidget()

      }, //all screens
    );
  }
}
