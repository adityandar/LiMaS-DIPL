import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:we_help_app/models/param_create_material.dart';

const String materialCreatePageRoute = '/material-create';

class MaterialCreatePage extends StatefulWidget {
  const MaterialCreatePage({Key? key}) : super(key: key);

  @override
  State<MaterialCreatePage> createState() => _MaterialCreatePageState();
}

class _MaterialCreatePageState extends State<MaterialCreatePage> {
  final ParamCreateMaterial args = Get.arguments as ParamCreateMaterial;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = args.materialMdl?.nama ?? '';
    _descController.text = args.materialMdl?.deskripsi ?? '';
    _expController.text = args.materialMdl?.penjelasan ?? '';
    _isSelected = args.materialMdl?.isTask ?? false;
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
                  hintText: 'Nama Materi',
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
              const Divider(),
              TextFormField(
                controller: _expController,
                decoration: const InputDecoration(
                  hintText: 'Penjelasan',
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
              ),
              CheckboxListTile(
                value: _isSelected,
                onChanged: (val) {
                  setState(() {
                    _isSelected = val ?? false;
                  });
                },
                title: const Text('Apakah ini merupakan tugas?'),
              ),
              SizedBox(height: 32.w),
              SizedBox(
                width: 1.sw,
                child: ElevatedButton(
                  onPressed: () {
                    final materialsCollection =
                        FirebaseFirestore.instance.collection('materials');
                    final data = {
                      'classId': args.classId,
                      'nama': _nameController.text,
                      'deskripsi': _descController.text,
                      'penjelasan': _expController.text,
                      'isTask': _isSelected,
                      'jawaban': [],
                    };

                    if (args.materialMdl != null) {
                      // Artinya update
                      materialsCollection
                          .doc(args.materialMdl?.id)
                          .update(data);
                    } else {
                      materialsCollection.add(data);
                    }

                    Get.back();
                  },
                  child: Text(
                    (args.materialMdl != null)
                        ? 'Update Materials'
                        : 'Add Materials',
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
