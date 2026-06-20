import 'dart:io';

import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/function/image_picker.dart';
import 'package:first_project/function/pop_up.dart';
import 'package:first_project/file_structure/ui/auth/welcome_screen/Welcome_Page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/adding_button.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// ignore: must_be_immutable
class AddingAlertWidget extends StatefulWidget {
  AddingAlertWidget({
    super.key,
    required this.castPhoto,
    required this.height,
    required this.imagePicker1,
    required this.width,required this.castImages,required this.castNames
  });

  String? castPhoto;
  final double height;
  final ImagePicker imagePicker1;
  final double width;
ValueNotifier< List<String>> castImages;
  ValueNotifier <List<String> >castNames;
  @override
  State<AddingAlertWidget> createState() => _AddingAlertWidgetState();
}

final TextEditingController _controller = TextEditingController();

class _AddingAlertWidgetState extends State<AddingAlertWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bagroundBlack,
      title: TextWidget(
        text: 'Cast Photo',
        color: textWeight,
      ),
      content: ContainerWidget(
          height: 0.32,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(backgroundColor: textWeight,
                radius: widget.height * 0.065,
                backgroundImage:
                    widget.castPhoto != null && widget.castPhoto!.isNotEmpty
                        ? FileImage(File(widget.castPhoto!))
                        : null,
                child: widget.castPhoto != null && widget.castPhoto!.isNotEmpty
                    ? null
                    : IconButton(
                        onPressed: () async {
                          final castImage =
                              await pickImg(imagePicker: widget.imagePicker1);
                          if (castImage != null) {
                            setState(() {
                              widget.castPhoto = castImage;
                            });
                          }
                        },
                        icon:  Icon(Icons.add_photo_alternate, size: 40,color: textBlack,),
                      ),
              ),
              SizedBox(
                height: widget.height * 0.02,
              ),
              TextFormFieldWidget(
                focusBorderColor: Colors.blue,
                controller: _controller,
                filled: true,
                filledColor: textWeight,textColor: textBlack,
                radius: 13,
                hint: 'Cast Name',
                prefixicon: Icons.person,
                hintColor: opendecityBlack,
                iconColor: opendecityBlack,
                height: 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: ButtonInAdding(
                      function: () => popUp(context),
                      icon: false,
                      text: 'Cancel',
                      height: 0.045,
                      width: 0.32,
                      bagroundColor: textWeight,textColor: textBlack,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: ButtonInAdding(
                      function: () {
                        String text = _controller.text.trim();
                        if (widget.castPhoto != null && text.isNotEmpty) {
                        widget.  castImages.value.add(widget.castPhoto!);
                       // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                       widget.   castImages.notifyListeners();
                        widget.  castNames.value.add(text);
                       // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                       widget.   castNames.notifyListeners();
                          popUp(context);
                          _controller.clear();
                        }
                      },
                      text: 'Add',
                      height: 0.045,
                      width: 0.31,
                      icon: false,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
