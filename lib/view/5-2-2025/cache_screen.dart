
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class CacheScreen2 extends StatefulWidget {
  const CacheScreen2({super.key});

  @override
  State<CacheScreen2> createState() => _CacheScreen2State();
}

class _CacheScreen2State extends State<CacheScreen2> {

  final Uri _url = Uri.parse('https://images.applypixels.com/images/originals/1696b13e-7eb7-4fd0-83a1-bb89d5aa5ab8.png');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cache Screen'),),
      body: Center(
        child: Column(
          children: [

            // network image
            Image.network('https://images.pexels.com/photos/30543353/pexels-photo-30543353/free-photo-of-serene-heron-perched-on-tree-branch.jpeg?auto=compress&cs=tinysrgb&w=400',
            scale: 4,),
            const SizedBox(height: 50,),
            // cache network image
            CachedNetworkImage(
              imageUrl: 'https://images.pexels.com/photos/30543353/pexels-photo-30543353/free-photo-of-serene-heron-perched-on-tree-branch.jpeg?auto=compress&cs=tinysrgb&w=400',
              scale: 4,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),


        SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.black,
            child: Image.asset('assets/Silver Medal.png'),
          ),
        ),


            Center(
              child: ElevatedButton(
                onPressed: _launchUrl,
                child: Text('Show Flutter homepage'),
              ),
            ),


          ],
        ),
      ),
    );

  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch-----------> $_url');
    }
  }

}
