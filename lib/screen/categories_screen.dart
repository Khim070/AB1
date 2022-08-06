import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test6/model/category.dart';
import 'package:test6/screen/home_screen.dart';
import 'package:test6/service/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _CategoriesNameController = TextEditingController();
  var _CategoriesDescriptinController = TextEditingController();

  var _Category = Category();
  var _CategoryServices = CategoryServices();

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (pragma) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  _Category.name = _CategoriesNameController.text;
                  _Category.description = _CategoriesDescriptinController.text;
                  _CategoryServices.saveCategory(_Category);
                },
                child: Text('Save'),
              )
            ],
            title: Text('Hello Flutter'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _CategoriesNameController,
                    decoration: InputDecoration(
                        hintText: 'Write a Categories',
                        labelText: 'Categories'),
                  ),
                  TextField(
                    controller: _CategoriesDescriptinController,
                    decoration: InputDecoration(
                        hintText: 'Write a discripton',
                        labelText: 'Description'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: RaisedButton(
          elevation: 0.0,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen())),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Colors.blue,
        ),
      ),
      body: Container(
        child: Center(child: Text('Welcome to Categories')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
