import 'package:flutter/material.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';

class ListRatingPage extends StatefulWidget {
  const ListRatingPage({Key? key});

  @override
  State<ListRatingPage> createState() => _ListRatingPageState();
}

class _ListRatingPageState extends State<ListRatingPage> {
  TextEditingController paymentController = TextEditingController();
  String searchText = '';
  String searchCategoryText = '';
  List<String> items = [
    'Lisa 1',
    'Lisa 2',
    'Lisa 3',
    // Add more items as needed
  ];
  List<String> kategori = [
    'Tahu Sumedang',
    'Tukang Bangunan',
    'Rumah Makan',
    // Add more items as needed
  ];
  List<String> filteredItems = [];
  List<String> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    filteredCategories = kategori;
  }

  void filterItems(String query) {
    setState(() {
      searchText = query;
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void filterCategories(String query) {
    setState(() {
      searchCategoryText = query;
      filteredCategories = kategori
          .where((category) =>
              category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Rating'),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff001523),
              Color(0xFF006466),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20.0,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                        onChanged: filterItems,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    final kategori = filteredCategories[index];
                    return Container(
                      height: 275,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      // padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.shop_2_rounded,
                                    size: 60,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        kategori,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Kuliner',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'Ket: Membangun Kedai',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 14,
                                            color: Colors.grey[600],
                                          ),
                                          Text(
                                            'Cimalaka, Sumendang, Jawa Barat',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 2.0,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image(
                                      image:
                                          AssetImage('assets/images/lisa.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Investor',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.yellow[700],
                                    ),
                                    SizedBox(width: 2),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.yellow[700],
                                    ),
                                    SizedBox(width: 2),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.yellow[700],
                                    ),
                                    SizedBox(width: 2),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.yellow[700],
                                    ),
                                    SizedBox(width: 2),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.yellow[700],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Text(
                              '"Lisa tepat waktu dalam mengembalikan pinjaman."',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 1,
                color: Colors.white,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.format_list_bulleted_sharp,
                        size: 24, color: Color.fromARGB(255, 85, 84, 84)),
                    SizedBox(width: 5),
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 85, 84, 84),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: VerticalDivider(color: Color.fromARGB(255, 85, 84, 84)),
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sort,
                        size: 24, color: Color.fromARGB(255, 85, 84, 84)),
                    SizedBox(width: 5),
                    Text(
                      'Urutkan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 85, 84, 84),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
