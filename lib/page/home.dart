import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/model/listing_model.dart';
import 'package:myapp/page/listings.dart';
import 'package:myapp/page/check_in.dart';
import 'package:myapp/page/check_out.dart';
import 'package:myapp/page/recom_recipe.dart';

class Homepage extends StatelessWidget {
  ListingService listingService = ListingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Home Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Welcome To Smart Home Home Page',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,),
              Container(
                padding: const EdgeInsets.all(60.0),
                color: Colors.grey[100],
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CheckInOption()
                    )
                ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 50),
                    maximumSize: const Size(400, 50),
                  ),
                  icon: const Icon(
                    Icons.add_circle,
                    size: 25.0,
                  ),
                  label: const Text(
                    'Check In Items',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(60.0),
                color: Colors.grey[100],
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> CheckOutOption())
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 50),
                    maximumSize: const Size(400, 50),
                  ),
                  icon: const Icon(
                    Icons.add_to_home_screen,
                    size: 25.0,
                  ),
                  label: const Text(
                    'Check Out Items',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(60.0),
                color: Colors.grey[100],
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ListingsPage()
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 50),
                    maximumSize: const Size(400, 50),
                  ),
                  icon: const Icon(
                    Icons.article_outlined,
                    size: 25.0,
                  ),
                  label: const Text(
                    'Item List',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(60.0),
                color: Colors.grey[100],
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => RecomRecipePage()
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 50),
                    maximumSize: const Size(400, 50),
                  ),
                  icon: const Icon(
                    Icons.update,
                    size: 25.0,
                  ),
                  label: const Text(
                    'Recipes',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}