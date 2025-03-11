import 'package:flutter/material.dart';
import 'package:winpair/view/components/chanel_card.dart';

class ChannelsListHome extends StatelessWidget {
  const ChannelsListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Fav Channels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Replace with your actual fav channels count
                    itemBuilder: (context, index) => ChannelCard(channelName: 'Channel ${index + 1}'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Last Viewed Channels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Replace with your actual fav channels count
                    itemBuilder: (context, index) => ChannelCard(channelName: 'Channel ${index + 1}'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

