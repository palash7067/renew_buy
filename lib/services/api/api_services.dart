import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:renew_buy/core/utils/constants.dart';
import 'package:renew_buy/core/utils/failure.dart';
import 'package:renew_buy/core/utils/helpers.dart';
import 'package:renew_buy/src/models/feed_model.dart';

class ApiService{
  ApiService();

  final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.apiBaseUrl));

  Future<Either<Failure, FeedModel>> getFeed() async {
    try {
      final response = await Helpers.sendRequest(
        dio, RequestType.get, ApiEndpoints.getFeed,
      );
      return Right(FeedModel.fromJson(response));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}