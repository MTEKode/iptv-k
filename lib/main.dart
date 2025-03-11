import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpair/view/home_screen.dart';
import 'package:winpair/core/lib/channel_provider.dart';

void main() async { //Make main async
  WidgetsFlutterBinding.ensureInitialized(); //Add this line.
  final channelProvider = ChannelProvider();
  await channelProvider.loadChannels('./assets/data/tv_channels_toribio_plus.m3u'); //Replace with your file path.
  runApp(ChangeNotifierProvider(
    create: (_) => channelProvider,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}