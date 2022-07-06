import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:okit/constant/text.dart';
import 'package:okit/model/faq_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/shared/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../shared/layouts/blank_layout.dart';

class FaqPageView extends StatefulWidget {
  const FaqPageView({Key? key}) : super(key: key);

  @override
  State<FaqPageView> createState() => _FaqPageViewState();
}

class _FaqPageViewState extends State<FaqPageView> {
  void initState() {
    getRequest();
    super.initState();
  }

  final _box = GetStorage();
  Future<FaqModel?> getRequest() async {
    FaqModel? faq;

    final tok =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjZiYTc4Ny02MGY5LTRjN2YtODQ0Ni01Yzg1MzAwNmMyMTYiLCJqdGkiOiI5YjA0MjJmYzI3MzQxMDkyZTI3ZTVlNTQwZDQ0ZjAyNTk3YzA5MWQxY2Y4ZmZiZGRkZGFmMmVjZDE0OTFmNzhmYTJiMDIzYTJjNTU4ODVjMCIsImlhdCI6MTY1NTg3ODE4OC41Mzk4ODAwMzczMDc3MzkyNTc4MTI1LCJuYmYiOjE2NTU4NzgxODguNTM5ODgwMDM3MzA3NzM5MjU3ODEyNSwiZXhwIjoxNjg3NDE0MTg4LjUzODc5MzA4NzAwNTYxNTIzNDM3NSwic3ViIjoiMiIsInNjb3BlcyI6W119.LE1rKvPBMcVtrsinzDQ6X5XaJt7jFwA2W9p4_RwTgVvUc-yrnrhdUeh0vRwYqlxSBnSuuZyijTRgZ7vIjRssqhym4nzFmYz2kaFs4BNtY3PlBb3kXOt6b2kH0PHsH5B0BSd5d7dXBLgQTTMq3zl8zhyuGIJAgLxWddcAUdOdod6Byd7NO85PWKm_uMxizFSbj-eG7Fjn4hWMlxueVwHXnkzFAc-sQRLlvjvYyjLYj7PV6uqDtC9dsYPVyGRq_Is1JedDg6yGXHZ0KN_cxcfGpbMlUrj1jL-mCf_kUktQSuiax2DRFvdH1A6JkSnFVgoBM5h3gpeEBEubEgDgZoojzpZxIAOcpNxM_KahgwPjJn71rFphIkINDI9lnmncyATJwzmNz3DyqagMhwgYHCcf3TENG7RZ9cotuLqZmKyWsDPO9zGPLpmOPfRVKmHmHHDHPXEVvTzrz4aX8vKGkiT4d4-7C560cUHHI9Gg7ugFcYKuKNdu08P2fWkZH9KZpEMpPhYwVkyJfjAcLGWnrLhJUWWNHxX8wvTQ2hIz8s8QIBkBpLW10RUsmHQyVx3uFBNTH5f4CZeqAs6uAgryqjgcVFrWWb5Z5b9CupVoa4zVQa6vUGyKRbacI5PJ7aAHGHfFvU75JeAQAgaDZJNvyZpFDpkq2MOm1tUFKr3uAINtxJ8";

    final apiService = Provider.of<ApiService>(context, listen: false);
    var response = await apiService.getFAQ(kBearer + tok);
    print(response.body);
    if (response.isSuccessful) {
      // response.body[0].image!;
      // course = response.body!;

      faq = response.body;
    }
    // print(faq!.data![0].title.toString());

    print(" The faq lenght ${faq!.data!.length}");
    return faq;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: FutureBuilder(
                future: getRequest(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        if (snapshot == null) {
                          return Text("No DAta");
                        }
                        return ListTile(
                          title: Text(snapshot.data[index].title.toString()),
                        );
                      });
                }),
          ),
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({Key? key, required this.title, required this.body})
      : super(key: key);
  final String? title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.all(16.r),
      textColor: Colors.black,
      title: Text(title!),
      children: [Text(body!)],
    );
  }
}
