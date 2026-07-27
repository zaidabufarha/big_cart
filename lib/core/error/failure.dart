abstract class Failure {
  String message;
  Failure(this.message);
}

class WrongPassword extends Failure {
  WrongPassword([super.message = 'Incorrect password']);
}

class NoInternet extends Failure {
  NoInternet([super.message = 'Couldn\'t connect to the server']);
}

class WrongOTP extends Failure {
  WrongOTP([super.message = 'Incorrect OTP']);
}

class InvalidEmail extends Failure {
  InvalidEmail([super.message = 'Email already in use']);
}

class InvalidNumber extends Failure {
  InvalidNumber([super.message = 'Number already in use']);
}
