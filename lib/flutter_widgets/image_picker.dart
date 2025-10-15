import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '';
import 'dart:io';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  bool _isLoading = false;

  // pick from gallery
  Future<File?> pickFromGallery() async {
    try {
      final XFile? picked = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked == null) return null;
      // setState(() {
      //   _imageFile = File(picked.path);
      // });
      return File(picked.path);
    } catch (e) {
      print("Error Occurred during selecting image: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error picking image : $e")));
      return null;
    }
  }

  // pick image from camera
  Future<File?> pickFromCamera() async {
    try {
      final XFile? picked = await _imagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (picked == null) return null;
      // setState(() {
      //   _imageFile = File(picked.path);
      // });
      return File(picked.path);
    } catch (e) {
      print("Error Occurred during clicking image: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error picking image : $e")));
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _imageFile != null
                  ? Image.file(
                      _imageFile!,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text("Pick Image Via Gallery"),
              onPressed: () async {
                _imageFile = await pickFromGallery();
                if (_imageFile != null) {
                  CroppedFile? croppedFile = await ImageCropper().cropImage(
                    sourcePath: _imageFile!.path,
                    uiSettings: [
                      AndroidUiSettings(
                        toolbarTitle: 'Cropper',
                        toolbarColor: Colors.deepOrange,
                        toolbarWidgetColor: Colors.white,
                        aspectRatioPresets: [
                          CropAspectRatioPreset.original,
                          CropAspectRatioPreset.square,
                        ],
                      ),
                    ],
                  );
                  if(croppedFile != null){
                    _imageFile = File(croppedFile.path);
                  }
                  setState(() {});
                } else {
                  print(" Please Select Image");
                }
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.photo_camera),
              label: Text("Pick Image Via Camera"),
              onPressed: () async {
                _imageFile = await pickFromCamera();
                if (_imageFile != null) {
                  CroppedFile? croppedFile = await ImageCropper().cropImage(
                    sourcePath: _imageFile!.path,
                    uiSettings: [
                      AndroidUiSettings(
                        toolbarTitle: 'Cropper',
                        toolbarColor: Colors.deepOrange,
                        toolbarWidgetColor: Colors.white,
                        aspectRatioPresets: [
                          CropAspectRatioPreset.original,
                          CropAspectRatioPreset.square,
                        ],
                      ),
                    ],
                  );
                  if(croppedFile != null){
                    _imageFile = File(croppedFile.path);
                  }
                  setState(() {});
                } else {
                  print(" Please Select Image");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
