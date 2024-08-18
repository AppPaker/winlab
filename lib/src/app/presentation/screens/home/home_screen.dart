import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:winlab/src/app/presentation/components/app_logo_widget.dart';
import 'package:winlab/src/app/presentation/screens/home/widget/summary_widget.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedFromDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime selectedToDate = DateTime.now();

  List<DateTime> getDateOptions() {
    final today = DateTime.now();
    return List.generate(30, (index) => today.subtract(Duration(days: index)));
  }

  List<DateTime> dateOptions = [];

  @override
  void initState() {
    super.initState();
    dateOptions = getDateOptions();
    // Ensure the selected dates are in the options
    if (!dateOptions.contains(selectedFromDate)) {
      dateOptions.add(selectedFromDate);
    }
    if (!dateOptions.contains(selectedToDate)) {
      dateOptions.add(selectedToDate);
    }
    // Sort the date options
    dateOptions.sort((a, b) => b.compareTo(a));
  }

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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Padding(
                  padding: const EdgeInsets.only(left: kPadding),
                  child: AppLogoWidget(height: size.height / 100 * 3)),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kPadding * 3),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDateDropdown('Từ ngày', selectedFromDate,
                            (newValue) {
                          setState(() {
                            selectedFromDate = newValue!;
                          });
                        }),
                      ),
                      const SizedBox(width: kPadding * 3),
                      Expanded(
                        child: _buildDateDropdown('Đến ngày', selectedToDate,
                            (newValue) {
                          setState(() {
                            selectedToDate = newValue!;
                          });
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: kPadding * 2),
                  const SummaryWidget(),
                  const SizedBox(height: kPadding * 2),
                  // -------------------- Percentage of number of tests by groups --------------------
                  Container(
                    padding: const EdgeInsets.all(kPadding * 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kWhiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: kLightGreyColor,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text('Tỷ lệ số lượng xét nghiệm các nhóm',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkBlueColor)),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: PieChart(
                            PieChartData(
                              sections: _pieChartSections(),
                              centerSpaceRadius: 40,
                              sectionsSpace: 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: _pieChartIndicators(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kPadding * 2),

                  // -------------------- Patient density --------------------
                  Container(
                    padding: const EdgeInsets.all(kPadding * 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kWhiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: kLightGreyColor,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Một độ bệnh nhân',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kDarkBlueColor)),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: BarChart(
                            BarChartData(
                              barGroups: _patientData,
                              titlesData: const FlTitlesData(show: true),
                              borderData: FlBorderData(show: false),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: kPadding * 2),
                  // -------------------- Machine running report --------------------
                  Container(
                    padding: const EdgeInsets.all(kPadding * 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kWhiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: kLightGreyColor,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Báo cáo chạy máy',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kDarkBlueColor)),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: BarChart(
                            BarChartData(
                              barGroups: _machineData,
                              titlesData: const FlTitlesData(show: true),
                              borderData: FlBorderData(show: false),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: kPadding * 2),
                  // -------------------- Machine running report --------------------
                  Container(
                    padding: const EdgeInsets.all(kPadding * 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kWhiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: kLightGreyColor,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sales report',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kDarkBlueColor)),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: BarChart(
                            BarChartData(
                              barGroups: _revenueData,
                              titlesData: const FlTitlesData(show: true),
                              borderData: FlBorderData(show: false),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kPadding * 2),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildDateDropdown(
      String title, DateTime selectedDate, ValueChanged<DateTime?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        DropdownButton<DateTime>(
          value: selectedDate,
          onChanged: onChanged,
          items: dateOptions.map((DateTime date) {
            return DropdownMenuItem<DateTime>(
              value: date,
              child: Text(DateFormat('dd/MM/yyyy').format(date)),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<PieChartSectionData> _pieChartSections() {
    var textstyle = const TextStyle(
        color: kWhiteColor, fontWeight: FontWeight.w600, fontSize: 13);
    return [
      PieChartSectionData(
          titleStyle: textstyle,
          color: kBlueColor,
          value: 47,
          title: '47%',
          radius: 50),
      PieChartSectionData(
          titleStyle: textstyle,
          color: kYellowColor,
          value: 21,
          title: '21%',
          radius: 50),
      PieChartSectionData(
          titleStyle: textstyle,
          color: kPurpleColor,
          value: 11,
          title: '11%',
          radius: 50),
      PieChartSectionData(
          titleStyle: textstyle,
          color: kBrownColor,
          value: 27,
          title: '27%',
          radius: 50),
      PieChartSectionData(
          titleStyle: textstyle,
          color: kRedColor,
          value: 17,
          title: '17%',
          radius: 50),
      PieChartSectionData(
          titleStyle: textstyle,
          color: kBabyPinkColor,
          value: 7,
          title: '7%',
          radius: 50),
      PieChartSectionData(
          titleStyle: textstyle,
          color: kSkyBlueColor,
          value: 6,
          title: '6%',
          radius: 50),
    ];
  }

  List<Widget> _pieChartIndicators() {
    final labels = [
      '0110',
      'D',
      'DM',
      'GPB',
      'GPTB',
      'HH',
      'HTN',
      'KM',
      'MD',
      'NT',
      'SH',
      'SHPT',
      'TB',
      'VS',
      'VSSHPT'
    ];
    final colors = [
      kGreenColor,
      kRedColor,
      kOrangeColor,
      kGreenColor,
      kGreenColor,
      kRedColor,
      kBabyPinkColor,
      kSkyBlueColor,
      kBlueColor,
      kPurpleColor,
      kBlueColor,
      kPinkColor,
      kBlackColor,
      kPurpleColor,
      kBabyPinkColor,
    ];
    return List.generate(labels.length, (index) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 16, height: 16, color: colors[index]),
          const SizedBox(width: 8),
          Text(labels[index]),
        ],
      );
    });
  }

  static List<BarChartGroupData> get _patientData {
    double width = 30;
    var radius = BorderRadius.circular(kRadius / 2);
    return [
      BarChartGroupData(x: 0, barRods: [
        BarChartRodData(
            toY: 8, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 1, barRods: [
        BarChartRodData(
            toY: 10, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 2, barRods: [
        BarChartRodData(
            toY: 14, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 3, barRods: [
        BarChartRodData(
            toY: 15, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 4, barRods: [
        BarChartRodData(
            toY: 5, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 5, barRods: [
        BarChartRodData(
            toY: 2, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 6, barRods: [
        BarChartRodData(
            toY: 19, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 7, barRods: [
        BarChartRodData(
            toY: 3, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
    ];
  }

  static List<BarChartGroupData> get _machineData {
    double width = 30;
    var radius = BorderRadius.circular(kRadius / 2);
    return [
      BarChartGroupData(x: 3, barRods: [
        BarChartRodData(
            toY: 15, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 4, barRods: [
        BarChartRodData(
            toY: 5, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 5, barRods: [
        BarChartRodData(
            toY: 2, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 6, barRods: [
        BarChartRodData(
            toY: 19, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 7, barRods: [
        BarChartRodData(
            toY: 3, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
    ];
  }

  static List<BarChartGroupData> get _revenueData {
    double width = 30;
    var radius = BorderRadius.circular(kRadius / 2);
    return [
      BarChartGroupData(x: 3, barRods: [
        BarChartRodData(
            toY: 15, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
      BarChartGroupData(x: 7, barRods: [
        BarChartRodData(
            toY: 3, width: width, borderRadius: radius, color: kSecondaryColor)
      ]),
    ];
  }
}
