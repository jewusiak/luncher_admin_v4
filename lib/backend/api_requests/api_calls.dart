import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Luncher Core API (POST___auth_login) Group Code

class LuncherCoreAPIPOSTAuthLoginGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? email = '',
    String? password = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPOSTAuthLoginGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
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
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static GetProfileCall getProfileCall = GetProfileCall();
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIGETProfileGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getProfile',
      apiUrl: '${baseUrl}/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___profile) Group Code

/// Start Luncher Core API (DELETE___auth_logout) Group Code

class LuncherCoreAPIDELETEAuthLogoutGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static LogoutCall logoutCall = LogoutCall();
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIDELETEAuthLogoutGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '${baseUrl}/auth/logout',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (DELETE___auth_logout) Group Code

/// Start Luncher Core API (POST___users) Group Code

class LuncherCoreAPIPOSTUsersGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

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
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPOSTUsersGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "firstName": "${firstName}",
  "surname": "${surname}",
  "password": "${password}",
  "role": "${role}",
  "enabled": ${enabled}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUser',
      apiUrl: '${baseUrl}/users',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (POST___users) Group Code

/// Start Luncher Core API (GET___users_available_roles) Group Code

class LuncherCoreAPIGETUsersAvailableRolesGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static GetAvailableRolesCall getAvailableRolesCall = GetAvailableRolesCall();
}

class GetAvailableRolesCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIGETUsersAvailableRolesGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAvailableRoles',
      apiUrl: '${baseUrl}/users/available_roles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
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
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

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
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPUTUsersUserIdGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "firstName": "${firstName}",
  "surname": "${surname}",
  "password": "${password}",
  "role": "${role}",
  "enabled": ${enabled}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updateUser',
        apiUrl: '${baseUrl}/users/${userId}',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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

/// End Luncher Core API (PUT___users_userId) Group Code

/// Start Luncher Core API (GET___users_search) Group Code

class LuncherCoreAPIGETUsersSearchGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static AdminSearchUsersCall adminSearchUsersCall = AdminSearchUsersCall();
}

class AdminSearchUsersCall {
  Future<ApiCallResponse> call({
    String? query = '',
    int? size,
    int? page,
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIGETUsersSearchGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'adminSearchUsers',
      apiUrl: '${baseUrl}/users/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {
        'query': query,
        'size': size,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___users_search) Group Code

/// Start Luncher Core API (GET___users_uuid) Group Code

class LuncherCoreAPIGETUsersUuidGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static GetUserByUuidCall getUserByUuidCall = GetUserByUuidCall();
}

class GetUserByUuidCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIGETUsersUuidGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getUserByUuid',
      apiUrl: '${baseUrl}/users/${uuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___users_uuid) Group Code

/// Start Luncher Core API (GET___placetype) Group Code

class LuncherCoreAPIGETPlacetypeGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static GetAllPlaceTypesCall getAllPlaceTypesCall = GetAllPlaceTypesCall();
}

class GetAllPlaceTypesCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIGETPlacetypeGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllPlaceTypes',
      apiUrl: '${baseUrl}/placetype',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___placetype) Group Code

/// Start Luncher Core API (DELETE___placetype_identifier) Group Code

class LuncherCoreAPIDELETEPlacetypeIdentifierGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static DeletePlaceTypeCall deletePlaceTypeCall = DeletePlaceTypeCall();
}

