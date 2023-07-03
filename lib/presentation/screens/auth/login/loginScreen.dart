import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraftbase_chat_app/presentation/screens/auth/signup/signupScreen.dart';
import 'package:kraftbase_chat_app/presentation/screens/home/home_screen.dart';
// ignore: unused_import
import 'package:kraftbase_chat_app/presentation/screens/welcome/splashScreen.dart';
import 'package:provider/provider.dart';

import '../../../../logic/provider/auth/auth_provider.dart';
import '../../../constants/divider.dart';
import '../../../widgets/silver_sized_box.dart';
import '../../../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  void toRegisterScreen({required BuildContext context}) {
        Navigator.pushNamed(context, '/signUp');
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const SignUpScreen(),
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .2,
                ),

                ///text welcome
                Text(
                  "Welcome back to \nKraftBase Chat App",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * .02,
                ),

                ///edit text email
                buildEditTextBox(context, size)
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding buildEditTextBox(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefault),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "E-mail address",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              borderRadius: BorderRadius.circular(kDefault),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: kDefault / 2),
                      child: TextFormField(
                        onChanged: (it) =>
                            Provider.of<AuthProvider>(context, listen: false)
                                .onEmailChange(it),
                        decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: kDefault / 2),
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),

          ///password
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Password",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
              Text(
                "Forgot password",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              borderRadius: BorderRadius.circular(kDefault),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: kDefault / 2),
                      child: TextFormField(
                        onChanged: (it) =>
                            Provider.of<AuthProvider>(context, listen: false)
                                .onPasswordChange(it),
                        decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: kDefault / 2),
                    child: Icon(
                      Icons.visibility_outlined,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),

          ///remember me
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CupertinoCheckbox(value: true, onChanged: (it) {}),
              Text(
                "Remember me",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Row(
            children: [
              const Expanded(
                  child: Divider(
                thickness: 1,
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: kDefault),
                child: const Text("or"),
              ),
              const Expanded(
                  child: Divider(
                thickness: 1,
              ))
            ],
          ),
          SizedBox(
            height: size.height * .04,
          ),

          ///button social login
          Row(
            children: [
              const Spacer(),
              SocialButton(
                color: Colors.blueAccent,
                iconData: Icons.facebook,
                onTap: () {},
              ),
              SocialButton(
                color: Colors.black,
                iconData: Icons.apple,
                onTap: () {},
              ),
              SocialButton(
                color: Colors.red,
                iconData: Icons.g_mobiledata_sharp,
                onTap: () {},
              ),
              const Spacer()
            ],
          ),
          SizedBox(
            height: size.height * .12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefault),
            child: ElevatedButton(
              onPressed: () {
                final auth = Provider.of<AuthProvider>(context, listen: false);
                auth.onSignIn(success: () {
                  ///home page
                  Navigator.pushReplacementNamed(context, '/');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const HomeScreen(),
                  //     ));
                }, failure: () {
                  ///error
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Error!")));
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kDefault))),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login",style: TextStyle(color: Colors.white),),
                  SizedBox(
                    width: kDefault,
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont have on account ?",
                  style: Theme.of(context).textTheme.bodySmall),
              InkWell(
                onTap: () => toRegisterScreen(context: context),
                child: Text(
                  "  Sing up now.",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.blue),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .01,
          ),
        ],
      ),
    );
  }
}
