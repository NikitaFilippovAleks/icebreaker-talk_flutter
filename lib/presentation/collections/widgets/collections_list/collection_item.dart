part of 'index.dart';

class CollectionItem extends StatefulWidget {
  const CollectionItem({
    super.key,
    required this.collection,
    required this.color,
    this.isReversed = false,
  });
  final Collection collection;
  final Color color;
  final bool isReversed;

  @override
  State<CollectionItem> createState() => _CollectionItemState();
}

class _CollectionItemState extends State<CollectionItem> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
  }

  Future<void> _onTap(BuildContext context) async {
    if (_isNavigating) return;
    _isNavigating = true;

    await _animationController.forward();
    if (!mounted) {
      _isNavigating = false;
      return;
    }

    await CollectionRoute(
      id: widget.collection.id,
      color: widget.collection.color,
    ).push(this.context);

    if (mounted) {
      await Future.delayed(const Duration(milliseconds: 300));
      await _animationController.reverse();
    }
    _isNavigating = false;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => _onTap(context),
    child: CollectionHeroBackground(
      id: widget.collection.id,
      color: widget.collection.color,
      child: Row(
        children: widget.isReversed
            ? _buildContent(context).reversed.toList()
            : _buildContent(context),
      ),
    ),
  );

  List<Expanded> _buildContent(BuildContext context) {
    final theme = context.customTheme;
    final t = context.t;

    return [
      Expanded(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Opacity(opacity: _opacityAnimation.value, child: child),
          child: GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25.h,
              children: [
                Text(widget.collection.name, style: theme.labelLargeMontserrat),
                Text(widget.collection.description, style: theme.bodyMediumManrope),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Text(
                        t.collections.questions_count(n: widget.collection.questions.length),
                        style: theme.bodyMediumMontserrat.copyWith(color: theme.white),
                      ),
                    ),
                    ButtonsGlass(
                      child: Assets.icons.arrow45.svg(
                        colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      const Expanded(child: SizedBox()),
    ];
  }
}