class DeletePlaceTypeCall {
  Future<ApiCallResponse> call({
    String? identifier = '',
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIDELETEPlacetypeIdentifierGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deletePlaceType',
      apiUrl: '${baseUrl}/placetype/${identifier}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (DELETE___placetype_identifier) Group Code

/// Start Luncher Core API (POST___placetype) Group Code

class LuncherCoreAPIPOSTPlacetypeGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static CreatePlaceTypeCall createPlaceTypeCall = CreatePlaceTypeCall();
}

class CreatePlaceTypeCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? idenitifier = '',
    String? iconName = '',
    String? name = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPOSTPlacetypeGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final ffApiRequestBody = '''
{
  "identifier": "${idenitifier}",
  "iconName": "${iconName}",
  "name": "${name}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'createPlaceType',
        apiUrl: '${baseUrl}/placetype',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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

/// End Luncher Core API (POST___placetype) Group Code

/// Start Luncher Core API (PUT___placetype_identifier) Group Code

class LuncherCoreAPIPUTPlacetypeIdentifierGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

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
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPUTPlacetypeIdentifierGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final ffApiRequestBody = '''
{
  "identifier": "${identifier}",
  "iconName": "${iconName}",
  "name": "${name}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updatePlaceType',
        apiUrl: '${baseUrl}/placetype/${identifier}',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static GetByIdentifierCall getByIdentifierCall = GetByIdentifierCall();
}

class GetByIdentifierCall {
  Future<ApiCallResponse> call({
    String? identifier = '',
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIGETPlacetypeIdentifierGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getByIdentifier',
      apiUrl: '${baseUrl}/placetype/${identifier}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___placetype_identifier) Group Code

/// Start Luncher Core API (POST___place_search) Group Code

class LuncherCoreAPIPOSTPlaceSearchGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static SearchQueryCall searchQueryCall = SearchQueryCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class SearchQueryCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? textQuery,
    String? placeTypeIdentifier,
    String? hasLunchServedAt,
    String? ownerEmail,
    String? enabled,
    int? size,
    int? page,
    String? backendurl,
  }) async {
    textQuery ??= FFAppConstants.nullvalue;
    placeTypeIdentifier ??= FFAppConstants.nullvalue;
    hasLunchServedAt ??= FFAppConstants.nullvalue;
    ownerEmail ??= FFAppConstants.nullvalue;
    enabled ??= FFAppConstants.nullvalue;
    size ??= FFAppConstants.nullvalueINT;
    page ??= FFAppConstants.nullvalueINT;
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPOSTPlaceSearchGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final ffApiRequestBody = '''
{
  "textQuery": "${textQuery}",
  "placeTypeIdentifier": "${placeTypeIdentifier}",
  "hasLunchServedAt": "${hasLunchServedAt}",
  "ownerEmail": "${ownerEmail}",
  "enabled": "${enabled}",
  "page": ${page},
  "size": ${size}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'searchQuery',
        apiUrl: '${baseUrl}/place/search',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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

/// Start Luncher Core API (GET___place_uuid) Group Code

class LuncherCoreAPIGETPlaceUuidGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static GetByIdCall getByIdCall = GetByIdCall();
}

class GetByIdCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIGETPlaceUuidGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getById',
      apiUrl: '${baseUrl}/place/${uuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___place_uuid) Group Code

/// Start Luncher Core API (POST___place) Group Code

class LuncherCoreAPIPOSTPlaceGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static CreatePlaceCall createPlaceCall = CreatePlaceCall();
}

class CreatePlaceCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? name,
    String? placeTypeIdentifier,
    String? enabled,
    String? backendurl,
  }) async {
    name ??= FFAppConstants.nullvalue;
    placeTypeIdentifier ??= FFAppConstants.nullvalue;
    enabled ??= FFAppConstants.nullvalue;
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPOSTPlaceGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "placeTypeIdentifier": "${placeTypeIdentifier}",
  "enabled": "${enabled}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'createPlace',
        apiUrl: '${baseUrl}/place',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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

/// End Luncher Core API (POST___place) Group Code

/// Start Luncher Core API (PUT___place_placeUuid) Group Code

class LuncherCoreAPIPUTPlacePlaceUuidGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static UpdatePlaceCall updatePlaceCall = UpdatePlaceCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class UpdatePlaceCall {
  Future<ApiCallResponse> call({
    String? placeUuid = '',
    String? authorization = '',
    String? name,
    String? longName,
    String? description,
    String? facebookPageId,
    String? instagramHandle,
    String? webpageUrl,
    String? phoneNumber,
    String? addressFirstLine,
    String? addressSecondLine,
    String? addressZipCode,
    String? addressCity,
    String? addressDistrict,
    String? addressDescription,
    String? addressCountry,
    String? googleMapsReference,
    dynamic openingWindowsJson,
    String? placeTypeIdentifier,
    double? locationLatitude,
    double? locationLongitude,
    String? ownerEmail,
    String? enabled,
    dynamic menuOffersJson,
    List<String>? imageIdsList,
    String? backendurl,
  }) async {
    name ??= FFAppConstants.nullvalue;
    longName ??= FFAppConstants.nullvalue;
    description ??= FFAppConstants.nullvalue;
    facebookPageId ??= FFAppConstants.nullvalue;
    instagramHandle ??= FFAppConstants.nullvalue;
    webpageUrl ??= FFAppConstants.nullvalue;
    phoneNumber ??= FFAppConstants.nullvalue;
    addressFirstLine ??= FFAppConstants.nullvalue;
    addressSecondLine ??= FFAppConstants.nullvalue;
    addressZipCode ??= FFAppConstants.nullvalue;
    addressCity ??= FFAppConstants.nullvalue;
    addressDistrict ??= FFAppConstants.nullvalue;
    addressDescription ??= FFAppConstants.nullvalue;
    addressCountry ??= FFAppConstants.nullvalue;
    googleMapsReference ??= FFAppConstants.nullvalue;
    placeTypeIdentifier ??= FFAppConstants.nullvalue;
    locationLatitude ??= FFAppConstants.nullvalueDOUBLE;
    locationLongitude ??= FFAppConstants.nullvalueDOUBLE;
    ownerEmail ??= FFAppConstants.nullvalue;
    enabled ??= FFAppConstants.nullvalue;
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPUTPlacePlaceUuidGroup.getBaseUrl(
      backendurl: backendurl,
    );
    final imageIds = _serializeList(imageIdsList);
    final openingWindows = _serializeJson(openingWindowsJson, true);
    final menuOffers = _serializeJson(menuOffersJson, true);
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "longName": "${longName}",
  "description": "${description}",
  "facebookPageId": "${facebookPageId}",
  "instagramHandle": "${instagramHandle}",
  "webpageUrl": "${webpageUrl}",
  "phoneNumber": "${phoneNumber}",
  "address": {
    "firstLine": "${addressFirstLine}",
    "secondLine": "${addressSecondLine}",
    "zipCode": "${addressZipCode}",
    "city": "${addressCity}",
    "district": "${addressDistrict}",
    "description": "${addressDescription}",
    "country": "${addressCountry}"
  },
  "googleMapsReference": "${googleMapsReference}",
  "openingWindows": ${openingWindows},
  "placeTypeIdentifier": "${placeTypeIdentifier}",
  "location": {
    "latitude": ${locationLatitude},
    "longitude": ${locationLongitude}
  },
  "menuOffers": ${menuOffers},
  "ownerEmail": "${ownerEmail}",
  "imageIds": ${imageIds},
  "enabled": "${enabled}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updatePlace',
        apiUrl: '${baseUrl}/place/${placeUuid}',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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

/// End Luncher Core API (PUT___place_placeUuid) Group Code

/// Start Google Places API Group Code

class GooglePlacesAPIGroup {
  static String getBaseUrl({
    int? apiVersion = 1,
    String? googlePlacesApiKey,
  }) {
    googlePlacesApiKey ??= valueOrDefault<String>(
      FFDevEnvironmentValues().mapsPlacesKey,
      'AIzaSyAdi5-YDfOFki2hiMzVi96mlDzD5udx_7M',
    );
    return 'https://places.googleapis.com/v${apiVersion}';
  }

  static Map<String, String> headers = {
    'X-Goog-Api-Key': '[googlePlacesApiKey]',
  };
  static TextSearchCall textSearchCall = TextSearchCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class TextSearchCall {
  Future<ApiCallResponse> call({
    String? textQuery = '',
    int? apiVersion = 1,
    String? googlePlacesApiKey,
  }) async {
    googlePlacesApiKey ??= valueOrDefault<String>(
      FFDevEnvironmentValues().mapsPlacesKey,
      'AIzaSyAdi5-YDfOFki2hiMzVi96mlDzD5udx_7M',
    );
    final baseUrl = GooglePlacesAPIGroup.getBaseUrl(
      apiVersion: apiVersion,
      googlePlacesApiKey: googlePlacesApiKey,
    );

    final ffApiRequestBody = '''
{
  "textQuery": "${textQuery}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'TextSearch',
        apiUrl: '${baseUrl}/places:searchText',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'X-Goog-Api-Key': '${googlePlacesApiKey}',
          'X-Goog-FieldMask':
              'places.id,places.displayName,places.location,places.addressComponents,places.formattedAddress',
          'Content-Type': 'application/json',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: true,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      GooglePlacesAPIGroup.interceptors,
    );
  }

  List<GoogleTextSearchResponseStruct>? places(dynamic response) =>
      (getJsonField(
        response,
        r'''$.places''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => GoogleTextSearchResponseStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

/// End Google Places API Group Code

/// Start Luncher Core API (GET___content-management_arrangements_uuid) Group Code

class LuncherCoreAPIGETContentManagementArrangementsUuidGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static GetArrangementByIdCall getArrangementByIdCall =
      GetArrangementByIdCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class GetArrangementByIdCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl =
        LuncherCoreAPIGETContentManagementArrangementsUuidGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getArrangementById',
        apiUrl: '${baseUrl}/content-management/arrangements/${uuid}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: true,
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

/// End Luncher Core API (GET___content-management_arrangements_uuid) Group Code

/// Start Luncher Core API (POST___asset) Group Code

class LuncherCoreAPIPOSTAssetGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static UploadImageCall uploadImageCall = UploadImageCall();
}

class UploadImageCall {
  Future<ApiCallResponse> call({
    String? description = '',
    String? authorization = '',
    FFUploadedFile? file,
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIPOSTAssetGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'uploadImage',
      apiUrl: '${baseUrl}/asset',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {
        'description': description,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (POST___asset) Group Code

/// Start Luncher Core API (PUT___content-management_arrangements_uuid) Group Code

class LuncherCoreAPIPUTContentManagementArrangementsUuidGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static UpdateArrangementCall updateArrangementCall = UpdateArrangementCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class UpdateArrangementCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
    dynamic pageArrangementJson,
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl =
        LuncherCoreAPIPUTContentManagementArrangementsUuidGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final pageArrangement = _serializeJson(pageArrangementJson);
    final ffApiRequestBody = '''
${pageArrangement}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updateArrangement',
        apiUrl: '${baseUrl}/content-management/arrangements/${uuid}',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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

/// End Luncher Core API (PUT___content-management_arrangements_uuid) Group Code

/// Start Luncher Core API (PUT___content-management_arrangements_uuid_primary) Group Code

class LuncherCoreAPIPUTContentManagementArrangementsUuidPrimaryGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static MakeArrangementPrimaryCall makeArrangementPrimaryCall =
      MakeArrangementPrimaryCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class MakeArrangementPrimaryCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl =
        LuncherCoreAPIPUTContentManagementArrangementsUuidPrimaryGroup
            .getBaseUrl(
      backendurl: backendurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'makeArrangementPrimary',
        apiUrl: '${baseUrl}/content-management/arrangements/${uuid}/primary',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.NONE,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: true,
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

/// End Luncher Core API (PUT___content-management_arrangements_uuid_primary) Group Code

/// Start Luncher Core API (POST___content-management_arrangements) Group Code

class LuncherCoreAPIPOSTContentManagementArrangementsGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static CreateArrangementCall createArrangementCall = CreateArrangementCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class CreateArrangementCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl =
        LuncherCoreAPIPOSTContentManagementArrangementsGroup.getBaseUrl(
      backendurl: backendurl,
    );

    final ffApiRequestBody = '''
{
  
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'createArrangement',
        apiUrl: '${baseUrl}/content-management/arrangements',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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

/// End Luncher Core API (POST___content-management_arrangements) Group Code

/// Start Luncher Core API (GET___content-management_arrangements) Group Code

class LuncherCoreAPIGETContentManagementArrangementsGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static GetAllArrangementsCall getAllArrangementsCall =
      GetAllArrangementsCall();
}

class GetAllArrangementsCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl =
        LuncherCoreAPIGETContentManagementArrangementsGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllArrangements',
      apiUrl: '${baseUrl}/content-management/arrangements',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___content-management_arrangements) Group Code

/// Start Luncher Core API (DELETE___place_placeUuid) Group Code

class LuncherCoreAPIDELETEPlacePlaceUuidGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static RemovePlaceCall removePlaceCall = RemovePlaceCall();
}

class RemovePlaceCall {
  Future<ApiCallResponse> call({
    String? placeUuid = '',
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIDELETEPlacePlaceUuidGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'removePlace',
      apiUrl: '${baseUrl}/place/${placeUuid}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (DELETE___place_placeUuid) Group Code

/// Start Luncher Core API (DELETE___users_uuid) Group Code

class LuncherCoreAPIDELETEUsersUuidGroup {
  static String getBaseUrl({
    String? backendurl,
  }) {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    return '${backendurl}';
  }

  static Map<String, String> headers = {};
  static DeleteUserCall deleteUserCall = DeleteUserCall();
}

class DeleteUserCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
    String? backendurl,
  }) async {
    backendurl ??= FFDevEnvironmentValues().backendurl;
    final baseUrl = LuncherCoreAPIDELETEUsersUuidGroup.getBaseUrl(
      backendurl: backendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteUser',
      apiUrl: '${baseUrl}/users/${uuid}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (DELETE___users_uuid) Group Code

/// Start Luncher Core API (GET___schema) Group Code

class LuncherCoreAPIGETSchemaGroup {
  static String getBaseUrl({
    String? importsbackendurl,
  }) {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importsbackendurl}';
  }

  static Map<String, String> headers = {};
  static GetAllForPlaceCall getAllForPlaceCall = GetAllForPlaceCall();
}

class GetAllForPlaceCall {
  Future<ApiCallResponse> call({
    String? placeId = '',
    String? authorization = '',
    String? importsbackendurl,
  }) async {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIGETSchemaGroup.getBaseUrl(
      importsbackendurl: importsbackendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllForPlace',
      apiUrl: '${baseUrl}/schema',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {
        'placeId': placeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___schema) Group Code

/// Start Luncher Core API (PUT___schema_schemaId) Group Code

class LuncherCoreAPIPUTSchemaSchemaIdGroup {
  static String getBaseUrl({
    String? importsbackendurl,
  }) {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importsbackendurl}';
  }

  static Map<String, String> headers = {};
  static UpdateImportSchemaCall updateImportSchemaCall =
      UpdateImportSchemaCall();
}

class UpdateImportSchemaCall {
  Future<ApiCallResponse> call({
    String? schemaId = '',
    String? authorization = '',
    dynamic schemaJson,
    String? importsbackendurl,
  }) async {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIPUTSchemaSchemaIdGroup.getBaseUrl(
      importsbackendurl: importsbackendurl,
    );

    final schema = _serializeJson(schemaJson);
    final ffApiRequestBody = '''
${schema}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updateImportSchema',
        apiUrl: '${baseUrl}/schema/${schemaId}',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
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

/// End Luncher Core API (PUT___schema_schemaId) Group Code

/// Start Luncher Core API (POST___schema) Group Code

class LuncherCoreAPIPOSTSchemaGroup {
  static String getBaseUrl({
    String? importsbackendurl,
  }) {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importsbackendurl}';
  }

  static Map<String, String> headers = {};
  static CreateImportSchemaCall createImportSchemaCall =
      CreateImportSchemaCall();
}

class CreateImportSchemaCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    dynamic schemaJson,
    String? importsbackendurl,
  }) async {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIPOSTSchemaGroup.getBaseUrl(
      importsbackendurl: importsbackendurl,
    );

    final schema = _serializeJson(schemaJson);
    final ffApiRequestBody = '''
${schema}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createImportSchema',
      apiUrl: '${baseUrl}/schema',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (POST___schema) Group Code

/// Start Luncher Core API (GET___utils_describe-cron) Group Code

class LuncherCoreAPIGETUtilsDescribeCronGroup {
  static String getBaseUrl({
    String? importbackendurl,
  }) {
    importbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importbackendurl}';
  }

  static Map<String, String> headers = {};
  static GetCronDescriptionCall getCronDescriptionCall =
      GetCronDescriptionCall();
}

class GetCronDescriptionCall {
  Future<ApiCallResponse> call({
    String? cron = '',
    String? authorization = '',
    String? importbackendurl,
  }) async {
    importbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIGETUtilsDescribeCronGroup.getBaseUrl(
      importbackendurl: importbackendurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getCronDescription',
        apiUrl: '${baseUrl}/utils/describe-cron',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'cron': cron,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: true,
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

/// End Luncher Core API (GET___utils_describe-cron) Group Code

/// Start Luncher Core API (DELETE___schema_schemaId) Group Code

class LuncherCoreAPIDELETESchemaSchemaIdGroup {
  static String getBaseUrl({
    String? importsbackendurl,
  }) {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importsbackendurl}';
  }

  static Map<String, String> headers = {};
  static DeleteImportSchemaCall deleteImportSchemaCall =
      DeleteImportSchemaCall();
}

class DeleteImportSchemaCall {
  Future<ApiCallResponse> call({
    String? schemaId = '',
    String? authorization = '',
    String? importsbackendurl,
  }) async {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIDELETESchemaSchemaIdGroup.getBaseUrl(
      importsbackendurl: importsbackendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteImportSchema',
      apiUrl: '${baseUrl}/schema/${schemaId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (DELETE___schema_schemaId) Group Code

/// Start Luncher Core API (POST___schema_schemaId_job) Group Code

class LuncherCoreAPIPOSTSchemaSchemaIdJobGroup {
  static String getBaseUrl({
    String? importsbackendurl,
  }) {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importsbackendurl}';
  }

  static Map<String, String> headers = {};
  static DispatchJobCall dispatchJobCall = DispatchJobCall();
}

class DispatchJobCall {
  Future<ApiCallResponse> call({
    String? schemaId = '',
    String? authorization = '',
    String? importsbackendurl,
  }) async {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIPOSTSchemaSchemaIdJobGroup.getBaseUrl(
      importsbackendurl: importsbackendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'dispatchJob',
      apiUrl: '${baseUrl}/schema/${schemaId}/job',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (POST___schema_schemaId_job) Group Code

/// Start Luncher Core API (GET___schema_schemaId_job) Group Code

class LuncherCoreAPIGETSchemaSchemaIdJobGroup {
  static String getBaseUrl({
    String? importsbackendurl,
  }) {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importsbackendurl}';
  }

  static Map<String, String> headers = {};
  static GetSchemasJobsCall getSchemasJobsCall = GetSchemasJobsCall();
}

class GetSchemasJobsCall {
  Future<ApiCallResponse> call({
    String? schemaId = '',
    String? authorization = '',
    String? importsbackendurl,
  }) async {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIGETSchemaSchemaIdJobGroup.getBaseUrl(
      importsbackendurl: importsbackendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getSchemasJobs',
      apiUrl: '${baseUrl}/schema/${schemaId}/job',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___schema_schemaId_job) Group Code

/// Start Luncher Core API (GET___schema_schemaId_job_jobId) Group Code

class LuncherCoreAPIGETSchemaSchemaIdJobJobIdGroup {
  static String getBaseUrl({
    String? importsbackendurl,
  }) {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importsbackendurl}';
  }

  static Map<String, String> headers = {};
  static GetJobCall getJobCall = GetJobCall();
}

class GetJobCall {
  Future<ApiCallResponse> call({
    String? schemaId = '',
    String? jobId = '',
    String? authorization = '',
    String? importsbackendurl,
  }) async {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIGETSchemaSchemaIdJobJobIdGroup.getBaseUrl(
      importsbackendurl: importsbackendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getJob',
      apiUrl: '${baseUrl}/schema/${schemaId}/job/${jobId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___schema_schemaId_job_jobId) Group Code

/// Start Luncher Core API (DELETE___schema_schemaId_job_jobId) Group Code

class LuncherCoreAPIDELETESchemaSchemaIdJobJobIdGroup {
  static String getBaseUrl({
    String? importsbackendurl,
  }) {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    return '${importsbackendurl}';
  }

  static Map<String, String> headers = {};
  static CancelJobCall cancelJobCall = CancelJobCall();
}

class CancelJobCall {
  Future<ApiCallResponse> call({
    String? schemaId = '',
    String? jobId = '',
    String? authorization = '',
    String? importsbackendurl,
  }) async {
    importsbackendurl ??= FFDevEnvironmentValues().importsbackendurl;
    final baseUrl = LuncherCoreAPIDELETESchemaSchemaIdJobJobIdGroup.getBaseUrl(
      importsbackendurl: importsbackendurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancelJob',
      apiUrl: '${baseUrl}/schema/${schemaId}/job/${jobId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (DELETE___schema_schemaId_job_jobId) Group Code

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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
