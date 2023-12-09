{ pkgs, home-manager, username, ... }:
{
  #----- Home Manager Config -----
  home-manager.users.${username} = { pkgs, ... }: {
  
    home.packages = with pkgs; [
      nyxt
    ];

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };
    
    programs = {
      chromium = {
    	enable = true;
      };
      firefox = {
          enable = true;
          profiles.ihome = {
            isDefault = true;
            # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            #   ff2mpv
            #   vimium
            #   languagetool
            #   ublock-origin
            #   darkreader
            #   libredirect
            #   multi-account-containers
            #   vertical-tabs-reloaded
            # ];
    
            settings = {
              "browser.startup.homepage" = "about:blank";
              "browser.urlbar.placeholderName" = "Time to get Productive...";
              "gfx.webrender.all" = true;
              "gfx.webrender.enabled" = true;
              "media.av1.enabled" = false;
              "media.ffmpeg.vaapi.enabled" = true;
              "media.hardware-video-decoding.force-enabled" = true;
              "media.navigator.mediadatadecoder_vpx_enabled" = true;
              "signon.rememberSignons" = false;
              "app.normandy.api_url" = "";
              "app.normandy.enabled" = false;
              "app.shield.optoutstudies.enabled" = false;
              "beacon.enabled" = false;
              "breakpad.reportURL" = "";
              "browser.aboutConfig.showWarning" = false;
              "browser.cache.offline.enable" = false;
              "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
              "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
              "browser.crashReports.unsubmittedCheck.enabled" = false;
              "browser.disableResetPrompt" = true;
              "browser.newtab.preload" = false;
              "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
              "extensions.pocket.enabled" = false;
              "browser.newtabpage.enhanced" = false;
              "browser.newtabpage.introShown" = true;
              "browser.safebrowsing.appRepURL" = "";
              "browser.safebrowsing.blockedURIs.enabled" = false;
              "browser.safebrowsing.downloads.enabled" = false;
              "browser.safebrowsing.downloads.remote.enabled" = false;
              "browser.safebrowsing.downloads.remote.url" = "";
              "browser.safebrowsing.enabled" = false;
              "browser.safebrowsing.malware.enabled" = false;
              "browser.safebrowsing.phishing.enabled" = false;
              "browser.selfsupport.url" = "";
              "browser.send_pings" = false;
              "browser.sessionstore.privacy_level" = 2;
              "browser.startup.homepage_override.mstone" = "ignore";
              "browser.tabs.crashReporting.sendReport" = false;
              "browser.urlbar.groupLabels.enabled" = false;
              "browser.urlbar.quicksuggest.enabled" = false;
              "browser.urlbar.speculativeConnect.enabled" = false;
              "datareporting.healthreport.service.enabled" = false;
              "datareporting.healthreport.uploadEnabled" = false;
              "datareporting.policy.dataSubmissionEnabled" = false;
              "device.sensors.ambientLight.enabled" = false;
              "device.sensors.enabled" = false;
              "device.sensors.motion.enabled" = false;
              "device.sensors.orientation.enabled" = false;
              "device.sensors.proximity.enabled" = false;
              "dom.battery.enabled" = false;
              "dom.event.clipboardevents.enabled" = true;
              "dom.webaudio.enabled" = false;
              "experiments.activeExperiment" = false;
              "experiments.enabled" = false;
              "experiments.manifest.uri" = "";
              "experiments.supported" = false;
              "extensions.getAddons.cache.enabled" = false;
              "extensions.getAddons.showPane" = false;
              "extensions.greasemonkey.stats.optedin" = false;
              "extensions.greasemonkey.stats.url" = "";
              "extensions.shield-recipe-client.api_url" = "";
              "extensions.shield-recipe-client.enabled" = false;
              "extensions.webservice.discoverURL" = "";
              "fission.autostart" = true;
              "media.autoplay.default" = 1;
              "media.autoplay.enabled" = false;
              "media.eme.enabled" = false;
              "media.gmp-widevinecdm.enabled" = false;
              "media.navigator.enabled" = false;
              "media.video_stats.enabled" = false;
              "network.IDN_show_punycode" = true;
              "network.allow-experiments" = false;
              "network.captive-portal-service.enabled" = false;
              "network.cookie.cookieBehavior" = 1;
              "network.dns.disablePrefetch" = true;
              "network.dns.disablePrefetchFromHTTPS" = true;
              "network.http.referer.spoofSource" = true;
              "network.http.speculative-parallel-limit" = 0;
              "dom.security.https_only_mode" = true;
              "network.predictor.enable-prefetch" = false;
              "network.predictor.enabled" = false;
              "network.prefetch-next" = false;
              "network.trr.mode" = 5;
              "privacy.donottrackheader.enabled" = true;
              "privacy.donottrackheader.value" = 1;
              "privacy.firstparty.isolate" = true;
              "privacy.trackingprotection.cryptomining.enabled" = true;
              "privacy.trackingprotection.enabled" = true;
              "privacy.trackingprotection.fingerprinting.enabled" = true;
              "privacy.trackingprotection.pbmode.enabled" = true;
              "privacy.usercontext.about_newtab_segregation.enabled" = true;
              "security.ssl.disable_session_identifiers" = true;
              "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" = false;
              "browser.newtabpage.activity-stream.showSponsored" = false;
              "signon.autofillForms" = false;
              "toolkit.telemetry.archive.enabled" = false;
              "toolkit.telemetry.bhrPing.enabled" = false;
              "toolkit.telemetry.cachedClientID" = "";
              "toolkit.telemetry.enabled" = false;
              "toolkit.telemetry.firstShutdownPing.enabled" = false;
              "toolkit.telemetry.hybridContent.enabled" = false;
              "toolkit.telemetry.newProfilePing.enabled" = false;
              "toolkit.telemetry.prompted" = 2;
              "toolkit.telemetry.rejected" = true;
              "toolkit.telemetry.reportingpolicy.firstRun" = false;
              "toolkit.telemetry.server" = "";
              "toolkit.telemetry.shutdownPingSender.enabled" = false;
              "toolkit.telemetry.unified" = false;
              "toolkit.telemetry.unifiedIsOptIn" = false;
              "toolkit.telemetry.updatePing.enabled" = false;
              "webgl.disabled" = true;
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
              "webgl.renderer-string-override" = " ";
              "webgl.vendor-string-override" = " ";
              "browser.urlbar.update2.engineAliasRefresh" = true;
              "signon.passwordEditCapture.enabled" = false;
              "browser.search.hiddenOneOffs" = "Google,Yahoo,Bing,Amazon.com,Twitter";
              "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
              "browser.urlbar.trimURLs" = false;
              "findbar.modalHighlight" = true;
              "browser.fullscreen.autohide" = true;
              "browser.newtabpage.activity-stream.topSitesRows" = 0;
              "browser.urlbar.quickactions.enabled" = true;
              "pdfjs.annotationEditorMode" = 0;
              "pdfjs.annotationmode" = 2;
              "layers.acceleration.force-enabled" = true;
              "layout.css.backdrop-filter.enabled" = true;
              "svg.context-properties.content.enabled" = true;
            };
    
            search = {
              default = "DuckDuckGo";
              force = true;
              engines = {
                "Nixpkgs-Package Search" = {
                  urls = [{ template = "https://search.nixos.org/packages?channel=unstable&size=250&sort=relevance&type=packages&query={searchTerms}"; }];
                  iconUpdateURL = "https://nixos.org/favicon.png";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@nps" ];
                };
    
                "Nixpkgs-Modules Search" = {
                  urls = [{ template = "https://search.nixos.org/options?channel=unstable&size=200&sort=relevance&query={searchTerms}"; }];
                  iconUpdateURL = "https://nixos.org/favicon.png";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@nms" ];
                };
    
                "NixOS-Wiki Search" = {
                  urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}&go=Go"; }];
                  iconUpdateURL = "https://nixos.org/favicon.png";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@nws" ];
                };
    
                "Home-Manager Search" = {
                  urls = [{ template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}"; }];
                  iconUpdateURL = "https://nixos.org/favicon.png";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@hms" ];
                };
    
                "GitHub-Code Search" = {
                  urls = [{ template = "https://github.com/search?q={searchTerms}&type=code"; }];
                  iconUpdateURL = "https://github.githubassets.com/favicons/favicon-dark.svg";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@gcs" ];
                };
    
                "Noogle.dev Search" = {
                  urls = [{ template = "https://noogle.dev/?term=%22{searchTerms}%22"; }];
                  iconUpdateURL = "https://noogle.dev/favicon.png";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@ngd" "@nog" ];
                };
    
                "Nixpkgs PRs" = {
                  urls = [{ template = "https://nixpk.gs/pr-tracker.html?pr={searchTerms}"; }];
                  iconUpdateURL = "https://nixos.org/favicon.png";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@npr" ];
                };
              };
    
              order = [
                "DuckDuckGo"
              ];
            };
    
            userChrome = builtins.readFile ./configs/userChrome.css;
    
          };
      };
    };
  };

  #----- System Configuration -----
  programs = {
    chromium = {
      enable = true;
      extraOpts = {
        "BrowserSignin" = 1;
        "SyncDisabled" = false;
        "PasswordManagerEnabled" = false;
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = [ "pt-BR" ];
      };
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      ];
    };
  };
}
