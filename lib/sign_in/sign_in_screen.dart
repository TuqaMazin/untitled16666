import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled16666/sign_up/sign_up_screen.dart';
import 'package:untitled16666/home/home_screen.dart'; // Import your HomeScreen
import '../common/color.dart'; // Ensure to include your color.dart file

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgGrayScreen,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _txtSignInWidget(context),
            _signInDetailsWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _txtSignInWidget(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text(
            "SIGN IN",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Please sign in to continue.",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _signInDetailsWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: kElevationToShadow[4],
      ),
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: MediaQuery.of(context).size.height * 0.25,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Column(
        children: [
          _emailTextField(),
          const SizedBox(height: 15),
          _passwordTextField(),
          const SizedBox(height: 20),
          _signInButton(context), // Pass context here
          const SizedBox(height: 30),
          _txtForgotPassword(),
          const SizedBox(height: 30),
          _txtOrConnectingUsing(),
          const SizedBox(height: 30),
          _signInWithGoogleButton(),
          _txtCreateAccount(context), // Pass context here
        ],
      ),
    );
  }

  Widget _emailTextField() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: TextFormField(
        maxLines: 1,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: AppColor.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: AppColor.primary,
        decoration: const InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(
            color: AppColor.txtColor999,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: AppColor.bgGaryTextFormField,
          prefixIcon: Icon(
            Icons.email,
            color: AppColor.txtColor999,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: TextFormField(
        maxLines: 1,
        textInputAction: TextInputAction.done,
        obscureText: true,
        style: const TextStyle(
          color: AppColor.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: AppColor.primary,
        decoration: const InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(
            color: AppColor.txtColor999,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: AppColor.bgGaryTextFormField,
          prefixIcon: Icon(
            Icons.lock_rounded,
            color: AppColor.txtColor999,
          ),
          suffixIcon: Icon(Icons.remove_red_eye, color: AppColor.txtColor999),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: const LinearGradient(
          colors: [
            AppColor.primary,
            AppColor.txtColorGreen,
          ],
        ),
      ),
      child: TextButton(
        onPressed: () {
          // Navigate to HomeScreen when sign in is successful
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _txtForgotPassword() {
    return const InkWell(
      child: Text(
        "Forgot Password?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.txtColorGreen,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _txtOrConnectingUsing() {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.grayDivider,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or Connect Using",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.txtColorGreen,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColor.grayDivider,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _signInWithGoogleButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/icons/ic_google.png",
          width: double.infinity,
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Sign in with Google",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.txtColor666,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _txtCreateAccount(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(
            color: AppColor.txtColor999,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Sign Up',
              style: const TextStyle(
                color: AppColor.txtColorGreen,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigate to the SignupScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}