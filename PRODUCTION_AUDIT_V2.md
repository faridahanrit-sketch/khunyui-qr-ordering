# KHUNYUI Production Audit — V2

## Corrected findings

- The OWNER source already had a real JavaScript controller. It imports Supabase, binds the login form submit event, prevents default refresh, calls `signInWithPassword`, controls screens, bottom navigation, orders, menu, finance, settings, and realtime. Therefore no duplicate "main controller" was added.
- Google Fonts import for Noto Sans Thai was missing and is now added to owner and customer production HTML.
- QR UI/rendering was missing in OWNER. A customer-menu QR modal is now added to Screen 09.1. It encodes the deployed customer URL plus the configured QR token and supports Web Share / clipboard fallback.
- The original OWNER source contained demo/local inspection paths. Production keeps demo disabled unless `ALLOW_DEMO:true`; leave it false.
- The uploaded V50 customer source created orders only in browser session storage. Production V2 replaces that final submit path with the Supabase `customer_place_order` RPC and reads tracking with `customer_order_status`.
- Payment PromptPay QR is intentionally not fabricated. A real payment QR needs a real merchant/PromptPay identifier and should be configured separately; menu/order QR is production-ready now.

## Production flow

QR scan → customer V50 → `customer_public_state` → current DB menu/access → cart/review → `customer_place_order` → `orders` + `order_items` → OWNER realtime/order screens → status update → customer `customer_order_status`.
