// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app1/common/colors.dart';
import 'package:app1/common/paths.dart';
import 'package:app1/common/repository/common_firebase_storage.dart';
import 'package:app1/common/sizes.dart';
import 'package:app1/common/utils.dart';
import 'package:app1/models/user_model.dart';

class WriteArticle extends ConsumerStatefulWidget {
  const WriteArticle({super.key});

  @override
  ConsumerState<WriteArticle> createState() => _WriteArticleState();
}

class _WriteArticleState extends ConsumerState<WriteArticle> {
  XFile? image;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void pickImage() async {
    image = await pickImageFromGallery();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            centerTitle: true,
            title: Text(
              'Your Article',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    
                  }
                },
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: Padding(
            padding: scaffoldPadding,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: activeColor,
                        image: image != null
                            ? DecorationImage(
                                image: FileImage(File(image!.path)),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: image == null
                          ? const Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.white,
                              size: 50,
                            )
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: verticalPadding5,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Your Title Here!',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter content';
                      }
                      return null;
                    },
                    controller: contentController,
                    maxLines: 100,
                    decoration: InputDecoration(
                      hintText: 'Your Article Content Here!',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
