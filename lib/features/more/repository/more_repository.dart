// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/article_model.dart';

final moreRepositoryProvider = Provider(
  (ref) => MoreRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class MoreRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  MoreRepository({
    required this.auth,
    required this.firestore,
  });

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> writeArticle(ArticleModel articleModel) async {
    await firestore.collection('articles').add(articleModel.toMap());
    await addSubCollection(
      'articles',
      auth.currentUser!.uid,
      'articles',
      articleModel.uid,
      articleModel.toMap(),
    );
  }

  Future<void> addSubCollection(
      String collectionName,
      String docID,
      String subCollectionName,
      subCollectionDocID,
      Map<String, dynamic> data) async {
    await firestore
        .collection(collectionName)
        .doc(docID)
        .collection(subCollectionName)
        .doc(subCollectionDocID)
        .set(data);
  }
}
