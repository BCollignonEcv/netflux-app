import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GETShowCall {
  static Future<ApiCallResponse> call({
    int showId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Show',
      apiUrl: 'https://api.tvmaze.com/shows/${showId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class SearchShowsCall {
  static Future<ApiCallResponse> call({
    String q = 'actions',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Shows',
      apiUrl: 'https://api.tvmaze.com/search/shows',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
      },
      returnBody: true,
    );
  }
}

class GETShowsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Shows ',
      apiUrl: 'https://api.tvmaze.com/shows',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic show(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
      );
}
