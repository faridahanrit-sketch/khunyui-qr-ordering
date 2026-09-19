# KHUNYUI QR Ordering — GitHub + Supabase Production Package V2

This package keeps **Customer V50** as the visual/menu master and **OWNER V8** as the back-office UI source. Production data is centralized in Supabase.

## What is connected

Customer QR → `customer_public_state` → current menu/store/access → cart/review → `customer_place_order` (server recalculates price) → `orders` + `order_items` → OWNER Realtime → status changes → `customer_order_status` tracking.

Owner menu edits update `menu_items`; image edits upload to Storage bucket `menu-images`; customer bootstrap reads the same records. Owner customer-page switches are stored in `customer_access`.

## Deploy in this order

1. Create a Supabase project.
2. SQL Editor: run `database/001_schema.sql` → `002_seed_v50.sql` → `003_rpc.sql` → `004_realtime_storage.sql`.
3. Authentication > Users: create the real OWNER user. Edit the email in `database/005_link_owner.sql`, then run it.
4. Project Connect: copy **Project URL** and **Publishable key** into `config.js`. Do **not** put a Secret/service-role key in this repository.
5. Upload this folder to GitHub. Enable GitHub Pages from the repository root. Root `index.html` is customer; `/owner/` is owner login.
6. Open `tools/qr-generator.html`, enter the deployed customer URL, and print the resulting QR. The supplied default token is `KHUNYUI-MAIN-2026`; create more `qr_points` rows for tables/locations if needed.

## Locked master

See `LOCK_MANIFEST.json`. The untouched sources are under `/locked`. SHA-256 is recorded so later revisions can be checked against the approved master.

## Security model

- Customer browser has only Supabase **Publishable key**. Anonymous users have no direct order/menu table write access.
- Customer order creation is via a SECURITY DEFINER RPC that validates the QR, store-open state, menu availability, quantities, and **database price**.
- Owner uses Supabase Auth plus store membership and RLS.
- The old owner demo credential path is disabled unless `ALLOW_DEMO:true` is explicitly set. Keep it false in production.
- Secret/service-role keys are never needed in GitHub Pages.

## Important production note

The code and database contract are wired, but a real cloud order cannot be created until `config.js` has the URL/publishable key for an actual Supabase project and the SQL migrations have been run there.

## QR inside OWNER

OWNER > เพิ่มเติม > หน้าที่ลูกค้าเห็น > “แสดง QR เมนูลูกค้า” renders the customer URL with `DEFAULT_QR_TOKEN`. Set `CUSTOMER_MENU_URL` only if the customer page is not the repository root.

`qrcode.js` is pinned to cdnjs version 1.0.0.
