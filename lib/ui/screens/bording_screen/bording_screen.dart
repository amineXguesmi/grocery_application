import 'package:flutter/material.dart';

import '../../presentation/presentation.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.onBordingBackgroundImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    AppIcons.logoIcon,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome \nto our store",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Ger your groceries in as fast as one hour",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.descriptionTextColor, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 40),
                ActionButton(
                  buttonText: "Get Started",
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                ),
                SizedBox(
                  height: context.height * 0.06,
                ),
              ],
            )),
      ),
    );
  }
}
