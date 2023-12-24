import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/Inscription.dart';
import 'package:unieduc/Screen/Login.dart';
import 'package:unieduc/Screen/Preinscription.dart';
import 'package:unieduc/Utils/Global.dart';
import 'package:unieduc/Utils/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLiked = false;
  int nbLike = 100;
  int selectedIndex = 1;

  bool isVisibleNotifications=true;

  

   colorDrawer(int index){

    setState(() {
       selected_drawer=index;
    });
   
   }

  final GlobalKey accueilKey = GlobalKey();
  final GlobalKey accountKey = GlobalKey();
  final GlobalKey messageKey = GlobalKey();
  final GlobalKey schoolKey = GlobalKey();

   final String salutation = DateTime.now().hour < 12 ? "Bonjour" : "Bonsoir";

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration:  const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        PRIMARY_COLOR,
                        Color.fromARGB(255, 38, 83, 129)
                      ]),
                  // color: Colors.blue,
                ),
                child: Center(
                    child: Column(children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.person,
                      size: 75,
                      color: Color.fromARGB(255, 77, 76, 76),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("$salutation Giresse",
                      style: const TextStyle(color: Colors.white, fontSize: 20))
                ])),
              ),
              Container(
                decoration: BoxDecoration(color: selected_drawer==1?const Color.fromARGB(255, 229, 242, 248):null),
                child: ListTile(
                  leading: const Icon(Icons.account_box),
                  title: const Text('Creer un compte',
                      style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                  onTap: () async{
                    await colorDrawer(1);
                     Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const CreateAccount(),
                      ));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(color: selected_drawer==11?const Color.fromARGB(255, 229, 242, 248):null),
                child: ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Se connecter',
                      style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                  onTap: () async{
                    await colorDrawer(11);
                     Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const Login(),
                      ));
                  },
                ),
              ),
              const Divider(height: 40),
              Container(
                decoration: BoxDecoration(color: selected_drawer==2?const Color.fromARGB(255, 229, 242, 248):null),
                child: ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Accueil',
                    style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                onTap: () async{

                  await colorDrawer(2);
                  
                    
                  
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const HomePage(),
                      ));
                  
                  
                },
              ),
              ),
              
              Container(
                decoration: BoxDecoration(color: selected_drawer==3?const Color.fromARGB(255, 229, 242, 248):null),
                child: ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text("S'inscrire a l'universite",
                      style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                  onTap: () async{
                    await colorDrawer(3);
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => Inscription(),
                        ));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(color: selected_drawer==4?const Color.fromARGB(255, 229, 242, 248):null),
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Parametres",
                      style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                  onTap: () async{

                   await colorDrawer(4);
                    
                  },
                ),
              ),
              const Divider(height: 40),
              Container(
                decoration: BoxDecoration(color: selected_drawer==5?const Color.fromARGB(255, 229, 242, 248):null),
                child: ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text("Partager l'Application",
                      style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                  onTap: ()async {
                    await colorDrawer(5);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(color: selected_drawer==6?const Color.fromARGB(255, 229, 242, 248):null),
                child: ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('A propos',
                      style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                  onTap: () async{
                    await colorDrawer(6);
                  },
                ),
              ),
              const Divider(height: 40),

              Container(
                decoration: BoxDecoration(color: selected_drawer==7?const Color.fromARGB(255, 229, 242, 248):null),
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Deconnexion',
                      style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                  onTap: () {
                    
                  },
                ),
              ),
              // Ajoutez d'autres éléments de menu ici
            ],
          ),
        ),
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('UY1App'),
        
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient:LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        PRIMARY_COLOR,
                        Color.fromARGB(255, 38, 83, 129)
                      ]),
          ),
        ),
        elevation: 4,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Stack(children: [
                    Container(
                
                child: IconButton(
                  key: accueilKey,
                  icon:  Icon(Icons.newspaper,size: 25,
                  color: selectedIndex==1?Colors.blue:null,),
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const HomePage(),
                      ));
                    });
                  },
                  iconSize: 35,
                ),
              ),
              Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 30),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle
                                ),
                                child: const Center(child: Text("15",style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          )
                        ],
                      )

               ],), 

               Stack(
                children: [
                   IconButton(
                key: accountKey,
                icon:  Icon(Icons.message,size: 25,
                color: selectedIndex==2?Colors.blue:null,
                ),
                onPressed: () {
                   setState(() {
                    selectedIndex = 2;
                  });
                },
                iconSize: 35,
              ),
                    Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 30),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle
                                ),
                                child: const Center(child: Text("2",style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          )
                        ],
                      )
                ],
               ),
               Stack(
                children: [
                  IconButton(
                key:schoolKey,
                icon:  Icon(Icons.notifications,size: 25,
                color: selectedIndex==3?Colors.blue:null,),
                onPressed: () {
                   setState(() {
                    selectedIndex = 3;
                    isVisibleNotifications=false;
                  });
                },
                iconSize: 35,
              ),
              Visibility(
                visible: isVisibleNotifications,
                child: 
                    Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 25),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle
                                ),
                                child: const Center(child: Text("8",style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          )
                        ],
                      ))
                ],
               ),
               
              
             
              
              IconButton(
                key: messageKey,
                icon:  Icon(Icons.school,size: 30,
                color: selectedIndex==4?Colors.blue:null,),
                onPressed: () {
                   setState(() {
                    selectedIndex = 4;
                  });
                },
                iconSize: 35,
              ),
            ],
          ),
          
          ),
         
          
          Expanded(
            flex:2,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>index==0?

                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        const SizedBox(width: 5,),
                        const Icon(Icons.account_circle_rounded,color: Colors.grey,size:30),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.grey,
                        //     //image: DecorationImage(image: image)
                        //   ),
                        //   width: 30,
                        //   height: 30,
                        //   child: Image.asset("assets/images/fc7ea768-how-to-reduce-the-waiting-time-in-your-restaurant-fr.png",width: double.maxFinite,height: double.maxFinite,),
                        // ),
                        // CircleAvatar(
                        //   child: Image.asset("assets/images/159911965-icône-de-l-homme-sans-emploi-déprimé-style-cartoon.jpg",fit: BoxFit.fill,),
                        // ),
                        Expanded(
                          flex: 2,
                          child: 
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 249, 248, 248),
                            border: Border.all(color:const Color.fromARGB(255, 249, 248, 248),),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child:Container(
                            margin: const EdgeInsets.only(left: 20,top: 4),
                            child: const Text("A quoi pensez-vous?")),
                        ))
                      ],
                    ),
                  )
                  
                  : Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.grey),
                        // margin: EdgeInsets.all(6),
                        child: Card(
                          elevation: 0,
                          child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(children: [
                                const SizedBox(
                                  height: 5,
                                ),

                               
                                 const ListTile(
                                  leading: Icon(
                                    Icons.account_circle_rounded,
                                    size: 45,
                                  ),
                                  title: Text("Adamou"),
                                  subtitle: Text(
                                    "il y'a 2 min",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 9),
                                  ),
                                  //trailing: IconButton(onPressed: (){}, icon: Icon(Icons.pool_sharp)),
                                ),
                                Visibility(
                                  visible: true,
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                  child: const Text("Le travail est très important, cela éloigne de nous trois grands maux: L'ennuis, le vice et le besoin",style: TextStyle(color: Colors.black,fontSize: 12),),
                                )),
                                Visibility(
                                  visible: true,
                                  
                                  child: 
                                
                                Container(
                                  child: Image.asset("assets/images/fc7ea768-how-to-reduce-the-waiting-time-in-your-restaurant-fr.png",width: double.infinity,),
                                )),

                                const SizedBox(
                                  height: 5,
                                ),



                               
                                Container(
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    //color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children:  [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isLiked = !isLiked;
                                            if (isLiked) {
                                              nbLike =nbLike + 1;
                                            } else {
                                              nbLike =nbLike - 1;
                                            }
                                          });
                                        },
                                        child:
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color:isLiked?const Color.fromARGB(255, 234, 205, 204): const Color.fromARGB(255, 240, 239, 239),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:  [
                                            Icon(isLiked?Icons.favorite:
                                          Icons.favorite_border_outlined,
                                          color: isLiked?Colors.red:null,),
                                         const SizedBox(width: 5,),
                                          Text("$nbLike ")
                                          
                                          ],
                                        ),
                                      )),
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 240, 239, 239),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                          Icons.comment),
                                         SizedBox(width: 5,),
                                          Text("20 ")
                                          
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 240, 239, 239),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                          Icons.share),
                                         SizedBox(width: 5,),
                                          Text("2 ")
                                          
                                          ],
                                        ),
                                      )
                                      
                                     
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                              ])),
                        ),
                      )))),
                      const SizedBox(),
        ],
      ),
    );
  }
}
