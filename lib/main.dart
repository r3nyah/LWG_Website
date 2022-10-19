import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:lwg_website/Src/Service/Auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCz1tDgvI8dBzKkciWIk9q0uF-GNm31uPw",
        appId: "1:380629168260:web:23930435a85bcde3ea92d1",
        messagingSenderId: "380629168260",
        projectId: "lwg-android"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuthState(),
    );
  }
}