// lib/core/network/crud.dart
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingtask/core/class/status_request.dart';
import 'check_internet.dart';

class Crud {
  // POST request method
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map data, Map<String, String> header) async {
    return _handleRequest(
          () => http.post(
        Uri.parse(linkUrl),
        body: jsonEncode(data),
        headers: header,
      ),
    );
  }

  // GET request method
  Future<Either<StatusRequest, Map>> getData(
      String linkUrl, Map<String, String> header) async {
    return _handleRequest(
          () => http.get(
        Uri.parse(linkUrl),
        headers: header,
      ),
    );
  }

  // Private method to handle requests and responses
  Future<Either<StatusRequest, Map>> _handleRequest(
      Future<http.Response> Function() request) async {
    try {
      if (await checkInternet()) {
        final response = await request();
        if (response.statusCode == 200 || response.statusCode == 201) {
          final Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
