---
title: SAML assertion from ADFS2 via SOAP endpoint
author: Tech Debug
type: post
date: 2015-02-07T06:14:35+00:00
url: /blog/2015/02/07/saml-assertion-adfs2-via-soap-endpoint/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:1019;}'
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.7";s:14:"tweet_template";b:0;s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:2;s:13:"tweet_log_ids";a:1:{i:0;i:1019;}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - integration
  - microsoft
  - SOAP
tags:
  - ADFS
  - assertion
  - AWS
  - endpoint
  - IdP
  - mex
  - SAML
  - SOAP
  - SSO
  - usernamemixed
  - WS-A

---
According to Wikipedia, Microsoft Active Directory Federation Services ([ADFS][1]) is:

> &#8230; a software component developed by Microsoft that can be installed on Windows Server operating systems to provide users with single sign-on access to systems and applications located across organizational boundaries. It uses a claims-based access control authorization model to maintain application security and implement federated identity.

ADFS can provide Single sign as an identity provider to users, but what if a developer needs the same sign on outside of &#8220;browser land&#8221;? One option is to scrape webpage responses, but a better option is receiving a SAML Assertion using SOAP endpoints exposed via Microsoft ADFS, as long as they are enabled. You can use SOAP 1.2 with WS-A Addressing and mixed message security with the username/password in the SOAP headers secured over HTTPS, and get a valid SAML assertion.

There is Mex Endpoint (Anonymous by default) provided by ADFS2 or greater (if not disabled) at  
`https://youradfsserver.com.au/adfs/services/trust/mex`  
If you want to play with SOAP based claim requests, use a tool like [SoapUI][2] and consume the Mex endpoint as the WSDL. You can then construct Soap messages, and see if you get a valid response &#8211; which would contain an assertion.

The SOAP Endpoint for requesting a SAML token using WS-Trust 1.3 and mixed security would be  
`https://youradfsserver.com.au/adfs/services/trust/13/usernamemixed`

The client credentials are included in the header of a SOAP message. Confidentiality is preserved at the transport layer (SSL/TLS); hence a _usernamemixed_ endpoint.

Here is an example SOAP request for usernamemixed:  


You can also use curl to post the soap request as shown:  


Given all that; this actually won&#8217;t work for AWS; given ADFS2 actually breaks the SAML2.0 standards updated in 2012. Next post will detail this.

 [1]: https://technet.microsoft.com/en-us/library/adfs2%28v=ws.10%29.aspx
 [2]: http://www.soapui.org/