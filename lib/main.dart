// ignore_for_file: unused_import

import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_change/Pages/welcome_home.dart';
import 'package:smart_change/models/user_model.dart';
import 'package:smart_change/providers/chats.dart';
import 'package:smart_change/providers/signup.dart';
import 'package:smart_change/providers/user.dart';
import 'package:smart_change/screens/Tab%20bar%20screen/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_change/screens/auth.dart';
import 'components/nav_bar.dart';
import 'firebase_options.dart';
import 'on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Change',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const  AuthPage(), // SmartChangeAppBottom(), 
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
