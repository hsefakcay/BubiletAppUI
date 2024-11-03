import 'package:bubilet_app/app/core/constants/colors.dart';
import 'package:bubilet_app/app/core/constants/icon_sizes.dart';
import 'package:bubilet_app/app/data/models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: _eventImage(context),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 150,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _eventNameText(context),
                        _eventLocationText(context),
                        _eventPrice(context),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: _shoppingIcon(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Icon _shoppingIcon() {
    return Icon(
      Icons.shopping_basket_outlined,
      color: AppColor.primaryColor,
      size: IconSizes.bottombarIconSize,
    );
  }

  Text _eventPrice(BuildContext context) {
    return Text(
      "${event.price} TL",
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Text _eventLocationText(BuildContext context) {
    return Text(
      event.location,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColor.greyColor),
    );
  }

  Text _eventNameText(BuildContext context) {
    return Text(event.name,
        style:
            Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1) // satır aralığı azaltıldı,
        );
  }

  ClipRRect _eventImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(children: [
        Image(
          image: AssetImage("lib/assets/images/${event.image}"),
          fit: BoxFit.cover,
          height: 100,
          width: 130,
        ),
        Positioned(
          child: SizedBox(
            width: 120,
            child: Text(
              event.date,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColor.whiteColor, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          bottom: 8,
          left: 10,
        )
      ]),
    );
  }
}
