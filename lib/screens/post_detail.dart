import 'package:TestApp/data/create_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:TestApp/data/comment.dart';
import 'package:form_field_validator/form_field_validator.dart';

class PostDetailScreen extends StatefulWidget {
  final String title;
  final String body;
  final int postId;
  PostDetailScreen({Key key, this.title, this.body, this.postId})
      : super(key: key);
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  CommentModel _comment;
  Future<CommentModel> createComment(
      String name, String email, String body) async {
    final String apiUrl =
        "https://jsonplaceholder.typicode.com/posts/${widget.postId}/comment";
    final response = await http
        .post(apiUrl, body: {"name": name, "email": email, "body": body});

    if (response.statusCode == 201) {
      final String responseString = response.body;

      return commentModelFromJson(responseString);
    } else {
      return null;
    }
  }

  final myEmailController = TextEditingController();
  final myNameController = TextEditingController();
  final myBodyController = TextEditingController();
  void dispose() {
    myEmailController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState.validate()) {
      print('validated');
    } else {
      print('not vilidated');
    }
  }

  String validateR(value) {
    if (value.isEmpty) {
      return "Required";
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: getComment(widget.postId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data[index].email),
                        subtitle: Text(snapshot.data[index].body),
                      ),
                    ),
                  );
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.cyanAccent,
              context: context,
              builder: (context) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: myEmailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email'),
                              validator: MultiValidator([
                                EmailValidator(
                                    errorText: "Не правильный Email"),
                                RequiredValidator(errorText: "Введите email")
                              ])),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                                controller: myNameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Имя'),
                                validator: RequiredValidator(
                                    errorText: "введите текст")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                                controller: myBodyController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Комментарий'),
                                validator: RequiredValidator(
                                    errorText: "введите текст")),
                          ),
                          _comment == null ? null :
                          Text("The comment user ${_comment.name} is created "),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () async {
                                final String email = myEmailController.text;
                                final String name = myNameController.text;
                                final String body = myBodyController.text;

                                final CommentModel comment =
                                    await createComment(email, name, body);
                                setState(() {
                                  _comment = comment;
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Отправить',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.comment_sharp),
      ),
    );
  }
}
