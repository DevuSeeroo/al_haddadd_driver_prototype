import 'dart:convert';

import 'package:alhaddad_driver/app/api/error_handler/server_error.dart';
import 'package:alhaddad_driver/app/api/generic/base_model.dart';
import 'package:alhaddad_driver/app/api/services/api_client.dart';
import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart';
import 'package:alhaddad_driver/app/modules/home/models/order_status_model.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/job_list_model.dart';

class JobListProvider extends GetConnect {
  late Dio dio;
  late ApiClient client;
  final AppStorageKeys appStorageKeys = AppStorageKeys();

  String baseurl = AppConstants.BaseUrl;
  String className = "JobListProvider";
  @override
  void onInit() {
    CustomLogger().print('OnInit', className: className, lineNumber: 25);
    dio = Dio();
    client = ApiClient(dio, baseurl);
  }

  List<OrderStatusModel> createOrderStatusListBasedOnIndex(int index) {
    CustomLogger().print("Passed index: $index", lineNumber: 33);
    List<OrderStatusModel> list = [];
    if (index == AppConstants.jobHistoryIndex) {
      // list.add(OrderStatusModel(0, 'All', false.obs));
      list.add(OrderStatusModel(
          AppConstants.completedStatusId, LocaleKeys.delivered.tr, false.obs));
      list.add(OrderStatusModel(AppConstants.deliveryPendingStatusId,
          LocaleKeys.failed.tr, false.obs));
    }
    return list;
  }

  Future<JobListResponse?> getJobList(int id) async {
    var res =
        await rootBundle.loadString("assets/sample_jsons/job_list_ref.json");
    JobListResponse response = JobListResponse.fromJson(jsonDecode(res));

    return response;
  }

  Future<BaseModel<JobListResponse>> getJobListFromAPI(
      JobListInputParam inputParams) async {
    onInit();
    CustomLogger().print(jsonEncode(inputParams), lineNumber: 41);
    JobListResponse? response;
    try {
      response = await client.getJobListPOST(
          appStorageKeys.readUserToken(), inputParams);

      CustomLogger().print('response: ${response.toJson()}',
          className: className, lineNumber: 48);
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 52);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<JobListResponse>> getJobListFromAPI2(
      JobListInputParam inputParams) async {
    onInit();
    CustomLogger().print(jsonEncode(inputParams), lineNumber: 62);
    JobListResponse response;
    try {
      dynamic res =
          await client.getJobList(appStorageKeys.readUserToken(), inputParams);
      // print(jsonEncode(res));
      var string = "{\"job_list\": ${jsonEncode(res)}}";
      response = JobListResponse.fromJson(json.decode(string));
      print('job_list: ${response.toJson()}');
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 73);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }
}
