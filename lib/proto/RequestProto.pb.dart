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

class BaseRequestProto extends $pb.GeneratedMessage {
  factory BaseRequestProto() => create();
  BaseRequestProto._() : super();
  factory BaseRequestProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BaseRequestProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BaseRequestProto', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reqMsg', protoName: 'reqMsg')
    ..aInt64(2, _omitFieldNames ? '' : 'requestId', protoName: 'requestId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..aInt64(4, _omitFieldNames ? '' : 'fromId', protoName: 'fromId')
    ..aInt64(5, _omitFieldNames ? '' : 'receiveId', protoName: 'receiveId')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'msgCode', $pb.PbFieldType.O3, protoName: 'msgCode')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'chatType', $pb.PbFieldType.O3, protoName: 'chatType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BaseRequestProto clone() => BaseRequestProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BaseRequestProto copyWith(void Function(BaseRequestProto) updates) => super.copyWith((message) => updates(message as BaseRequestProto)) as BaseRequestProto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BaseRequestProto create() => BaseRequestProto._();
  BaseRequestProto createEmptyInstance() => create();
  static $pb.PbList<BaseRequestProto> createRepeated() => $pb.PbList<BaseRequestProto>();
  @$core.pragma('dart2js:noInline')
  static BaseRequestProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseRequestProto>(create);
  static BaseRequestProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reqMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set reqMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReqMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearReqMsg() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get requestId => $_getI64(1);
  @$pb.TagNumber(2)
  set requestId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRequestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get fromId => $_getI64(3);
  @$pb.TagNumber(4)
  set fromId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFromId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get receiveId => $_getI64(4);
  @$pb.TagNumber(5)
  set receiveId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReceiveId() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceiveId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get msgCode => $_getIZ(5);
  @$pb.TagNumber(6)
  set msgCode($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMsgCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearMsgCode() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get chatType => $_getIZ(6);
  @$pb.TagNumber(7)
  set chatType($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasChatType() => $_has(6);
  @$pb.TagNumber(7)
  void clearChatType() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
