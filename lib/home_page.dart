import 'package:flutter/material.dart';
import 'package:tugas_data_navigation/profile_page.dart';

class HomePage extends StatefulWidget {
  final String memberid;

  const HomePage({Key? key, required this.memberid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _title = "";
  String _writer ="";
  String _month = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          children: [
            Text(
              "Hi, ${widget.memberid}!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 24,),
            Text("Input Current Reading"),
            SizedBox(height: 12,),
            _buildForm(),
            SizedBox(height: 24,),
            _buildSubmitButton()
          ],
        ),
      ),
    );
  }

  Widget _formnput(
      {required String hint,
        required String label,
        required Function(String value) setStateInput,
        int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm(){
    return Column(
      children: [
        SizedBox(height: 12),
        _formnput(hint: "Insert Book Title", label: "Title *", setStateInput: (value){
          _title = value;
        }),
        SizedBox(height: 12),
        _formnput(hint: "Insert Book Writer", label: "Writer *", setStateInput: (value){
          _writer = value;
        }),
        SizedBox(height: 12),
        _formnput(hint: "Insert Month", label: "Month *", setStateInput: (value){
          _month = value;
        })
      ],
    );
  }

  Widget _buildSubmitButton(){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          if(_title == "" || _writer == "" || _month == ""){
            SnackBar snackBar = SnackBar(content: Text("* Please enter a value !"),);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ProfilePage(
                memberid: widget.memberid,
                title: _title,
                writer: _writer,
                month: _month,
              );
            }));
          }
        },
        child: Text('Submit'),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: TextStyle(fontSize: 16)
        ),
      ),
    );
  }
}
