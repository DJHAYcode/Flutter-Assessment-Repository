import 'package:flutter/material.dart';

void main (){
  runApp(AssessmentApp());
}

class AssessmentApp extends StatelessWidget {
  const AssessmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AssessmentScreen(),
    );
  }
}
class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {

  int firstNum = 0;
  bool isLimitReached = false;

void toIncrement(){
  if(firstNum < 10){
    setState(() {
      firstNum++;
    });
  if (firstNum == 10){
    setState(() {
      isLimitReached = true;
    });
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: Text('Limit Reached'),
        content: Text('You\'ve reached the limit!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
 }
}

void resetBacktoFirstNum(){
    setState(() {
        firstNum = 0;
        isLimitReached = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Counter reset'),
      duration: Duration(seconds: 3),
    ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WarmUp', style: TextStyle(
             fontSize: 22,
             color: Colors.white,   
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.yellow.shade300,
                  child: Center(
                    child: Text(firstNum.toString(), style: TextStyle(
                      fontSize: 30,
               ),
              ),
             ),
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    isLimitReached ? null : toIncrement();
                  }, 
                  child: Text('+1'),
                ),
                SizedBox(width: 6),
                ElevatedButton(
                  onPressed: (){
                    resetBacktoFirstNum();
                  }, 
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}