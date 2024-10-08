import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notificacao/main.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'id_canal', // ID do canal
    'nome_canal', // Nome do canal
    channelDescription: 'descr',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // ID da notificação
    'Título da Notificação', // Título
    'Esta é a descrição da notificação', // Corpo
    platformChannelSpecifics,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('Notificador'),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(198, 24, 0, 160),
            Color.fromARGB(255, 75, 0, 110),
            Color.fromARGB(255, 233, 2, 2)
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/espaco4.jpg"), // Imagem de fundo
            fit: BoxFit.cover, // Faz a imagem cobrir a tela
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Notificador Espacial',
                style: TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        color: Color.fromARGB(0, 4, 4, 128),
                      )
                    ],
                    color: Color.fromARGB(255, 86, 0, 224),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 146, 0, 0),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    showNotification();
                  },
                  icon: const Icon(Icons.notification_important),
                  label: const Text('Mostrar notificação')),
            ],
          ),
        ),
      ),
    );
  }
}
