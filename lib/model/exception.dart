//this class is used to handle the different exception while fetching the data from the internet

class NoInternetException {
  var message;
  NoInternetException({required this.message});
}

class NoServiceFoundException {
  var message;
  NoServiceFoundException({this.message});
}

class InvalidFormatException {
  var message;
  InvalidFormatException({this.message});
}

class UnknownException {
  var message;
  UnknownException({this.message});
}
