/// page : 1
/// per_page : 6
/// total : 12
/// total_pages : 2
/// data : [{"id":1,"name":"cerulean","year":2000,"color":"#98B2D1","pantone_value":"15-4020"},{"id":2,"name":"fuchsia rose","year":2001,"color":"#C74375","pantone_value":"17-2031"},{"id":3,"name":"true red","year":2002,"color":"#BF1932","pantone_value":"19-1664"},{"id":4,"name":"aqua sky","year":2003,"color":"#7BC4C4","pantone_value":"14-4811"},{"id":5,"name":"tigerlily","year":2004,"color":"#E2583E","pantone_value":"17-1456"},{"id":6,"name":"blue turquoise","year":2005,"color":"#53B0AE","pantone_value":"15-5217"}]
/// support : {"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}

class LoginResponse {
  int _page;
  int _perPage;
  int _total;
  int _totalPages;
  List<Data> _data;
  Support _support;

  int get page => _page;
  int get perPage => _perPage;
  int get total => _total;
  int get totalPages => _totalPages;
  List<Data> get data => _data;
  Support get support => _support;

  LoginResponse({
      int page, 
      int perPage, 
      int total, 
      int totalPages, 
      List<Data> data, 
      Support support}){
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    _data = data;
    _support = support;
}

  LoginResponse.fromJson(dynamic json) {
    _page = json["page"];
    _perPage = json["per_page"];
    _total = json["total"];
    _totalPages = json["total_pages"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
    _support = json["support"] != null ? Support.fromJson(json["support"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = _page;
    map["per_page"] = _perPage;
    map["total"] = _total;
    map["total_pages"] = _totalPages;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    if (_support != null) {
      map["support"] = _support.toJson();
    }
    return map;
  }

}

/// url : "https://reqres.in/#support-heading"
/// text : "To keep ReqRes free, contributions towards server costs are appreciated!"

class Support {
  String _url;
  String _text;

  String get url => _url;
  String get text => _text;

  Support({
      String url, 
      String text}){
    _url = url;
    _text = text;
}

  Support.fromJson(dynamic json) {
    _url = json["url"];
    _text = json["text"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    map["text"] = _text;
    return map;
  }

}

/// id : 1
/// name : "cerulean"
/// year : 2000
/// color : "#98B2D1"
/// pantone_value : "15-4020"

class Data {
  int _id;
  String _name;
  int _year;
  String _color;
  String _pantoneValue;

  int get id => _id;
  String get name => _name;
  int get year => _year;
  String get color => _color;
  String get pantoneValue => _pantoneValue;

  Data({
      int id, 
      String name, 
      int year, 
      String color, 
      String pantoneValue}){
    _id = id;
    _name = name;
    _year = year;
    _color = color;
    _pantoneValue = pantoneValue;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _year = json["year"];
    _color = json["color"];
    _pantoneValue = json["pantone_value"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["year"] = _year;
    map["color"] = _color;
    map["pantone_value"] = _pantoneValue;
    return map;
  }

}