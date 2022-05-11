
import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Insurence/uploadCarImagesDetails.dart';
import 'package:sizer/sizer.dart';

import '../Const/colors.dart';
import '../Const/images.dart';
class DueckInsuranceCompanyScreen extends StatefulWidget {
  DueckInsuranceCompanyScreen({Key? key}) : super(key: key);

  @override
  State<DueckInsuranceCompanyScreen> createState() => _DueckInsuranceCompanyScreenState();
}
 bool? isAdd=false;

class _DueckInsuranceCompanyScreenState extends State<DueckInsuranceCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )
            ),
            height: 40.h,
            width: 100.w,
            child: Image.asset(background1,fit:BoxFit.cover, colorBlendMode: BlendMode.darken,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.h),
            child: Container(
              height: 73.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.grey[200]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                    padding: EdgeInsets.only(top: 2.h,left: 3.w,right: 3.w),
                   child: Text("Lorem Ipsum is simply dummy text of the printing \nand typesetting industry. Lorem Ipsum has been \nthe industry's standard dummy text ever since the \n1500s, when an unknown printer took a galley\nof. ",
                   style: TextStyle(
                     fontSize: 12.sp,
                     color: kPrimaryGrey
                   ),
                   ),
                 ),
                 SizedBox(height: 3.h,),
                 Padding(
                   padding: EdgeInsets.only(left: 3.w,right: 3.w),
                   child: Text('Services',style: TextStyle(
                     fontSize: 14.sp,
                     color: Colors.black,
                     fontWeight: FontWeight.bold
                   ),),
                 ),
                 SizedBox(height: 2.h,),
                 Padding(
                    padding: EdgeInsets.only(left: 3.w,right: 3.w),
                   child: ExpansionTile(
                     title: Text('Comprehensive Insurance'),
                     
                   ),
                   
                
                 ),
                 SizedBox(height: 26.h,),
                 Container(
                   height: 10.h,
                   width: 100.w,
                   color: kPrimaryWhite,
                   child: Padding(
                     padding:  EdgeInsets.only(top: 2.h,right: 3.w,left: 3.w),
                     child: Row( 
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         InkWell(
                           onTap: (){
                              _paymentsummryModalBottomSheet(context);
                           },
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Total',style: TextStyle(
                                 fontSize: 12.sp,
                                 color: kPrimaryGrey
                               ),),
                                Row(
                                  children: [
                                    Text('120 KWD',style: TextStyle(
                                     fontSize: 14.sp,
                                     color: kPrimaryGrey,
                                     fontWeight: FontWeight.bold
                               ),),
                               SizedBox(width: 3.w,),
                               Icon(Icons.keyboard_arrow_up)
                                  ],
                                ),
                             ],
                           ),
                         ),
                         Spacer(),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>UploadCarImagesDetails()));
                            },
                            child: Container(
                              height: 4.5.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                     kprimegradient,
                                      kPrimaryOrange
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  ),
                              child: Center(
                                child: Text('Continue',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryWhite,
                                  
                                  ),
                                ),
                              ),
                            ),
                          )
                       ]),
                   ),
                 )
                  ]
                ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h,left: 3.w,right: 3.w),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios,color: kPrimaryWhite,),
                Spacer(),
                Image.asset(heratsimg),
              ],
            )),
            Container(
              // alignment: Alignment.center,
              margin: EdgeInsets.only(top: 14.h,left: 40.w),
              child: CircleAvatar(
                radius: 4.h,
                backgroundImage: AssetImage(image1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h,left: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("t'azur",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryWhite
                  ),),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Image.asset(ratingstarimg,height: 2.h,color: Colors.amber,),
                      SizedBox(width: 2.w,),
                        Text('4.5 - 254 Reviews',style: TextStyle(
                      fontSize: 10.sp,
                      color: kPrimaryWhite
                    ),)
                    ],),
                
                ],
              ),
            )
      
      ]),
    );
  }
   void _paymentsummryModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * .4,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                       padding: EdgeInsets.only(left: 3.w,top: 2.h,right: 6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                          children: [
                            Text('Payment Summary',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.keyboard_arrow_down,color: kPrimaryGrey,))
                          ],
                        ), 
                        SizedBox(height: 2.h,),
                          Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Comprehensive Insurance',style: TextStyle(
                                     fontSize: 12.sp,
                                   ),),
                                   Spacer(),
                                   Text('120.0 KWD',style: TextStyle(
                                     fontSize: 12.sp,
                                   ),),                                              
                                 ],),
                                 SizedBox(height: 4.h,),
                                    Text('Add on',style: TextStyle(
                                      fontSize: 12.sp,
                                      color: kPrimaryGrey
                                    ),), 
                                    SizedBox(height:4.h),             
                                    Row(
                          children: [
                            Text('Payable Amount',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),),
                            Spacer(),
                            Text('120.0 KWD',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ), 
                        SizedBox(height: 4.h,),
                      Container(
                       height: 10.h,
                       width: 100.w,
                      
                       child: Padding(
                         padding:  EdgeInsets.only(top: 2.h,right: 3.w,left: 3.w),
                         child: Row( 
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('Total',style: TextStyle(
                                   fontSize: 12.sp,
                                   color: kPrimaryGrey
                                 ),),
                                 SizedBox(height: 1.h,),
                                  Text('120.0 KWD',style: TextStyle(
                                   fontSize: 12.sp,
                                   color: kPrimaryGrey,
                                   fontWeight: FontWeight.bold
                                 ),),
                               ],
                             ),
                             Spacer(),
                              InkWell(
                                onTap: (){
                                   
                                },
                                child: Container(
                                  height: 4.5.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                         kprimegradient,
                                          kPrimaryOrange
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      ),
                                  child: Center(
                                    child: Text('Check Out',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: kPrimaryWhite,
                                      
                                      ),
                                    ),
                                  ),
                                ),
                              )
                           ]),
                       ),
                   )
                                    
                                    ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}