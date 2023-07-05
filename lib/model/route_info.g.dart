// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteInfo _$RouteInfoFromJson(Map<String, dynamic> json) => RouteInfo(
      ip: json['ip'] as String?,
      serverPort: json['serverPort'] as int?,
      httpPort: json['httpPort'] as int?,
    );

Map<String, dynamic> _$RouteInfoToJson(RouteInfo instance) => <String, dynamic>{
      'ip': instance.ip,
      'serverPort': instance.serverPort,
      'httpPort': instance.httpPort,
    };
