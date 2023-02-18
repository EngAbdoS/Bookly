import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection timeout with Server');

      case DioErrorType.sendTimeout:
        return ServerFailure('send timeout with Server');

      case DioErrorType.receiveTimeout:
        return ServerFailure('receive timeout with Server');

      case DioErrorType.response:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to Server was canceld');

      case DioErrorType.other:
       // if (dioError.message.contains('SochetException')) {
          return ServerFailure('مشكلة نت يا رجولة يعني برا عني, جرب رستر الراوتر 😒');
       //} else {
       //  return ServerFailure('Unexpected Error,try later');
       //}
      default:
        return ServerFailure('Opps tgere was an error ,try later');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 403 || statusCode == 401) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your reqest not found,plz try later');
    } else if (statusCode == 500) {
      return ServerFailure('internal server err ,try later');
    } else {
      return ServerFailure('Opps tgere was an error ,try later');
    }
  }
}
