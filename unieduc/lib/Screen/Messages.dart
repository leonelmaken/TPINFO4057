import 'package:flutter/material.dart';
import 'package:unieduc/Screen/Disscuss.dart';

import 'HomePage.dart';
//import 'package:messagerie/messages.dart';

class Messages extends StatefulWidget {
   const Messages({super.key});


  

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {





  
  final GlobalKey accueilKey = GlobalKey();
  final GlobalKey accountKey = GlobalKey();
  final GlobalKey messageKey = GlobalKey();
  final GlobalKey schoolKey = GlobalKey();

  int selectedIndex = 2;

    bool isVisibleNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Container(
                      child: IconButton(
                        key: accueilKey,
                        icon: Icon(
                          Icons.newspaper,
                          size: 25,
                          color: selectedIndex == 1 ? Colors.blue : null,
                        ),
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
                                  color: Colors.red, shape: BoxShape.circle),
                              child: const Center(
                                  child: Text(
                                "15",
                                style: TextStyle(color: Colors.white),
                              )),
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
                      key: accountKey,
                      icon: Icon(
                        Icons.message,
                        size: 25,
                        color: selectedIndex == 2 ? Colors.blue : null,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                          Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>  const Messages(),
                                ));
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
                                  color: Colors.red, shape: BoxShape.circle),
                              child: const Center(
                                  child: Text(
                                "2",
                                style: TextStyle(color: Colors.white),
                              )),
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
                      key: schoolKey,
                      icon: Icon(
                        Icons.notifications,
                        size: 25,
                        color: selectedIndex == 3 ? Colors.blue : null,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 3;
                          isVisibleNotifications = false;
                        });
                      },
                      iconSize: 35,
                    ),
                    Visibility(
                        visible: isVisibleNotifications,
                        child: Column(
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
                                      shape: BoxShape.circle),
                                  child: const Center(
                                      child: Text(
                                    "8",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
                IconButton(
                  key: messageKey,
                  icon: Icon(
                    Icons.school,
                    size: 30,
                    color: selectedIndex == 4 ? Colors.blue : null,
                  ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text("Messages",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              IconButton(onPressed: (){}, icon: Icon(Icons.search))
            ],
          ),
          Expanded(child: 
          ListView.separated(
            itemCount: 30,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const Disscuss(),
                      ));
                },
                child: 
                const ListTile(
                leading: CircleAvatar(
                  //backgroundImage: AssetImage('assets/images/avatar.png'),
                  child: Icon(Icons.person, color: Colors.white, size: 30,),
                ),
                title: Text('Ivana Georgette'),
                subtitle: Text("Bienvenue sur Uy1App "),
                // trailing: Icon(Icons.circle),
              ),
              );
            },
          ),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}