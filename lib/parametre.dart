import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:page_dannonces/Widget/ScrollWidget.dart';

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: AppBarExample(),
      home: SettingApp(),
    );
  }
}

class SettingApp extends StatelessWidget {
  const SettingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parametre'),
        actions: [Icon(Icons.settings)],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: const Row(
              children: [
                Icon(Icons.privacy_tip),
                Text('Confidentialite'),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: const Row(children: [
              Icon(Icons.notification_add),
              Text('Notificaiton'),
            ]),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: const Row(children: [
              Icon(Icons.delete),
              Text('Supprimer Compte'),
            ]),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: const Row(children: [
              Icon(Icons.help),
              Text('Aide'),
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ]),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
