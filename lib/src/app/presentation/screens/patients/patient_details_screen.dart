import 'package:flutter/material.dart';
import 'package:winlab/src/app/presentation/screens/patients/widget/patient_bottom_icon_widget.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/assets.dart';
import 'package:winlab/src/app/presentation/utils/consts.dart';

import 'widget/patient_list.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  bool selectAll = false;
  List<bool> selected = [];


  @override
  void initState() {
    super.initState();
    selected = List<bool>.filled(data.length, false);
  }

  void _toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      for (int i = 0; i < selected.length; i++) {
        selected[i] = selectAll;
      }
    });
  }

  void _toggleSelection(int index, bool? value) {
    setState(() {
      selected[index] = value!;
    });
  }

  Color _getResultColor(String result) {
    // We'll just return red if the result is less than 5.0
    return double.tryParse(result) != null && double.parse(result) < 5.0
        ? kRedColor
        : kBlackColor;
  }

  void _showTextFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nhập nội dung ghi chú'),
          content: const TextField(
            decoration: InputDecoration(
              hintText: 'Nhập nội dung ghi chú',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Hủy',
                style: TextStyle(color: kRedColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Xác nhận'),
              onPressed: () {
                // Handle the OK button press
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w700, color: kBlackColor);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding * 2, vertical: kPadding),
        decoration: const BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kLightGreyColor,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PatientBottomCardWidget(
              onTap: () {
                Navigator.pop(context);
              },
              image: Assets.svg.detailBackSVG,
              title: "Quay lại",
            ),
            PatientBottomCardWidget(
              image: Assets.svg.detailApproveSVG,
              title: "Duyệt KQ",
            ),
            PatientBottomCardWidget(
              image: Assets.svg.detailCancelSVG,
              title: "Hủy duyệt KQ",
            ),
            PatientBottomCardWidget(
              image: Assets.svg.detailCalculateSVG,
              title: "Tính toán KQ",
            ),
            PatientBottomCardWidget(
              onTap: () {
                _showTextFieldDialog(context);
              },
              image: Assets.svg.detailNoteSVG,
              title: "Ghi chú",
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: kPadding),
          child: Text(
            "Nguyễn Thị Dung - F - 1990",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: kBlackColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: kWhiteColor,
              child: const Padding(
                padding: EdgeInsets.all(kPadding),
                child: Text(
                  '121887(24007731) Nguyễn Thị Dung |F|1950|Phường Trung Hòa, Quận Cầu Giấ, Hà Nội',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 220,
                    child: Column(
                      children: [
                        Container(
                          color: kWhiteColor,
                          height: 56,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: kPrimaryColor,
                                value: selectAll,
                                onChanged: (value) {
                                  _toggleSelectAll();
                                },
                              ),
                               SizedBox(
                                    width: 150,
                                    child: Text('Tên xét nghiệm',
                                        style: textStyle)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: kWhiteColor,
                                height: 56,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      activeColor: kPrimaryColor,
                                      value: selected[index],
                                      onChanged: (value) {
                                        _toggleSelection(index, value);
                                      },
                                    ),
                                    SizedBox(
                                        width: 150,
                                        child: Text(
                                          data[index]['testName']!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: data[index]
                                                        ['testNameIsBold'] ==
                                                    'true'
                                                ? FontWeight.bold
                                                : FontWeight.w400,
                                            color: kBlackColor,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                     
                     
                     
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: kWhiteColor,
                            height: 56,
                            child: Row(
                              children: [
                               
                                SizedBox(
                                    width: 100,
                                    child: Text('Kết quả', style: textStyle)),
                                SizedBox(
                                    width: 100,
                                    child: Text('Đơn vị', style: textStyle)),
                                SizedBox(
                                    width: 100,
                                    child: Text('CSBT', style: textStyle)),
                                SizedBox(
                                    width: 100,
                                    child: Text('Valid', style: textStyle)),
                                SizedBox(
                                    width: 100,
                                    child:
                                        Text('KQ tiến sử', style: textStyle)),
                                SizedBox(
                                    width: 100,
                                    child:
                                        Text('SD tiến sử', style: textStyle)),
                                SizedBox(
                                    width: 100,
                                    child: Text('UserV', style: textStyle)),
                                SizedBox(
                                    width: 100,
                                    child: Text('CSBT', style: textStyle)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ListView.builder(
                             
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: kWhiteColor,
                                  height: 56,
                                  child: Row(
                                    children: [
                                     
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            data[index]['result']!,
                                            style: TextStyle(
                                              color: _getResultColor(
                                                  data[index]['result']!),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            data[index]['unit']!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: kBlackColor),
                                          )),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            data[index]['csbt']!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: kBlackColor),
                                          )),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            data[index]['valid']!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: kBlackColor),
                                          )),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            data[index]['previousResult']!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: kBlackColor),
                                          )),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            data[index]['sdResult']!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: kBlackColor),
                                          )),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            data[index]['user']!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: kBlackColor),
                                          )),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            data[index]['csbtValue']!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: kBlackColor),
                                          )),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                       
                        ],
                      ),
                    ),
                  ),
               
               
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
