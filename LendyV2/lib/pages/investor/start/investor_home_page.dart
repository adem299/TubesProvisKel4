import 'package:flutter/material.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';
import 'package:lendyv1/util/bar/bar_graph.dart';
import 'package:lendyv1/util/card_category.dart';
import 'package:lendyv1/util/topup/top_up_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InvestorHomePage extends StatefulWidget {
  const InvestorHomePage({super.key});

  @override
  State<InvestorHomePage> createState() => _InvestorHomePageState();
}

class _InvestorHomePageState extends State<InvestorHomePage> {
  // pagecontroller
  final _controller = PageController();

  // list weekly
  List<double> weeklySummary = [
    4.20,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];

  // media querry
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      children: [
        // Profile Icon
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    print('click icon');
                  },
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        // Greetings
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Helo Lisa",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Good Morning",
                style: TextStyle(color: Colors.white, fontSize: 17),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 60,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white24,
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(3),
              child: IconButton(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                color: Colors.white,
                onPressed: () {
                  print('klik button');
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),

        Container(
          height: 230,
          width: 300,
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 250,
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: BarGraph(
                  weeklySummary: weeklySummary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Container(
                  height: 210,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 13,
                            decoration: BoxDecoration(
                                color: AppColors.starColor,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20),
                            width: 300,
                            height: 145,
                            decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Saldo Anda',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rp. 50.000.000',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return const TopUpPage();
                                              },
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add_box_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
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
              ),
            ],
          ),
        ),
        // Wallet Card

        SizedBox(
          height: 30.0,
        ),
        // Kategori Section
        Text(
          'Kategori',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 25),
        ),
        // Category Card
        Column(
          children: [
            SizedBox(
              height: 25.0,
            ),
            // Kategori Card
            Container(
              height: 105,
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  CategoryCard(
                    icon: Icons.accessibility_new_rounded,
                    title: 'Pakaian',
                  ),
                  CategoryCard(
                    icon: Icons.shopify_rounded,
                    title: 'Perdagangan',
                  ),
                  CategoryCard(
                    icon: Icons.diamond_rounded,
                    title: 'Aksesoris',
                  ),
                  CategoryCard(
                    icon: Icons.accessibility_new_rounded,
                    title: 'Pakaian',
                  ),
                  CategoryCard(
                    icon: Icons.shopify_rounded,
                    title: 'Perdagangan',
                  ),
                  CategoryCard(
                    icon: Icons.diamond_rounded,
                    title: 'Aksesoris',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: WormEffect(
                  activeDotColor: Colors.blue.shade300,
                  dotColor: Colors.blue.shade100),
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
        ),
        // Daftar Investasi
        // Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Daftar Investasi',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.white),
            ),
            TextButton(
              onPressed: () {},
              child: Text('view all'),
            ),
          ],
        ),
        Column(
          children: [
            // Person
            ListTile(
              leading: Icon(
                Icons.person_2_rounded,
                color: Colors.white,
              ),
              title: Text(
                'Labib Husain',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'UMKM Tahu Sumedang',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                '230 K',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.person_2_rounded,
                color: Colors.white,
              ),
              title: Text(
                'Alif Faturahman',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'UMKM Kosmetik',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                '1000 K',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.person_2_rounded,
                color: Colors.white,
              ),
              title: Text(
                'Alif Faturahman',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'UMKM Kosmetik',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                '1000 K',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.person_2_rounded,
                color: Colors.white,
              ),
              title: Text(
                'Alif Faturahman',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'UMKM Kosmetik',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                '1000 K',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            // sample in another way
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Icon(Icons.person_2_rounded),
            //     Column(
            //       children: [
            //         Text('Alif Faturahman'),
            //         Text('UMKM Kosmetik'),
            //       ],
            //     ),
            //     Text('130 K'),
            //   ],
            // ),
          ],
        )
      ],
    );
  }
}
