import 'package:fabcurate/util.dart/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CATEGORY extends StatefulWidget {
  const CATEGORY({Key? key}) : super(key: key);

  @override
  State<CATEGORY> createState() => _CATEGORYState();
}

class _CATEGORYState extends State<CATEGORY> {
  @override
  void initState() {
    super.initState();
    final categoryumdl = Provider.of<CategoryProvider>(context, listen: false);
    categoryumdl.getCategoryData(context);
    final postMdl = Provider.of<ModulDataProvider>(context, listen: false);
    postMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final postMdl = Provider.of<ModulDataProvider>(context);
    double width = MediaQuery.of(context).size.width;
    final categoryumdl = Provider.of<CategoryProvider>(context);
    return (!categoryumdl.loading)
        ? Container(
            color: Colors.white,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(int.parse(postMdl.post!.mainModul![1]
                                  .category![index].tintColor!
                                  .toString()
                                  .replaceAllMapped("#", (match) => "0xFF")
                                  .toUpperCase()))
                              .withAlpha(150),
                        ),
                        width: width,
                        height: height * 0.17,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.45,
                            child: Image.network(
                                categoryumdl.category!.bannerImage.toString(),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.53,
                        height: height * 0.17,
                        margin: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54.withOpacity(0.2),
                                offset: Offset(4, 0),
                                // spreadRadius: 1,
                                blurRadius: 4,
                                spreadRadius: -1
                                //
                                ),
                            const BoxShadow(
                              offset: Offset(-4, 0),
                              color: Colors.white,
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color(int.parse(postMdl
                              .post!.mainModul![1].category![index].tintColor!
                              .toString()
                              .replaceAllMapped("#", (match) => "0xFF")
                              .toUpperCase())),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              categoryumdl.category!.categories![0]
                                  .child![index].categoryName
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              itemCount: postMdl.post!.mainModul![1].category!.length,
            ),
          )
        : Container(
            child: Center(
              child: CircularProgressIndicator(color: Colors.grey),
            ),
          );
  }
}
