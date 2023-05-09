import 'package:corona_app/Cases_widgets_row.dart';
import 'package:corona_app/custom_drop_down_menu.dart';
import 'package:corona_app/header_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'http_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HttpHelper(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Provider.of<HttpHelper>(context, listen: false).getData(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await HttpHelper().sendPostRequest(
                          cases: Provider.of<HttpHelper>(context, listen: false)
                              .getCountryStatsCases,
                          deaths:
                              Provider.of<HttpHelper>(context, listen: false)
                                  .getCountryStatsDeaths,
                          recovered:
                              Provider.of<HttpHelper>(context, listen: false)
                                  .getCountryStatsRecovered,
                        );
                      },
                      child: const HeaderContanier(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomDropDownMenu(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Cases Update",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "newest update ${DateTime.now().toIso8601String().substring(0, 10)}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.infinity,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Colors.black.withOpacity(
                              0.3,
                            ),
                            width: 1),
                      ),
                      child: const CasesWidgetsRow(),
                    ),
                    //const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () async {
                          await HttpHelper().sendPump();
                        },
                        child: const Center(
                          child: Text("PUMP"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
