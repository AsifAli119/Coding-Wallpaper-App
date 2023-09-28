import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class SavedImagesToGallery {
   saveImage(BuildContext context, String imgPath) async {
    try {
      // Request storage permission
      final resultPermission = await _askPermission();

      // Check if the permission was granted
      if (resultPermission.isGranted) {
        final response = await Dio().get(
          imgPath,
          options: Options(responseType: ResponseType.bytes),
        );
        final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
        );
        print(result);
        Navigator.pop(context);
      } else {
        // Handle the case where permission is denied.
        print("Permission to access storage denied.");
      }
    } catch (e) {
      print("Error: $e");
      // Handle any exceptions that may occur during the image saving process.
    }
  }

  Future<PermissionStatus> _askPermission() async {
    if (Platform.isAndroid) {
      final permission = Permission.storage;
      if (await permission.isDenied) {
        final resultPermission = await permission.request();
        return resultPermission;
      }
    }
    return PermissionStatus.granted; // Return granted if not on Android
  }
}
