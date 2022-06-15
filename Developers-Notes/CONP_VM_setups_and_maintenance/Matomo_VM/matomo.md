# Description

[Matomo](https://matomo.org/) is an analytics platform that we are using to collect our own analytics 
to protect CONP users' privacy.



# VM information

We have an MCIN Matomo server (matomo.acelab.ca) that is currently tracking analytics on the 
https://conp.ca (Matomo site ID = 1) and https://portal.conp.ca (Matomo site ID = 2) websites.



# Matomo usage

### Tracking users' activity on the portal

The following code snippet needed to be added to `app/templates/common/base_main.html` to track
the portal's users' activity:

```html
<!-- Matomo -->
<script type="text/javascript">
  var matomoUrl = {{ config['MATOMO_SERVER_URL']|tojson }}
  var matomoSiteId = {{ config['MATOMO_SITE_ID']|tojson }}
  var _paq = window._paq = window._paq || [];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u=`//${matomoUrl}/`;
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', `${matomoSiteId}`]);
    _paq.push(['enableHeartBeatTimer']);
    _paq.push(['trackPageView']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Matomo Code -->
```

Variables `MATOMO_SERVER_URL` and `MATOMO_SITE_ID` for the portal can be found in the `.flaskenv` file in the 
root directory of the `conp-portal` code installed on portal.conp.ca.

### Matomo's API

Documentation for the Matomo API can be found at: https://developer.matomo.org/api-reference


### Whitelisting IP addresses 

When querying multiple times Matomo's API when using the `flask update_analytics` feature of the portal 
code, the max number of requests gets quickly exceeded. In order to have different VMs able to query
repeatedly Matomo's API, the IP address of the VM needs to be added to a whitelist of IP addresses. 

The following VMs have been added to the whitelist:
- portal.conp.ca
- portal-dev.conp.ca
- portal-test.conp.ca
- Cecile's home IP and McGill VPN IP addresses


### Max login attempts

In order to ensure the widgets are being displayed to the portal frontend user, the max login attempts within
60 minutes has been set to 100.