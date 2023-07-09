//
//  Generated code. Do not modify.
//  source: RequestProto.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RequestProto extends $pb.GeneratedMessage {
  factory RequestProto() => create();
  RequestProto._() : super();
  factory RequestProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestProto', package: const $pb.PackageName(_omitMessageNames ? '' : 'cn.v2ss.server.protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reqMsg', protoName: 'reqMsg')
    ..aInt64(2, _omitFieldNames ? '' : 'reqId', protoName: 'reqId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestProto clone() => RequestProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestProto copyWith(void Function(RequestProto) updates) => super.copyWith((message) => updates(message as RequestProto)) as RequestProto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestProto create() => RequestProto._();
  RequestProto createEmptyInstance() => create();
  static $pb.PbList<RequestProto> createRepeated() => $pb.PbList<RequestProto>();
  @$core.pragma('dart2js:noInline')
  static RequestProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestProto>(create);
  static RequestProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reqMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set reqMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReqMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearReqMsg() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get reqId => $_getI64(1);
  @$pb.TagNumber(2)
  set reqId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReqId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReqId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
