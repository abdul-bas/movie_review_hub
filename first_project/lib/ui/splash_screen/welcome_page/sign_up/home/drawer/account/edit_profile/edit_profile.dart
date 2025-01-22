import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/log_functions/profile_edit.dart';
import 'package:first_project/function/image_picker.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/splash_screen/welcome_page/Welcome_Page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/account/account.dart';
import 'package:first_project/widget/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  EditProfile({super.key, required this.userId});
  final String userId;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  late ValueNotifier<dynamic> profileImagePath; // Initialize later
  late SignUpModel userModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context).height;

    return ValueListenableBuilder(
      valueListenable: usersDetails,
      builder: (context, user, child) {
        userModel = user.firstWhere((e) => e.id == userId);
        nameController.text = userModel.fullName;
        emailController.text = userModel.email;

        // Initialize profileImagePath with the user's current image
        
       
        // ignore: unnecessary_null_in_if_null_operators
        profileImagePath = ValueNotifier<dynamic>(userModel.image ?? null);

        return AlertDialog(
          backgroundColor: bagroundBlack,
          content: SizedBox(
            height: screenSize * 0.5,
            width: double.infinity,
            child: Column(spacing: 20,mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ValueListenableBuilder(
                  valueListenable: profileImagePath,
                  builder: (context, image, child) {
                    return ProfileWidget(
                      // Current image path
                      onTap: () async {
  final selectedImage = await pickImg(imagePicker: _imagePicker);
  if (selectedImage != null) {
    profileImagePath.value = selectedImage; // Update the ValueNotifier
  }
},
                       image:
                          image is String ? image : null,
                    );
                  },
                ),const SizedBox(height: 5,),
               
                SizedBox(height: screenSize*0.06,
                  child: TextFormFieldWidget(textColor: textBlack,
                    controller: nameController,
                    filled: true,filledColor: textWeight,
                    radius: 15,
                    hint: 'Full Name',labelText:'Full Name' ,labelColor: textBlack,prefixicon: Icons.person,
                    maxLine: 1,
                  ),
                ),
               
                SizedBox(height: screenSize*0.06,
                  child: TextFormFieldWidget(filledColor: textWeight,textColor: textBlack,
                    controller: emailController,labelText: 'Email Address',labelColor:textBlack,prefixicon: Icons.email,iconColor: Colors.blue,
                    filled: true,
                    radius: 15,
                    maxLine: 1,
                    hint: 'Email Address',
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButtonWidget(
                      text: 'Cancel',
                      function: () => Navigator.of(context).pop(),
                    ),
                    TextButtonWidget(
                      text: 'Save',textColor: constWeght,
                      function: () => saveProfile(context),
                      backgroundColor: Colors.blue[900],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void saveProfile(BuildContext context) async {
    final fullName = nameController.text.trim();
    final userEmail = emailController.text.trim();

    if (fullName.isEmpty || userEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name and email cannot be empty')),
      );
      return;
    }

    final updatedUser = SignUpModel(
      fullName: fullName,
      password: userModel.password,
      email: userEmail,
      isLog: userModel.isLog,
      id: userModel.id,
      image: profileImagePath.value,
      index: userModel.index,
      isFavorate: userModel.isFavorate,
    );

    await profileEdit(userId, updatedUser);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(); // Close the dialog after saving
  }
}
