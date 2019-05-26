import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/models/ui/record_details_model.dart';
import 'package:flutter_wallet_app/src/ui/botton_navigation/bottom_navigation_holder.dart';

class ListViewItem extends StatefulWidget {
  final List<RecordDetailsModel> items;
  final Widget goToWidgetOnClick;

  const ListViewItem({Key key, this.items, this.goToWidgetOnClick})
      : super(key: key);

  _ListViewItem createState() => _ListViewItem();
}

class _ListViewItem extends State<ListViewItem> {
  void _navigate() {
    if (widget.goToWidgetOnClick is BottomNavigationHolder) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.goToWidgetOnClick),
          (Route<dynamic> route) => false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget.goToWidgetOnClick,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, position) {
        return InkWell(
          onTap: () {
            _navigate();
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(widget.items[position].iconData),
              ),
              Expanded(
                flex: 3,
                child: Text(widget.items[position].mainText),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        );
      },
      itemCount: widget.items.length,
    );
  }
}
