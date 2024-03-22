class Profile {
  const Profile({required this.id, required this.username, required this.status, required this.bio, required this.icon, required this.online});
  const Profile.empty(String placeholder) : this(id: -1, username: '...', status: placeholder, bio: placeholder, icon: -1, online: false);

  final int id;
  final String username;
  final String status;
  final String bio;
  final int icon;
  final bool online;

  Profile copyWith({
    int? id,
    String? username,
    String? status,
    String? bio,
    int? icon,
    bool? online,
  }) =>
      Profile(
        id: id ?? this.id,
        username: username ?? this.username,
        status: status ?? this.status,
        bio: bio ?? this.bio,
        icon: icon ?? this.icon,
        online: online ?? this.online,
      );

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as int,
      username: json['username'] as String,
      status: json['status'] as String,
      bio: json['bio'] as String,
      icon: json['profileIcon'] as int,
      online: json['isOnline'] as bool,
    );
  }
}
