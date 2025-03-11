import 'package:flutter/material.dart';

class ChannelCard extends StatelessWidget {
  final String channelName;
  final String? channelImageUrl; // Make it optional
  final String? channelNumber; // Optional channel number

  const ChannelCard({
    super.key,
    required this.channelName,
    this.channelImageUrl,
    this.channelNumber,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(channelName),
                          ),
                        );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //         children: [
  //           if (channelImageUrl != null) // Conditional image display
  //             Image.network(
  //               channelImageUrl!,
  //               width: 60, // Adjust image size as needed
  //               height: 60,
  //               fit: BoxFit.cover, // Ensures image fills the space
  //               errorBuilder: (context, error, stackTrace) {
  //                 // Handle image loading errors
  //                 return const Icon(Icons.broken_image);
  //               },
  //             )
  //           else
  //             const SizedBox(width: 60, height: 60, child: Icon(Icons.tv)), // Placeholder if no image

  //           const SizedBox(width: 10), // Spacing between image and text
  //           Expanded( // Allows text to take remaining space
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   channelName,
  //                   style: const TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //                 if (channelNumber != null) // Conditional channel number display
  //                   Text(
  //                     'Channel: $channelNumber',
  //                     style: TextStyle(fontSize: 12),
  //                   ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}