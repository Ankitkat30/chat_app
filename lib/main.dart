import 'package:flutter/material.dart';
import 'package:kraftbase_chat_app/logic/provider/auth/auth_provider.dart';
import 'package:kraftbase_chat_app/presentation/screens/auth/login/loginScreen.dart';
import 'package:kraftbase_chat_app/presentation/screens/auth/signup/signupScreen.dart';
import 'package:kraftbase_chat_app/presentation/screens/call/call_screen.dart';
import 'package:kraftbase_chat_app/presentation/screens/chat/chat_screen.dart';
import 'package:kraftbase_chat_app/presentation/screens/home/home_screen.dart';
import 'package:kraftbase_chat_app/presentation/screens/welcome/splashScreen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
      url: 'https://uxskdqnpnjfkmpsytbov.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV4c2tkcW5wbmpma21wc3l0Ym92Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODc5Mzc1MTUsImV4cCI6MjAwMzUxMzUxNX0.EUQ8wt_8Q1XEyHkKXMKTZPWeu1RChgNPZp64CmhNS5A');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen()
      ),
    );
  }
}
