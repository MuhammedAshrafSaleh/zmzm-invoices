
class DeleteResponse {
  int? status;
  String? message;
  dynamic data;

  DeleteResponse({this.status, this.message, this.data});

  DeleteResponse.fromJson(Map<String, dynamic> json) {
    if(json["status"] is int) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["data"] = data;
    return _data;
  }
}