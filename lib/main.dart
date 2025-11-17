import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart'; // <-- this now exists

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Background message received: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      home: BlogHomePage(),
    );
  }
}

class BlogHomePage extends StatefulWidget {
  @override
  _BlogHomePageState createState() => _BlogHomePageState();
}

class _BlogHomePageState extends State<BlogHomePage> {
  final List<String> blogs = [
    "Flutter 101",
    "Understanding FCM",
    "State Management Basics",
  ];

  @override
  void initState() {
    super.initState();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request notification permissions
    messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground message: ${message.notification?.title}');
    });

    // Get FCM token
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Blog")),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(blogs[index]),
            subtitle: Text("Read more..."),
          );
        },
      ),
    );
  }
}
