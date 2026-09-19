# PRE-LAUNCH CHECKLIST

- [ ] Run SQL 001–005 in order.
- [ ] `config.js` has Project URL + Publishable key only.
- [ ] `ALLOW_DEMO` remains `false`.
- [ ] Owner can sign in with real Supabase Auth user.
- [ ] Owner Screen 06 can edit price and toggle availability; customer page reflects it after refresh.
- [ ] Owner Screen 06.1 can upload/change a menu image; customer page shows the Storage URL.
- [ ] Open customer URL with `?q=KHUNYUI-MAIN-2026`.
- [ ] Submit a test order; it appears in OWNER “ออเดอร์วันนี้”.
- [ ] Advance new → preparing → ready; customer Tracking updates within ~5 seconds.
- [ ] Complete cash order and mark payment paid; Finance reflects it.
- [ ] Test owner “คิวหน้าลูกค้า” toggles for home/somtam/yum/cart.
- [ ] Test store open/closed switch blocks new customer orders.
- [ ] Test invalid/unavailable menu submission is rejected by database.
- [ ] GitHub Pages URL is HTTPS and QR points to the same deployed URL.
