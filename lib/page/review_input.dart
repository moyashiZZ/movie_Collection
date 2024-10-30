import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_collection/model/review.dart';
import 'package:movie_collection/view_model/review_input_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewInput extends StatefulWidget {
  const ReviewInput({
    super.key,
    required this.movieId,
    this.review,
  });

  final String movieId;
  final Review? review;

  @override
  State<ReviewInput> createState() => _ReviewInputState();
}

class _ReviewInputState extends State<ReviewInput> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _nameController = TextEditingController();
  final _bodyController = TextEditingController();
  final _viewModel = ReviewInputViewModel();
  late final SharedPreferences _prefs;
  var uid = "";

  @override
  void initState() {
    super.initState();
    if (widget.review != null) {
      _titleController.text = widget.review!.title;
      _bodyController.text = widget.review!.text;
    }
  }

  _ReviewInputState() {
    SharedPreferences.getInstance().then((pref) {
      _prefs = pref;
      _viewModel.getUser(uid: _prefs.get("uid").toString()).then((user) {
        uid = user.uid;
        _nameController.text = user.name;
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _nameController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String title = _titleController.text;
      String name = _nameController.text;
      String body = _bodyController.text;
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final review = Review(
        docId: widget.review != null ? widget.review!.docId : "",
        title: title,
        text: body,
        uid: prefs.get("uid").toString(),
        movieId: widget.movieId,
        name: name,
        dateTime: Timestamp.fromDate(
          DateTime.now(),
        ),
      );
      if (widget.review == null) {
        _viewModel.addReview(review: review).then((result) {
          if (result.isNotEmpty) {
            Navigator.pop(context);
          } else {
            print("ERROR");
          }
        });
      } else {
        await _viewModel.setReview(review: review).then((result) {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'タイトル',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => _validateInput(value, "タイトル"),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '名前',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => _validateInput(value, "名前"),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(
                  labelText: '本文',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) => _validateInput(value, "本文"),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('送信'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
