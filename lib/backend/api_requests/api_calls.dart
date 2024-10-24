import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Luncher Core API (POST___auth_login) Group Code

class LuncherCoreAPIPOSTAuthLoginGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = LuncherCoreAPIPOSTAuthLoginGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '$baseUrl/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.accessToken''',
      ));
  int? tokenLifetime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.tokenLifetime''',
      ));
}

/// End Luncher Core API (POST___auth_login) Group Code

/// Start Luncher Core API (GET___profile) Group Code

class LuncherCoreAPIGETProfileGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static GetProfileCall getProfileCall = GetProfileCall();
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIGETProfileGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getProfile',
      apiUrl: '$baseUrl/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___profile) Group Code

/// Start Luncher Core API (DELETE___auth_logout) Group Code

class LuncherCoreAPIDELETEAuthLogoutGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static LogoutCall logoutCall = LogoutCall();
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIDELETEAuthLogoutGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '$baseUrl/auth/logout',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (DELETE___auth_logout) Group Code

/// Start Luncher Core API (POST___users) Group Code

class LuncherCoreAPIPOSTUsersGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static CreateUserCall createUserCall = CreateUserCall();
}

class CreateUserCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? email = '',
    String? firstName = '',
    String? surname = '',
    String? password = '',
    String? role = '',
    bool? enabled = true,
  }) async {
    final baseUrl = LuncherCoreAPIPOSTUsersGroup.getBaseUrl();

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
      callName: 'createUser',
      apiUrl: '$baseUrl/users',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (POST___users) Group Code

/// Start Luncher Core API (GET___users_available_roles) Group Code

class LuncherCoreAPIGETUsersAvailableRolesGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static GetAvailableRolesCall getAvailableRolesCall = GetAvailableRolesCall();
}

class GetAvailableRolesCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIGETUsersAvailableRolesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAvailableRoles',
      apiUrl: '$baseUrl/users/available_roles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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

/// End Luncher Core API (GET___users_available_roles) Group Code

/// Start Luncher Core API (PUT___users_userId) Group Code

class LuncherCoreAPIPUTUsersUserIdGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static UpdateUserCall updateUserCall = UpdateUserCall();
}

class UpdateUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? authorization = '',
    String? email = '',
    String? firstName = '',
    String? surname = '',
    String? password = '',
    String? role = '',
    bool? enabled,
  }) async {
    final baseUrl = LuncherCoreAPIPUTUsersUserIdGroup.getBaseUrl();

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
      callName: 'updateUser',
      apiUrl: '$baseUrl/users/$userId',
      callType: ApiCallType.PUT,
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (PUT___users_userId) Group Code

/// Start Luncher Core API (GET___users_search) Group Code

class LuncherCoreAPIGETUsersSearchGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static AdminSearchUsersCall adminSearchUsersCall = AdminSearchUsersCall();
}

class AdminSearchUsersCall {
  Future<ApiCallResponse> call({
    String? query = '',
    int? size,
    int? page,
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIGETUsersSearchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'adminSearchUsers',
      apiUrl: '$baseUrl/users/search',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___users_search) Group Code

/// Start Luncher Core API (GET___users_uuid) Group Code

class LuncherCoreAPIGETUsersUuidGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static GetUserByUuidCall getUserByUuidCall = GetUserByUuidCall();
}

class GetUserByUuidCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIGETUsersUuidGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getUserByUuid',
      apiUrl: '$baseUrl/users/$uuid',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___users_uuid) Group Code

/// Start Luncher Core API (POST___place_search) Group Code

class LuncherCoreAPIPOSTPlaceSearchGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static SearchQueryCall searchQueryCall = SearchQueryCall();
}

class SearchQueryCall {
  Future<ApiCallResponse> call({
    String? textQuery,
    String? placeTypeIdentifier,
    String? openAtTime,
    String? openAtDay,
    double? locationLatitude,
    double? locationLongitude,
    double? locationRadius,
    String? hasLunchServedAt,
    String? owner,
    bool? enabled,
    int? page = 0,
    int? size = 10,
    String? authorization = '',
  }) async {
    textQuery ??= FFAppConstants.nullvalue;
    placeTypeIdentifier ??= FFAppConstants.nullvalue;
    openAtTime ??= FFAppConstants.nullvalue;
    openAtDay ??= FFAppConstants.nullvalue;
    locationLatitude ??= FFAppConstants.nullvalueDOUBLE;
    locationLongitude ??= FFAppConstants.nullvalueDOUBLE;
    locationRadius ??= FFAppConstants.nullvalueDOUBLE;
    hasLunchServedAt ??= FFAppConstants.nullvalue;
    owner ??= FFAppConstants.nullvalue;
    final baseUrl = LuncherCoreAPIPOSTPlaceSearchGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "textQuery": "$textQuery",
  "placeTypeIdentifier": "$placeTypeIdentifier",
  "openAt": {
    "time": "$openAtTime",
    "day": "$openAtDay"
  },
  "location": {
    "latitude": $locationLatitude,
    "longitude": $locationLongitude,
    "radius": $locationRadius
  },
  "hasLunchServedAt": "$hasLunchServedAt",
  "owner": "$owner",
  "enabled": $enabled,
  "page": $page,
  "size": $size
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'searchQuery',
        apiUrl: '$baseUrl/place/search',
        callType: ApiCallType.POST,
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
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

/// End Luncher Core API (POST___place_search) Group Code

/// Start Luncher Core API (GET___placetype) Group Code

class LuncherCoreAPIGETPlacetypeGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static GetAllPlaceTypesCall getAllPlaceTypesCall = GetAllPlaceTypesCall();
}

class GetAllPlaceTypesCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIGETPlacetypeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllPlaceTypes',
      apiUrl: '$baseUrl/placetype',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___placetype) Group Code

/// Start Luncher Core API (DELETE___placetype_identifier) Group Code

class LuncherCoreAPIDELETEPlacetypeIdentifierGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static DeletePlaceTypeCall deletePlaceTypeCall = DeletePlaceTypeCall();
}

class DeletePlaceTypeCall {
  Future<ApiCallResponse> call({
    String? identifier = '',
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIDELETEPlacetypeIdentifierGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deletePlaceType',
      apiUrl: '$baseUrl/placetype/$identifier',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (DELETE___placetype_identifier) Group Code

/// Start Luncher Core API (POST___placetype) Group Code

class LuncherCoreAPIPOSTPlacetypeGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static CreatePlaceTypeCall createPlaceTypeCall = CreatePlaceTypeCall();
}

class CreatePlaceTypeCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? idenitifier = '',
    String? iconName = '',
    String? name = '',
  }) async {
    final baseUrl = LuncherCoreAPIPOSTPlacetypeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "identifier": "$idenitifier",
  "iconName": "$iconName",
  "name": "$name"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPlaceType',
      apiUrl: '$baseUrl/placetype',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (POST___placetype) Group Code

/// Start Luncher Core API (PUT___placetype_identifier) Group Code

class LuncherCoreAPIPUTPlacetypeIdentifierGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static UpdatePlaceTypeCall updatePlaceTypeCall = UpdatePlaceTypeCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class UpdatePlaceTypeCall {
  Future<ApiCallResponse> call({
    String? identifier = '',
    String? authorization = '',
    String? iconName = '',
    String? name = '',
  }) async {
    final baseUrl = LuncherCoreAPIPUTPlacetypeIdentifierGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "identifier": "$identifier",
  "iconName": "$iconName",
  "name": "$name"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'updatePlaceType',
        apiUrl: '$baseUrl/placetype/$identifier',
        callType: ApiCallType.PUT,
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
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      LuncherCoreAPIPUTPlacetypeIdentifierGroup.interceptors,
    );
  }
}

/// End Luncher Core API (PUT___placetype_identifier) Group Code

/// Start Luncher Core API (GET___placetype_identifier) Group Code

class LuncherCoreAPIGETPlacetypeIdentifierGroup {
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static GetByIdentifierCall getByIdentifierCall = GetByIdentifierCall();
}

class GetByIdentifierCall {
  Future<ApiCallResponse> call({
    String? identifier = '',
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIGETPlacetypeIdentifierGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getByIdentifier',
      apiUrl: '$baseUrl/placetype/$identifier',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___placetype_identifier) Group Code

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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
