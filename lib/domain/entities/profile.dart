class Profile {
  const Profile(this.username, this.status, this.icon, this.online);
  const Profile.empty(String placeholder) : this('...', placeholder, -1, false);

  final String username;
  final String status;
  final int icon;
  final bool online;
}
