import 'package:chopper/chopper.dart';
import 'package:okit/model/active_wallets_model.dart';
import 'package:okit/model/currency_model.dart';
import 'package:okit/model/customer_support_model.dart';
import 'package:okit/model/email_otp_model.dart';
import 'package:okit/model/faq_model.dart';
import 'package:okit/model/loginModel.dart';
import 'package:okit/model/message_model.dart';
import 'package:okit/model/operator_by_country_iso_model.dart';
import 'package:okit/model/payment_method_model.dart';
import 'package:okit/model/profile_model.dart';
import 'package:okit/model/profile_setting_model.dart';
import 'package:okit/model/profile_update_model.dart';
import 'package:okit/model/registration_model.dart';
import 'package:okit/model/singupmessage_model.dart';
import 'package:okit/model/topup_model.dart';
import 'package:okit/model/transection_by_id.dart';
import '../constant/text.dart';
import 'model_converter.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: "/api/v1")
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
        //baseUrl: 'http://192.168.0.252:8000',
        baseUrl: 'https://okit.spinnertechltd.com',
        services: [_$ApiService()],
        converter: JsonToTypeConverter(
          {
            LoginModel: (jsonData) => LoginModel.fromJson(jsonData),
            ProfileModel: (jsonData) => ProfileModel.fromJson(jsonData),
            ProfileSettingModel: (jsonData) =>
                ProfileSettingModel.fromJson(jsonData),
            SupportedCurrencyModel: (jsonData) =>
                SupportedCurrencyModel.fromJson(jsonData),
            ActiveWalletsModel: (jsonData) =>
                ActiveWalletsModel.fromJson(jsonData),
            FaqModel: (jsonData) => FaqModel.fromJson(jsonData),
            CustomerSupportModel: (jsonData) =>
                CustomerSupportModel.fromJson(jsonData),

            // RegistrationModel: (jsonData) =>
            //     RegistrationModel.fromJson(jsonData),

            SignUpMessage: (jsonData) => SignUpMessage.fromJson(jsonData),
            PaymentMethodModel: (jsonData) =>
                PaymentMethodModel.fromJson(jsonData),
            Message: (jsonData) => Message.fromJson(jsonData),
            ProfileSettingUpdateModel: (jsonData) =>
                ProfileSettingUpdateModel.fromJson(jsonData),

            //LoginResponse: (jsonData) => LoginResponse.fromJson(jsonData),
            // VerifyResponse: (jsonData) => VerifyResponse.fromJson(jsonData),
            // MessageResponse: (jsonData) => MessageResponse.fromJson(jsonData),
            // JobsResponse: (jsonData) => JobsResponse.fromJson(jsonData),
            // MinistryListResponse: (jsonData) => MinistryListResponse.fromJson(jsonData),
          },
        ),
        interceptors: [
          HttpLoggingInterceptor(),
        ]);

    return _$ApiService(client);
  }

  @Post(
    headers: {'Accept': 'application/json'},
    path: '/login',
  )
  Future<Response<LoginModel>> loginUser(@Body() Map body);

  @Post(
    headers: {'Accept': 'application/json'},
    path: '/registration',
  )
  Future<Response<SignUpMessage>> Signup(@Body() Map body);

  @Post(
    headers: {'Accept': 'application/json'},
    path: '/topup',
  )
  Future<Response<Message>> topUpMobile(
      @Body() TopUpModel body, @Header(kAuth) String authHeader);

  @Post(
    headers: {'Accept': 'application/json'},
    path: '/profile-update',
  )
  Future<Response<Message>> profileSettingUpdate(
      @Body() ProfileSettingUpdateModel body, @Header(kAuth) String authHeader);

  @Post(
    headers: {'Accept': 'application/json'},
    path: '/payment-method/add',
  )
  Future<Response<PaymentMethodModel>> addPaymentMethod(
      @Body() Map body, @Header(kAuth) String authHeader);

  @Post(
    headers: {'Accept': 'application/json'},
    path: '/customer-support',
  )
  Future<Response<CustomerSupportModel>> customerSupport(
      @Body() Map body, @Header(kAuth) String authHeader);

  @Get(
    headers: {'Accept': 'application/json'},
    path: '/profile',
  )
  Future<Response<ProfileModel>> getMyProfile(@Header(kAuth) String authHeader
      //  @Path() int id,
      );

  @Get(headers: {'Accept': 'application/json'}, path: '/profile-settings')
  Future<Response<ProfileSettingModel>> getLimitSetting(
      @Header(kAuth) String authHeader);

  @Get(headers: {'Accept': 'application/json'}, path: '/currencies')
  Future<Response<SupportedCurrencyModel>> getSupportCurrency(
      @Header(kAuth) String authHeader);

  @Get(headers: {'Accept': 'application/json'}, path: '/wallets/active-only')
  Future<Response<ActiveWalletsModel>> getActiveWallets(
      @Header(kAuth) String authHeader);

  @Get(headers: {'Accept': 'application/json'}, path: '/freequently-ask-qus')
  Future<Response<FaqModel>> getFAQ(@Header(kAuth) String authHeader);

  @Post(
    headers: {'Accept': 'application/json'},
    path: '/send-otp',
  )
  Future<Response<EmailOTPModel>> sendOTPtoMail(
      @Header(kAuth) String authHeader, @Body() Map body);

  // @Post(
  //   headers: {'Accept': 'application/json'},
  //   path: '/register',
  // )
  // Future<Response<LoginModel>> loginUser(@Body() Map body);

  // @Post(
  //   headers: {'Accept': 'application/json'},
  //   path: '/login',
  // )
  // Future<Response<VerifyResponse>> verify(@Body() Map body);
  //
  // @Post(
  //   headers: {'Accept': 'application/json'},
  //   path: '/profile/update',
  // )
  // Future<Response<MessageResponse>> updateProfile(
  //   @Header(kAuth) String authHeader,
  //   @Body() UpdateProfileRequest body,
  // );
  //
  // @Post(
  //   headers: {'Accept': 'application/json'},
  //   path: '/basicInfo',
  // )
  // Future<Response<MessageResponse>> basicInfo(
  //   @Header(kAuth) String authHeader,
  //   @Body() BasicInfoRequest body,
  // );
  //
  // @Get(
  //   headers: {'Accept': 'application/json'},
  //   path: '/jobs-active',
  // )
  // Future<Response<JobsResponse>> getJobs(
  //   @Header(kAuth) String authHeader,
  // );
  //
  // @Get(
  //   headers: {'Accept': 'application/json'},
  //   path: '/user-favourite-list',
  // )
  // Future<Response<JobsResponse>> getFabJobs(
  //   @Header(kAuth) String authHeader,
  // );
  //
  // @Get(
  //   headers: {'Accept': 'application/json'},
  //   path: '/user-favourite-department',
  // )
  // Future<Response<MinistryListResponse>> getMinistry(
  //     @Header(kAuth) String authHeader
  //     );
  //
  // @Post(
  //   headers: {'Accept': 'application/json'},
  //   path: '/user-favourite-department',
  // )
  // Future<Response<MessageResponse>> postMinistry(
  //     @Header(kAuth) String authHeader,
  //     @Body() Map body
  //     );
  //
  // @Get(
  //   headers: {'Accept': 'application/json'},
  //   path: '/user-favourite-university',
  // )
  // Future<Response<MinistryListResponse>> getUniversity(
  //     @Header(kAuth) String authHeader
  //     );
  //
  // @Post(
  //   headers: {'Accept': 'application/json'},
  //   path: '/user-favourite-university',
  // )
  // Future<Response<MessageResponse>> postUniversity(
  //     @Header(kAuth) String authHeader,
  //     @Body() Map body
  //     );
  //
  // @Get(
  //   headers: {'Accept': 'application/json'},
  //   path: '/user-favourite-grade',
  // )
  // Future<Response<MinistryListResponse>> getGrade(
  //     @Header(kAuth) String authHeader
  //     );
  //
  // @Post(
  //   headers: {'Accept': 'application/json'},
  //   path: '/user-favourite-grade',
  // )
  // Future<Response<MessageResponse>> postGrade(
  //     @Header(kAuth) String authHeader,
  //     @Body() Map body
  //     );

}
