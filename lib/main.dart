import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpair/view/components/custom_video_player.dart';
import 'package:winpair/view/home_screen.dart';

import 'core/lib/channel_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ChannelProvider(),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Video Player Example')),
        body: const Center(
          child: HomeScreen()
        ),
      ),
    );
  }
}
