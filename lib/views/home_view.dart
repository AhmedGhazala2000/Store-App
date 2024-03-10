import 'package:flutter/material.dart';
import 'package:store_app/widgets/build_icon_button.dart';
import 'package:store_app/widgets/build_title.dart';
import 'package:store_app/widgets/categories_list_view.dart';
import 'package:store_app/widgets/custom_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const id = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: buildTitle(context, text: 'New Trend'),
        actions: [buildIconButton(context)],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            ),
            CustomGridView(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
