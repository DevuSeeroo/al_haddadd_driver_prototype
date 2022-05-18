import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/job_list_model.dart';

class JobListProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return JobList.fromJson(map);
      if (map is List) {
        return map.map((item) => JobList.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  // Future<JobList?> getJobList(int id) async {
  //   final response = await get('joblist/$id');
  //   return response.body;
  // }
  //
  // Future<Response<JobList>> postJobList(JobList joblist) async =>
  //     await post('joblist', joblist);
  // Future<Response> deleteJobList(int id) async => await delete('joblist/$id');

  Future<JobListResponse?> getJobList(int id) async {
    var res = await rootBundle.loadString("assets/sample_jsons/job_list.json");
    JobListResponse response = JobListResponse.fromJson(jsonDecode(res));

    return response;
  }
}
