import 'package:dealdox_integrated/common/widgets/Registration.dart';
import 'package:dealdox_integrated/common/widgets/welcome_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> with TickerProviderStateMixin{

  List<String> carousal_images=[
    'assets/images/carousal1.png',
    'assets/images/carousal2.png',
    'assets/images/carousal3.png'
  ];

  List<String> dialogues = [
    '   Spend less time\n on quotations,sell\n             more!',
    '  DealDox keeps you\n updated on per-sales\n          activities!',
    '          Track the\n productivity levels of\n      your sales team',
  ];

  int currentindex=0;

  // final color=[
  //   Colors.red,
  //   Colors.amber,
  //   Colors.teal,
  //   Colors.blueGrey,
  //   Colors.blue,
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: SingleChildScrollView(

          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 30.0,),

              Container(
                // decoration: BoxDecoration(color: Colors.redAccent),
                child: SizedBox(height: 400,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount:carousal_images.length,
                    // pageSnapping: false,
                    physics: const BouncingScrollPhysics(),
                    controller:PageController(initialPage: 0,),

                    onPageChanged: (value){

                      setState(() {
                        currentindex=value;
                      });
                    },

                    itemBuilder: (context,index){
                  return Container(
                    width: double.infinity,

                    // color: color[index],
                    alignment: Alignment.center,
                    child: Image.asset(carousal_images[index],
                      width: 400,
                      height: 400,
                      fit: BoxFit.fill,
                    ),

                  );
                }),
                ),
              ),

              const SizedBox(height: 30,),

              Positioned(
                bottom: 20.0,
                child: Text(
                  dialogues[currentindex],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              const SizedBox(height: 30,),

              TabPageSelector(
                controller: TabController(length: carousal_images.length,vsync: this,
                  initialIndex:currentindex ,
                ),
                selectedColor: Colors.black54,
                color: Colors.black12,

              ),
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(5),
                    gradient: LinearGradient(colors:
                    [
                      Color.fromRGBO(113, 92, 243, 1),
                      Color.fromRGBO(109, 106, 243, 1),
                      Color.fromRGBO(97, 138, 243, 1),
                      Color.fromRGBO(94, 149, 243, 1)
                    ]
                    )
                  ),
                  child: MaterialButton(
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)) ,
                    minWidth: double.infinity,
                    height: 60,
                    //minWidth: 150,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()),);     //here the navigation bar from OPENING
                    },
                    child: Text('Create an account',style: TextStyle(color: Colors.white,fontSize:22),),
                    ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(

                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)) ,
                  minWidth: double.infinity,
                  height: 60,
                  //minWidth: 150,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeBack()),);     //here the navigation bar from
                  },
                  child: Text('Sign in',style: TextStyle(color:Colors.black,fontSize:22),),
                  ),
              ),
            ],
          ),
        ),
      ),


    );
}
}


