import 'package:flutter/material.dart';

import 'package:project/ui/screens/login_screen.dart';
import 'package:project/ui/widgets/body_background.dart';
import 'package:project/ui/widgets/snack_message.dart';

import '../../data/network_caller/network_caller.dart';
import '../../data/network_caller/network_response.dart';
import '../../data/utility/urls.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signUpInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Join with us",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                        controller: _emailTEController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your valid email address";
                          }
                        }),
                    const SizedBox(height: 16),
                    TextFormField(
                        controller: _firstNameTEController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "First name",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your First Name";
                          }
                        }),
                    const SizedBox(height: 16),
                    TextFormField(
                        controller: _lastNameTEController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Last name",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your Last Name";
                          }
                        }),
                    const SizedBox(height: 16),
                    TextFormField(
                        controller: _mobileTEController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          hintText: "Mobile",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your valid Phone Number";
                          }
                        }),
                    const SizedBox(height: 16),
                    TextFormField(
                        controller: _passwordTEController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your valid email address";
                          }
                        }),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: _signUpInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: _signUp,
                          child: const Icon(Icons.arrow_right_alt_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            "Sign in",
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
      ),
    );

  }

  Future<void> _signUp()async {
    if (_formKey.currentState!.validate()) {
      _signUpInProgress = true;
      if(mounted){
        setState(() {

        });
      }
      final NetworkResponse response =
      await NetworkCaller()
          .postRequest(Urls.registration, body: {
        "email":_emailTEController.text.trim(),
        "firstName":_firstNameTEController.text.trim(),
        "lastName":_lastNameTEController.text.trim(),
        "mobile":_mobileTEController.text.trim(),
        "password":_passwordTEController.text,


      });
      _signUpInProgress = false;
      if(mounted){
        setState(() {

        });
      }

      if (response.isSuccess) {
        _clearTextFields();
        if(mounted) {
          showSnackMessage(context, "Account has been created! Please login");
        }
      }else{
        if(mounted) {
          showSnackMessage(context, "Account creation failed. Please try again", true);
        }

      }
    }
  }

  void _clearTextFields(){
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();


  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
