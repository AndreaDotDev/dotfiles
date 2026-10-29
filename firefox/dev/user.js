// Firefox Developer Edition - dev profile
// Read at every start; values here override about:config changes.

// DevTools
user_pref("devtools.cache.disabled", true);             // no HTTP cache while the toolbox is open
user_pref("devtools.netmonitor.persistlog", true);      // keep requests across navigations
user_pref("devtools.webconsole.persistlog", true);
user_pref("devtools.chrome.enabled", true);             // Browser Toolbox, browser console input
user_pref("devtools.debugger.remote-enabled", true);
user_pref("devtools.toolbox.host", "right");
user_pref("devtools.theme", "dark");
user_pref("devtools.selfxss.count", 100);               // paste into the console without the warning
user_pref("devtools.editor.keymap", "vim");             // vim keys in DevTools editors, if the build honours it

// URL bar and local domains
user_pref("browser.urlbar.trimURLs", false);
user_pref("browser.urlbar.trimHttps", false);
user_pref("browser.fixup.domainsuffixwhitelist.test", true);      // treat foo.test as a host, not a search
user_pref("browser.fixup.domainsuffixwhitelist.internal", true);

// Quality of life
user_pref("browser.aboutConfig.showWarning", false);
user_pref("view_source.wrap_long_lines", true);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);  // enable userChrome.css
