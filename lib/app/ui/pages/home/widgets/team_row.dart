import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class TeamRow extends StatelessWidget {
  final bool isCompleted;
  final String flag;
  final String name;
  final String score;
  final String? overs;

  const TeamRow({
    super.key,
    this.isCompleted = false,
    required this.flag,
    required this.name,
    required this.score,
    this.overs,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium;

    return Row(
      children: [
        isCompleted ?  Icon(Icons.flag, color: Colors.white,): _buildTeamFlag(),
        buildSizedboxW(12),
        _buildTeamName(context, textStyle),
        _buildTeamScore(textStyle),
        if (overs != null) _buildOvers(textStyle),
      ],
    );
  }

  // Builds the team flag with proper styling and dimensions
  Widget _buildTeamFlag() {
    return CustomImageView(
        height: isCompleted ? 5.h : 35.h,
        margin: const EdgeInsets.all(2),
        imagePath: isCompleted ? "assets/images/ic_cricket_bat.png" : flag ,
        fit: BoxFit.cover,
        radius: BorderRadius.circular(24.0.r));
  }

  // Builds the team name with the provided text style
  Widget _buildTeamName(BuildContext context, TextStyle? textStyle) {
    return Expanded(
      child: Text(
        name,
        style: textStyle?.copyWith(
          fontSize: 14.0.sp,
        ),
      ),
    );
  }

  // Builds the team score with the provided text style
  Widget _buildTeamScore(TextStyle? textStyle) {
    return Text(
      score,
      style: textStyle?.copyWith(
        fontSize: 14.0.sp,
      ),
    );
  }

  // Builds the overs text (if available) with custom styling
  Widget _buildOvers(TextStyle? textStyle) {
    return Padding(
      padding: EdgeInsets.only(left: 4.0.w),
      child: Text(
        overs!,
        style: textStyle?.copyWith(
          fontSize: 10.0.sp,
          fontWeight: FontWeight.w400,
          color: ThemeData().customColors.onboardingH1Color,
        ),
      ),
    );
  }
}
