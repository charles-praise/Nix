class Usermodel {
  final String email;
  final String password;

  Usermodel({
    required this.email,
    required this.password,
  });
}

class Friend {
  String name, image, message, msgTime;

  Friend(this.name, this.image, this.message, this.msgTime);
}

class Message {
  final int user;
  final String description;

  Message(this.user, this.description);
}
