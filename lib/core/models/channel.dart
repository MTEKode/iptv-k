class Channel {
  final String id;
  final String name;
  final String logoUrl;
  final String groupTitle;
  final String streamUrl;

  Channel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.groupTitle,
    required this.streamUrl,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      logoUrl: json['logoUrl'] ?? '',
      groupTitle: json['groupTitle'] ?? '',
      streamUrl: json['streamUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'groupTitle': groupTitle,
      'streamUrl': streamUrl,
    };
  }
}