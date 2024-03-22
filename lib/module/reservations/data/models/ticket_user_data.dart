/// Represents user data associated with a ticket.

class TicketUserData {
  String avatar;
  String firstName;
  bool isUser;
  String lastName;

  TicketUserData({
    required this.avatar,
    required this.firstName,
    required this.isUser,
    required this.lastName,
  });

  factory TicketUserData.fromJson(Map<String, dynamic> json) {
    return TicketUserData(
      avatar: json['avatar'],
      firstName: json['first_name'],
      isUser: json['is_user'],
      lastName: json['last_name'],
    );
  }
}
