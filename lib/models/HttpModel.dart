class HttpResponseModel {
  late bool status;
  late Meta meta;
  dynamic data;
  Map<String, dynamic>? error;

  HttpResponseModel({
    required this.status,
    required this.meta,
    required this.data,
  });

  HttpResponseModel.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    meta = Meta.fromJSON(json['meta']);
    data = json['data'];
    error = json['error'];
  }
}

class Meta {
  late String message;
  late int? status;

  Meta({
    required this.message,
    required this.status,
  });

  Meta.fromJSON(Map<String, dynamic> meta) {
    message = meta['message'];
    status = meta['status'];
  }
}
