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
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'updateUser',
        apiUrl: '$baseUrl/users/$userId',
        callType: ApiCallType.PUT,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
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
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'createPlaceType',
        apiUrl: '$baseUrl/placetype',
        callType: ApiCallType.POST,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
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
  }) async {
    textQuery ??= FFAppConstants.nullvalue;
    placeTypeIdentifier ??= FFAppConstants.nullvalue;
    hasLunchServedAt ??= FFAppConstants.nullvalue;
    ownerEmail ??= FFAppConstants.nullvalue;
    enabled ??= FFAppConstants.nullvalue;
    size ??= FFAppConstants.nullvalueINT;
    page ??= FFAppConstants.nullvalueINT;
    final baseUrl = LuncherCoreAPIPOSTPlaceSearchGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "textQuery": "$textQuery",
  "placeTypeIdentifier": "$placeTypeIdentifier",
  "hasLunchServedAt": "$hasLunchServedAt",
  "ownerEmail": "$ownerEmail",
  "enabled": "$enabled",
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static GetByIdCall getByIdCall = GetByIdCall();
}

class GetByIdCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
  }) async {
    final baseUrl = LuncherCoreAPIGETPlaceUuidGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getById',
      apiUrl: '$baseUrl/place/$uuid',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static CreatePlaceCall createPlaceCall = CreatePlaceCall();
}

class CreatePlaceCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? name,
    String? placeTypeIdentifier,
    String? enabled,
  }) async {
    name ??= FFAppConstants.nullvalue;
    placeTypeIdentifier ??= FFAppConstants.nullvalue;
    enabled ??= FFAppConstants.nullvalue;
    final baseUrl = LuncherCoreAPIPOSTPlaceGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "$name",
  "placeTypeIdentifier": "$placeTypeIdentifier",
  "enabled": "$enabled"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'createPlace',
        apiUrl: '$baseUrl/place',
        callType: ApiCallType.POST,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
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
    final baseUrl = LuncherCoreAPIPUTPlacePlaceUuidGroup.getBaseUrl();
    final imageIds = _serializeList(imageIdsList);
    final openingWindows = _serializeJson(openingWindowsJson, true);
    final menuOffers = _serializeJson(menuOffersJson, true);
    final ffApiRequestBody = '''
{
  "name": "$name",
  "longName": "$longName",
  "description": "$description",
  "facebookPageId": "$facebookPageId",
  "instagramHandle": "$instagramHandle",
  "webpageUrl": "$webpageUrl",
  "phoneNumber": "$phoneNumber",
  "address": {
    "firstLine": "$addressFirstLine",
    "secondLine": "$addressSecondLine",
    "zipCode": "$addressZipCode",
    "city": "$addressCity",
    "district": "$addressDistrict",
    "description": "$addressDescription",
    "country": "$addressCountry"
  },
  "googleMapsReference": "$googleMapsReference",
  "openingWindows": $openingWindows,
  "placeTypeIdentifier": "$placeTypeIdentifier",
  "location": {
    "latitude": $locationLatitude,
    "longitude": $locationLongitude
  },
  "menuOffers": $menuOffers,
  "ownerEmail": "$ownerEmail",
  "imageIds": $imageIds,
  "enabled": "$enabled"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'updatePlace',
        apiUrl: '$baseUrl/place/$placeUuid',
        callType: ApiCallType.PUT,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
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
    return 'https://places.googleapis.com/v$apiVersion';
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
  "textQuery": "$textQuery"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TextSearch',
        apiUrl: '$baseUrl/places:searchText',
        callType: ApiCallType.POST,
        headers: {
          'X-Goog-Api-Key': googlePlacesApiKey,
          'X-Goog-FieldMask':
              'places.id,places.displayName,places.location,places.addressComponents,places.formattedAddress',
          'Content-Type': 'application/json',
        },
        params: const {},
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
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
  }) async {
    final baseUrl =
        LuncherCoreAPIGETContentManagementArrangementsUuidGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'getArrangementById',
        apiUrl: '$baseUrl/content-management/arrangements/$uuid',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static UploadImageCall uploadImageCall = UploadImageCall();
}

class UploadImageCall {
  Future<ApiCallResponse> call({
    String? description = '',
    String? authorization = '',
    FFUploadedFile? file,
  }) async {
    final baseUrl = LuncherCoreAPIPOSTAssetGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'uploadImage',
      apiUrl: '$baseUrl/asset',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authorization',
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
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
  }) async {
    final baseUrl =
        LuncherCoreAPIPUTContentManagementArrangementsUuidGroup.getBaseUrl();

    final pageArrangement = _serializeJson(pageArrangementJson);
    final ffApiRequestBody = pageArrangement;
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'updateArrangement',
        apiUrl: '$baseUrl/content-management/arrangements/$uuid',
        callType: ApiCallType.PUT,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
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
  }) async {
    final baseUrl =
        LuncherCoreAPIPUTContentManagementArrangementsUuidPrimaryGroup
            .getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'makeArrangementPrimary',
        apiUrl: '$baseUrl/content-management/arrangements/$uuid/primary',
        callType: ApiCallType.PUT,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static CreateArrangementCall createArrangementCall = CreateArrangementCall();

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

class CreateArrangementCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl =
        LuncherCoreAPIPOSTContentManagementArrangementsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'createArrangement',
        apiUrl: '$baseUrl/content-management/arrangements',
        callType: ApiCallType.POST,
        headers: {
          'Authorization': 'Bearer $authorization',
        },
        params: const {},
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
  static String getBaseUrl() => 'https://api.pre.luncher.pl';
  static Map<String, String> headers = {};
  static GetAllArrangementsCall getAllArrangementsCall =
      GetAllArrangementsCall();
}

class GetAllArrangementsCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl =
        LuncherCoreAPIGETContentManagementArrangementsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllArrangements',
      apiUrl: '$baseUrl/content-management/arrangements',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
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
