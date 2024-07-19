import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/authentication/controllers/emailcontroller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FetchedData {
  String memberName;
  List<dynamic> packageItems;
  String issueDate;

  FetchedData({required this.memberName, required this.packageItems, required this.issueDate});
}

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final supabase = Supabase.instance.client;
  final Emailcontroller emailcontroller = Get.put(Emailcontroller());
  String id = '';

  List<FetchedData> fetchedList = [];

  Future<void> naamkaran() async {
    final response = await supabase
        .from('Members')
        .select()
        .eq('emailid', emailcontroller.emailget.value)
        .single();
    final data = response;
    emailcontroller.Namefrommail.value = data['name'];
    emailcontroller.idfrommail.value = data['id'];
    print(emailcontroller.idfrommail.value);
  }

  Future<void> fetchPackage() async {
    print(emailcontroller.idfrommail.value);
    final fetchedPackage = await supabase
        .from('Transactions')
        .select()
        .eq('id', emailcontroller.idfrommail.value);
    
    final data = fetchedPackage as List;

    for (var item in data) {
      fetchedList.add(
        FetchedData(
          memberName: item['name'],
          packageItems: item['package'],
          issueDate: item['issuedate'],
        ),
      );
    }

    print(fetchedList);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    await naamkaran();
    await fetchPackage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 154, 210, 255),
              Color.fromARGB(255, 213, 245, 252),
              Color.fromARGB(255, 242, 254, 255)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
           
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: fetchedList.length,
                itemBuilder: (ctx, index) {
                  final fetchedComp = fetchedList[index];
                  final List<String> itemNames = fetchedComp.packageItems
                      .map<String>((item) => item['compname'].toString())
                      .toList();
                  //print(itemNames);

                  final item1 = itemNames.isNotEmpty ? itemNames[0] : '';
                  final item2 = itemNames.length > 1 ? itemNames[1] : '';

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(39, 5, 168, 244),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              '${item1},${item2}...',
                              style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Member: ${fetchedComp.memberName}',
                              style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Issued On: ${fetchedComp.issueDate}',
                              style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
