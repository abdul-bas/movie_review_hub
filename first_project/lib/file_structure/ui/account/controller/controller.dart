import 'package:first_project/function/hive_functions/log_functions/profile_edit.dart';
import 'package:first_project/function/image_picker.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AccountController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();

  late SignUpModel userModel;

  String? imagePath;
  bool isSaving = false;

  void initUser(String userId, List<SignUpModel> users) {
    userModel = users.firstWhere((e) => e.id == userId);

    if (nameController.text.isEmpty) {
      nameController.text = userModel.fullName ;
      emailController.text = userModel.email ;
      imagePath = userModel.image;
    }
  }

  Future<void> pickImage() async {
    final picked = await pickImg(imagePicker: imagePicker);

    if (picked != null) {
      imagePath = picked;
    }
  }

  Future<bool> saveProfile(String userId) async {
    final fullName = nameController.text.trim();
    final email = emailController.text.trim();

    if (fullName.isEmpty || email.isEmpty) {
      return false;
    }

    isSaving = true;

    final updated = SignUpModel(
      fullName: fullName,
      email: email,
      password: userModel.password,
      isLog: userModel.isLog,
      id: userModel.id,
      image: imagePath,
      index: userModel.index,
      isFavorate: userModel.isFavorate,
    );

    await profileEdit(userId, updated);

    isSaving = false;
    return true;
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
  }
}