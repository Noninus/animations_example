import 'package:animations_example/app/modules/animation/animated_page/components/easing_widget.dart';
import 'package:animations_example/app/modules/animation/restaurante/restaurante_card_extent.dart';
import 'package:animations_example/app/modules/animation/restaurante/testChanger.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class RestaurantePage extends StatefulWidget {
  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 10, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Color(0xFFFF6700), boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ]),
                height: height * 0.2,
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.125),
                child: Center(
                  child: Container(
                    width: width * 0.9,
                    child: EasingAnimationWidget(
                      child: Card(
                          elevation: 10,
                          child: Column(children: <Widget>[
                            ListTile(
                              title: Text(
                                'Donatello Pizzaria',
                                style: TextStyle(fontSize: 24),
                              ),
                              subtitle: Text(
                                'Aberto até as 23:59',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Divider(
                              indent: 10,
                              endIndent: 10,
                              color: Color(0xFFeaeaea),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.timer),
                                        Text('20min')
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.monetization_on),
                                        Text('R\$5,00')
                                      ],
                                    )
                                  ]),
                            ),
                            RestauranteCardExtended(
                              begin: 30,
                              end: 100,
                            )
                          ])),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: EasingAnimationWidget(
                  begin: -1,
                  duration: Duration(seconds: 1),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Promoções",
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        " 3",
                        style:
                            TextStyle(fontSize: 32, color: Color(0xFFACACAC)),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            height: height * 0.25,
            child: EasingAnimationWidget(
              begin: 1,
              duration: Duration(seconds: 2),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(16),
                              width: width * 0.7,
                              color: Colors.red),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Pizza de calabresa"),
                              Text("R\$ 32,90")
                            ])
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(16),
                              width: width * 0.7,
                              color: Colors.green),
                        ),
                        Column(children: <Widget>[
                          Text("Calzones"),
                          Text("A partir de R\$ 19,90")
                        ])
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(16),
                              width: width * 0.7,
                              color: Colors.yellow),
                        ),
                        Column(children: <Widget>[
                          Text("Saladas"),
                          Text("R\$ 9,90")
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          StickyHeader(
            callback: (a) => print(a),
            header: Container(
              color: Colors.white,
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: Color(0xFFFF6700),
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                    Tab(text: 'Teste'),
                  ],
                  controller: tabController),
            ),
            content: Column(
              children: <Widget>[
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
                TesterChanger(
                  tab: tabController,
                ),
                ListTile(
                  title: Text('a'),
                  subtitle: Text('a'),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
