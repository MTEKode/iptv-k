import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpair/view/components/channels_list.dart';
import 'package:winpair/view/components/channels_list_home.dart';
import 'package:winpair/view/components/custom_video_player.dart';

import '../core/lib/channel_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    final channelGroups = Provider.of<ChannelProvider>(context).channelGroups;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.list),
            icon: Icon(Icons.list_alt_outlined),
            label: 'List',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: <Widget>[
          ChannelsListHome(),
          ChannelsList(channelGroups: channelGroups),
          CustomVideoPlayer(
            videoUrl: 'http://titled36322.cdngold.me:80/toribio/7121b8a559/855889',
          )
        ][currentPageIndex],
      ),
    );
  }
}

