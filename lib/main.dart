import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myimpactmetertask/providers/auth_provider.dart';
import 'package:myimpactmetertask/providers/main_screen_provider.dart';
import 'package:myimpactmetertask/view/screens/log_in_screen.dart';
import 'package:myimpactmetertask/view/screens/setting_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsProvider(initialDarkMode: false, initialNotifications: true,)),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),

      ],
      child: MaterialApp(
        title: 'My Impact Meter',
        //theme: Provider.of<SettingsProvider>(context).currentTheme,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LogInScreen(),
      ),
    );
  }
}


