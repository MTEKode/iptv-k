import 'package:flutter/material.dart';

class ChannelsList extends StatelessWidget {
  final List<String> channelGroups;

  const ChannelsList({
    super.key,
    required this.channelGroups
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: ListView.builder(
          itemCount: channelGroups.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                'Group Name',
                style: const TextStyle(color: Colors.white),
              ),
              // onTap: () => onGroupSelected(channelGroups[index]),
            );
          },
        ),
      ),
    );
  }
}
