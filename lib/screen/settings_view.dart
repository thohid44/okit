import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okit/constant/pref_keys.dart';
import 'package:okit/constant/text.dart';
import 'package:okit/model/profile_setting_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/routes/router.gr.dart';
import 'package:okit/screen/automatic_pay_view.dart';
import 'package:okit/screen/set_default_card_view.dart';
import 'package:okit/screen/set_limit_view.dart';
import 'package:okit/screen/automatic_pay_view.dart';
import 'package:okit/shared/layouts/blank_layout.dart';
import 'package:okit/shared/widgets/custom_settings_list_tile.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  void initState() {
    getRequest();
    super.initState();
  }

  final _box = GetStorage();
  Future<ProfileSettingModel> getRequest() async {
    ProfileSettingModel? limit;
    final String token = _box.read(PrefKey.token);
    final apiService = Provider.of<ApiService>(context, listen: false);
    var response = await apiService.getLimitSetting(kBearer + token);
    print(response.body);
    if (response.isSuccessful) {
      // response.body[0].image!;
      // course = response.body!;
      limit = response.body;
      //

    }

    return limit!;
  }

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
        includeAppBar: true,
        appbar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            "Settings",
            style: GoogleFonts.montserrat(
              letterSpacing: 1,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomSettingsListTile(
                  title: "Default Card",
                  subtitle: "Rahul Sharma (MasterCard)",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetDefaultCardView()));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FutureBuilder(
                future: getRequest(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CustomSettingsListTile(
                        title: "Limit",
                        subtitle: snapshot.data.data.dailyLimit.toString(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SetLimitView(
                                    limit: snapshot.data.data.dailyLimit),
                              ));
                        });
                  }
                  return Center(
                    child:
                        CircularProgressIndicator(color: Colors.orangeAccent),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomSettingsListTile(
                  title: "Automatic Pay",
                  subtitle: "OKIT Card",
                  onTap: () {
                    //context.router.push(const AutomaticPayRoute());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AutomaticPayView()));
                  }),
            ),
          ],
        ));
  }
}
