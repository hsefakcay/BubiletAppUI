import 'package:bubilet_app/app/core/constants/colors.dart';
import 'package:bubilet_app/app/core/constants/icon_sizes.dart';
import 'package:bubilet_app/app/core/utils/screen_utility.dart';
import 'package:bubilet_app/app/data/event_list.dart';
import 'package:bubilet_app/app/data/image_list.dart';
import 'package:bubilet_app/app/data/models/event.dart';
import 'package:bubilet_app/app/ui/widgets/category_button_widget.dart';
import 'package:bubilet_app/app/ui/widgets/custom_navigationbar_widget.dart';
import 'package:bubilet_app/app/ui/widgets/event_card_widget.dart';
import 'package:bubilet_app/app/ui/widgets/filter_icon_button_widget.dart';
import 'package:bubilet_app/app/ui/widgets/menu_grid_toggle_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil.screenHeight(context);
    double width = ScreenUtil.screenWidth(context);

    return Scaffold(
      appBar: _myAppBar(height, width),
      backgroundColor: AppColor.backgroundColor,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        children: [
          Container(height: height * 0.04, color: AppColor.primaryColor),
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              _scrollImageBuilder(height, width, scrollImageList),
              Positioned(
                  top: -30,
                  child: Center(
                      child: SizedBox(width: width * 0.9, child: _searchTextField(context)))),
              Positioned(bottom: -30, right: 0, left: 0, child: _categoryButtonRow())
            ],
          ),
          SizedBox(height: height * 0.046),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "İzmir Etkinlikleri",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColor.darkGreyColor, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    const FilterIconButton(),
                    SizedBox(width: width * 0.03),
                    const MenuGridToggle()
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: height * 0.015),
          _eventsListView(eventList)
        ],
      ),
    );
  }

//////////////////////////////////////////////////////////////
  Expanded _eventsListView(List<Event> eventList) {
    return Expanded(
      child: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          if (eventList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: EventCard(
                event: eventList[index],
              ),
            );
          } else {
            return const Placeholder();
          }
        },
      ),
    );
  }

  Row _categoryButtonRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryButton(icon: Icons.music_note, label: "KONSER"),
        CategoryButton(icon: Icons.theater_comedy, label: "TİYATRO"),
        CategoryButton(icon: Icons.festival, label: "FESTİVAL"),
      ],
    );
  }

  SizedBox _scrollImageBuilder(double height, double width, List<String> scrollImageList) {
    return SizedBox(
      height: height * 0.24,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: scrollImageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            "lib/assets/images/${scrollImageList[index]}",
            width: width,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  TextField _searchTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "  Etkinlik, sanatçı veya mekan arayın",
        hintStyle: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: AppColor.greyColor, fontSize: 16),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: Icon(Icons.search_rounded,
                color: AppColor.darkGreyColor, size: IconSizes.iconLarge),
            onPressed: () {
              // Define what happens when the icon is pressed
            },
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColor.whiteColor, // Background color of the search bar
      ),
    );
  }

  AppBar _myAppBar(double height, double width) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      toolbarHeight: height * 0.12,
      title: Image.asset("lib/assets/images/bubilet_logo.png", height: height * 0.28),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu_rounded, size: IconSizes.iconLarge, color: AppColor.whiteColor)),
      leadingWidth: width * 0.18,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () {},
                icon:
                    Icon(Icons.location_on, size: IconSizes.iconLarge, color: AppColor.whiteColor)))
      ],
    );
  }
}
