// Firefox - daily profile (personal and work browsing)
// Built-in protections only, no hardening template.

// Tracking protection and HTTPS
user_pref("browser.contentblocking.category", "strict"); // Enhanced Tracking Protection: Strict
user_pref("dom.security.https_only_mode", true);
user_pref("privacy.globalprivacycontrol.enabled", true); // ask sites not to sell or share data

// DNS over HTTPS with fallback, so VPN and internal hostnames still resolve
user_pref("network.trr.mode", 2);
user_pref("network.trr.uri", "https://dns.quad9.net/dns-query");

// Telemetry, studies and sponsored content
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// URL bar honesty
user_pref("browser.urlbar.trimURLs", false); // always show the full URL
user_pref("network.IDN_show_punycode", true); // expose homograph domains

// 1Password handles logins
user_pref("signon.rememberSignons", false);
