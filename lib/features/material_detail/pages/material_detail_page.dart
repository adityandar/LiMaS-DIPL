import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:we_help_app/shared/shared.dart';

import '../../../models/material_mdl.dart';

const String materialDetailStudentPageRoute = '/material-detail-student';
const String materialDetailTeacherPageRoute = '/material-detail-teacher';

class MaterialDetailPage extends StatefulWidget {
  MaterialDetailPage.student({Key? key})
      : role = 'student',
        super(key: key);
  MaterialDetailPage.teacher({Key? key})
      : role = 'teacher',
        super(key: key);

  final String role;

  @override
  State<MaterialDetailPage> createState() => _MaterialDetailPageState();
}

class _MaterialDetailPageState extends State<MaterialDetailPage> {
  final MaterialMdl args = Get.arguments as MaterialMdl;
  final TextEditingController _answerController = TextEditingController();
  bool answered = false;
  final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  String jawaban = '';

  @override
  void initState() {
    super.initState();
    args.jawaban.forEach((element) {
      if (element[userId] != null) {
        setState(() {
          answered = true;
          jawaban = element[userId];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isTeacher = widget.role == 'teacher';
    return Scaffold(
      appBar: AppBar(
        title: Text(args.nama),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Deskripsi: '),
              Text(
                args.deskripsi,
                style: textButtonNormal(color: blackColor),
              ),
              const Text('Penjelasan Tambahan: '),
              Text(
                args.penjelasan,
                style: textButtonNormal(color: blackColor),
              ),
              if (args.isTask && !isTeacher && !answered) ...[
                TextFormField(
                  controller: _answerController,
                  decoration: const InputDecoration(labelText: 'Jawaban'),
                ),
                SizedBox(
                  width: 1.sw,
                  child: ElevatedButton(
                    onPressed: () {
                      var listJawaban = List.from(args.jawaban);
                      listJawaban.add({
                        userId: _answerController.text,
                      });
                      final materialsCollection =
                          FirebaseFirestore.instance.collection('materials');
                      materialsCollection.doc(args.id).update({
                        'jawaban': listJawaban,
                      });
                      setState(() {
                        answered = true;
                        jawaban = _answerController.text;
                      });
                      Get.snackbar('Berhasil', 'Jawaban berhasil disimpan');
                    },
                    child: Text(
                      'Submit jawaban',
                    ),
                  ),
                ),
              ] else ...[
                if (!isTeacher) ...[
                  const Text('Jawaban anda: '),
                  Text(
                    jawaban,
                    style: textButtonNormal(color: blackColor),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
