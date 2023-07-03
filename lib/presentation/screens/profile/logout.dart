import 'package:flutter/material.dart';
import 'package:kraftbase_chat_app/logic/provider/auth/auth_provider.dart';
import 'package:kraftbase_chat_app/presentation/screens/auth/login/loginScreen.dart';
import 'package:provider/provider.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            IconButton(
                onPressed: () {
                  final auth = Provider.of<AuthProvider>(context, listen: false);
                  auth.onSignOut(success: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                  }, failure: () {
                    ///error
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Logout Error!")));
                  });
                },
                icon: Icon(Icons.logout)),
                Text("Logout",style: TextStyle(color: Colors.blue,fontSize: 28,fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}
