import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okit/shared/layouts/blank_layout.dart';
import 'package:okit/shared/widgets/custom_textfield.dart';

class UpdateProfileInfoView extends StatefulWidget {
  final name;
  final email;
  final phone;
  final gender;

  UpdateProfileInfoView(
      {Key? key, this.name, this.email, this.phone, this.gender})
      : super(key: key);

  @override
  State<UpdateProfileInfoView> createState() => _UpdateProfileInfoViewState();
}

class _UpdateProfileInfoViewState extends State<UpdateProfileInfoView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Update Profile"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 5.h),
                child: CustomTextField(
                    title: "Name",
                    labelText: "${widget.name}",
                    textEditingController: name),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 5.h),
                child: CustomTextField(
                    title: "Email",
                    labelText: "${widget.email}",
                    textEditingController: name),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 5.h),
                child: CustomTextField(
                    title: "Phone",
                    labelText: "${widget.phone}",
                    textEditingController: name),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 5.h),
                child: CustomTextField(
                    title: "Gender",
                    labelText: "${widget.gender}",
                    textEditingController: name),
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Update"))
            ],
          ),
        ));
  }
}
