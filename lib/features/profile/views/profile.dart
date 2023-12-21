import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/sizes.dart';
import '../../../models/user_model.dart';
import '../controller/profile_controller.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: FutureBuilder<UserModel>(
            future: ref.read(profileController).getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userModel = snapshot.data!;
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.amber,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: CachedNetworkImageProvider(
                              userModel.profilePhoto!),
                        ),
                      ),
                      Padding(
                        padding: verticalPadding10,
                        child: Text(
                          '@${userModel.username}',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: verticalPadding10,
                        child: Text(
                          '${userModel.name} ${userModel.surname}',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 200,
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Edit Profile',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (ConnectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}