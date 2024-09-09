import '../../../../domain/usecase/get_logged_user/get_logged_user.dart';
import '../../repositories/authentication/authentication_provider.dart';
import '../../repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_logged_user_provider.g.dart';

@riverpod
GetLoggedUser getLoggedUser(GetLoggedUserRef ref) => GetLoggedUser(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
