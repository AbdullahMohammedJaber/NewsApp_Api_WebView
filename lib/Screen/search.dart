import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Screen/webview.dart';
import 'package:newsapp/news_cubit.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: searchController,
                  // onChanged: (value) {
                  //   NewsCubit.get(context).getApiSearch(value);
                  // },
                  decoration: InputDecoration(
                    label: Text(
                      'Search',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        NewsCubit.get(context)
                            .getApiSearch(searchController.text);
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => xx(list[index]['url'])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: list[index]['urlToImage'] == null
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.deepOrange,
                                        ),
                                      )
                                    : Container(
                                        child: Image.network(
                                          '${list[index]['urlToImage']}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Text(
                                      '${list[index]['title']}',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    '${list[index]['publishedAt']}',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 1.2,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    );
                  },
                  itemCount: list.length,
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
