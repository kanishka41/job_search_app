import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_search_app/app_job_search.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyBw4Yla_CrCQqtJ4NF0CwzAQpZ57PnCF-U",
    authDomain: "nexthire-f794f.firebaseapp.com",
    projectId: "nexthire-f794f",
    storageBucket: "nexthire-f794f.appspot.com",
    messagingSenderId: "592385901632",
    appId: "1:592385901632:web:afb44050958ed68d180ba5",
    measurementId: "G-4HR5ZST9G8"
  );


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);

  // OneSignal.initialize('cd0d5a43-b7de-48d9-bee8-153c06abbbd4');
  OneSignal.initialize("cd0d5a43-b7de-48d9-bee8-153c06abbbd4");

  runApp(const JobSearchApp());
}
