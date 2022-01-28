import 'package:firebase_auth/firebase_auth.dart';
import '../models/app_user.dart';
import '../widgets/custom_toast.dart';
import 'user_apisdsa.dart';

class AuthMethods {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  static String? uid() {
    return _auth.currentUser?.uid;
  }

  Future<User?> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth
          .createUserWithEmailAndPassword(
        email: email.toLowerCase().trim(),
        password: password.trim(),
      )
          .catchError((Object obj) {
        CustomToast.errorToast(message: obj.toString());
      });
      final User? user = result.user;
      assert(user != null);
      return user;
    } catch (signUpError) {
      CustomToast.errorToast(message: signUpError.toString());
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .catchError((Object obj) {
        CustomToast.errorToast(message: obj.toString());
      });
      final User? user = result.user;
      // final AppUser appUser = await UserAPI().getInfo(uid: user!.uid);
      // TODO: add info
      return user;
    } catch (signUpError) {
      CustomToast.errorToast(message: signUpError.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
