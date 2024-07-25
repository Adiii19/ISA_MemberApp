import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/src/features/authentication/screens/login/login_screen.dart';
// import 'package:inventory/src/features/authentication/screens/onboarding_screen/onboarding_screen.dart';
// import 'package:inventory/src/features/authentication/screens/splash_screen/splash_screen.dart';
// import 'package:inventory/src/features/authentication/screens/welcome/welcome.dart';
import 'package:inventory/src/utils/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);


OneSignal.initialize("329b0b98-b961-4613-ae74-94e4c17dd44f");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission

  await Supabase.initialize(
      url: 'https://bxcsazxrgkrslbqeworx.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ4Y3NhenhyZ2tyc2xicWV3b3J4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk3NDQyODMsImV4cCI6MjAzNTMyMDI4M30.NcvtPsa_FC_3ozm4G43pDrY8XtO2zhtM2RVW1WFOy78');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        theme: CAppTheme.lightTheme,
        darkTheme: CAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const LoginScreen());
  }
}
