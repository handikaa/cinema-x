import '../../../../data/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/firebase/firebase_user_repo_impl.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    FirebaseUserRepository();
