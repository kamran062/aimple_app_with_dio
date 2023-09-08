import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main_screen_provider.dart';
import '../../utils/strings.dart';
import '../../utils/textstyles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  File? _newProfilePicture;



  final GlobalKey<FormState> _formKey = GlobalKey();




  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    nameController.text = profileProvider.name;
    bioController.text = profileProvider.bio;
    // pictureController.text = profileProvider.profilePicture;
  }



  Future<void> _pickNewProfilePicture() async {
    // Implement your image selection logic here, e.g., using image_picker package.
    // In this example, we'll simply use a placeholder image.
    final newImageFile = File('assets/new_profile_picture.jpg');
    setState(() {
      _newProfilePicture = newImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',style: AppTextStyles.headingStyle,),
        centerTitle: true,
      ),
      body: getBody()
    );
  }

  Widget getBody(){
    final profileProvider = Provider.of<ProfileProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: size.height*0.07),

            GestureDetector(
              onTap: _pickNewProfilePicture,
              child: CircleAvatar(
                radius: 70,
                // backgroundImage: _newProfilePicture != null
                //     ? FileImage(_newProfilePicture!)
                //     : AssetImage(profileProvider.profilePicture),
                backgroundImage: AssetImage(profileProvider.profilePicture),
              ),
            ),
            SizedBox(height: size.height*0.05),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      hint: AppStrings.name),
                  SizedBox(height: size.height*0.02),
                  CustomTextFormField(
                      controller: bioController,
                      textInputAction: TextInputAction.next,
                      hint: AppStrings.bio),
                  SizedBox(height: size.height*0.05),
                  Center(
                    child: CustomButton(
                      onTapped: (){},
                      width: size.width,
                      height: size.height * 0.06,
                      title: AppStrings.update,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}