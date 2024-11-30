import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled16666/sign_in/sign_in_screen.dart';
import 'package:untitled16666/choose_height/choose_height_screen.dart'; // Import your ChooseHeightScreen
import '../common/color.dart'; // Ensure to include your color.dart file

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgGrayScreen,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _txtSignUpWidget(context),
            _signUpDetailsWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _txtSignUpWidget(BuildContext context) {
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
            "SIGN UP",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Create an account to get started.",
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

  Widget _signUpDetailsWidget(BuildContext context) {
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
          const SizedBox(height: 15),
          _confirmPasswordTextField(),
          const SizedBox(height: 20),
          _signUpButton(context), // Pass context here
          const SizedBox(height: 30),
          _txtTermsAndConditions(),
          const SizedBox(height: 30),
          _txtOrConnectingUsing(),
          const SizedBox(height: 30),
          _signUpWithGoogleButton(),
          _txtAlreadyHaveAccount(context), // Pass context here
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

  Widget _confirmPasswordTextField() {
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
          hintText: "Confirm Password",
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

  Widget _signUpButton(BuildContext context) {
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
          // Navigate to ChooseHeightScreen when sign up is successful
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ChooseHeightScreen()),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: const Text(
            "Sign Up",
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

  Widget _txtTermsAndConditions() {
    return const Text(
      "By signing up, you agree to our Terms and Conditions.",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColor.txtColor999,
        fontSize: 16,
        fontWeight: FontWeight.w400,
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

  Widget _signUpWithGoogleButton() {
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
            "Sign up with Google",
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

  Widget _txtAlreadyHaveAccount(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(
            color: AppColor.txtColor999,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Sign in',
              style: const TextStyle(
                color: AppColor.txtColorGreen,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigate to the SignInScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}