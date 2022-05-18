class JobListResponse {
  List<JobList>? jobList;

  JobListResponse({this.jobList});

  JobListResponse.fromJson(Map<String, dynamic> json) {
    if (json['job_list'] != null) {
      jobList = <JobList>[];
      json['job_list'].forEach((v) {
        jobList?.add(JobList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (jobList != null) {
      data['job_list'] = jobList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobList {
  String? jobId;
  String? name;
  String? address;
  int? jobStatus;
  String? jobMessage;
  String? time;
  String? date;

  JobList(
      {this.jobId,
      this.name,
      this.address,
      this.jobStatus,
      this.jobMessage,
      this.time,
      this.date});

  JobList.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    name = json['name'];
    address = json['address'];
    jobStatus = json['job_status'];
    jobMessage = json['job_message'];
    time = json['time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['job_id'] = jobId;
    data['name'] = name;
    data['address'] = address;
    data['job_status'] = jobStatus;
    data['job_message'] = jobMessage;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}
