import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/reactive_controller.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
        init: ReactiveController(),
        builder: (_) {
          print('reactive');
          return Scaffold(
            body: Obx(() => ListView.builder(
                  itemBuilder: (__, index) {
                    final String text = _.items[index];
                    return ListTile(
                      title: Text(text),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _.removeItem(index);
                          }),
                    );
                  },
                  itemCount: _.items.length,
                )),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                    heroTag: 'add',
                    child: Icon(Icons.add),
                    onPressed: () {
                      //_.increment();
                      _.addItem();
                    }),
                FloatingActionButton(
                    heroTag: 'date',
                    child: Icon(Icons.calendar_today),
                    onPressed: () {
                      _.getDate();
                    })
              ],
            ),
          );
        });
  }
}

// Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Obx(
//                     () => Text(
//                       _.counter.value.toString(),
//                       style: TextStyle(fontSize: 30),
//                     ),
//                   ),
//                   Obx(
//                     () => Text(
//                       _.currentDate.value.toString(),
//                       style: TextStyle(fontSize: 30),
//                     ),
//                   ),
//                 ],
//               ),
//             )
