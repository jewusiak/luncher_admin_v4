import 'dart:convert';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

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
  "email": "$login",
  "password": "$password"
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
  int? tokenLifetime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.tokenLifetime''',
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
        'Authorization': 'Bearer $authorization',
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
        'Authorization': 'Bearer $authorization',
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

/// Start Luncher Core API (users) Group Code

class LuncherCoreAPIusersGroup {
  static String baseUrl = 'https://core.api.pre1.luncher.pl';
  static Map<String, String> headers = {};
  static GetUsersPagedCall getUsersPagedCall = GetUsersPagedCall();
  static AdminCreateUserCall adminCreateUserCall = AdminCreateUserCall();
  static AdminUpdateUserCall adminUpdateUserCall = AdminUpdateUserCall();
  static GetUserByUuidCall getUserByUuidCall = GetUserByUuidCall();
  static AdminSearchUsersCall adminSearchUsersCall = AdminSearchUsersCall();
  static GetAvailableRolesCall getAvailableRolesCall = GetAvailableRolesCall();
}

class GetUsersPagedCall {
  Future<ApiCallResponse> call({
    int? size,
    int? page,
    String? authorization = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUsersPaged',
      apiUrl: '${LuncherCoreAPIusersGroup.baseUrl}/admin/users',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {
        'size': size,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<UserStruct>? users(dynamic response) => (getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => UserStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  int? pageNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pageable.pageNumber''',
      ));
  int? pageSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pageable.pageSize''',
      ));
  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalPages''',
      ));
  int? totalElements(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalElements''',
      ));
  bool? isLastPage(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.last''',
      ));
  bool? isFirstPage(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.first''',
      ));
  bool? isEmpty(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.empty''',
      ));
  int? contentSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.size''',
      ));
}

class AdminCreateUserCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? email = '',
    String? firstName = '',
    String? surname = '',
    String? password = '',
    String? role = 'USER',
    bool? enabled = true,
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "firstName": "$firstName",
  "surname": "$surname",
  "password": "$password",
  "role": "$role",
  "enabled": $enabled
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adminCreateUser',
      apiUrl: '${LuncherCoreAPIusersGroup.baseUrl}/admin/users',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
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
}

class AdminUpdateUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? authorization = '',
    String? email = '',
    String? firstName = '',
    String? surname = '',
    String? password = '',
    String? role = '',
    bool? enabled = true,
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "firstName": "$firstName",
  "surname": "$surname",
  "password": "$password",
  "role": "$role",
  "enabled": $enabled
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'adminUpdateUser',
        apiUrl: '${LuncherCoreAPIusersGroup.baseUrl}/admin/users/$userId',
        callType: ApiCallType.PATCH,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class GetUserByUuidCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserByUuid',
      apiUrl: '${LuncherCoreAPIusersGroup.baseUrl}/admin/users/$uuid',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
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

class AdminSearchUsersCall {
  Future<ApiCallResponse> call({
    String? query = '',
    int? size,
    int? page,
    String? authorization = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'adminSearchUsers',
      apiUrl: '${LuncherCoreAPIusersGroup.baseUrl}/admin/users/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {
        'query': query,
        'size': size,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<UserStruct>? users(dynamic response) => (getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => UserStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  int? pageNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pageable.pageNumber''',
      ));
  int? pageSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pageable.pageSize''',
      ));
  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalPages''',
      ));
  int? totalElements(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalElements''',
      ));
  bool? isFirst(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.first''',
      ));
  bool? isLast(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.last''',
      ));
}

class GetAvailableRolesCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAvailableRoles',
      apiUrl: '${LuncherCoreAPIusersGroup.baseUrl}/admin/users/available_roles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? roles(dynamic response) => (getJsonField(
        response,
        r'''$.roles''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Luncher Core API (users) Group Code

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
