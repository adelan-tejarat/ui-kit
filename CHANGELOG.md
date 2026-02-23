## 2.0.1 — Update Dimens - add spacings

### 🚀 Update
- **update(dimens):** Add spacing variables

---

## 2.0.0 — Change Package Name to `vamstreet_uikit`

### 🚀 Features
- **feat:** Change package name to `vamstreet_uikit`

---

### 🚀 Features
- **feat(navigationBar):** add bottom navigation component with showcase
  - BottomNavCubit for state management
  - 5 pages (profile, settings, wallet, services, barcode)
  - 4 visible items + center FAB
  - CustomBottomNav with active/inactive states
  - CenterBarcodeFab for QR scanner
  - MainScreen with page builder injection
  - BottomNavConfig with design tokens

### 🎨 Showcase
- **feat(showcase):** add bottom navigation showcase page
  - All 5 sample pages
  - Integrated in ShowCaseApp grid

### 📦 Dependencies
- **flutter_bloc:** ^8.1.3

---

## 1.2.0 — Enterprise-Grade Toast Notification System

### 🚀 Features
- **feat(toast):** enterprise-grade toast notification system with showcase
  - ToastService built with enterprise-grade architecture
    - 4 notification types: Success, Error, Warning, Info
    - 2 sizes: Regular (default) and Compact (half height)
    - Customizable duration with proper defaults (4s/3s)
    - RTL support for Persian language
    - Drag to close • Pause on hover • Auto-close timer

  - Powered by `toastification` package
    - Stable overlay management with no conflicts
    - Queue handling for multiple notifications
    - Built-in animations with flatColored style
    - Custom close button with ripple effect

  - Color system aligned with design tokens
    - Success: green/600 border • #0D542B icon • #F0FDF4 bg
    - Error: red/600 border • #7B3306 icon • #FEF2F2 bg
    - Warning: brand/600 border • #7B3306 icon • #FFFBEB bg
    - Info: sky/600 border • #024A70 icon • #F0F9FF bg
    - Dark variants for Error/Warning with red/700 & brand/700

  - Complete showcase page demonstrating:
    - Toast types with/without close button
    - Description support with proper typography
    - Duration variants (2s, 3s, 4s, 7s)
    - Sequential toast demonstration
    - Dismiss all utility
    - Comprehensive RTL legend with usage guidelines
    - Color-coded buttons matching toast themes

---

## 1.1.0 — Enterprise-Grade SelectBox Component

### 🚀 Features
- **feat(selectbox):** enterprise-grade searchable dropdown component with showcase
  - SelectBox<T> built with enterprise-grade architecture
    - Generic type support for any data model via SelectOption<T>
    - Support for 2 sizes (Small/Large) via isLarge flag
    - Prefix/Suffix support with tap handlers and disabled state
    - 5 interaction states: normal, hover, focus, error, disabled
    - Error state management via errorText (no redundant isError flag)
    - Real-time search/filter as you type
    - Leading icons support in dropdown items
    - Proper RTL support with EdgeInsetsDirectional

  - Powered by search_autocomplete package
    - Stable focus management with no conflicts
    - Built-in search field with auto-focus
    - Custom dropdown builder with shadow and border styling
    - Empty state handling with "No results found" message

  - Complete showcase page demonstrating:
    - All dropdown states with visual indicators
    - Hover effect demonstration (border/background/icon color changes)
    - Prefix/Suffix examples with click handlers
    - Size variants with detailed specifications (48px/56px heights)
    - Error state management with dynamic validation
    - Leading icons in options (flags, language icons)
    - Live examples with selection tracking
    - Real-world form example (country/city/language)
    - Comprehensive RTL legend with usage guidelines
    - Priority ordering: Disabled > Error > Focus > Hover > Normal

---

## 1.0.0 — Enterprise-Grade UI Component Library Initial Release

### 🚀 Features
- **feat(buttons):** comprehensive button system with showcase
  - ButtonWidget & IconButtonWidget with size/mode/color variants
  - 3 sizes: md (40px), lg (48px), xlg (56px)
  - 3 modes: filled, outline, standard
  - 4 color packs: Brand, Green, Red, Neutral with 5 interaction states (enabled/disabled/loading/hover/focus)
  - Custom iOS-style loading widget with performance optimization
  - Adaptive primary, secondary, and text button implementations
  - Fixed expand-in-width behavior with proper content length handling
  - Default values for simplified button widget usage

