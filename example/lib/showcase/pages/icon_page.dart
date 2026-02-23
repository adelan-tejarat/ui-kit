import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vamstreet_uikit/src/core/constants/dimens.dart';
import 'package:vamstreet_uikit/src/core/themes/app_colors.dart';
import 'package:vamstreet_uikit/src/core/themes/radius.dart';
import 'package:vamstreet_uikit/src/core/themes/typography.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:vamstreet_uikit/src/core/utils/gen/assets/assets.gen.dart'
    show Assets;

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<AssetIcon> _allIcons = [];
  List<AssetIcon> _filteredIcons = [];
  bool _isLoading = true;

  // رنگ‌های مختلف برای آیکون‌ها
  final List<Color> _iconColors = [
    const Color(AppColors.violet500),
    const Color(AppColors.sky500),
    const Color(AppColors.green500),
    const Color(AppColors.amber500),
    const Color(AppColors.pink500),
    const Color(AppColors.brand500),
    const Color(AppColors.red500),
    const Color(AppColors.neutral700),
  ];

  @override
  void initState() {
    super.initState();
    _loadIcons();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _filterIcons();
    });
  }

  void _loadIcons() {
    _allIcons = _getManualIconList();
    _allIcons.sort((a, b) => a.name.compareTo(b.name));

    setState(() {
      _isLoading = false;
    });
  }

  List<AssetIcon> _getAllIconsFromAssets() {
    final icons = <AssetIcon>[];

    // دریافت تمام فیلدهای استاتیک کلاس Assets.svg
    const assetIcons = Assets.svg;

    // استفاده از reflection-like approach برای دسترسی به فیلدها
    final iconFields = <String, dynamic>{};

    // اینجا باید تمام فیلدهای Assets.svg رو اضافه کنیم
    // روش ساده‌تر: استفاده از map دستی یا استفاده از package:reflectable
    // اما برای سادگی، می‌تونیم از reflection با dart:mirrors استفاده کنیم
    // یا اینکه یه لیست دستی ازشون درست کنیم

    // روش پیشنهادی: استفاده از یه اسکریپت برای تولید این لیست
    // یا استفاده از package:reflectable برای reflection

    return icons;
  }

  // روش جایگزین: استفاده از لیست دستی با کمک flutter gen
  // این متد رو بعد از اجرای flutter gen و دیدن خروجی تکمیل می‌کنیم
  List<AssetIcon> _getManualIconList() {
    return [
      AssetIcon('academic-cap', Assets.svg.academicCap),
      AssetIcon('home', Assets.svg.home),
      AssetIcon('adjustments', Assets.svg.adjustments),
      AssetIcon('annotation', Assets.svg.annotation),
      AssetIcon('archive', Assets.svg.archive),
      AssetIcon('inbox-in', Assets.svg.inboxIn),
      AssetIcon('identification', Assets.svg.identification),
      AssetIcon('inbox', Assets.svg.inbox),
      AssetIcon('arrow-circle-down', Assets.svg.arrowCircleDown),
      AssetIcon('arrow-circle-left', Assets.svg.arrowCircleLeft),
      AssetIcon('information-circle', Assets.svg.informationCircle),
      AssetIcon('key', Assets.svg.key),
      AssetIcon('library', Assets.svg.library),
      AssetIcon('light-bulb', Assets.svg.lightBulb),
      AssetIcon('lightning-bolt', Assets.svg.lightningBolt),
      AssetIcon('link', Assets.svg.link),
      AssetIcon('location-marker', Assets.svg.locationMarker),
      AssetIcon('lock-closed', Assets.svg.lockClosed),
      AssetIcon('lock-open', Assets.svg.lockOpen),
      AssetIcon('login', Assets.svg.login),
      AssetIcon('logout', Assets.svg.logout),
      AssetIcon('mail-open', Assets.svg.mailOpen),
      AssetIcon('mail', Assets.svg.mail),
      AssetIcon('map', Assets.svg.map),
      AssetIcon('menu-alt-1', Assets.svg.menuAlt1),
      AssetIcon('menu-alt-2', Assets.svg.menuAlt2),
      AssetIcon('menu-alt-3', Assets.svg.menuAlt3),
      AssetIcon('menu-alt-4', Assets.svg.menuAlt4),
      AssetIcon('menu', Assets.svg.menu),
      AssetIcon('microphone', Assets.svg.microphone),
      AssetIcon('minus-circle', Assets.svg.minusCircle),
      AssetIcon('minus', Assets.svg.minus),
      AssetIcon('moon', Assets.svg.moon),
      AssetIcon('music-note', Assets.svg.musicNote),
      AssetIcon('newspaper', Assets.svg.newspaper),
      AssetIcon('office-building', Assets.svg.officeBuilding),
      AssetIcon('paper-airplane', Assets.svg.paperAirplane),
      AssetIcon('paper-clip', Assets.svg.paperClip),
      AssetIcon('pause', Assets.svg.pause),
      AssetIcon('pencil-alt', Assets.svg.pencilAlt),
      AssetIcon('pencil', Assets.svg.pencil),
      AssetIcon('phone-incoming', Assets.svg.phoneIncoming),
      AssetIcon('phone-missed-call', Assets.svg.phoneMissedCall),
      AssetIcon('phone-outgoing', Assets.svg.phoneOutgoing),
      AssetIcon('phone', Assets.svg.phone),
      AssetIcon('photograph', Assets.svg.photograph),
      AssetIcon('play', Assets.svg.play),
      AssetIcon('plus-circle', Assets.svg.plusCircle),
      AssetIcon('plus', Assets.svg.plus),
      AssetIcon('presentation-chart-bar', Assets.svg.presentationChartBar),
      AssetIcon('presentation-chart-line', Assets.svg.presentationChartLine),
      AssetIcon('printer', Assets.svg.printer),
      AssetIcon('puzzle', Assets.svg.puzzle),
      AssetIcon('qrcode', Assets.svg.qrcode),
      AssetIcon('question-mark-circle', Assets.svg.questionMarkCircle),
      AssetIcon('receipt-refund', Assets.svg.receiptRefund),
      AssetIcon('receipt-tax', Assets.svg.receiptTax),
      AssetIcon('refresh', Assets.svg.refresh),
      AssetIcon('reply', Assets.svg.reply),
      AssetIcon('rewind', Assets.svg.rewind),
      AssetIcon('rss', Assets.svg.rss),
      AssetIcon('save-as', Assets.svg.saveAs),
      AssetIcon('save', Assets.svg.save),
      AssetIcon('scale', Assets.svg.scale),
      AssetIcon('scissors', Assets.svg.scissors),
      AssetIcon('search-circle', Assets.svg.searchCircle),
      AssetIcon('search', Assets.svg.search),
      AssetIcon('selector', Assets.svg.selector),
      AssetIcon('server', Assets.svg.server),
      AssetIcon('share', Assets.svg.share),
      AssetIcon('shield-check', Assets.svg.shieldCheck),
      AssetIcon('shield-exclamation', Assets.svg.shieldExclamation),
      AssetIcon('shopping-bag', Assets.svg.shoppingBag),
      AssetIcon('shopping-cart', Assets.svg.shoppingCart),
      AssetIcon('sort-ascending', Assets.svg.sortAscending),
      AssetIcon('sort-descending', Assets.svg.sortDescending),
      AssetIcon('sparkles', Assets.svg.sparkles),
      AssetIcon('speakerphone', Assets.svg.speakerphone),
      AssetIcon('star', Assets.svg.star),
      AssetIcon('status-offline', Assets.svg.statusOffline),
      AssetIcon('status-online', Assets.svg.statusOnline),
      AssetIcon('stop', Assets.svg.stop),
      AssetIcon('sun', Assets.svg.sun),
      AssetIcon('support', Assets.svg.support),
      AssetIcon('switch-horizontal', Assets.svg.switchHorizontal),
      AssetIcon('switch-vertical', Assets.svg.switchVertical),
      AssetIcon('table', Assets.svg.table),
      AssetIcon('tag', Assets.svg.tag),
      AssetIcon('template', Assets.svg.template),
      AssetIcon('terminal', Assets.svg.terminal),
      AssetIcon('thumb-down', Assets.svg.thumbDown),
      AssetIcon('thumb-up', Assets.svg.thumbUp),
      AssetIcon('ticket', Assets.svg.ticket),
      AssetIcon('translate', Assets.svg.translate),
      AssetIcon('trash', Assets.svg.trash),
      AssetIcon('trending-down', Assets.svg.trendingDown),
      AssetIcon('trending-up', Assets.svg.trendingUp),
      AssetIcon('truck', Assets.svg.truck),
      AssetIcon('upload', Assets.svg.upload),
      AssetIcon('user-add', Assets.svg.userAdd),
      AssetIcon('user-circle', Assets.svg.userCircle),
      AssetIcon('user-group', Assets.svg.userGroup),
      AssetIcon('user-remove', Assets.svg.userRemove),
      AssetIcon('user', Assets.svg.user),
      AssetIcon('users', Assets.svg.users),
      AssetIcon('variable', Assets.svg.variable),
      AssetIcon('video-camera', Assets.svg.videoCamera),
      AssetIcon('view-boards', Assets.svg.viewBoards),
      AssetIcon('view-grid-add', Assets.svg.viewGridAdd),
      AssetIcon('view-grid', Assets.svg.viewGrid),
      AssetIcon('view-list', Assets.svg.viewList),
      AssetIcon('volume-off', Assets.svg.volumeOff),
      AssetIcon('volume-up', Assets.svg.volumeUp),
      AssetIcon('wifi', Assets.svg.wifi),
      AssetIcon('x-circle', Assets.svg.xCircle),
      AssetIcon('x', Assets.svg.x),
      AssetIcon('zoom-in', Assets.svg.zoomIn),
      AssetIcon('zoom-out', Assets.svg.zoomOut),
      AssetIcon('heart', Assets.svg.heart),
      AssetIcon('hand', Assets.svg.hand),
      AssetIcon('hashtag', Assets.svg.hashtag),
      AssetIcon('gift', Assets.svg.gift),
      AssetIcon('globe-alt', Assets.svg.globeAlt),
      AssetIcon('globe', Assets.svg.globe),
      AssetIcon('folder-add', Assets.svg.folderAdd),
      AssetIcon('folder-download', Assets.svg.folderDownload),
      AssetIcon('folder-open', Assets.svg.folderOpen),
      AssetIcon('folder-remove', Assets.svg.folderRemove),
      AssetIcon('folder', Assets.svg.folder),
      AssetIcon('flag', Assets.svg.flag),
      AssetIcon('fire', Assets.svg.fire),
      AssetIcon('finger-print', Assets.svg.fingerPrint),
      AssetIcon('film', Assets.svg.film),
      AssetIcon('filter', Assets.svg.filter),
      AssetIcon('fast-forward', Assets.svg.fastForward),
      AssetIcon('eye-off', Assets.svg.eyeOff),
      AssetIcon('eye', Assets.svg.eye),
      AssetIcon('external-link', Assets.svg.externalLink),
      AssetIcon('exclamation-circle', Assets.svg.exclamationCircle),
      AssetIcon('exclamation', Assets.svg.exclamation),
      AssetIcon('emoji-sad', Assets.svg.emojiSad),
      AssetIcon('emoji-happy', Assets.svg.emojiHappy),
      AssetIcon('duplicate', Assets.svg.duplicate),
      AssetIcon('download', Assets.svg.download),
      AssetIcon('dots-vertical', Assets.svg.dotsVertical),
      AssetIcon('dots-horizontal', Assets.svg.dotsHorizontal),
      AssetIcon('dots-circle-horizontal', Assets.svg.dotsCircleHorizontal),
      AssetIcon('document', Assets.svg.document),
      AssetIcon('document-text', Assets.svg.documentText),
      AssetIcon('document-search', Assets.svg.documentSearch),
      AssetIcon('document-report', Assets.svg.documentReport),
      AssetIcon('document-remove', Assets.svg.documentRemove),
      AssetIcon('document-duplicate', Assets.svg.documentDuplicate),
      AssetIcon('document-download', Assets.svg.documentDownload),
      AssetIcon('document-add', Assets.svg.documentAdd),
      AssetIcon('device-tablet', Assets.svg.deviceTablet),
      AssetIcon('device-mobile', Assets.svg.deviceMobile),
      AssetIcon('desktop-computer', Assets.svg.desktopComputer),
      AssetIcon('database', Assets.svg.database),
      AssetIcon('cursor-click', Assets.svg.cursorClick),
      AssetIcon('currency-yen', Assets.svg.currencyYen),
      AssetIcon('currency-rupee', Assets.svg.currencyRupee),
      AssetIcon('currency-pound', Assets.svg.currencyPound),
      AssetIcon('currency-euro', Assets.svg.currencyEuro),
      AssetIcon('currency-dollar', Assets.svg.currencyDollar),
      AssetIcon('currency-bangladeshi', Assets.svg.currencyBangladeshi),
      AssetIcon('cube-transparent', Assets.svg.cubeTransparent),
      AssetIcon('cube', Assets.svg.cube),
      AssetIcon('credit-card', Assets.svg.creditCard),
      AssetIcon('color-swatch', Assets.svg.colorSwatch),
      AssetIcon('collection', Assets.svg.collection),
      AssetIcon('code', Assets.svg.code),
      AssetIcon('cloud-upload', Assets.svg.cloudUpload),
      AssetIcon('cloud-download', Assets.svg.cloudDownload),
      AssetIcon('cloud', Assets.svg.cloud),
      AssetIcon('clock', Assets.svg.clock),
      AssetIcon('clipboard', Assets.svg.clipboard),
      AssetIcon('clipboard-list', Assets.svg.clipboardList),
      AssetIcon('clipboard-copy', Assets.svg.clipboardCopy),
      AssetIcon('clipboard-check', Assets.svg.clipboardCheck),
      AssetIcon('chip', Assets.svg.chip),
      AssetIcon('chevron-up', Assets.svg.chevronUp),
      AssetIcon('chevron-right', Assets.svg.chevronRight),
      AssetIcon('chevron-left', Assets.svg.chevronLeft),
      AssetIcon('chevron-down', Assets.svg.chevronDown),
      AssetIcon('chevron-double-up', Assets.svg.chevronDoubleUp),
      AssetIcon('chevron-double-right', Assets.svg.chevronDoubleRight),
      AssetIcon('chevron-double-left', Assets.svg.chevronDoubleLeft),
      AssetIcon('chevron-double-down', Assets.svg.chevronDoubleDown),
      AssetIcon('check', Assets.svg.check),
      AssetIcon('check-circle', Assets.svg.checkCircle),
      AssetIcon('chat', Assets.svg.chat),
      AssetIcon('chat-alt', Assets.svg.chatAlt),
      AssetIcon('chat-alt-2', Assets.svg.chatAlt2),
      AssetIcon('chart-square-bar', Assets.svg.chartSquareBar),
      AssetIcon('chart-pie', Assets.svg.chartPie),
      AssetIcon('chart-bar', Assets.svg.chartBar),
      AssetIcon('cash', Assets.svg.cash),
      AssetIcon('camera', Assets.svg.camera),
      AssetIcon('calendar', Assets.svg.calendar),
      AssetIcon('calculator', Assets.svg.calculator),
      AssetIcon('cake', Assets.svg.cake),
      AssetIcon('briefcase', Assets.svg.briefcase),
      AssetIcon('bookmark', Assets.svg.bookmark),
      AssetIcon('bookmark-alt', Assets.svg.bookmarkAlt),
      AssetIcon('book-open', Assets.svg.bookOpen),
      AssetIcon('bell', Assets.svg.bell),
      AssetIcon('beaker', Assets.svg.beaker),
      AssetIcon('ban', Assets.svg.ban),
      AssetIcon('bag-2', Assets.svg.bag2),
      AssetIcon('badge-check', Assets.svg.badgeCheck),
      AssetIcon('backspace', Assets.svg.backspace),
      AssetIcon('at-symbol', Assets.svg.atSymbol),
      AssetIcon('arrows-expand', Assets.svg.arrowsExpand),
      AssetIcon('arrow-up', Assets.svg.arrowUp),
      AssetIcon('arrow-right', Assets.svg.arrowRight),
      AssetIcon('arrow-narrow-up', Assets.svg.arrowNarrowUp),
      AssetIcon('arrow-narrow-right', Assets.svg.arrowNarrowRight),
      AssetIcon('arrow-narrow-left', Assets.svg.arrowNarrowLeft),
      AssetIcon('arrow-narrow-down', Assets.svg.arrowNarrowDown),
      AssetIcon('arrow-left', Assets.svg.arrowLeft),
      AssetIcon('arrow-down', Assets.svg.arrowDown),
      AssetIcon('arrow-circle-up', Assets.svg.arrowCircleUp),
      AssetIcon('arrow-circle-right', Assets.svg.arrowCircleRight),
    ];
  }

  void _filterIcons() {
    if (_searchQuery.isEmpty) {
      _filteredIcons = List.from(_allIcons);
    } else {
      _filteredIcons = _allIcons.where((icon) {
        return icon.name.toLowerCase().contains(_searchQuery);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons Showcase'),
        backgroundColor: const Color(AppColors.neutral50),
        elevation: Dimens.px0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildIconsGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px16),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        border: Border(
          bottom: BorderSide(
            color: const Color(AppColors.neutral200),
            width: Dimens.px1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(AppColors.neutral100),
              borderRadius: AppRadius.fullAll,
              border: Border.all(
                color: const Color(AppColors.neutral200),
                width: Dimens.px1,
              ),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search icons...',
                hintStyle: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: const Color(AppColors.neutral400),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: const Color(AppColors.neutral500),
                  size: Dimens.px20,
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: const Color(AppColors.neutral500),
                          size: Dimens.px20,
                        ),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Dimens.px16,
                  vertical: Dimens.px12,
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_filteredIcons.length} icons found',
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: const Color(AppColors.neutral600),
                ),
              ),
              Text(
                'Total: ${_allIcons.length} icons',
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: const Color(AppColors.neutral400),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(Dimens.px12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(MediaQuery.of(context).size.width),
        crossAxisSpacing: Dimens.px8,
        mainAxisSpacing: Dimens.px8,
        childAspectRatio: 1,
      ),
      itemCount: _allIcons.length,
      itemBuilder: (context, index) {
        final icon = _allIcons[index];
        final color = _iconColors[index % _iconColors.length];
        return _IconCard(icon: icon, color: color);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(Dimens.px24),
            decoration: BoxDecoration(
              color: const Color(AppColors.neutral100),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off,
              size: Dimens.px48,
              color: const Color(AppColors.neutral400),
            ),
          ),
          const SizedBox(height: Dimens.px16),
          Text(
            'No icons found',
            style: AppTypography.textTheme.titleMedium?.copyWith(
              color: const Color(AppColors.neutral700),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'Try searching with a different keyword',
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              color: const Color(AppColors.neutral500),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Dimens.px24),
          ElevatedButton(
            onPressed: () {
              _searchController.clear();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(AppColors.brand500),
              foregroundColor: const Color(AppColors.white),
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.px24,
                vertical: Dimens.px12,
              ),
              shape: RoundedRectangleBorder(borderRadius: AppRadius.fullAll),
            ),
            child: const Text('Clear Search'),
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width < 400) return 3;
    if (width < 600) return 4;
    if (width < 900) return 5;
    return 6;
  }
}

