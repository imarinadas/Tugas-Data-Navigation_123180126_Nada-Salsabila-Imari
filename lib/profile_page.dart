import 'package:flutter/material.dart';
import 'package:tugas_data_navigation/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String memberid;
  final String title;
  final String writer;
  final String month;

  const ProfilePage(
      {Key? key,
        required this.memberid,
        required this.title,
        required this.writer,
        required this.month})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Current Reading"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  memberid,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                Text(
                  "Book Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  writer,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  month,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 36,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 18,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                          return LoginPage();
                        }), (route) => false);
                      },
                      child: Text("Logout"),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
