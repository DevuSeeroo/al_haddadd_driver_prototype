import 'dart:convert';

import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/job_detail_model.dart';

class JobDetailProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return JobDetail1.fromJson(map);
    //   if (map is List)
    //     return map.map((item) => JobDetail1.fromJson(item)).toList();
    // };
    // httpClient.baseUrl = 'YOUR-API-URL';
  }
  //
  // Future<JobDetail1?> getJobDetail1(int id) async {
  //   final response = await get('jobdetail1/$id');
  //   return response.body;
  // }
  //
  // Future<Response<JobDetail1>> postJobDetail1(JobDetail1 jobdetail1) async =>
  //     await post('jobdetail1', jobdetail1);
  //
  // Future<Response> deleteJobDetail1(int id) async =>
  //     await delete('jobdetail1/$id');

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
}
