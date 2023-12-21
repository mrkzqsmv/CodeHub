import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user_model.dart';
import '../repository/profile_repository.dart';

final profileController = Provider(
  (ref) => ProfileController(
    profileRepository: ref.read(profileRepository),
  ),
);

class ProfileController {
  final ProfileRepository profileRepository;

  ProfileController({required this.profileRepository});

  Future<UserModel> getUser() async {
    return await profileRepository.getUser();
  }
}