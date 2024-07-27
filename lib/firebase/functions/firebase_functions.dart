import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseFunctions {
  static const String _collection = 'widgets-doc';
  static const String _textDocKey = 'text-doc';
  static const String _imageDocKey = 'image-doc';

  FirebaseFunctions._internal();
  static final FirebaseFunctions instance = FirebaseFunctions._internal();
  factory FirebaseFunctions() => instance;

  Future<dynamic> uploadImagetoFirebaseStorage(File imageFile) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imagesRef = storageRef
          .child("images/${DateTime.now().millisecondsSinceEpoch}.jpg");

      await imagesRef.putFile(imageFile);
      final downloadURL = await imagesRef.getDownloadURL();

      await addImageUrlToFirebase(downloadURL);

      return downloadURL;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<dynamic> addTextToFirebase(String text) async {
    try {
      FirebaseFirestore.instance
          .collection(_collection)
          .doc(_textDocKey)
          .set({"text": text});
      return true;
    } on FirebaseException catch (e) {
      return e;
    }
  }

  Future<dynamic> addImageUrlToFirebase(String imageUrl) async {
    FirebaseFirestore.instance
        .collection(_collection)
        .doc(_imageDocKey)
        .set({'imageurl': imageUrl});
  }

  Future<dynamic> fetchImageUrl() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(_collection)
          .doc(_imageDocKey)
          .get();

      if (documentSnapshot.exists) {
        return documentSnapshot['imageUrl'].toString();
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      return e;
    }
  }

  Future<dynamic> fetchText() async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection(_collection)
          .doc(_textDocKey)
          .get();

      if (documentSnapshot.exists) {
        return documentSnapshot['text'].toString();
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      return e;
    }
  }
}
