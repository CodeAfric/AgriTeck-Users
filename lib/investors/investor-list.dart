import 'package:agriteck_user/investors/investor-details-screen.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'file:///C:/Users/emman/StudioProjects/AgriTeck-Users/lib/common%20UI/filter_buttons.dart';

class InvestorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      //height: size.height * 0.70,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: primaryLight.withOpacity(0.3),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 80.0),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      child: ListItems(
                        diseaseImage: 'assets/diseases/disease1.jpg',
                        diseaseName: 'Curly flew Shoot',
                        plantType: 'general grass',
                      ),
                    ),
                    onTap: () {
                      navigateToInvestorDetails(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  final String diseaseImage;
  final String diseaseName;
  final String plantType;

  const ListItems(
      {Key key, this.diseaseImage, this.diseaseName, this.plantType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    child: Image.asset(
                      diseaseImage,
                      fit: BoxFit.cover,
                      height: 90,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          diseaseName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: primaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          plantType,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right_outlined,
                  color: primaryLight,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future navigateToInvestorDetails(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => InvestorDetailsScreen()));
}
