class InfoUser {
  final String name;
  final String email;
  final num? phone;
  final int agencyID;

  InfoUser({
    required this.name,
    required this.email,
    this.phone = 1,
    required this.agencyID,
  });
}
