import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class TechNewsPage extends StatefulWidget {
  const TechNewsPage({Key? key}) : super(key: key);

  @override
  _TechNewsPageState createState() => _TechNewsPageState();
}

class _TechNewsPageState extends State<TechNewsPage> {
  String? stringResponse;
  Map? mapResponse; // Initialized with null
  bool isLoading = true; // Flag to track loading state

  Future<void> apiCall() async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0402d2bceaae4a798197d42182d7d8ef"));

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body); // Update state with response body
        isLoading = false; // Set loading flag to false
      });
    } else {
      // Handle error (logic not shown here)
    }
  }

  @override
  void initState() {
    super.initState();
    apiCall(); // Call the API call in initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            'TechTrends',
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: isLoading
              ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching
              : mapResponse != null
                  ? PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mapResponse!['articles'].length,
                      itemBuilder: (context, index) {
                        var article = mapResponse!['articles'][index];
                        return Column(
                          children: [
                            Container(
                              height: 200,
                              width: 380,
                              color: Colors.blue,
                              child: Image.network(
                                article['urlToImage'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                article['title'] ?? 'No title available',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                article['description'] ?? 'No description available',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final url = article['url'];
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              
                              child: const Padding(
                                padding:  EdgeInsets.only(top: 40.0),
                                child: Text('Read more',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  : const Center(child: Text('No data available')), // Display message if no data available
        ),
      ),
    );
  }
}
