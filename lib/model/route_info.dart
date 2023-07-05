import 'package:json_annotation/json_annotation.dart';

part 'route_info.g.dart';

@JsonSerializable()
class RouteInfo {
  String? ip;
  int? serverPort;
  int? httpPort;

  RouteInfo({this.ip, this.serverPort, this.httpPort});

  factory RouteInfo.fromJson(Map<String, dynamic> json) =>
      _$RouteInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RouteInfoToJson(this);
}
