import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_request_model.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_containter_widget.dart';

import '../../../../common/util/exports.dart';

class AgentRequestCard extends StatelessWidget {
  final AgentRequestModel agentModel;
  final Function onAgentRequestTap;
  const AgentRequestCard({Key? key, required this.agentModel, required this.onAgentRequestTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: SizedBox(
        height: 80.h,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '27 DEC, 12:30 AM',
                  style: TextStyle(
                    color: AppColors.indigo,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    
                    onAgentRequestTap();
                  },
                  child: Text(
                    agentModel.agentVerificationStatus
                        .toString()
                        .split(".")[1]
                        .replaceAll("_", " "),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      agentModel.name!,
                      style: TextStyle(
                        color: AppColors.indigo,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      agentModel.address!,
                      style: TextStyle(
                        color: AppColors.hintInfotextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 40.h,
                  width: 40.h,
                  child: CustomContainer(
                    containerColor: AppColors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.directions,
                          color: AppColors.blue,
                        ),
                        Text(
                          "5KM",
                          style: TextStyle(
                            color: AppColors.indigo,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    borderColor: AppColors.white,
                  ),
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  height: 40.h,
                  width: 40.h,
                  child: CustomContainer(
                    containerColor: AppColors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.call,
                          color: AppColors.blue,
                        ),
                        Text(
                          "call",
                          style: TextStyle(
                            color: AppColors.indigo,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    borderColor: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
