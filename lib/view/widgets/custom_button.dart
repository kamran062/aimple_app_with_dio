import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myimpactmetertask/utils/assets.dart';
import 'package:myimpactmetertask/utils/strings.dart';

import '../../utils/colors.dart';
import '../../utils/textstyles.dart';

class CustomButton extends StatelessWidget {
  double height;
  double width;
  String title;
  var onTapped;
   CustomButton({Key? key,required this.height,required this.title,required this.width,this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTapped,
      child: Container(
        height: height,
        // height: size.height*0.07,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.primaryColor
        ),
        child: Center(
          child: Text(title,style: AppTextStyles.buttonTextStyle,),
        ),
      ),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  double height;
  double width;
  bool isApple;
  var onTapped;
  CustomAuthButton({Key? key,required this.height,required this.width,this.onTapped,required this.isApple}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTapped,
      child: Container(
        // width: size.width * 0.85,
        height: size.height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.blackColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isApple?Icon(Icons.apple,color: Colors.white,size: size.height*0.05,):Image.asset(AppAssets.gLogo,height: size.height*0.04,),
            SizedBox(width: 10,),
            isApple?Text(AppStrings.appleContinue,style: AppTextStyles.buttonTextStyle,):
            Text(AppStrings.googleContinue,style: AppTextStyles.buttonTextStyle,),
          ],
        ),
      ),
    );
  }
}
