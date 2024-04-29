import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Luncher Core API Group Code

class LuncherCoreAPIGroup {
  static String baseUrl = 'https://core.api.pre1.luncher.pl';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static GetProfileCall getProfileCall = GetProfileCall();
  static LogoutCall logoutCall = LogoutCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? login = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${login}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${LuncherCoreAPIGroup.baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? accesstoken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.accessToken''',
      ));
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getProfile',
      apiUrl: '${LuncherCoreAPIGroup.baseUrl}/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.role''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.firstName''',
      ));
  String? surname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.surname''',
      ));
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '${LuncherCoreAPIGroup.baseUrl}/auth/logout',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
