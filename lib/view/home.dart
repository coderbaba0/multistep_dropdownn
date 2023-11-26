import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/homecontroller.dart';
import '../services/api_provider.dart';

class HomeView extends StatelessWidget {
  final HomeController controller =
      Get.put(HomeController(Repository(ApiProvider())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          'Dropdown from API',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SingleChildScrollView(
          physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => DropdownButtonFormField(
                    isDense: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return controller.validateState(val.toString());
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    items: controller.lststatedropdownmenuitem.value,
                    value: controller.selectedstate.value.isNotEmpty?controller.selectedstate.value:null,
                    hint: Text(
                      "Select State",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    onChanged: (selectedValue) {
                      controller.selectedstate.value = selectedValue.toString();
                      if (controller.selectedstate.value != "0") {
                        controller.getdist(controller.selectedstate.value);
                      }
                    },
                    isExpanded: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => DropdownButtonFormField(
                    isDense: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return controller.validateDist(val.toString());
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    items: controller.lstdistDropDownMenuItem.value,
                    value: controller.selecteddist.value,
                    hint: Text(
                      "Select Dist",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    onChanged: (selectedValue) {
                      controller.selecteddist.value = selectedValue.toString();
                      if (controller.selecteddist.value != "0") {
                        controller.getcity(controller.selecteddist.value);
                      }
                    },
                    isExpanded: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => DropdownButtonFormField(
                    isDense: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return controller.validateCity(val.toString());
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    items: controller.lstcityDropDownMenuItem.value,
                    value: controller.selectedcity.value,
                    hint: Text(
                      "Select City",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    onChanged: (selectedValue) {
                      controller.selectedcity.value = selectedValue.toString();
                    },
                    isExpanded: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Column(
                    children: [
                      Text('StateID:' +
                          controller.selectedstate.value.toString()),
                      Text(
                          'DistID:' + controller.selecteddist.value.toString()),
                      Text(
                          'CityID:' + controller.selectedcity.value.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