- **feat(radio):** enterprise-grade radio button component with showcase
  - RadioButtonWidget built with state resolver architecture
  - Support for lg (24px) and xlg (32px) sizes
  - Integrated ColorPack system (Brand/Green/Red/Neutral)
  - Full interaction states: enabled, disabled, selected, hover, focus
  - Controlled selection model via groupValue
  - Dedicated showcase page demonstrating all variants and states

- **feat(input):** enterprise-grade text input components with showcase
  - TextInputWidget built with enterprise-grade architecture
    - Support for 2 sizes: Small (12px padding) and Large (16px padding)
    - Prefix/Suffix support with tap handlers and disabled state
    - 5 interaction states: normal, hover, focus, error, disabled
    - Error state management via errorText (no redundant isError flag)
    - Performance optimized with flutter_hooks (useMemoized, useCallback)
    - Proper RTL support with EdgeInsetsDirectional
    - MaxLines and height property fixes

  - DescriptionInputWidget for multi-line text input
    - Fixed height: 4 lines (120px) with 12px padding all around
    - Multi-line support with proper keyboard configuration
    - Same interaction states as TextInputWidget
    - Error text support with visual feedback
    - Optimized line height calculation (24px per line)

- **feat(checkboxes):** add adaptive checkbox widget
  - Support dynamic theming and typography in AdaptiveCheckbox

- **feat(textInputs):** add adaptive text input widget
  - Fix max_lines and height properties
  - Proper text field sizing implementation

- **feat(core):** comprehensive design system foundation
  - Complete color system with brand, accent, neutral, and semantic colors
  - Typography system with IRAN Sans font family
  - Proper font weight configuration (regular: 400, medium: 500, bold: 700)
  - Blur utilities with values from none to 3xl (4px to 32px)
  - Opacity system with 21 levels (0% to 100%)
  - Border radius scale: none (0px) to full (9999px)
  - Dimension constants for consistent spacing
  - Dark/light mode scaffold background color configuration

- **feat(assets):** comprehensive icon library
  - 200+ SVG icons from Heroicons collection
  - Proper asset generation with FlutterGen
  - Icons showcase page with search and preview capabilities

- **feat(localization):** add Farsi support
  - Remove Spanish and French localizations
  - Focus on Persian language support

### 🎨 Showcase & Documentation
- **feat(showcase):** complete component showcase application
  - Dedicated pages for each component type (Buttons, Radio, Inputs, Icons, Colors)
  - Real-time state visualization with hover/focus toggles
  - Size variants with detailed specifications
  - Error state management with dynamic validation
  - Live examples with state tracking
  - Comprehensive RTL legend with usage guidelines
  - Responsive grid layouts for all screen sizes

### 🔧 Fixes & Improvements
- **fix(color/icons):** fix color value handling and icon asset loading
  - Convert Color constants to raw integer values with getters
  - Fix icon path resolution in assets
  - Resolve const Color constructor warnings

- **fix(buttons):** resolve debug overflow in EnableIntrinsicWidth
  - Fix null safety bug in expandToFullWidth property
  - Show correct behavior in Widgetbook

- **fix(textInputs):** fix max_lines and height property issues
  - Properly handle multi-line text input constraints

### 🧹 Code Quality & Maintenance
- **refactor(core):** comprehensive design system alignment
  - Replace brand color in accent color palette
  - Match dark accent color to light mode values
  - Fix font height to 1.0 for proper text alignment
  - Update text styles according to IRAN Sans font
  - Reconfigure fonts by adding iran-sans family

- **style:** comprehensive lint fixes and code style improvements
  - Fix import statements for proper src directory access
  - Resolve all lint issues across the codebase
  - Clean code organization following feature-based structure

- **chore(deps):** update and fix dependencies
  - Add shimmer package for loading effects
  - Fix dependency resolution and lint issues
  - Proper weight size configuration for fonts

---

### 📦 Project Setup
- **ci:** add lint & test and deploy-web steps in pipeline
- **docs:** add issue templates
- **chore:** initial project setup with complete build configuration