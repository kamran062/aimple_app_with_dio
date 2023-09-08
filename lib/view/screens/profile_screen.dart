import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myimpactmetertask/utils/textstyles.dart';
import 'package:provider/provider.dart';
import '../../providers/main_screen_provider.dart';
import '../../utils/strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    nameController.text = profileProvider.name;
    bioController.text = profileProvider.bio;
    // pictureController.text = profileProvider.profilePicture;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile',style: AppTextStyles.headingStyle,),
        centerTitle: true,
      ),
      body: getBody(context)
    );
  }

  Widget getBody(BuildContext context){
    final profileProvider = Provider.of<ProfileProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height*0.07),

            GestureDetector(
              // onTap: _pickNewProfilePicture,
              child: CircleAvatar(
                radius: 70,
                // backgroundImage: _newProfilePicture != null
                //     ? FileImage(_newProfilePicture!)
                //     : AssetImage(profileProvider.profilePicture),
                backgroundImage: AssetImage(profileProvider.profilePicture),
              ),
            ),
            SizedBox(height: size.height*0.05),
            Column(
              children: [
                CustomTextFormField(
                  enabled: false,
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    hint: AppStrings.name),
                SizedBox(height: size.height*0.02),
                CustomTextFormField(
                    enabled: false,
                    controller: bioController,
                    textInputAction: TextInputAction.next,
                    hint: AppStrings.bio),
                SizedBox(height: size.height*0.05),
                Center(
                  child: CustomButton(
                    onTapped: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    width: size.width,
                    height: size.height * 0.06,
                    title: AppStrings.editProfile,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

