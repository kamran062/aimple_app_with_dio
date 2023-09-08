import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  String hint;
  var validator;
  bool? obsecuteText;
  var icon;
  var textInputAction;
  var onChanged;
  var keyboardType;
  int maxLines;
  int? maxLength;
  Color hintTextColor;
  bool enabled;
   CustomTextFormField({Key? key,required this.controller,required this.hint, this.validator, this.obsecuteText=false,this.icon,this.hintTextColor=AppColors.skipTextColor,this.maxLines=1,this.textInputAction,this.onChanged,this.enabled=true,this.maxLength,this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obsecuteText!,
      validator: validator,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onChanged: onChanged,
      // maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        enabled: enabled,
        suffixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 10,
        ),
          counterText: '',
        suffixIcon: Padding(padding: EdgeInsets.only(right: 20),child: icon,),
        contentPadding:
        const EdgeInsets.only( bottom: 11, top: 11, right: 15,left: 20),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColors.primaryWhiteColor),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColors.primaryWhiteColor),
          borderRadius: BorderRadius.circular(25.7),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColors.primaryWhiteColor),
          borderRadius: BorderRadius.circular(25.7),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryWhiteColor),
          borderRadius: BorderRadius.circular(25.7),
        ),focusedErrorBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryWhiteColor),
        borderRadius: BorderRadius.circular(25.7),
      ),
        fillColor: AppColors.circleAvatarColor,
        filled: true,
        hintText: hint,
        hintStyle:GoogleFonts.inter(
          textStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: hintTextColor),
        ),
      ),
    );
  }
}
