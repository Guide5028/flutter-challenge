# Solution — Pawat Mungmuang (Guide)

## Time spent
~1.5 hours

## Tasks completed
- A1: Wired onChanged in search bar to controller.setSearchQuery(). Implemented 
  visibleOffers getter to filter by category and search query together (case-insensitive).
- A2: Created OfferDetailsScreenController to load offer by id, manage quantity stepper, 
  and add to bag. Created OfferDetailsBindings and wired it in routes.dart. Built full 
  details screen with image, title, store, prices, discount %, pickup window, quantity 
  left, and CO₂ badge.
- A3: Wrapped ListView.builder with RefreshIndicator wired to controller.onRefresh(). 
  Added AlwaysScrollableScrollPhysics so pull gesture works even when list is short. 
  Also added refresh IconButton in AppBar for desktop testing since pull-to-refresh 
  requires a touch screen.
- A4: Replaced SizedBox.shrink() with a Center + Text widget showing empty_offers.tr 
  when offer list is empty.

## Bugs fixed
- B1: offer_model.dart was reading co2_saved_kg from JSON but the actual key is co2_kg — 
  changed to the correct key so CO₂ value displays properly.
- B2: toggleFavorite() in home_screen_controller.dart saved to SharedPreferences but never 
  updated the UI — added await fetchOffers() after toggle so the observable list refreshes 
  and Obx rebuilds the favorite icon.
- B3: cartTotal in cart_service.dart was multiplying by originalPrice instead of 
  discountedPrice — changed to discountedPrice so the cart charges the correct rescue price.

## AI tools used
Used Claude Code to learn GetX concepts (GetxController, .obs reactive variables, Obx(), 
Bindings, GetView) and understand the codebase patterns. For each task I asked Claude to 
explain why the bug existed and how the fix connects to the UI — verified each change 
manually by running the app on Windows and testing the behavior. All logic decisions and 
understanding were verified before applying.

## If I had more time
- Add unit tests for cart total calculation (S1)
- Add shimmer loading effect while offers load (S3)
- Persist favorites-only filter across sessions (S2)
- Set up Android emulator to fully test pull-to-refresh gesture