extension IntExtensions on int {
  bool get codeSucessfull {
    var codes = [
      200,
      201,
      202,
      204,
    ];

    return codes.contains(this);
  }
}
