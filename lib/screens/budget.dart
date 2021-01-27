import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart';
import 'package:pokket_final/screens/addTransaction.dart';
class BudgetPage extends StatefulWidget {

  @override
  _BudgetPageState createState() => _BudgetPageState();
}


class _BudgetPageState extends State<BudgetPage> {
  @override

  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 10));
  }


  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;

  // final _defaultTimeRange = TimeRangeResult(
  //   TimeOfDay(hour: 14, minute: 50),
  //   TimeOfDay(hour: 15, minute: 20),
  // );
  // TimeRangeResult _timeRange;

  // @override
  // void initState1() {
  //   super.initState();
  //   _timeRange = _defaultTimeRange;
  // }

  void popup(BuildContext context){
    var alertDialog = AlertDialog(
      title: Center(child: Text("Transacion added successfully!")),
    ) ;
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
    );
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xfaf16e7e),
          bottom:TabBar(
            tabs:[
               Tab(icon: Icon(Icons.account_balance_wallet)),
              Tab(icon: Icon(Icons.calendar_today_rounded, )),
              Tab(icon: Icon(Icons.history)),
              // Tab(icon: Icon(Icons.add_circle_outline)),
              // Tab(icon: Icon(Icons.receipt_outlined),)
            ]
          ),
        ),
  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 3,
  //     child: Scaffold(


  


  //       backgroundColor: Colors.white,
  //       appBar: AppBar(
  //         backgroundColor: Color(0xfaf16e7e) ,
  //         bottom: TabBar(
  //           tabs: [
  //             Tab(icon: Icon(Icons.account_balance_wallet)),
  //             Tab(icon: Icon(Icons.calendar_today_rounded, )),
  //             Tab(icon: Icon(Icons.history)),
  //           ],
  //         ),
        
        
        body:

        TabBarView(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.355, 0.694, 0.864, 1.0],
                            colors: <Color> [
                              const Color(0xff3d4a62),
                              const Color(0xff695369),
                              const Color(0xffa86073),
                              const Color(0xffd16879),
                              const Color(0xfaf16e7e)
                            ],
                            )
                    ),
                    height: 200,
                    width: 400,
                    child: Row(
                      children:  <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('YOUR CURRENT BALANCE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text('Rs 90.0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text('Tap here to set a monthly budget and \n manage your expenses efficiently.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),

                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18.0,10.0,8.0,80.0),
                              child: IconButton(
                                icon: Icon(Icons.category,
                                size: 100.0,
                                ),
                                onPressed: (){
                                  print("icon pressed....");
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Image.asset('images/undraw_pink.png',
                      height: 300.0,
                    width: 350.0,
                  ),
                ),
                
                
              ]
            ),






            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:5, left:16),
                      child: Text(
                        'Calendar Timeline',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.teal),
                      ),
                    ),
                    CalendarTimeline(
                      showYears: true,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                      leftMargin: 20,
                      monthColor: Colors.black,
                      dayColor: Colors.teal[200],
                      dayNameColor: Color(0xFF333A47),
                      activeDayColor: Colors.black,
                      activeBackgroundDayColor: Colors.redAccent[100],
                      dotsColor: Color(0xFF333A47),
                      //selectableDayPredicate: (date) => date.day != 23,
                      locale: 'en',
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: FlatButton(
                        color: Colors.teal[200],
                        child: Text(
                            'RESET', style: TextStyle(color: Color(0xFF333A47))),
                         onPressed: () => setState(() => _resetSelectedDate()),
                       ),
                    ),
                    SizedBox(height: 5),
                    Center(child: Text('Selected date is $_selectedDate',
                        style: TextStyle(color: Colors.white))),
                    SizedBox(height: 5),

                  ],
                ),

                //TIME PICKER
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Padding(
                //       padding: const EdgeInsets.only(left: 10.0, top: 2),
                //       // child: Text(
                //       //   'Opening Times',
                //       //   style: Theme.of(context)
                //       //       .textTheme
                //       //       .headline6
                //       //       .copyWith(fontWeight: FontWeight.bold, color: dark),
                //       // ),
                //     ),
                //     SizedBox(height: 10),
                //     TimeRange(
                //       fromTitle: Text(
                //         'FROM',
                //         style: TextStyle(
                //           fontSize: 14,
                //           color: dark,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //       toTitle: Text(
                //         'TO',
                //         style: TextStyle(
                //           fontSize: 14,
                //           color: dark,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //       titlePadding: leftPadding,
                //       textStyle: TextStyle(
                //         fontWeight: FontWeight.normal,
                //         color: dark,
                //       ),
                //       activeTextStyle: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         color: orange,
                //       ),
                //       borderColor: dark,
                //       activeBorderColor: dark,
                //       backgroundColor: Colors.transparent,
                //       activeBackgroundColor: dark,
                //       firstTime: TimeOfDay(hour: 8, minute: 00),
                //       lastTime: TimeOfDay(hour: 20, minute: 00),
                //       initialRange: _timeRange,
                //       timeStep: 10,
                //       timeBlock: 30,
                //       onRangeCompleted: (range) => setState(() => _timeRange = range),
                //     ),
                //     SizedBox(height: 10),
                //     if (_timeRange != null)
                //       Padding(
                //         padding: const EdgeInsets.only(top: 8.0, left: leftPadding),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Text(
                //               'Selected Range: ${_timeRange.start.format(context)} - ${_timeRange.end.format(context)}',
                //               style: TextStyle(fontSize: 20, color: dark),
                //             ),
                //             SizedBox(height: 20),
                //             // MaterialButton(
                //             //   child: Text('Default'),
                //             //   onPressed: () =>
                //             //       setState(() => _timeRange = _defaultTimeRange),
                //             //   color: orange,
                //             // )
                //           ],
                //         ),
                //       ),
                //   ],
                // ),


                //SUBMIT BUTTON


                RaisedButton(onPressed: (){
                  // popup(context);
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Addtransaction(_selectedDate)),
                      );
                },
                    color: Colors.redAccent[100],
                    elevation: 5,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'SUBMIT'
                    ))
              ],
            ),




          



              Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.355, 0.864, 1.0],
                            colors: <Color> [
                              const Color(0xff3d4a62),
                              const Color(0xff695369),
                              // const Color(0xffa86073),
                              const Color(0xffd16879),
                              const Color(0xfaf16e7e)
                            ],
                            )
                    ),
                    height: 80,
                    width: 400,
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.355, 0.864, 1.0],
                            colors: <Color> [
                              const Color(0xff3d4a62),
                              const Color(0xff695369),
                              // const Color(0xffa86073),
                              const Color(0xffd16879),
                              const Color(0xfaf16e7e)
                            ],
                            )
                    ),
                    height: 80,
                    width: 400,
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.355, 0.864, 1.0],
                            colors: <Color> [
                              const Color(0xff3d4a62),
                              const Color(0xff695369),
                              // const Color(0xffa86073),
                              const Color(0xffd16879),
                              const Color(0xfaf16e7e)
                            ],
                            )
                    ),
                    height: 80,
                    width: 400,
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.355, 0.864, 1.0],
                            colors: <Color> [
                              const Color(0xff3d4a62),
                              const Color(0xff695369),
                              // const Color(0xffa86073),
                              const Color(0xffd16879),
                              const Color(0xfaf16e7e)
                            ],
                            )
                    ),
                    height: 80,
                    width: 400,
                    
                  ),
                ),
                
                
              ]
            ),
            
          
          ],
        ),
    

    ),
    );
  }
}