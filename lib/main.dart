import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notificacao/views/home_view.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  initializeNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 44, 0, 167),
            foregroundColor: Colors.white),
      ),
      home: const HomeView(),
    );
  }
}
