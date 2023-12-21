import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonFbStorageProvider = Provider(
  (ref) => CommonFirebaseStorageRepository(
    firebaseStorage: FirebaseStorage.instance,
  ),
);

class CommonFirebaseStorageRepository{
  final FirebaseStorage firebaseStorage;

  CommonFirebaseStorageRepository({required this.firebaseStorage});

  Future<String> storeFileToFirebase(String ref,File file) async{
    final storageRef = firebaseStorage.ref(ref);
    final uploadTask = storageRef.putFile(file);
    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } 
}