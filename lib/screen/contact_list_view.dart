import 'dart:convert';
import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:okit/model/operator_by_country_iso_model.dart';
import 'package:okit/screen/select_amount.dart';
import 'package:http/http.dart' as http;

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  TextEditingController _number = TextEditingController();
  var operatorName;
  var operatorId;
  var uniqueId;
  String operator =
      'https://logovtor.com/wp-content/uploads/2020/08/banglalink-logo-vector.png';

  String token =
      "eyJraWQiOiI1N2JjZjNhNy01YmYwLTQ1M2QtODQ0Mi03ODhlMTA4OWI3MDIiLCJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNTM1MCIsImlzcyI6Imh0dHBzOi8vcmVsb2FkbHktc2FuZGJveC5hdXRoMC5jb20vIiwiaHR0cHM6Ly9yZWxvYWRseS5jb20vc2FuZGJveCI6dHJ1ZSwiaHR0cHM6Ly9yZWxvYWRseS5jb20vcHJlcGFpZFVzZXJJZCI6IjE1MzUwIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiYXVkIjoiaHR0cHM6Ly90b3B1cHMtaHMyNTYtc2FuZGJveC5yZWxvYWRseS5jb20iLCJuYmYiOjE2NTYzOTI0OTUsImF6cCI6IjE1MzUwIiwic2NvcGUiOiJzZW5kLXRvcHVwcyByZWFkLW9wZXJhdG9ycyByZWFkLXByb21vdGlvbnMgcmVhZC10b3B1cHMtaGlzdG9yeSByZWFkLXByZXBhaWQtYmFsYW5jZSByZWFkLXByZXBhaWQtY29tbWlzc2lvbnMiLCJleHAiOjE2NTY0Nzg4OTUsImh0dHBzOi8vcmVsb2FkbHkuY29tL2p0aSI6ImQ1MzlmNWYxLWUwNmItNDAwOC1hZDkyLTljNTA2Nzc1MmU3MiIsImlhdCI6MTY1NjM5MjQ5NSwianRpIjoiNzVlYmMwYzAtMTBiOS00ODkwLTg1MTYtOWYwOTUxZTU3Y2NjIn0.oW8EZIHQxfdV-48dYGVupdC-ajsPvkEpOalrzZCsOI4";
  List<Contact>? contacts;
  var getClient = http.Client();
  String getUrl = "topups-sandbox.reloadly.com";

  Future<List<OperatorByCountryIos>?> getOperator() async {
    List<OperatorByCountryIos> operatorList = [];

    // var response =
    //     await getClient.get(Uri.https(getUrl, '/operators/countries/US'));

    var response =
        await http.get(Uri.https(getUrl, 'operators/countries/BD'), headers: {
      'Authorization': 'Bearer $token',
    });
    var courseListData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var i in courseListData) {
        OperatorByCountryIos operator_list = OperatorByCountryIos(
          id: i['id'],
          operatorId: i['operatorId'],
          name: i['name'],
        );
        operatorList.add(operator_list);
      }
      return operatorList;
    } else {
      return operatorList;
    }
  }

  void getPhoneData() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {});
    }
  }

  void initState() {
    getPhoneData();
    getOperator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact List"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10.0),
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: TextField(
                            controller: _number,
                            decoration:
                                InputDecoration(border: OutlineInputBorder())),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          const uId = Uuid();
                          setState(() {
                            uniqueId = uId.v1();
                          });

                          showModalBottomSheet(
                              context: context,
                              builder: (context) => FutureBuilder(
                                  future: getOperator(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return Column(
                                      children: [
                                        const Text("Chose Operator"),
                                        Expanded(
                                          child: GridView.builder(
                                            itemCount: snapshot.data.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 10,
                                                    crossAxisSpacing: 5),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  operatorId = snapshot
                                                      .data[index].operatorId;
                                                  operatorName =
                                                      snapshot.data[index].name;
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SelectAmount(
                                                                  operatorId:
                                                                      operatorId,
                                                                  operator:
                                                                      operator,
                                                                  number:
                                                                      _number
                                                                          .text,
                                                                  uniquekey:
                                                                      uniqueId,
                                                                  name:
                                                                      operatorName)));
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Center(
                                                    child: Text(snapshot
                                                        .data[index].name!),
                                                  ),
                                                  decoration: BoxDecoration(

                                                      // image: DecorationImage(
                                                      //   fit: BoxFit.cover,
                                                      //   image: NetworkImage(),
                                                      // ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  }));

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MobileOperator()));
                        },
                        icon: Icon(Icons.keyboard_arrow_right))
                  ],
                )),
            Expanded(
              child: (contacts == null)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: contacts!.length,
                      itemBuilder: (context, index) {
                        Uint8List? image = contacts![index].photo;
                        String number = (contacts![index].phones.isNotEmpty)
                            ? contacts![index].phones.first.number
                            : "---";
                        return ListTile(
                          leading: (image == null)
                              ? CircleAvatar(child: Icon((Icons.person)))
                              : CircleAvatar(
                                  backgroundImage: MemoryImage(image),
                                ),
                          title: Text(contacts![index].name.first),
                          subtitle: Text(number),
                          onTap: () {
                            // showModalBottomSheet(
                            //     context: context,
                            //     builder: (context) => Column(
                            //           children: [
                            //             const Text("Select Operator"),
                            //             Expanded(
                            //               child: GridView.builder(
                            //                 itemCount: 5,
                            //                 gridDelegate:
                            //                     const SliverGridDelegateWithFixedCrossAxisCount(
                            //                         crossAxisCount: 3),
                            //                 itemBuilder: (BuildContext context,
                            //                     int index) {
                            //                   return InkWell(
                            //                     onTap: () {
                            //                       Navigator.push(
                            //                           context,
                            //                           MaterialPageRoute(
                            //                             builder: (context) =>
                            //                                 SelectAmount(
                            //                               operatorId:
                            //                                   operatorId,
                            //                               operator: operator,
                            //                               number: number,
                            //                               name: operatorName,
                            //                               uniquekey: uniqueId,
                            //                             ),
                            //                           ));
                            //                     },
                            //                     child: Container(
                            //                       margin: EdgeInsets.all(8),
                            //                       decoration: BoxDecoration(
                            //                           color: Colors.yellow,
                            //                           image: DecorationImage(
                            //                             fit: BoxFit.cover,
                            //                             image: NetworkImage(
                            //                                 'https://logovtor.com/wp-content/uploads/2020/08/banglalink-logo-vector.png'),
                            //                           ),
                            //                           borderRadius:
                            //                               BorderRadius.circular(
                            //                                   5),
                            //                           border: Border.all(
                            //                               color: Colors.black)),
                            //                     ),
                            //                   );
                            //                 },
                            //               ),
                            //             ),
                            //           ],
                            //         ));
                            setState(() {
                              _number.text = number;
                            });
                            //   launchUrlString('tel:${number}');
                          },
                        );
                      }),
            ),
          ],
        ));
  }
}
