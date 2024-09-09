import '../../../../domain/usecase/logout/logout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/authentication/authentication_provider.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) =>
    Logout(authentication: ref.watch(authenticationProvider));
