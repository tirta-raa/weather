part of 'services.dart';

class UserService {
  CollectionReference _userReferance =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      //* sesuaikan dengan di UserModels
      _userReferance.doc(user.id).set({
        'email': user.email,
        'name': user.name,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReferance.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
      );
    } catch (e) {
      throw e;
    }
  }
}
