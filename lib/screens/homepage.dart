import 'package:carousel_slider/carousel_slider.dart';

import 'package:fabcurate/util.dart/provider.dart';

import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _stickyMenuIndex = 0;
  int _dots = 0;

  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<ModulDataProvider>(context, listen: false);
    postMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<ModulDataProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return postMdl.loading
        ? Container(
            color: Colors.white,
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.grey,
            )),
          )
        : Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Expanded(
                      child: SizedBox(
                        width: width,
                        height: height * 0.15,
                        child: PageView.builder(
                            padEnds: false,
                            controller: PageController(
                              viewportFraction: 0.33,
                              initialPage: 1,
                            ),
                            onPageChanged: ((int index) =>
                                setState(() => _stickyMenuIndex = index)),
                            scrollDirection: Axis.horizontal,
                            itemCount: postMdl
                                .post?.mainModul![0].mainStickyMenu!.length,
                            itemBuilder: (
                              BuildContext context,
                              int itemIndex,
                            ) {
                              return Card(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(3),
                                        topRight: Radius.circular(3),
                                      ),
                                      child: Image.network(
                                        postMdl.post!.mainModul![0]
                                            .mainStickyMenu![itemIndex].image
                                            .toString(),
                                        alignment: Alignment.topCenter,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: Center(
                                          child: Text(
                                        postMdl.post!.mainModul![0]
                                            .mainStickyMenu![itemIndex].title
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 11),
                                      )),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: height * 0.27,
                      viewportFraction: 0.89,
                      initialPage: 1,
                      enableInfiniteScroll: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: postMdl.post!.mainModul![0]
                        .mainStickyMenu![_stickyMenuIndex].sliderImages!.length,
                    itemBuilder: (BuildContext context, int sliderIndex,
                            int pageViewIndex) =>
                        Card(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              postMdl
                                  .post!
                                  .mainModul![0]
                                  .mainStickyMenu![_stickyMenuIndex]
                                  .sliderImages![sliderIndex]
                                  .image
                                  .toString(),
                              width: width,
                              height: height,
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.1,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        postMdl
                                            .post!
                                            .mainModul![0]
                                            .mainStickyMenu![_stickyMenuIndex]
                                            .sliderImages![sliderIndex]
                                            .title
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w600),
                                        textScaleFactor: 1.15,
                                      ),
                                      Text(
                                        "+EXPLORE",
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w600),
                                        textScaleFactor: 0.65,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: height * 0.25,
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: width * 0.69,
                            child: Image.network(
                              postMdl.post!.mainModul![0]
                                  .offerCodeBanner![index].bannerImage
                                  .toString(),
                              width: width,
                              // height: height,
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        );
                      }),
                      itemCount:
                          postMdl.post!.mainModul![0].offerCodeBanner!.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  banner("Shop By Category"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: width,
                      height: height * 0.6,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.35,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Color(int.parse(postMdl.post!.mainModul![1]
                                    .category![index].tintColor!
                                    .toString()
                                    .replaceAllMapped("#", (match) => "0xFF")
                                    .toUpperCase()))
                                .withAlpha(80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  postMdl.post!.mainModul![1].category![index]
                                      .image
                                      .toString(),
                                  height: height * 0.2,
                                  width: width * 0.7,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text: postMdl.post!.mainModul![1]
                                            .category![index].name
                                            .toString()
                                            .toUpperCase()
                                            .split(" ")
                                            .first,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600]),
                                        children: [
                                          TextSpan(text: "  "),
                                          TextSpan(
                                              text: postMdl.post!.mainModul![1]
                                                  .category![index].name
                                                  .toString()
                                                  .toUpperCase()
                                                  .split(" ")
                                                  .last,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.grey[700]))
                                        ]),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "+EXPLORE",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8,
                                        color: Color(0xffA0A0A0)),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: postMdl.post!.mainModul![1].category!.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  banner("Shop By Fabric Material"),
                  SizedBox(
                    width: width,
                    height: height * 0.38,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return CircleAvatar(
                            backgroundImage: NetworkImage(postMdl
                                .post!.mainModul![1].category![index].image
                                .toString()),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: Text(
                                postMdl
                                    .post!.mainModul![1].category![index].name
                                    .toString()
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          );
                        },
                        itemCount: postMdl.post!.mainModul![1].category!.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  banner("Shop By Design Patterns"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: width,
                      height: height * 0.48,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.4,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        postMdl.post!.mainModul![1]
                                            .category![index].image
                                            .toString(),
                                      ),
                                      fit: BoxFit.fill)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      postMdl.post!.mainModul![1]
                                          .category![index].name
                                          .toString()
                                          .toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    child: Text("+EXPLORE",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )
                                ],
                              ));
                        },
                        itemCount: postMdl.post!.mainModul![1].category!.length,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  banner("Unstitched"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 300,
                        pauseAutoPlayOnTouch: true,
                        clipBehavior: Clip.antiAlias,
                        viewportFraction: 0.6,
                        initialPage: 2,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.ease,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: postMdl.post!.mainModul![1].unstitched!.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  postMdl.post!.mainModul![1]
                                      .unstitched![itemIndex].image
                                      .toString(),
                                ),
                                fit: BoxFit.fill)),
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: width * 0.6,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    postMdl.post!.mainModul![0]
                                        .mainStickyMenu![itemIndex].image
                                        .toString(),
                                  ),
                                  fit: BoxFit.fill)),
                          child: Text(
                            postMdl
                                .post!.mainModul![1].unstitched![itemIndex].name
                                .toString()
                                .toUpperCase(),
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  banner("Boutique Collecion"),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: CarouselSlider.builder(
                          options: CarouselOptions(
                            height: height * 0.6,
                            onPageChanged: (index, fun) {
                              setState(() {
                                _dots = index;
                              });
                            },
                            viewportFraction: 1,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemCount: postMdl
                              .post!.mainModul![1].boutiqueCollection!.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          postMdl
                                              .post!
                                              .mainModul![1]
                                              .boutiqueCollection![itemIndex]
                                              .bannerImage
                                              .toString(),
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          postMdl.post!.mainModul![1]
                                              .category![itemIndex].name
                                              .toString()
                                              .toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, bottom: 10),
                                        child: Text("+EXPLORE",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white)),
                                      )
                                    ],
                                  )))),
                  PageViewDotIndicator(
                    currentItem: _dots,
                    count:
                        postMdl.post!.mainModul![1].boutiqueCollection!.length,
                    unselectedColor: Colors.black26,
                    unselectedSize: Size(5, 5),
                    size: Size(10, 10),
                    selectedColor: Colors.black54,
                  ),
                  SizedBox(height: 10),
                  banner("Print Your Own Design"),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              postMdl.post!.mainModul![1].boutiqueCollection![0]
                                  .bannerImage
                                  .toString()
                                  .toUpperCase(),
                            ),
                            fit: BoxFit.cover)),
                    width: width,
                    height: height * 0.35,
                    child: Stack(children: [
                      Positioned(
                        height: height * 0.25,
                        width: width,
                        top: height * 0.133,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    postMdl
                                        .post!.mainModul![1].category![1].image
                                        .toString()
                                        .toUpperCase(),
                                  ),
                                  fit: BoxFit.fitWidth)),
                        ),
                      ),
                      Positioned(
                        top: height * 0.133,
                        height: height * 0.22,
                        width: width * 0.3,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    postMdl
                                        .post!.mainModul![1].category![2].image
                                        .toString()
                                        .toUpperCase(),
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: width * 0.55,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              "+Upload Your Design",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  banner("Range Of Pattern"),
                  SizedBox(
                    width: width,
                    height: height * 0.38,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return CircleAvatar(
                            backgroundImage: NetworkImage(postMdl.post!
                                .mainModul![2].rangeOfPattern![index].image
                                .toString()),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: Text(
                                postMdl.post!.mainModul![2]
                                    .rangeOfPattern![index].productId
                                    .toString()
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          );
                        },
                        itemCount: postMdl.post!.mainModul![1].category!.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  banner("Design AS Per Occasion"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.9,
                              crossAxisCount: 3,
                              crossAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(postMdl.post!.mainModul![2]
                                .designOccasion![index].image
                                .toString()),
                          )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Colors.white38,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        postMdl.post!.mainModul![2]
                                            .designOccasion![index].name
                                            .toString()
                                            .split(" ")
                                            .first
                                            .toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              postMdl
                                                  .post!
                                                  .mainModul![2]
                                                  .designOccasion![index]
                                                  .subName
                                                  .toString()
                                                  .toUpperCase(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5.0, top: 5),
                                              child: Text(
                                                postMdl.post!.mainModul![2]
                                                    .designOccasion![index].cta
                                                    .toString()
                                                    .toUpperCase(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black45,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount:
                          postMdl.post!.mainModul![2].designOccasion!.length,
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Widget banner(String banner) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          banner,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 22,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
