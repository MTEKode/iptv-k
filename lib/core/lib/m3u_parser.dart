import 'dart:convert';
import 'dart:io';

class M3uParser {
  static Map<String, String> parseChannel(String channelLineStr) {
    Map<String, String> channel = {};
    RegExp regex = RegExp(r'(\w+)(?:-?(\w+))?="(.*?)"');
    if (channelLineStr.startsWith('#EXTINF:')) {
      for (var match in regex.allMatches(channelLineStr)) {
        String key = match.group(2) != null ? '${match.group(1)}-${match.group(2)}' : match.group(1)!;
        String value = match.group(3)!;
        channel[key] = value;
      }
    } else if (channelLineStr.startsWith('http')) {
      channel['url'] = channelLineStr;
    }
    return channel;
  }
}

Future<List<Map<String, String>>> loadChannels(String filePath) async {
  List<Map<String, String>> channelList = [];
  File channelsFile = File(filePath);
  var stream = channelsFile.openRead();
  var lines = stream.transform(utf8.decoder).transform(LineSplitter());

  Map<String, String> lastChannel = {};

  await for (var line in lines) {
    Map<String, String> parsedLine = M3uParser.parseChannel(line);

    if (parsedLine.isNotEmpty && parsedLine.keys.first == 'url' && lastChannel.isNotEmpty) {
      lastChannel.addAll(parsedLine);
      channelList.add(lastChannel);
    } else {
      lastChannel = parsedLine;
    }
  }

  return channelList;
}

List<Map<String, String>> searchChannels(List<Map<String, String>> channels, String query) {
  String lowerQuery = query.toLowerCase();

  return channels.where((channel) {
    String tvgName = channel['tvg-name']?.toLowerCase() ?? '';
    return tvgName.contains(lowerQuery);
  }).toList();
}

void main() async {
  List<Map<String, String>> channels = await loadChannels('./assets/data/tv_channels_toribio_plus.m3u');

  String searchTerm = 'teacup'; // Example search
  List<Map<String, String>> results = searchChannels(channels, searchTerm);

  print('Found ${results.length} matching channels:');
  for (var channel in results) {
    print(channel);
  }
}
