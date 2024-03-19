import 'package:asmr_application/models/books.dart';
import 'package:flutter/material.dart';
import '../data.dart';
import 'audio_page.dart';
import 'tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
 @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 22, right: 22),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 40,
                    ),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(Icons.notifications)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 22, right: 22),
                      child: const Text('Popular Books :',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))),
                ],
              ),
              SizedBox(
                height: 180,
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.9),
                    itemCount: popularbookslist.length,
                    itemBuilder: (context, index) {
                      Books book = bookslist[index];
                      return InkWell(
                        onTap:(){
                            Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AudioPage(
                                                book: book,
                                               )));
                        },
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                          AssetImage(popularbookslist[index].img))),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder: (BuildContext context, bool isScroll) {
                      return [
                        SliverAppBar(
                            pinned: true,
                            bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(40),
                              child: Container(
                                  margin: const EdgeInsets.all(8),
                                  child: TabBar(
                                    indicatorPadding: const EdgeInsets.all(0),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    labelPadding: const EdgeInsets.all(0),
                                    controller: _tabController,
                                    isScrollable: true,
                                    tabAlignment: TabAlignment.center,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 8,
                                            offset: const Offset(0, 8)),
                                      ],
                                    ),
                                    tabs: const [
                                      LtTab(
                                        name: 'New',
                                        color: Colors.red,
                                      ),
                                      LtTab(
                                        name: 'Popular',
                                        color: Colors.blue,
                                      ),
                                      LtTab(
                                        name: 'Best',
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  )),
                            ))
                      ];
                    },
                    body: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                            itemCount: bookslist.length,
                            itemBuilder: (context, index) {
                              Books book = bookslist[index];
                              return Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AudioPage(
                                                book: book,
                                               )));
                                  },
                                  child: Card(
                                    child: Expanded(
                                      child: ListTile(
                                        leading: Image(
                                            image: AssetImage(
                                                bookslist[index].img)),
                                        title: Text(bookslist[index].title),
                                        subtitle: Text(bookslist[index].text),
                                        trailing: Text(bookslist[index].rating),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        ListView.builder(
                            itemCount: bookslist.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  leading: Image(
                                      image: AssetImage(bookslist[index].img)),
                                  title: Text(bookslist[index].title),
                                  subtitle: Text(bookslist[index].text),
                                  trailing: Text(bookslist[index].rating),
                                ),
                              );
                            }),
                        ListView.builder(
                            itemCount: bookslist.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  leading: Image(
                                      image: AssetImage(bookslist[index].img)),
                                  title: Text(bookslist[index].title),
                                  subtitle: Text(bookslist[index].text),
                                  trailing: Text(bookslist[index].rating),
                                ),
                              );
                            }),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
