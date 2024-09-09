import '../repositories/authentication.dart';
import '../../domain/result.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseAuth implements Authentication {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuth({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  @override
  String? getLoginUserId() => _firebaseAuth.currentUser?.uid;

  @override
  Future<Result<void>> logOut() async {
    await _firebaseAuth.signOut();
    if (_firebaseAuth.currentUser == null) {
      return const Result.success(null);
    } else {
      return const Result.failed('Gagal Logout');
    }
  }

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed('${e.message}');
    }
  }
}
