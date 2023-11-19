import 'package:flutter/material.dart';
import 'package:project/ui/screens/set_password.dart';
import 'package:project/ui/screens/signup_screen.dart';
import 'package:project/ui/widgets/body_background.dart';
import 'login_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Pin Verification",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Verify your PIN with 6 digit number ",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,

                    )
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter code sent by mail",
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SetPassword()),);

                      },
                      child: const Text("Verify"),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account?"),
                      TextButton(
                        onPressed: () {
                        Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                        builder: (context) => LoginScreen()),
                        (route) => false);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
