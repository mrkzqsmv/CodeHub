import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImageFromGallery() async {
  XFile? image;
  try {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage != null) {
      image = pickedImage;
    } else {
      debugPrint('No image selected.'); 
      
    } 
  } catch (e) {
    debugPrint(e.toString()); 
  }
  return image;
} 