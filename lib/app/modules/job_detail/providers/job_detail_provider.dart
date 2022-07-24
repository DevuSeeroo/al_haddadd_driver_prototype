import 'dart:convert';

import 'package:alhaddad_driver/app/api/error_handler/error_model_response.dart';
import 'package:alhaddad_driver/app/api/error_handler/server_error.dart';
import 'package:alhaddad_driver/app/api/generic/base_model.dart';
import 'package:alhaddad_driver/app/api/services/api_client.dart';
import 'package:alhaddad_driver/app/modules/job_detail/models/job_detail_model.dart';
import 'package:alhaddad_driver/app/modules/job_detail/models/job_failed_input_model.dart';
import 'package:alhaddad_driver/app/modules/job_detail/models/job_status_change_model.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/job_detail_json_model.dart';

class JobDetailProvider extends GetConnect {
  late Dio dio;
  late ApiClient client;
  final AppStorageKeys appStorageKeys = AppStorageKeys();

  String baseurl = AppConstants.BaseUrl;
  String className = "ProfileProvider";
  @override
  void onInit() {
    CustomLogger().print('OnInit', className: className, lineNumber: 20);
    dio = Dio();
    client = ApiClient(dio, baseurl);
  }

  Future<JobDetailModel?> getJobDetail(String id) async {
    String res = "";
    JobDetailModel response;
    if (id == "SO1640") {
      res = await rootBundle.loadString(Assets.sampleJsonsJobDetail2);
      response = JobDetailModel.fromJson(jsonDecode(res));
    } else if (id == "SO1641") {
      res = await rootBundle.loadString(Assets.sampleJsonsJobDetail0);
      response = JobDetailModel.fromJson(jsonDecode(res));
    } else if (id == "SO1642") {
      res = await rootBundle.loadString(Assets.sampleJsonsJobDetail1);
      response = JobDetailModel.fromJson(jsonDecode(res));
    } else {
      res = await rootBundle.loadString(Assets.sampleJsonsJobDetail3);
      response = JobDetailModel.fromJson(jsonDecode(res));
    }
    return response;
  }

  Future<BaseModel<JobDetail>> fetchJobDetail(
      {required String shippingId}) async {
    onInit();
    JobDetail response;
    try {
      response =
          await client.getJobDetail(appStorageKeys.readUserToken(), shippingId);
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 61);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<JobStatusChangeModel>> changeStatusToShippedOrPicked(
      int shippingId) async {
    onInit();
    JobStatusChangeModel response;
    try {
      dynamic res = await client.changeStatusToShippedOrPicked(
          appStorageKeys.readUserToken(), shippingId);
      if (res != null) {
        response =
            JobStatusChangeModel(status: true, message: res, statusCode: 200);
      } else {
        response = JobStatusChangeModel(
            status: true,
            message: "Something went"
                " wrong",
            statusCode: 400);
      }
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 87);
      DioError serverError = error as DioError;
      if (serverError.response!.statusCode! == 400) {
        response = JobStatusChangeModel(
            status: true,
            message:
                ErrorModelResponse.fromJson(serverError.response!.data).message,
            statusCode: 400);
      } else {
        return BaseModel()
          ..setException(ServerError.withErrorAndCode(error: serverError));
      }
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<JobStatusChangeModel>> changeStatusToInTransit(
      int shippingId) async {
    onInit();
    JobStatusChangeModel response;
    try {
      dynamic res = await client.changeStatusToInTransit(
          appStorageKeys.readUserToken(), shippingId);
      if (res != null) {
        response =
            JobStatusChangeModel(status: true, message: res, statusCode: 200);
      } else {
        response = JobStatusChangeModel(
            status: true,
            message: "Something went"
                " wrong",
            statusCode: 400);
      }
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 122);
      DioError serverError = error as DioError;
      if (serverError.response!.statusCode! == 400) {
        response = JobStatusChangeModel(
            status: true,
            message:
                ErrorModelResponse.fromJson(serverError.response!.data).message,
            statusCode: 400);
      } else {
        return BaseModel()
          ..setException(ServerError.withErrorAndCode(error: serverError));
      }
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<JobStatusChangeModel>> changeStatusToDelivered(
      int shippingId) async {
    onInit();
    JobStatusChangeModel response;
    try {
      dynamic res = await client.changeStatusToDelivered(
          appStorageKeys.readUserToken(), shippingId);
      if (res != null) {
        response =
            JobStatusChangeModel(status: true, message: res, statusCode: 200);
      } else {
        response = JobStatusChangeModel(
            status: true,
            message: "Something went"
                " wrong",
            statusCode: 400);
      }
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 157);
      DioError serverError = error as DioError;
      if (serverError.response!.statusCode! == 400) {
        response = JobStatusChangeModel(
            status: true,
            message:
                ErrorModelResponse.fromJson(serverError.response!.data).message,
            statusCode: 400);
      } else {
        return BaseModel()
          ..setException(ServerError.withErrorAndCode(error: serverError));
      }
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<JobStatusChangeModel>> changeStatusToDeliveryFailed(
      JobFailedInputModel model) async {
    onInit();
    JobStatusChangeModel response;
    try {
      dynamic res = await client.changeStatusToDeliveryFailed(
          appStorageKeys.readUserToken(),
          model.shippingId!,
          model.reason ?? "");
      if (res != null) {
        response =
            JobStatusChangeModel(status: true, message: res, statusCode: 200);
      } else {
        response = JobStatusChangeModel(
            status: true, message: "Something went wrong", statusCode: 400);
      }
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 192);
      DioError serverError = error as DioError;
      if (serverError.response!.statusCode! == 400) {
        try {
          response = JobStatusChangeModel(
              status: true,
              message: ErrorModelResponse.fromJson(serverError.response!.data)
                  .message,
              statusCode: 400);
        } catch (error) {
          response = JobStatusChangeModel(
              status: true,
              message: serverError.response?.data ??
                  LocaleKeys.somethingWentWrong.tr,
              statusCode: 400);
        }
      } else {
        return BaseModel()
          ..setException(ServerError.withErrorAndCode(error: serverError));
      }
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<JobStatusChangeModel>> changeStatusToPackageReturned(
      int shippingId) async {
    onInit();
    JobStatusChangeModel response;
    try {
      dynamic res = await client.changeStatusToPackageReturned(
          appStorageKeys.readUserToken(), shippingId);
      if (res != null) {
        response =
            JobStatusChangeModel(status: true, message: res, statusCode: 200);
        CustomLogger().print(jsonEncode(response), lineNumber: 217);
      } else {
        response = JobStatusChangeModel(
            status: true, message: "Something went wrong", statusCode: 400);
      }
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 228);
      DioError serverError = error as DioError;
      if (serverError.response!.statusCode! == 400) {
        response = JobStatusChangeModel(
            status: true,
            message:
                ErrorModelResponse.fromJson(serverError.response!.data).message,
            statusCode: 400);
      } else {
        return BaseModel()
          ..setException(ServerError.withErrorAndCode(error: serverError));
      }
    }
    return BaseModel()..data = response;
  }
}
