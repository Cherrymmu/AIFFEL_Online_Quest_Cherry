import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addUser(Map<String, dynamic> user) async {
  try {
    await db.collection('Users').doc(user['UserEmail']).set({
      'Email' : user['Email'],
      'SkinDisease' : user['SkinDisease'],
      'Name' : user['Name'],
      'Location' : user['Location'],
      'Tel' : user['Tel'],
      'NaverId' : user['NaverId'],
      'GoogleId' : user['GoogleId'],
      'KakaoId' : user['KakaoId'],
    });
    print('User added Successfully');
  } catch (error) {
    print('Error adding user: $error');
  }
}
