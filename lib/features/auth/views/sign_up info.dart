import 'package:app1/common/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app1/common/colors.dart';
import 'package:app1/features/auth/controller/auth_controller.dart';
import 'package:app1/models/user_model.dart';

import '../../home/views/home.dart';

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(profileInfoImage), fit: BoxFit.cover),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(color: borderColor))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: _surnameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Surname is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: 'Surname',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(color: borderColor))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: _usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(color: borderColor))),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ref
                                      .read(authController)
                                      .storeUserInfoToFirebase(
                                        UserModel(
                                          name: _nameController.text,
                                          surname: _surnameController.text,
                                          email: widget.email,
                                          username: _usernameController.text,
                                        ),
                                      )
                                      .whenComplete(() =>
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => const Home()),
                                              (route) => false));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              color: buttonColor,
                              minWidth: double.infinity,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: containerColor),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
