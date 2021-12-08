import 'package:flutter/material.dart';
import 'package:netdemo_task1/model/post_model.dart';
import 'package:netdemo_task1/services/http_service.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;

  void _apiPostList1() {
    Network.GET(Network.API_LIST1, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _apiPostList2() {
    Network.GET(Network.API_LIST2, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _apiCreatePost(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiUpdatePost(Post post) {
    Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiDeletePost(Post post) {
    Network.DEL(Network.API_DELETE, Network.paramsEmpty())
        .then((response) => {print(response), _showResponse(response!)});
  }

  // Ekranga chiqarish Funksiya
  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _apiPostList1();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Net Demo Task-1"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Text(data != null ? data : "No data"),
            ),
          ),
        ),
      ),
    );
  }
}
