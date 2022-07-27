// Mocks generated by Mockito 5.2.0 from annotations
// in alhaddad_driver/test/login_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;

import 'package:alhaddad_driver/app/api/services/api_client.dart' as _i8;
import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart'
    as _i12;
import 'package:alhaddad_driver/app/modules/home/models/job_list_model.dart'
    as _i6;
import 'package:alhaddad_driver/app/modules/home/models/view_profile_response.dart'
    as _i5;
import 'package:alhaddad_driver/app/modules/job_detail/models/job_detail_model.dart'
    as _i7;
import 'package:alhaddad_driver/app/modules/login/models/logout_response.dart'
    as _i2;
import 'package:alhaddad_driver/app/modules/login/models/send_otp_params.dart'
    as _i10;
import 'package:alhaddad_driver/app/modules/login/models/send_otp_response.dart'
    as _i3;
import 'package:alhaddad_driver/app/modules/verification/models/verify_otp_params.dart'
    as _i11;
import 'package:alhaddad_driver/app/modules/verification/models/verify_otp_response.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeLogoutResponse_0 extends _i1.Fake implements _i2.LogoutResponse {}

class _FakeSendOtpResponse_1 extends _i1.Fake implements _i3.SendOtpResponse {}

class _FakeVerifyOtpResponse_2 extends _i1.Fake
    implements _i4.VerifyOtpResponse {}

class _FakeViewProfileResponse_3 extends _i1.Fake
    implements _i5.ViewProfileResponse {}

class _FakeJobListResponse_4 extends _i1.Fake implements _i6.JobListResponse {}

class _FakeJobDetail_5 extends _i1.Fake implements _i7.JobDetail {}

/// A class which mocks [ApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiClient extends _i1.Mock implements _i8.ApiClient {
  MockApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.LogoutResponse> logout() =>
      (super.noSuchMethod(Invocation.method(#logout, []),
              returnValue:
                  Future<_i2.LogoutResponse>.value(_FakeLogoutResponse_0()))
          as _i9.Future<_i2.LogoutResponse>);
  @override
  _i9.Future<_i3.SendOtpResponse> sendOtp(_i10.SendOtpParams? sendOtpParams) =>
      (super.noSuchMethod(Invocation.method(#sendOtp, [sendOtpParams]),
              returnValue:
                  Future<_i3.SendOtpResponse>.value(_FakeSendOtpResponse_1()))
          as _i9.Future<_i3.SendOtpResponse>);
  @override
  _i9.Future<_i4.VerifyOtpResponse> verifyOtp(
          _i11.VerifyOtpParams? sendOtpParams) =>
      (super.noSuchMethod(Invocation.method(#verifyOtp, [sendOtpParams]),
              returnValue: Future<_i4.VerifyOtpResponse>.value(
                  _FakeVerifyOtpResponse_2()))
          as _i9.Future<_i4.VerifyOtpResponse>);
  @override
  _i9.Future<_i5.ViewProfileResponse> viewProfile(String? userToken) =>
      (super.noSuchMethod(Invocation.method(#viewProfile, [userToken]),
              returnValue: Future<_i5.ViewProfileResponse>.value(
                  _FakeViewProfileResponse_3()))
          as _i9.Future<_i5.ViewProfileResponse>);
  @override
  _i9.Future<dynamic> getJobList(
          String? header, _i12.JobListInputParam? inputParams) =>
      (super.noSuchMethod(Invocation.method(#getJobList, [header, inputParams]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<_i6.JobListResponse> getJobListPOST(
          String? header, _i12.JobListInputParam? inputParams) =>
      (super.noSuchMethod(
              Invocation.method(#getJobListPOST, [header, inputParams]),
              returnValue:
                  Future<_i6.JobListResponse>.value(_FakeJobListResponse_4()))
          as _i9.Future<_i6.JobListResponse>);
  @override
  _i9.Future<_i7.JobDetail> getJobDetail(String? header, String? orderId) =>
      (super.noSuchMethod(Invocation.method(#getJobDetail, [header, orderId]),
              returnValue: Future<_i7.JobDetail>.value(_FakeJobDetail_5()))
          as _i9.Future<_i7.JobDetail>);
  @override
  _i9.Future<dynamic> changeStatusToShippedOrPicked(
          String? header, int? orderId) =>
      (super.noSuchMethod(
          Invocation.method(#changeStatusToShippedOrPicked, [header, orderId]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> changeStatusToInTransit(String? header, int? orderId) =>
      (super.noSuchMethod(
          Invocation.method(#changeStatusToInTransit, [header, orderId]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> changeStatusToDelivered(String? header, int? orderId) =>
      (super.noSuchMethod(
          Invocation.method(#changeStatusToDelivered, [header, orderId]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> changeStatusToDeliveryFailed(
          String? header, int? orderId, String? reason) =>
      (super.noSuchMethod(
          Invocation.method(
              #changeStatusToDeliveryFailed, [header, orderId, reason]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> changeStatusToPackageReturned(
          String? header, int? orderId) =>
      (super.noSuchMethod(
          Invocation.method(#changeStatusToPackageReturned, [header, orderId]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
}
