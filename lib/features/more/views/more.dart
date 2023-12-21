// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: subtype_of_sealed_class

import 'package:app1/features/auth/controller/auth_controller.dart';
import 'package:app1/features/more/controller/more_controller.dart';
import 'package:app1/features/widgets/subtitle_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app1/common/colors.dart';
import 'package:app1/common/paths.dart';
import 'package:app1/common/sizes.dart';
import 'package:app1/models/user_model.dart';

import '../../auth/views/sign_in.dart';
import '../../profile/controller/profile_controller.dart';
import 'write_article.dart';

class More extends ConsumerWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: ref.read(profileController).getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userModel = snapshot.hasData;
            return SafeArea(
              child: Padding(
                padding: scaffoldPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'More',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //there is a problem with the icon
                        const Padding(
                          padding: verticalPadding10,
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurpleAccent,
                            radius: 20,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    _title('Create Content'),
                    MenuItem(
                      leadingAsset: articleSvg,
                      title: 'Write an article',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WriteArticle(),
                          ),
                        );
                      },
                    ),
                    MenuItem(
                      leadingAsset: codeSvg,
                      title: 'Let\'s try the coding page!',
                      onTap: () {},
                    ),
                    MenuItem(
                      leadingAsset: articleSvg,
                      title: 'Your articles',
                      onTap: () {},
                    ),
                    MenuItem(
                      leadingAsset: codeSvg,
                      title: 'Your code repos',
                      onTap: () {},
                    ),
                    _title('Profile'),
                    MenuItem(
                      leadingAsset: userEditSvg,
                      title: 'Edit your profile',
                      onTap: () {},
                    ),
                    MenuItem(
                      leadingAsset: signOutSvg,
                      title: 'Sign out',
                      onTap: () {
                        ref
                            .read(moreControllerProvider)
                            .signOut()
                            .whenComplete(() => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignIn(),
                                ),
                                (route) => false));
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }

  Padding _title(String title) {
    return Padding(
      padding: verticalPadding10,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.onTap,
    required this.leadingAsset,
    required this.title,
  }) : super(key: key);
  final Function()? onTap;
  final String leadingAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: verticalPadding5,
        child: Card(
          elevation: 10,
          color: activeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: SvgPicture.asset(
              leadingAsset,
            ),
            title: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
