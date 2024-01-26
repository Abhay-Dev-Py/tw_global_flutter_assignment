import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/data/services/navigation_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AppMediaUtils {
  AppMediaUtils._();

  static Future<void> pickImage(ImageSource source) async {
    BuildContext context = AppNavigation.navigatorKey.currentState!.context;

    final PermissionStatus photoPermissionStatus =
        await Permission.photos.status;
    final PermissionStatus cameraPermissionStatus =
        await Permission.camera.status;

    if (photoPermissionStatus.isDenied ||
        photoPermissionStatus.isPermanentlyDenied ||
        cameraPermissionStatus.isDenied ||
        cameraPermissionStatus.isPermanentlyDenied) {
      // Request both photo and camera permissions if denied
      await Permission.photos.request();
      await Permission.camera.request();

      // Check the updated permission statuses
      final PermissionStatus updatedPhotoStatus =
          await Permission.photos.status;
      final PermissionStatus updatedCameraStatus =
          await Permission.camera.status;

      if (updatedPhotoStatus.isDenied ||
          updatedPhotoStatus.isPermanentlyDenied ||
          updatedCameraStatus.isDenied ||
          updatedCameraStatus.isPermanentlyDenied) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Permissions Denied'),
              content: const Text(
                'Please enable access to the camera and image library in settings.',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    openAppSettings();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );

        return;
      }
    }

    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);

      if (await imageFile.exists()) {
        // Crop the picked image
        final croppedFile = await _cropImage(imageFile);

        if (croppedFile != null) {}
      } else {}
      Navigator.of(context).pop();
    }
  }

  // Function to crop an image
  static Future<File?> _cropImage(File imageFile) async {
    return await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(
        ratioX: 1,
        ratioY: 1,
      ), // Set the aspect ratio as needed
      compressQuality: 100, // Image quality after cropping (0 - 100)
      maxWidth: 512, // Maximum width after cropping
      maxHeight: 512, // Maximum height after cropping
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        hideBottomControls: true, // Hide bottom action bar
      ),
    );
  }
}
