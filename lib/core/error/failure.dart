abstract class Failure {
  String message;
  Failure(this.message);
}

class WrongPasswordFailure extends Failure {
  WrongPasswordFailure([super.message = 'Incorrect password']);
}

class NoInternetFailure extends Failure {
  NoInternetFailure([super.message = 'Couldn\'t connect to the server']);
}

class WrongOTPFailure extends Failure {
  WrongOTPFailure([super.message = 'Incorrect OTP']);
}

class InvalidEmailFailure extends Failure {
  InvalidEmailFailure([super.message = 'Email already in use']);
}

class InvalidNumberFailure extends Failure {
  InvalidNumberFailure([super.message = 'Number already in use']);
}

class PasswordMismatchFailure extends Failure {
  PasswordMismatchFailure([super.message = 'Passwords do not match']);
}

// class ServerFailure extends Failure {
//   ServerFailure([super.message = 'Something went wrong, try again later']);
// }
