import 'package:animations_example/app/modules/animation/animated_page/components/easing_widget.dart';
import 'package:animations_example/app/modules/animation/restaurante/restaurante_card_extent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class RestaurantePage extends StatefulWidget {
  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  StickyHeaderController controller;
  ScrollController scrollController;
  bool isAppBarVisibile = false;
  List<GlobalKey> listKeys = List();

  double currentOffset = 0.0;
  bool changingTabBar = false;

  listarCardapio() sync* {
    listKeys = List();
    for (int i = 0; i < 3; i++) {
      yield retornarGrupos(i, GlobalKey());
    }
  }

  Widget retornarGrupos(int grupoId, GlobalKey key) {
    listKeys.add(key);
    return _StickyHeaderList(key: key, index: grupoId, controller: controller);
  }

  @override
  void initState() {
    scrollController = ScrollController();
    tabController = TabController(length: 3, vsync: this);
    controller = StickyHeaderController();

    controller.addListener(() {
      if (!changingTabBar) {
        if (currentOffset > controller.stickyHeaderScrollOffset) {
          if (tabController.index >= 0 &&
              (tabController.index - 1 < tabController.length)) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              tabController.animateTo(tabController.index - 1);
            });
          }
        } else {
          if (currentOffset != 0.0 &&
              tabController.index >= 0 &&
              (tabController.index + 1 < tabController.length)) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              tabController.animateTo(tabController.index + 1);
            });
          }
        }
      }
      currentOffset = controller.stickyHeaderScrollOffset;
    });

    scrollController.addListener(() {
      if (scrollController.offset > 300) {
        if (!isAppBarVisibile) {
          setState(() {
            isAppBarVisibile = true;
          });
        }
      } else {
        if (isAppBarVisibile) {
          setState(() {
            isAppBarVisibile = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          isAppBarVisibile
              ? SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  pinned: true,
                  leading: BackButton(color: Color(0xFFFF6700)),
                  title: Column(
                    children: <Widget>[
                      Text(
                        "Pizzaria Donatello",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Entrega em 40min',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFFF6700)),
                      )
                    ],
                  ),
                  actions: <Widget>[Icon(Icons.search)],
                  bottom: TabBar(
                    onTap: (id) {
                      changingTabBar = true;
                      Scrollable.ensureVisible(listKeys[id].currentContext,
                              duration: Duration(seconds: 1))
                          .then((value) => changingTabBar = false);
                    },
                    controller: tabController,
                    isScrollable: true,
                    labelColor: Color(0xFFFF6700),
                    labelStyle: TextStyle(fontSize: 20),
                    indicatorColor: Color(0xFFFF6700),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Pizzas'),
                      Tab(text: 'Lanches'),
                      Tab(text: 'Bebidas'),
                    ],
                  ),
                )
              : SliverToBoxAdapter(child: Container()),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: <Widget>[
                    Container(
                      decoration:
                          BoxDecoration(color: Color(0xFFFF6700), boxShadow: [
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
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
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
                              style: TextStyle(
                                  fontSize: 32, color: Color(0xFFACACAC)),
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
              ],
            ),
          ),
          ...listarCardapio()
        ],
      ),
    );
  }
}

class ProdutoCard extends StatelessWidget {
  const ProdutoCard({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$title"),
    );
  }
}

class _StickyHeaderList extends StatefulWidget {
  const _StickyHeaderList({
    Key key,
    this.index,
    this.controller,
  }) : super(key: key);

  final int index;
  final StickyHeaderController controller;

  @override
  __StickyHeaderListState createState() => __StickyHeaderListState();
}

class __StickyHeaderListState extends State<_StickyHeaderList> {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      controller: widget.controller,
      header: Header(index: widget.index, color: Colors.white),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ProdutoCard(title: "$widget.index"),
          childCount: 20,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    this.index,
    this.title,
    this.color = Colors.lightBlue,
  }) : super(key: key);

  final String title;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: color,
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title ?? 'Header #$index',
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
