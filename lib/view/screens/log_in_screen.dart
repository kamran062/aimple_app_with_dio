import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myimpactmetertask/utils/textstyles.dart';
import 'package:myimpactmetertask/view/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
import 'main_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

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
        child: Stack(
          children: [
            authProvider.isLoading
                ? Center(child: CupertinoActivityIndicator(color: Colors.black,))
                :SizedBox(),
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height*0.1),
                Text(AppStrings.loginExplore,style: AppTextStyles.headingStyle,textAlign: TextAlign.center,),
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
                           if (!authProvider.isLoading) {
                             final email = emailController.text;
                             final password = passwordController.text;
                             authProvider.signInWithEmailAndPassword(email, password).then((value){
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                             });
                           }
                         },
                          width: size.width,
                          height: size.height * 0.06,
                          title: AppStrings.login,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height*0.02,),
                SignUpTextButton(text: AppStrings.dontHaveAcc, bText: AppStrings.signUp, onTappedB: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                }),
                SizedBox(height: size.height*0.15,),
                CustomAuthButton(
                  onTapped: () {
                    if (!authProvider.isLoading) {
                      authProvider.signInWithApple();
                    }
                  },
                  width: double.infinity,
                  height: size.height * 0.06,
                  // title: AppStrings.apple,
                  isApple: true,
                ),
                SizedBox(height: size.height*0.02,),
                CustomAuthButton(
                  onTapped: () {
                    if (!authProvider.isLoading) {
                      authProvider.signInWithGoogle(); // Pass the context
                    }
                  },
                  width: double.infinity,
                  height: size.height * 0.06,
                  isApple: false,
                ),
                SizedBox(height: size.height*0.05,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpTextButton extends StatelessWidget {
  final String text;
  final String bText;
  Function() onTappedB;
  SignUpTextButton({super.key,required this.text,required this.bText,required this.onTappedB});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: AppTextStyles.textBStyle,
        children: <TextSpan>[
          TextSpan(
            text: bText,
            style: const TextStyle(
              color: Colors.blue,),
            recognizer: TapGestureRecognizer()
              ..onTap = onTappedB,
          ),
        ],
      ),
    );
  }
}