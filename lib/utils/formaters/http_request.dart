class HttpRequestFormater {
  HttpRequestFormater(this.data);
  final Map<String, dynamic> data;

  Map<String, dynamic> clean() {
    return data..removeWhere((key, value) => value == null);
  }
}
