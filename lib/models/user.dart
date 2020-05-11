class UserUtils{
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();
}
enum LoginType { email, phone }

class User with UserUtils {
  String email;
  String phone;

  String _lastName;
  String _firstName;
  LoginType _type;

  //user
  List<User> friends = <User>[];

  User._({String firstName, String lastName, String phone, String email})
      : _firstName = firstName,
        _lastName = lastName,
        this.phone = phone,
        this.email = email {
    print("User is created");
    _type = email != null ? LoginType.email : LoginType.phone;
  }

  factory User({String name, String phone, String email}) {
    if (phone == null) phone = '';
    if (email == null) email = '';
    if (name == null) name = '';

    if (name.isEmpty) throw ("User name is empty");
    if (phone.isEmpty && email.isEmpty)
      throw Exception("phone or email is empty");
    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        phone: (phone.isNotEmpty) ? checkPhone(phone) : phone,
        email: (email.isNotEmpty) ? checkEmail(email) : email);
  }

  static String _getLastName(String userName) => userName.split(" ")[1];

  static String _getFirstName(String userName) => userName.split(" ")[0];

  static String checkPhone(String phone) {
    String pattern = r"^(?:[+0])?[0-9]{11}";

    phone = phone.replaceAll(RegExp("[^+\\d]"), "");

    if (phone == null || phone.isEmpty) {
      throw Exception("Enter don`t empty phone number");
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          "Enter a valid phone number staring with a + and containing 11 digits");
    }
    return phone;
  }

  static String checkEmail(String email) {
    if (email == null || email.isEmpty) {
      throw Exception("Enter don`t empty email");
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      throw Exception("Enter a valid email");
    }
    return email;
  }

  String get login {
    if (_type == LoginType.phone) return phone;
    return email;
  }

  String get name => "${capitalize(_firstName)} ${capitalize(_lastName)}";

  @override
  bool operator ==(Object object) {
    if (object == null) {
      return false;
    }
    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._lastName &&
          (phone == object.phone || email == object.email);
    }
  }

  void addFriend(Iterable<User> newFriend) {
    friends.addAll(newFriend);
  }

  void removeFriend(User user) {
    friends.remove(user);
  }
  User searchUser(User user){
    if(friends == null){
      throw Exception("List friends is null");
    }else if(friends.isEmpty){
      throw Exception("List is empty");
    }else {
      for (User i in friends)
        if (i == user) {
          return i;
        }
    }
  }
  String get userInfo => """
  name: $name
  email: $email
  firstName: $_firstName
  lastName: $_lastName
  friends: ${friends.toList()}
  \\n
  """;

  @override
  String toString() {
    return """
    name: $name
    email: $email
    friends : ${friends.toList()}
    """;
  }
}