import 'package:flutter/material.dart';

import '../../../presentation/presentation.dart';
import '../../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 0.3,
                  child: Center(
                    child: Image.asset(
                      AppIcons.coloredLogoIcon,
                    ),
                  ),
                ),
                const Text(
                  "Logging",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter your emails and password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF7C7C7C)),
                ),
                SizedBox(height: context.height * 0.05),
                const CustomTextField(
                  labelText: "Email",
                  initialValue: "",
                ),
                SizedBox(height: context.height * 0.04),
                const CustomTextField(
                  labelText: "Password",
                  initialValue: "",
                  isPassword: true,
                ),
                SizedBox(height: context.height * 0.04),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color(0xFF181725), fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: context.height * 0.05),
                Center(
                  child: ActionButton(
                    buttonText: "Login",
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                  ),
                ),
                SizedBox(height: context.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
