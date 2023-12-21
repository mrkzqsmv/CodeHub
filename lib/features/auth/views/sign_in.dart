import 'package:app1/common/colors.dart';
import 'package:app1/common/paths.dart';
import 'package:app1/features/auth/controller/auth_controller.dart';
import 'package:app1/features/home/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(signInImage),
                    fit: BoxFit.cover),
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
                            'Sign In',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Email',
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
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: 'Password',
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
                                        .signInEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text)
                                        .then((value) => Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (_) => const Home(),
                                                ),
                                                (route) => false));
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                color: Colors.green.shade700,
                                minWidth: double.infinity,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(color: containerColor),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: InkWell(
                            child: const Text(
                              'Forgot Password ?',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            onTap: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account ?'),
                              TextButton(
                                child: const Text(
                                  'Sign Up',
                                  style:
                                      TextStyle(color: buttonColor, fontSize: 12),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
