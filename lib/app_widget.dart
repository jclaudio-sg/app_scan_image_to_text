import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/presenter/pages/config_page.dart';
import 'history/presenter/pages/history_page.dart';
import 'home/presenter/pages/home_page.dart';
import 'scan/presenter/pages/scan_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Image To Text',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: "/", page: () => const HomePage()),
        GetPage(name: "/history", page: () => const HistoryPage()),
        GetPage(name: "/config", page: () => const ConfigPage()),
        GetPage(name: "/scan", page: () => const ScanPage()),
        GetPage(name: "/scan/camera", page: () => const ScanPage()),
        GetPage(name: "/scan/gallery", page: () => const ScanPage()),
      ],
    );
  }
}
