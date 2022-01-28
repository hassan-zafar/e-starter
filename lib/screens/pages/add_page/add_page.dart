import 'dart:io';

import 'package:estartup/database/auth_methods.dart';
import 'package:estartup/database/idea_api.dart';
import 'package:estartup/models/idea.dart';
import 'package:estartup/utilities/custom_validator.dart';
import 'package:estartup/utilities/utilities.dart';
import 'package:estartup/widgets/custom_elevated_button.dart';
import 'package:estartup/widgets/custom_textformfield.dart';
import 'package:estartup/widgets/custom_toast.dart';
import 'package:estartup/widgets/show_loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final List<PlatformFile?> _files = <PlatformFile?>[];
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  UploadTask? task;
  File? file;

  String? fileUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Idea',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                CustomTextFormField(
                  controller: _title,
                  hint: 'Title of your idea',
                  validator: (value) => CustomValidator.isEmpty(value),
                ),
                CustomTextFormField(
                  controller: _description,
                  hint: 'Describe your business idea',
                  maxLines: 6,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  validator: (value) => CustomValidator.isEmpty(value),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () => _fetchFile(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('${_files.length} Files attached'),
                          const SizedBox(width: 6),
                          const Icon(Icons.attachment_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomElevatedButton(
                  title: 'Post',
                  onTap: () async {
                    if (_key.currentState!.validate()) {
                      showLoadingDislog(context);
                      await uploadFile();
                      Idea _idea = Idea(
                          title: _title.text.trim(),
                          description: _description.text.trim(),
                          documents: [],
                          fileUrl: fileUrl);
                      final bool _done = await IdeaAPI().addIdea(_idea);
                      Navigator.of(context).pop();
                      if (_done) {
                        _title.text = '';
                        _description.text = '';
                        _files.clear();
                        CustomToast.successToast(message: 'Idea Posted');
                      } else {
                        CustomToast.errorToast(message: 'Some Error Found!!');
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static UploadTask? uploadFileFirebase(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  _fetchFile() async {
    // final FilePickerResult? _result = await FilePicker.platform.pickFiles(
    //   allowMultiple: false,
    //   type: FileType.custom,
    //   allowedExtensions: ['pdf', 'doc', 'docx'],
    // );
    // if (_result == null) return;
    // _files.clear();
    // for (PlatformFile element in _result.files) {
    //   _files.add(element);
    // }

    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() {
      file = File(path);
    });
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = _title.text;
    final destination = 'ideaFiles/$fileName';

    task = uploadFileFirebase(destination, file!);

    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    // fullPath = destination;
    setState(() {
      fileUrl = urlDownload;
    });
    CustomToast.successToast(message: "File Uploaded SuccessFully");
    print('Download-Link: $urlDownload');
  }
}
