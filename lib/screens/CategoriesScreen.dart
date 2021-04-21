import 'package:flutter/material.dart';
import 'package:todoapp_flutter/models/category.dart';
import 'package:todoapp_flutter/screens/homeScreen.dart';
import 'package:todoapp_flutter/services/categoryService.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  List<Category> _categoryList = List<Category>();

  // @override
  // void initState() {
  //   super.initState();
  //   getAllCategories();
  // }

  getAllCategories() async {
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      var categoryModel = Category();
      categoryModel.id = category['id'];
      categoryModel.description = category['description'];
      categoryModel.name = category['name'];
      _categoryList.add(categoryModel);
    });
  }

  _showFormDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          title: Text('Categories Form'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _categoryDescriptionController,
                  decoration: InputDecoration(
                    hintText: 'Enter Category',
                    labelText: 'Category',
                    // fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  ),
                ),
                TextField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Description',
                    labelText: 'Description',
                    // fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(param).pop(); // Dismiss alert dialog
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;
                // _category.id = 1;
                var result = await _categoryService.saveCategory(_category);
                print(result);
                Navigator.of(param).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Icon(Icons.arrow_back),
          style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
        ),
        title: Text('Categories'),
      ),
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                title: Row(
                  children: <Widget>[
                    Text(_categoryList[index].name),
                    IconButton(
                      onPressed: () {},
                      color: Colors.red,
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
