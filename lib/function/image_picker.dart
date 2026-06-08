
import 'package:image_picker/image_picker.dart';

Future<String?> pickImg({required ImagePicker imagePicker}) async {
  
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final String movieImage = pickedFile.path;
      return movieImage;
    } else {
      return null;
    }
 
}
