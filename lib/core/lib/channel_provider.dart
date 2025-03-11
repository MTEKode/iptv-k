import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'm3u_parser.dart';

class ChannelProvider extends ChangeNotifier {
  List<Map<String, String>> _channelList = [];

  List<Map<String, String>> get channelList => _channelList;

  Future<void> loadChannels(String filePath) async {
    _channelList.clear();
    File channelsFile = File(filePath);
    var stream = channelsFile.openRead();
    var lines = stream.transform(utf8.decoder).transform(LineSplitter());

    Map<String, String> lastChannel = {};
    await for (var line in lines) {
      Map<String, String> parsedLine = M3uParser.parseChannel(line);
      if (parsedLine.isNotEmpty && parsedLine.keys.first == 'url' && lastChannel.isNotEmpty) {
        lastChannel.addAll(parsedLine);
        _channelList.add(lastChannel);
      } else {
        lastChannel = parsedLine;
      }
    }
    notifyListeners(); // Notificar a la UI que los datos han cambiado
  }

  List<Map<String, String>> searchChannels(String query) {
    String lowerQuery = query.toLowerCase();
    return _channelList.where((channel) {
      String tvgName = channel['tvg-name']?.toLowerCase() ?? '';
      return tvgName.contains(lowerQuery);
    }).toList();
  }

  List<String> get channelGroups {
    return _channelList
        .map((channel) => channel["group-title"] ?? "Unknown") // Extraer 'group-title'
        .toSet() // Eliminar duplicados
        .toList();
  }
}
