import 'package:flutter/material.dart';
import 'package:lendyv1/util/card_category.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InvestorHomePage extends StatefulWidget {
  const InvestorHomePage({super.key});

  @override
  State<InvestorHomePage> createState() => _InvestorHomePageState();
}

class _InvestorHomePageState extends State<InvestorHomePage> {
  // pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
      children: [
        // Profile Icon
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.person_rounded),
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
          height: 25,
        ),
        // Greetings
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Helo Lisa",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Good Morning",
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        // Wallet Card
        Container(
          height: 210,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20),
                width: 314,
                height: 145,
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saldo Anda',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Rp. 50.000.000',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                            onPressed: () {
                              print('Pressed TopUp button');
                            },
                            icon: Icon(Icons.add_box_rounded),
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
        SizedBox(
          height: 30.0,
        ),
        // Kategori Section
        Text(
          'Kategori',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
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
                  activeDotColor: Colors.green.shade300,
                  dotColor: Colors.green.shade100),
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
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
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
              leading: Icon(Icons.person_2_rounded),
              title: Text('Labib Husain'),
              subtitle: Text('UMKM Tahu Sumedang'),
              trailing: Text('230 K'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person_2_rounded),
              title: Text('Alif Faturahman'),
              subtitle: Text('UMKM Kosmetik'),
              trailing: Text('1000 K'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person_2_rounded),
              title: Text('Alif Faturahman'),
              subtitle: Text('UMKM Kosmetik'),
              trailing: Text('1000 K'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person_2_rounded),
              title: Text('Alif Faturahman'),
              subtitle: Text('UMKM Kosmetik'),
              trailing: Text('1000 K'),
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
