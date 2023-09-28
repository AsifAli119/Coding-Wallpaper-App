import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/bloc/search_bloc/search_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/model/wallpaper_ui_model_ui.dart';
import 'package:wallpaper_app/src/features/wallpaper/ui/pages/details_page/detail_page.dart';
import 'package:wallpaper_app/src/features/wallpaper/ui/pages/main_page/wallpaper_components/wallpaper_loading.dart';
import 'package:wallpaper_app/src/repos/category_repos.dart';
class SearchPage extends StatefulWidget {
  final String query;
  const SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  SearchBloc _bloc = SearchBloc(categoryRepo: CategoryRepo);
  int _page = 30;

   void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _page = _page + 30;
      print(_page);
      _bloc.add(SearchScrollEvent(page: '$_page', query: widget.query));
    }
  }

  @override
  void initState() {
    _bloc.add(SearchFetchData(query: widget.query));
    _scrollController.addListener(_onScroll);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_left, size: 25,color: Colors.black,)),
            Text(widget.query.toUpperCase(), style: TextStyle(color: Colors.black),),
            SizedBox(width: 16,),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none),
                    )),
                InkWell(
                    onTap: () {
                      if (_searchController.text != "") {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        setState(() {
                          _bloc.add(SearchFetchData(
                              query: _searchController.text));
                        });
                      }
                    },
                    child: Container(child: Icon(Icons.search)))
              ],
            ),
          ),
          BlocConsumer<SearchBloc, SearchState>(
              listenWhen: (previous, current) => current is !SearchLoadedState,
              buildWhen: (previous, current) => current is SearchLoadedState,
              listener: (context, state) {},
              bloc: _bloc,
              builder: (ctx, state) {
                if (state is SearchLoadingState) {
                  return DoubleCircularProgressIndicator();
                } else if (state is SearchLoadedState) {
                  return buildListImage(state.list);
                } else if (state is SearchErrorState) {
                  return Scaffold(
                    body: Center(
                      child: Text(state.message),
                    ),
                  );
                }
                return Container();
              })
        ],
      ),
    );
  }

  Widget buildListImage(List<Photo> _list) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
            controller: _scrollController,
            itemCount: _list.length,
            cacheExtent: 9999,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Hero(
                tag: _list[index].id,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(imgUrl: _list[index].src.portrait)));
                    print("hello");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Colors.grey),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover, imageUrl: _list[index].src.portrait,
                        )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}


