class DataInputModel {
  String data;
  bool isNotValid;
  bool isValid;
  DataInputModel(
      {required this.isNotValid, required this.data, required this.isValid});

  @override
  String toString() {
    Map<String, dynamic> stringData = {
      "data": data,
      "isValid": isValid,
      "isNotValid": isNotValid
    };
    return stringData.toString();
  }
}
