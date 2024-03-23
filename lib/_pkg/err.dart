class Err {
  Err(
    this.message, {
    this.expected = false,
    this.title,
  }) {
    _init();
  }

  final String message;
  final bool expected;
  final String? title;

  void _init() {
    if (!expected) {
      var trace = StackTrace.current.toString();
      if (trace.length > 1000) trace = trace.substring(0, 1000);
    }
  }

  @override
  String toString() => (title != null ? '$title\nDetails: ' : '') + message;
}
