abstract class Failure {}

class ServerFailure extends Failure {
  @override
  String toString() {
    return "Server error";
  }
}

class NetworkFailure extends Failure {
  @override
  String toString() {
    return "Network connection failed";
  }
}

class CacheFailure extends Failure {
  @override
  String toString() {
    return "Network connection failed";
  }
}

