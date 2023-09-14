//Class for exception handling
class ApiException {
  dynamic data;
  dynamic error;

  ApiException({
    this.data,
    this.error,
  });
}
