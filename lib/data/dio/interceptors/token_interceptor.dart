// import 'package:dio/dio.dart';
// import 'package:tok_tok/data/service/local/auth_hive_service.dart';

// class TokenDioInterceptor implements Interceptor {
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final data = await AuthHiveService.getData();
//     options.headers['Authorization'] = 'Bearer ${data?.token.access}';
//     handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
//       AuthHiveService.logout();
//     }
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // TODO: implement onResponse
//     handler.resolve(response);
//   }
// }
