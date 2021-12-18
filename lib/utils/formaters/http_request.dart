class HttpRequestFormater {
  HttpRequestFormater(this.data);
  Map<String, dynamic> data;

  HttpRequestFormater clean() {
    data.removeWhere((key, value) => value == null);
    return this;
  }
}
