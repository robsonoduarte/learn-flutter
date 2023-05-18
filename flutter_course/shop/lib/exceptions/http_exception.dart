class HttpException implements Exception {
  final String msg;
  final int sc;
  HttpException(this.msg, this.sc);

  @override
  String toString() {
    return msg;
  }
}
