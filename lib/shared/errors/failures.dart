import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errorMessage);

  factory ServiceFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServiceFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServiceFailure('BadCertificate');
      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServiceFailure('Request to ApiServer was Canceled');
      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          return ServiceFailure('No Internet Connection');
        }
        return ServiceFailure('UnExpected Error, try again');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServiceFailure('No Internet Connection');
        }
        return ServiceFailure('UnExpected Error, try again');
      default:
        return ServiceFailure('Oops There was an error , try later');
    }
  }

  factory ServiceFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServiceFailure('Your request not found, try later');
    } else if (statusCode == 500) {
      return ServiceFailure('Internal server error, try later');
    } else {
      return ServiceFailure('Oops There was an error , try later');
    }
  }
}
