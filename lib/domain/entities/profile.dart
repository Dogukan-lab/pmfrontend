class Profile {
  const Profile(this.username, this.bio, this.icon, this.online);
  const Profile.empty(String placeholder) : this('...', placeholder, -1, false);

  final String username;
  final String bio;
  final int icon;
  final bool online;
}
