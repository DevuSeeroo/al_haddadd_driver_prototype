import 'dart:convert';

import 'package:alhaddad_driver/app/api/services/api_client.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
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
    CustomLogger().print('OnInit', className: className, lineNumber: 24);
    dio = Dio();
    client = ApiClient(dio, baseurl);
  }

  Future<JobListResponse?> getJobList(int id) async {
    var res = await rootBundle.loadString("assets/sample_jsons/job_list.json");
    JobListResponse response = JobListResponse.fromJson(jsonDecode(res));

    return response;
  }
}
