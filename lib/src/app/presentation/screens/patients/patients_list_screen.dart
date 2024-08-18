import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:winlab/src/app/presentation/components/custom_button.dart';
import 'package:winlab/src/app/presentation/routes/routes_navigator.dart';
import 'package:winlab/src/app/presentation/screens/patients/patient_details_screen.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/consts.dart';

enum FilterOption { all, enoughResults, lackingResults, printed, notPrinted }

class PatientsListScreen extends StatefulWidget {
  const PatientsListScreen({super.key});

  @override
  State<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  List<DateTime> getDateOptions() {
    final today = DateTime.now();
    return List.generate(
        30,
        (index) => DateTime(today.year, today.month, today.day)
            .subtract(Duration(days: index)));
  }

  DateTime? fromDate;
  DateTime? toDate;

  @override
  void initState() {
    super.initState();
    fromDate = getDateOptions().first;
    toDate = getDateOptions().first;
  }

  FilterOption _selectedFilter = FilterOption.all;
  String _getFilterOptionTitle(FilterOption option) {
    switch (option) {
      case FilterOption.all:
        return 'Tất cả';
      case FilterOption.enoughResults:
        return 'Đủ kết quả';
      case FilterOption.lackingResults:
        return 'Thiếu kết quả';
      case FilterOption.printed:
        return 'Đã in';
      case FilterOption.notPrinted:
        return 'Chưa in';
    }
  }

  List<String> patientsList = [
    'LA Thị Lan',
    'Bùi Văn Điệp',
    'Vương Thanh Duyên',
    'Vương Thanh Duyên',
    'LA Thị Lan',
    'Bùi Văn Điệp',
    'Vương Thanh Duyên',
    'Vương Thanh Duyên',
    'Bùi Văn Điệp',
    'Vương Thanh Duyên',
    'Vương Thanh Duyên',
    'Bùi Văn Điệp',
    'Vương Thanh Duyên',
    'Vương Thanh Duyên',
    'Vương Thanh Duyên',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Padding(
              padding: EdgeInsets.only(left: kPadding),
              child: Text(
                "Danh sách bệnh nhân",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding * 2.5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: kPadding * 3),
                  // <------------------------  Search Bar ------------------------>

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm',
                      contentPadding: const EdgeInsets.all(0),
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kRadius),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Filters
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton<DateTime>(
                          value: fromDate,
                          items: getDateOptions().map((DateTime date) {
                            return DropdownMenuItem<DateTime>(
                              value: date,
                              child: Text(DateFormat('dd/MM/yyyy').format(date),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: kBlackColor)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              fromDate = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton<DateTime>(
                          value: toDate,
                          items: getDateOptions().map((DateTime date) {
                            return DropdownMenuItem<DateTime>(
                              value: date,
                              child: Text(DateFormat('dd/MM/yyyy').format(date),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: kBlackColor)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              toDate = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kPadding * 2),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: 'Nhóm XH',
                          items: ['Nhóm XH', 'Group 1', 'Group 2']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: kBlackColor)),
                            );
                          }).toList(),
                          onChanged: (newValue) {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton<String>(
                          value: 'Loại BN',
                          items: ['Loại BN', 'Type 1', 'Type 2']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: kBlackColor)),
                            );
                          }).toList(),
                          onChanged: (newValue) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kPadding),
                  const Text('Kết quả',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kBlackColor)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: FilterOption.values.map((FilterOption option) {
                        return SizedBox(
                            child: Row(
                          children: [
                            Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: option,
                              activeColor: kPrimaryColor,
                              groupValue: _selectedFilter,
                              onChanged: (FilterOption? value) {
                                setState(() {
                                  _selectedFilter = value!;
                                });
                              },
                            ),
                            Text(
                              _getFilterOptionTitle(option),
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: kDarkBlueColor),
                            ),
                          ],
                        ));
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: kPadding * 2),
                  Center(
                    child: SizedBox(
                      width: size.width * 0.5,
                      height: size.height / 100 * 6,
                      child: CustomButton(
                          onPressed: () {},
                          showLoadingIndicator: true,
                          text: "Tìm kiếm"),
                    ),
                  ),

                  const SizedBox(height: 16),
                  // Patient List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: patientsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          RouteNavigator.route(
                              context, const PatientDetailsScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kPadding / 2),
                          child: Container(
                            padding: const EdgeInsets.all(kPadding),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kRadius),
                                border: Border.all(color: kGreyColor)),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: kWhiteColor,
                                  child: CircleAvatar(
                                      radius: 8, backgroundColor: kGreenColor),
                                ),
                                const SizedBox(
                                  width: kPadding * 2,
                                ),
                                const Text(
                                  '220424-121993',
                                  style: TextStyle(
                                      color: kBlueColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: kPadding * 2,
                                ),
                                Text(
                                  patientsList[index],
                                  style: const TextStyle(
                                      color: kBlueColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                const Row(
                                  children: [
                                    Text(
                                      '1993',
                                      style: TextStyle(
                                          color: kBlueColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: kBlueColor,
                                      size: 15,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
