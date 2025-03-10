import 'package:flutter/material.dart';
import 'package:zoomclone/Core/Routing/routing.dart';
import 'package:zoomclone/repo/auth_methods.dart';
import 'package:zoomclone/views/Home/page/HomeScreen.dart';
import 'package:zoomclone/views/loginScreen/widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start or join a meeting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Image.asset('assets/onboarding.jpg'),
            ),
            Custombutton(
              text: "Goole Sign In",
              onPressed: () async {
                bool res = await AuthMethods.signInWithGoogle(context);
                if (res) {
                  context.navigateTo(Homescreen());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
