---
title: ADFS2 is not always SAML 2.0 standards compliant
author: Tech Debug
type: post
date: 2015-02-10T04:26:26+00:00
url: /blog/2015/02/10/adfs2-not-always-saml-2-0-standards-compliant/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:1029;}'
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.7";s:14:"tweet_template";b:0;s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:2;s:13:"tweet_log_ids";a:1:{i:0;i:1029;}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - AWS
  - microsoft
  - SOAP
  - webdev
tags:
  - ADFS
  - ADFS2
  - amazon web services
  - assertion
  - AWS
  - Recipient
  - SAML
  - standards
  - SubjectConfirmationData
  - WS-Trust
  - WS-Trust 1.3

---
Now the madness with ADFS2 SAML assertions via WS-Trust 1.3 &#8211; and how they are not valid for use with Amazon Web Services (AWS).

`lexx:saml$ aws sts assume-role-with-saml --role-arn $role --principal-arn $principal --saml-assertion $assertion<br />
A client error (InvalidIdentityToken) occurred when calling the AssumeRoleWithSAML operation: Responses must contain SubjectConfirmatonData with a Recipient and NotOnOrAfter`

This failed due to a missing Recipient attribute on the SubjectConfirmationData element. Of course; I can&#8217;t modify the assertion to add the missing Recipient; as the SAML token is signed:

`lexx:saml$ aws sts assume-role-with-saml --role-arn $role --principal-arn $principal --saml-assertion $assertion<br />
A client error (InvalidIdentityToken) occurred when calling the AssumeRoleWithSAML operation: Response signature invalid`

Second fail is because I&#8217;ve modified the assertion to add the missing attribute; but now the signature is invalid.

When you get an assertion from the ADFS Identity Provider via the IdP Web Landing Page, for AWS, the assertion includes a “recipient”:  
`<subjectconfirmation Method="urn:oasis:names:tc:SAML:2.0:cm:bearer"><br />
	<subjectconfirmationdata NotOnOrAfter="2015-02-08T22:48:18.520Z" Recipient="https://signin.aws.amazon.com/saml"></subjectconfirmationdata><br />
</subjectconfirmation>`

When you ask for an assertion from the WS-Trust 1.3 endpoint; it is missing:  
`<subjectconfirmation Method="urn:oasis:names:tc:SAML:2.0:cm:bearer"><br />
	<subjectconfirmationdata NotOnOrAfter="2015-02-09T05:03:10.517Z"></subjectconfirmationdata><br />
</subjectconfirmation>`

Seems to be a common problem with ADFS2 whereby ADFS1 did it correctly. It&#8217;s [not][1] [just][2] [me][3]&#8230;

In the [original][4] SAML 2.0 Core spec &#8211; Line 725 &#8211; Recipient is an optional attribute in the SubjectConfirmationData element. However in subsequent errata for the specification, [Errata 02][5] in May 2007, made it mandatory. [Errata 05][6] still includes this requirement.

> At lease one bearer <subjectconfirmation> element MUST contain a <subjectconfirmationdata> element that itself MUST contain a Recipient attribute containing the service provider&#8217;s assertion consumer service URL</subjectconfirmationdata></subjectconfirmation>

Of course; Amazon adhere to the Standard:

> The value of the Recipient attribute inside the SubjectConfirmationData element must match the AWS endpoint (https://signin.aws.amazon.com/saml)

It seems that ADFS2 doesn&#8217;t provide valid SAML 2.0 assertions issued via the WS-Trust 1.3 endpoint. Since this has been a standard since for almost 8 years, how does ADFS2 even claim to be standards based.

 [1]: http://stackoverflow.com/questions/24756504/how-to-get-from-adfs-a-non-empty-recipient-attribute-in-saml-assertion
 [2]: https://social.msdn.microsoft.com/Forums/vstudio/en-US/a2ae7fdf-c7c4-49a7-8b4c-68b584af38ba/subjectconfirmationdata-is-missing-recipient?forum=Geneva
 [3]: https://social.msdn.microsoft.com/Forums/en-US/1d958b99-780d-4135-a58c-13e6d8014885/adfs-1-has-recipient-adfs-2-has-not-receiving-saml-20-assertions-via-wstrust-?forum=Geneva
 [4]: http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
 [5]: http://docs.oasis-open.org/security/saml/v2.0/sstc-saml-approved-errata-2.0-cd-02.html
 [6]: http://docs.oasis-open.org/security/saml/v2.0/sstc-saml-approved-errata-2.0.html