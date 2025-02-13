import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/models/sector_model.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/utils/app_regex.dart';
import 'package:cross_platforme_mobile/app/core/widgets/image_input_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/service_form_controller.dart';

class ServiceFormView extends GetView<ServiceFormController> {
  const ServiceFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Service',
          style: AppTextTheme.titleSmall,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // service name
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Service Name *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // service description
              TextFormField(
                controller: controller.descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Service Description',
                ),
              ),
              SizedBox(height: 10),
              // service price
              TextFormField(
                controller: controller.priceController,
                decoration: InputDecoration(
                  labelText: 'Service Price *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!AppRegex.isPrice(value)) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              controller.obx(
                (state) {
                  return DropdownButtonFormField<String>(
                    value: state!.first.id.toString(),
                    onChanged: (value) {
                      controller.sectorIdController.text = value!;
                    },
                    menuMaxHeight: 300,
                    dropdownColor: AppColors.white,
                    items: state
                        .map(
                          (sector) => DropdownMenuItem<String>(
                            value: sector.id.toString(),
                            child: Text(sector.name!),
                          ),
                        )
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Sector *',
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a sector';
                      }
                      return null;
                    },
                  );
                },
                onLoading: Center(child: CircularProgressIndicator.adaptive()),
                onEmpty: Column(
                  children: [
                    SizedBox(height: 10),
                    Icon(Bootstrap.database),
                    SizedBox(height: 10),
                    Text(
                      'No sectors found',
                      style: AppTextTheme.bodyMedium,
                    ),
                  ],
                ),
                onError: (error) => Column(
                  children: [
                    SizedBox(height: 10),
                    Icon(Bootstrap.exclamation_circle),
                    SizedBox(height: 10),
                    Text(error.toString()),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // service image
              ImageInputWidget(
                controller: controller.serviceImageFile,
                hintText: 'Service Image',
                width: 140,
                height: 170,
                validator: (value) {
                  if (value == null) {
                    return 'Please select an image';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // submit button
              ElevatedButton(
                onPressed: controller.create,
                child: Text(
                  'Save',
                  style: AppTextTheme.bodyLarge.copyWith(
                    color: AppColors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
