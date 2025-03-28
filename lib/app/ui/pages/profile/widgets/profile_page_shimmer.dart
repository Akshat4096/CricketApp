import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePageShimmer extends StatelessWidget {
  const ProfilePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildShimmerCircle(context, diameter: 120),
        buildSizedBoxH(20),
        _buildShimmerLine(context, width: 200, height: 20),
        buildSizedBoxH(8),
        _buildShimmerLine(context, width: 150, height: 16),
        buildSizedBoxH(40),
        _buildMenuShimmers(context),
      ],
    );
  }

  Widget _buildShimmerCircle(BuildContext context, {required double diameter}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        width: diameter.w,
        height: diameter.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildShimmerLine(BuildContext context,
      {required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  Widget _buildMenuShimmers(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              Expanded(
                child: _buildShimmerLine(context,
                    width: double.infinity, height: 50.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
