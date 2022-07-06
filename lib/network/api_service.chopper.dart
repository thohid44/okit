// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<LoginModel>> loginUser(Map<dynamic, dynamic> body) {
    final $url = '/api/v1/login';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<LoginModel, LoginModel>($request);
  }

  @override
  Future<Response<SignUpMessage>> Signup(Map<dynamic, dynamic> body) {
    final $url = '/api/v1/registration';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SignUpMessage, SignUpMessage>($request);
  }

  @override
  Future<Response<Message>> topUpMobile(TopUpModel body, String authHeader) {
    final $url = '/api/v1/topup';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Message, Message>($request);
  }

  @override
  Future<Response<Message>> profileSettingUpdate(
      ProfileSettingUpdateModel body, String authHeader) {
    final $url = '/api/v1/profile-update';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Message, Message>($request);
  }

  @override
  Future<Response<PaymentMethodModel>> addPaymentMethod(
      Map<dynamic, dynamic> body, String authHeader) {
    final $url = '/api/v1/payment-method/add';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<PaymentMethodModel, PaymentMethodModel>($request);
  }

  @override
  Future<Response<CustomerSupportModel>> customerSupport(
      Map<dynamic, dynamic> body, String authHeader) {
    final $url = '/api/v1/customer-support';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<CustomerSupportModel, CustomerSupportModel>($request);
  }

  @override
  Future<Response<ProfileModel>> getMyProfile(String authHeader) {
    final $url = '/api/v1/profile';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<ProfileModel, ProfileModel>($request);
  }

  @override
  Future<Response<ProfileSettingModel>> getLimitSetting(String authHeader) {
    final $url = '/api/v1/profile-settings';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<ProfileSettingModel, ProfileSettingModel>($request);
  }

  @override
  Future<Response<SupportedCurrencyModel>> getSupportCurrency(
      String authHeader) {
    final $url = '/api/v1/currencies';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<SupportedCurrencyModel, SupportedCurrencyModel>($request);
  }

  @override
  Future<Response<ActiveWalletsModel>> getActiveWallets(String authHeader) {
    final $url = '/api/v1/wallets/active-only';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<ActiveWalletsModel, ActiveWalletsModel>($request);
  }

  @override
  Future<Response<FaqModel>> getFAQ(String authHeader) {
    final $url = '/api/v1/freequently-ask-qus';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<FaqModel, FaqModel>($request);
  }

  @override
  Future<Response<EmailOTPModel>> sendOTPtoMail(
      String authHeader, Map<dynamic, dynamic> body) {
    final $url = '/api/v1/send-otp';
    final $headers = {
      'Authorization': authHeader,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<EmailOTPModel, EmailOTPModel>($request);
  }
}
