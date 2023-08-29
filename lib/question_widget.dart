import 'package:flutter/material.dart';
import 'package:questions_ans/question.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;

  const QuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final valueController = TextEditingController();
  int? marks;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${widget.question.question}='),
          SizedBox(
            width: 100.0,
            child: TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
      trailing: SizedBox(
          width: 50,
          child: (marks == null)
              ? Container()
              : (marks == 0)
                  ? const Icon(
                      Icons.clear,
                      color: Colors.red,
                      size: 30.0,
                    )
                  : const Icon(Icons.check, color: Colors.green, size: 30.0)),
    );
  }

  @override
  void initState() {
    super.initState();
    valueController.addListener(_calculate);
  }

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (valueController.value.text == "") {
      setState(() {
        marks = null;
      });
    } else {
      setState(() {
        marks = widget.question.answear == int.parse(valueController.value.text) ? widget.question.marks : 0;
      });
    }
  }
}