class AssetIcon {
  final String name;
  final String path; // مسیر فایل

  AssetIcon(this.name, this.path);
}

class _IconCard extends StatelessWidget {
  final AssetIcon icon;
  final Color color;

  const _IconCard({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _showIconDetails(context);
        },
        borderRadius: AppRadius.lgAll,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(AppColors.white),
            borderRadius: AppRadius.lgAll,
            border: Border.all(
              color: const Color(AppColors.neutral200),
              width: Dimens.px1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(Dimens.px12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  icon.path, // ✅ آیکون درست
                  package: 'vamstreet_uikit',
                  width: Dimens.px24,
                  height: Dimens.px24,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: Dimens.px8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.px4),
                child: Text(
                  icon.name,
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: const Color(AppColors.neutral700),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showIconDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _IconDetailsSheet(icon: icon, color: color),
    );
  }
}

class _IconDetailsSheet extends StatelessWidget {
  final AssetIcon icon;
  final Color color;

  const _IconDetailsSheet({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.xl2All,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: Dimens.px8),
            width: Dimens.px40,
            height: Dimens.px4,
            decoration: const BoxDecoration(
              color: const Color(AppColors.neutral300),
              borderRadius: AppRadius.fullAll,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.px24),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(Dimens.px24),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    icon.path,
                    width: Dimens.px64,
                    height: Dimens.px64,
                    package: 'vamstreet_uikit',
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                ),
                const SizedBox(height: Dimens.px16),
                Text(
                  icon.name,
                  style: AppTypography.textTheme.headlineSmall?.copyWith(
                    color: const Color(AppColors.neutral900),
                  ),
                ),
                const SizedBox(height: Dimens.px8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.px12,
                    vertical: Dimens.px4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(AppColors.neutral100),
                    borderRadius: AppRadius.fullAll,
                  ),
                  child: Text(
                    icon.path.split('/').last,
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: const Color(AppColors.neutral600),
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.px24),
                Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        icon: Icons.copy,
                        label: 'Copy Name',
                        onTap: () {
                          // کپی نام آیکون
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Icon name copied to clipboard'),
                              backgroundColor: Color(AppColors.green600),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: AppRadius.lgAll,
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: Dimens.px12),
                    Expanded(
                      child: _buildActionButton(
                        icon: Icons.visibility,
                        label: 'Preview',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.lgAll,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: Dimens.px12),
          decoration: BoxDecoration(
            color: const Color(AppColors.neutral100),
            borderRadius: AppRadius.lgAll,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: const Color(AppColors.neutral700),
                size: Dimens.px20,
              ),
              const SizedBox(height: Dimens.px4),
              Text(
                label,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: const Color(AppColors.neutral700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
