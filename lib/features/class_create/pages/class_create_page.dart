import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/class_mdl.dart';

const String classCreatePageRoute = '/class-create';

class ClassCreatePage extends StatefulWidget {
  const ClassCreatePage({Key? key}) : super(key: key);

  @override
  State<ClassCreatePage> createState() => _ClassCreatePageState();
}

class _ClassCreatePageState extends State<ClassCreatePage> {
  final ClassMdl? args = Get.arguments as ClassMdl?;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = args?.nama ?? '';
    _descController.text = args?.deskripsi ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Nama Kelas',
                ),
              ),
              const Divider(),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  hintText: 'Deskripsi',
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
              ),
              SizedBox(height: 32.w),
              SizedBox(
                width: 1.sw,
                child: ElevatedButton(
                  onPressed: () {
                    final classesCollection =
                        FirebaseFirestore.instance.collection('classes');
                    final data = {
                      'nama': _nameController.text,
                      'deskripsi': _descController.text,
                    };

                    if (args != null) {
                      // Artinya update
                      classesCollection.doc(args!.id).update(data);
                    } else {
                      classesCollection.add(data);
                    }

                    Get.back();
                  },
                  child: Text(
                    (args != null) ? 'Update Class' : 'Add Class',
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
