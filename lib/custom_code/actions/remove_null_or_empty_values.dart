// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/api_requests/api_interceptor.dart';

class RemoveNullOrEmptyValues extends FFApiInterceptor {
  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Perform any necessary calls or modifications to the [options] before
    // the API call is made.
    //Map<String, dynamic> params = options.params;

    Map<String, dynamic> bodyObject = jsonDecode(options.body ?? '');

    print(options.body ?? '--null--');

    bodyObject.removeWhere((key, value) => value == FFAppConstants.nullvalue);
    String bodyString = jsonEncode(bodyObject);

    print(bodyString);

    final ApiCallOptions newOptions = ApiCallOptions(
      callName: options.callName,
      callType: options.callType,
      bodyType: options.bodyType,
      apiUrl: options.apiUrl,
      params: options.params,
      headers: options.headers,
      returnBody: options.returnBody,
      body: options.body,
    );

    return newOptions;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    // Perform any necessary calls or modifications to the [response] prior
    // to returning it.
    return response;
  }
}
