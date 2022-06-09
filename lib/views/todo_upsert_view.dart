import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/TodoDB.dart';
import '../model/todo.dart';
import '../widgets/custom_gradient_item.dart';

class UpsertTodoList extends StatefulWidget {
  const UpsertTodoList({Key? key, required this.defaultItem}) : super(key: key);
  final Todo defaultItem;

  @override
  _UpsertTodoListState createState() => _UpsertTodoListState();
}

class _UpsertTodoListState extends State<UpsertTodoList> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _detail = TextEditingController();
  final TextEditingController? _endDate = TextEditingController();
  int? _id = 0;
  bool _isTop = false;
  bool _validate  = false;

  @override
  void initState() {
    _id = widget.defaultItem.id;
    _title.text = widget.defaultItem.title;
    _detail.text = widget.defaultItem.detail;
    _endDate?.text =  DateFormat('yyyy-MM-dd').format(widget.defaultItem.endDate??DateTime.now());
    _isTop = widget.defaultItem.top;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return upsertItem();
  }

  Widget upsertItem() {
    String? _checkValueValidate(TextEditingController value) {
      return value.text.isEmpty? '請填寫': null;
    }

    return Padding(
      padding: EdgeInsets.only( top: 10, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 5),
      child: Wrap(
        children: <Widget>[
          Text(
            "添加新提示事項",
            style: Theme.of(context).textTheme.headline6,
          ),
          TextField(
            controller: _title,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: '標題',
              errorText:  _validate ? _checkValueValidate(_title) : null
            ),
          ),
          TextField(
            controller: _detail,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: '詳細說明',
              errorText: _validate ? _checkValueValidate(_detail): null
            ),
          ),
          TextField(
            controller: _endDate, 
            decoration: const InputDecoration( 
                icon: Icon(Icons.calendar_today), 
                labelText: "應完成日期" 
            ),
            readOnly: true, 
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101)
              );
              
              if(pickedDate != null ){
                setState(() {
                    _endDate?.text =  DateFormat('yyyy-MM-dd').format(pickedDate);
                });
              }
            },
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: getStarStyle(_isTop),
                onPressed: () {
                  setState(() {
                    _isTop = !_isTop;
                  });
                },
              ), 
              GradientButton(
                text: const Text("儲存"), 
                gradientColors: const [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _validate = _title.value.text.isEmpty || _detail.value.text.isEmpty;
                  });

                  if (!_validate) {
                    Navigator.of(context).pop(Todo(
                      id: _id,
                      title: _title.text, 
                      detail: _detail.text, 
                      top: _isTop,
                      isfinish: false,
                      endDate: DateFormat('yyyy-MM-dd').parse(_endDate!.text),
                    ));
                    _title.clear();
                    _detail.clear();
                  }
                },
              )
            ],
          ),
        ],
      )
    );
  }
}