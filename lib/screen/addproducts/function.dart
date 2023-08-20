// ignore_for_file: prefer_typing_uninitialized_variables, depend_on_referenced_packages
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path1;


class ImagePickerController extends GetxController {
 // List<dynamic> downloadURLs = [].obs;
 List<dynamic> downloadURLs = <dynamic>[].obs;
  List<dynamic>imagelist=[].obs;
  var imagepath;
  List<String> imageUrl = [];
  Future <void> takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      
        imagepath = pickedFile.path;
      
    }
    imagelist.add(imagepath); 
    log(imagelist.toString());
  await uploadImagesToFirebase(
  imagelist);
  }
  void clear() {
    imageUrl.clear();
    imagelist.clear();
  }
  void removeImageAtIndex(int index) {
   
      imagelist.removeAt(index);
     
  }
   void removeUpdateIndex(int index){
     downloadURLs.removeAt(index);
    // imagelist.removeAt(index);
   }

Future<void> uploadImagesToFirebase(
      List<dynamic> imagePaths) async {
    final FirebaseStorage storage =
       FirebaseStorage.instance;
    final Reference storageRef = storage.ref();

    for (String imagePath in imagePaths) {
      final file = File(imagePath);
      final fileName = path1.basename(file.path);
      final Reference imageRef = storageRef.child(fileName);

      try {
        await imageRef.putFile(file);
        final downloadURL = await imageRef.getDownloadURL();
        downloadURLs.add(downloadURL);
      } catch (error) {
        // final snackBar =
        //     SnackBar(content: Text('Failed to upload image: $error'));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log(error.toString());
      }
    }
      }

 RxString dropdowngetx=''.obs;
      void setSelectedCategorys( String category){
       dropdowngetx.value=category;
      }

 RxString dropdownsizegetx=''.obs;
      void setSelectedSize( String category){
       dropdownsizegetx.value=category;
      }

      RxString dropgetx=''.obs;
      void setSelectedBrand( String brand){
       dropgetx.value=brand;
      }
}

