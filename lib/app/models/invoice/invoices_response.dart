
class InvoicesResponse {
  String? status;
  String? message;
  List<Data>? data;

  InvoicesResponse({this.status, this.message, this.data});

  InvoicesResponse.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  int? projectId;
  String? invoiceNumber;
  String? amount;
  String? date;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.projectId, this.invoiceNumber, this.amount, this.date, this.image, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["project_id"] is int) {
      projectId = json["project_id"];
    }
    if(json["invoice_number"] is String) {
      invoiceNumber = json["invoice_number"];
    }
    if(json["amount"] is String) {
      amount = json["amount"];
    }
    if(json["date"] is String) {
      date = json["date"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["project_id"] = projectId;
    _data["invoice_number"] = invoiceNumber;
    _data["amount"] = amount;
    _data["date"] = date;
    _data["image"] = image;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}