import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:okit/constant/pref_keys.dart';
import 'package:okit/model/profile_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/routes/router.gr.dart';
import 'package:okit/screen/profile_info_view.dart';
import 'package:okit/screen/settings_view.dart';
import 'package:okit/screen/update_profile_info_view.dart';
import 'package:okit/shared/layouts/blank_layout.dart';
import 'package:provider/provider.dart';

import '../constant/text.dart';
import '../shared/widgets/custom_profile_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void initState() {
    getRequest();
    super.initState();
  }

  final _box = GetStorage();

  // String token = _box.read(PrefKey.token);
  Future<ProfileModel> getRequest() async {
    ProfileModel? profile;
    final String token = _box.read(PrefKey.token);

    final apiService = Provider.of<ApiService>(context, listen: false);
    var response = await apiService.getMyProfile(kBearer + token);

    if (response.isSuccessful) {
      // response.body[0].image!;
      // course = response.body!;
      profile = response.body;
      //

    }

    return profile!;
  }

  @override
  Widget build(BuildContext context) {
    getRequest();
    return BlankLayout(
        includeAppBar: true,
        backgroundColor: Colors.grey,
        appbar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey,
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
            title: const Text("Profile"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    // context.route.push()
                    //context.router.push(SettingsRoute());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsView()));
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.yellow,
                  )),
            ]),
        body: FutureBuilder(
            future: getRequest(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      // clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 80, left: 25, right: 25, bottom: 25),
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 73,
                              child: CircleAvatar(
                                radius: 70.0,
                                backgroundImage: NetworkImage(
                                    "${snapshot.data.data.profile_picture}"),
                                //  backgroundColor: Colors.transparent,
                              )),
                        ),
                        Positioned(
                          top: 110,
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                "Verified",
                                style: GoogleFonts.montserrat(
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                // style: TextStyle(
                                //     fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade700,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),

                        Positioned(
                          top: 170,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateProfileInfoView(
                                                name: snapshot.data.data.name,
                                                email: snapshot.data.data.email,
                                                phone: snapshot.data.data.phone,
                                              )));
                                },
                                child: Text(
                                  snapshot.data.data.name,
                                  style:
                                      // TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      GoogleFonts.montserrat(
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileInfoView()));
                                },
                                child: Text(
                                  snapshot.data.data.email,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Positioned(
                        //   top: 230,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        //     child: ListTile(title: Text("Phone"), subtitle: Text("01"), trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),),
                        //   ),
                        // ),
                        Positioned(
                          top: 220,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 300,
                            child: Column(
                              children: [
                                CustomProfileInfoButton(
                                    title: "Phone Number",
                                    subtitle:
                                        snapshot.data.data.phone.toString(),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateProfileInfoView(
                                                    name:
                                                        snapshot.data.data.name,
                                                    email: snapshot
                                                        .data.data.email,
                                                    phone: snapshot
                                                        .data.data.phone,
                                                    gender: snapshot
                                                        .data.data.gender,
                                                  )));
                                    }),
                                CustomProfileInfoButton(
                                    title: "Email",
                                    subtitle: snapshot.data.data.email,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateProfileInfoView(
                                                    name:
                                                        snapshot.data.data.name,
                                                    email: snapshot
                                                        .data.data.email,
                                                    phone: snapshot
                                                        .data.data.phone,
                                                    gender: snapshot
                                                        .data.data.gender,
                                                  )));
                                    }),
                                CustomProfileInfoButton(
                                    title: "Gender",
                                    subtitle: snapshot.data.data.gender,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateProfileInfoView(
                                                    name:
                                                        snapshot.data.data.name,
                                                    email: snapshot
                                                        .data.data.email,
                                                    phone: snapshot
                                                        .data.data.phone,
                                                    gender: snapshot
                                                        .data.data.gender,
                                                  )));
                                    }),
                                // CustomProfileInfoButton(
                                //     title: "Bank Account",
                                //     subtitle: "American Express, Wells Fargo",
                                //     onPressed: () {}),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
