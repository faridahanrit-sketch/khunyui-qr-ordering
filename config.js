// KHUNYUI — browser-safe deployment config.
// Publishable key is intentionally used in browser; never place a Supabase secret/service-role key here.
window.KHUNYUI_CONFIG = Object.freeze({
  SUPABASE_URL: "",
  SUPABASE_PUBLISHABLE_KEY: "",
  DEFAULT_QR_TOKEN: "KHUNYUI-MAIN-2026",
  // Optional. Leave blank when customer is deployed at repository root.
  CUSTOMER_MENU_URL: "",
  DEFAULT_PAYMENT_METHOD: "cash",
  ALLOW_DEMO: false
});
