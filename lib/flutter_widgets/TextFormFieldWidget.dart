import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  // final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String currentState = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        // key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              // initialValue: "Hello",
              // obscureText: true,
              // obscuringCharacter: "*",
              // maxLength: 5,
              // maxLines: 5,

              // cursorWidth: 2,
              cursorHeight: 25,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter Your Name",
                alignLabelWithHint: true,
                // icon: Icon(Icons.person),
                suffix: Text("Hii"),
                suffixIcon: Icon(Icons.visibility),
                prefixIcon: Icon(Icons.person, color: Colors.blueGrey),
                filled: true,
                fillColor: Colors.greenAccent.shade100,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 10,
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            TextFormField(
              // controller: _nameController,
              // initialValue: "Hello",
              // autofocus: true,
              // readOnly: true,
              // cursorColor: Colors.red,
              // scrollPhysics: BouncingScrollPhysics(),
              // scrollPadding: EdgeInsets.symmetric(horizontal: 90),
              // enableSuggestions: true,
              autocorrect: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.newline,
              textDirection: TextDirection.rtl,


              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter Your Name",
                icon: Icon(Icons.person),
                border: OutlineInputBorder(),
                helperText: "Hello",
                counterText: "0/10",
                enabled: true,
              ),
              onChanged: (value) {
                setState(() {
                  currentState = value;
                });
                print("currentState: $currentState ");
                print(value);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).nextFocus();
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Name is required";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CompleteFormValidation extends StatefulWidget {
  const CompleteFormValidation({super.key});

  @override
  State<CompleteFormValidation> createState() => _CompleteFormValidationState();
}

class _CompleteFormValidationState extends State<CompleteFormValidation> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _savedName;
  String? _savedPassword;

  bool _isEmailEnabled = true;
  bool _isAbscureChar = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Form Submitted!\nName: $_savedName\nPassword: $_savedPassword",
          ),
        ),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fix the errors before submitting'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Creation"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          canPop: true,
          onPopInvokedWithResult: (didPop, result){
            print("Did Pop: $didPop, Result: $result");
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.done,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1),
                  ),
                  labelText: "Name",
                  hintText: "Enter Your Full Name",
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.blueGrey,
                ),
                // autofocus: true,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  print("Name Changed : ${value.trim()}");
                  _savedName = value;
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name is required";
                  }
                  if (value.trim().length < 3) {
                    return "Name be at least 3 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _isAbscureChar,

                obscuringCharacter: "*",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1),
                  ),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isAbscureChar = !_isAbscureChar;
                      });
                    },
                    icon: Icon(
                      _isAbscureChar ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  prefixIconColor: Colors.blueGrey,
                ),
                // autofocus: true,
                keyboardType: TextInputType.text,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Password can't be Empty!!";
                  }
                  return null;
                },

                onChanged: (value){
                  _savedPassword = value;
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _submitForm, child: Text("Submit")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
