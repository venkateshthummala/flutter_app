import 'package:flutter/material.dart';
import '../models/form_model.dart';
import '../services/local_storage.dart';

class FormScreen extends StatefulWidget {
  final FormModel formModel;
  FormScreen(this.formModel);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> formResponses = {};
  bool _isSaving = false; //Prevent multiple saves

  void _saveForm() async {
    if (_isSaving) return; // Stop multiple saves
    _isSaving = true;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await LocalStorageService.saveFormData(formResponses); //  Save only once
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Data saved successfully!")));
    }

    _isSaving = false; //  Allow next save
  }

  Widget _buildInputField(Question question) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: question.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0), // Square Shape
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.grey, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: question.answerType == "NUMBER"
            ? TextInputType.phone
            : TextInputType.text,
        validator: (value) {
          if (question.isMandatoryField && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          if (question.reValidation != null) {
            RegExp regex = RegExp(question.reValidation!);
            if (!regex.hasMatch(value!)) {
              return 'Invalid input';
            }
          }
          return null;
        },
        onSaved: (value) {
          formResponses[question.question] = value!;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.formModel.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ...widget.formModel.questions.map(_buildInputField).toList(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
