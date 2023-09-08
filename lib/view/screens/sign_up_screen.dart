import 'package:flutter/material.dart';
import 'package:myimpactmetertask/utils/textstyles.dart';
import 'package:myimpactmetertask/view/screens/main_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;


  void _togglePass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getBody(),
    );
  }




  Widget getBody(){
    final authProvider = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height*0.1),
            Text(AppStrings.signUpExplore,style: AppTextStyles.headingStyle,textAlign: TextAlign.center,),
            SizedBox(height: size.height*0.05),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      hint: AppStrings.enterEmail),
                  SizedBox(height: 5),
                  CustomTextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    hint: AppStrings.enterPassword,
                    obsecuteText: _obscureText,
                    icon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: GestureDetector(
                        onTap: () {
                          _togglePass();
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          size: 22,
                          color: AppColors.obSecureIconColor,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*0.07),
                  Center(
                    child: CustomButton(
                      onTapped: (){
                        final email = emailController.text;
                        final password = passwordController.text;
                        authProvider.signUpWithEmailAndPassword(email, password);
                      },
                      width: size.width,
                      height: size.height * 0.06,
                      title: AppStrings.signUp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height*0.02,),
            SignUpTextButton(text: AppStrings.alreadyHaveAcc, bText: AppStrings.login, onTappedB: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInScreen()));
            }),

          ],
        ),
      ),
    );
  }

}
