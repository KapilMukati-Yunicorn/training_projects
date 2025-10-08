import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCustomIMageWidget extends StatelessWidget {
  const MyCustomIMageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Scroll View"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              // color: Colors.blue,
              decoration: BoxDecoration(
                // image: DecorationImage(image: AssetImage("image.jpg")),
                // image: DecorationImage(image: NetworkImage("")),
              ),
              child: Image.network(
                "https://cdn.prod.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp",
                fit: BoxFit.cover,

                // centerSlice: Rect.zero,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.error_outline, color: Colors.red),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
                // child: Image.asset("assets/images/image.jpg", fit: BoxFit.fill),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://cdn.prod.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp",
                  fit: BoxFit.cover,
                  // placeholder: (context, url) =>
                  //     Center(child: CircularProgressIndicator()),
                  // errorWidget: (context, url, error) => Icon(Icons.error),
                  errorListener: (value) => {throw Future.error(value)},
                  fadeInCurve: Curves.easeInCirc,
                  fadeInDuration: Duration(seconds: 1),
                  progressIndicatorBuilder: (context, url, progress) {
                    if(progress.downloaded == false){
                      // return Center(child: CircularProgressIndicator(),);
                      return Text("Hiii");
                    }
                    return Center(child: CircularProgressIndicator(),);
                  }
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  "assets/images/imag.jpg",
                  // alignment: Alignment.center,
                  // opacity: AlwaysStoppedAnimation(0.5),
                  // cacheWidth: 400,
                  // height: 200,
                  // color: Colors.red.withOpacity(0.2),
                  // colorBlendMode: BlendMode.srcIn,
                  // cacheHeight: 400,
                  // color: Colors.black.withOpacity(0.5),
                  // colorBlendMode: BlendMode.screen,
                  // errorBuilder: ,
                  // filterQuality: FilterQuality.medium,
                  // fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error_outline, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
