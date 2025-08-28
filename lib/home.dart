import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("SkillMatch AI"),

            //login and signup buttons
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    height: 29,
                    width: 66,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFF0D78F2)),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF0D78F2),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 29,
                  width: 66,
                  decoration: BoxDecoration(
                    color: Color(0xFF0D78F2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Color(0xFFF7FAFC),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 497,
              decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Upload Your Career Potential',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 150, left: 150),
                    child: SizedBox(
                      width: 500,

                      child: Text(
                        'Our AI analysis PDF resume to indentify key skills and match you with the prefect job opportunities. Discover your strenght and find you ideal path',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 34.0),
                    child: Container(
                      width: 180,
                      height: 45,

                      decoration: BoxDecoration(
                        color: Color(0xFF0D78F2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload_outlined, color: Colors.white),
                          Text(
                            'Upload your PDF',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 497,
              color: Color(0xFFF7FAFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'A seamless Process',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "we've simplified the path to your next job in three easy steps",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 35, right: 15, left: 15),
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // light shadow
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                  0,
                                  4,
                                ), // moves the shadow downward
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFE7F2FE),
                                ),
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  color: Color(0xFF167DF2),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Upload your pdf'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Easily upload your resume or any PDF document containg your skills and experience',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 35, right: 15),
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // light shadow
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                  0,
                                  4,
                                ), // moves the shadow downward
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFE7F2FE),
                                ),
                                child: Icon(
                                  Icons.assistant,
                                  color: Color(0xFF167DF2),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Ai Skill Extraction'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Our algorithms your document to identify and extract your key skills and qualifications',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 35, right: 15),
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // light shadow
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                  0,
                                  4,
                                ), // moves the shadow downward
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFE7F2FE),
                                ),
                                child: Icon(
                                  Icons.work,
                                  color: Color(0xFF167DF2),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Job Ranking'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Get matched with opportunity that align with your skills and carrer goals, helping you find the perfect fit',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 300,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    height: 423,
                    decoration: BoxDecoration(
                      color: Color(0xFF1D2734),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ready to find your dream job ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Upload your pdf to get into our company',
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:15.0),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF0D78F2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
