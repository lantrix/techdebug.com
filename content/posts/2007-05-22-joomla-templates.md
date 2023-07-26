---
title: Roll your own Joomla Templates
author: Tech Debug
type: post
date: 2007-05-22T09:26:47+00:00
url: /blog/2007/05/22/joomla-templates/
categories:
  - webdev

---
<p style="float: right; margin-left: 10px; margin-bottom: 10px">
  <a href="http://www.joomla.org"><img decoding="async" src="https://techdebug.com/wp-content/uploads/2007/05/joomla-logo-horz-color.png" alt="Joomla Logo" /></a>
</p>

I am developing a web-site for a business. A really simple web presence with some Content Management. I am yet to fully convince the Business Owner that a CMS will be so beneficial to customers, but I am already using Joomla for the site, so we have one in place. I used the [DocMan][1] extension for Mambo/Joomla to cover document content and access control for the published documents. After some initial headaches with that, I sorted the issues out (to be blogged some other time I suppose) and started looking around the net for free templates. I was after a quick implementation they liked.

After much searching I found the [siteground][2] templates on offer for free. You could customise them all you wanted, but you had to leave their copyright and &#8220;add&#8221; info on the page.

I needed to customise the graphics to include customer information in the header anyway, so I started modifying the logo. Next up was the layout. It was missing some of the joomla inline modules in needed.

Whilst doing this, I noticed that all their templates are just mega tables. Very ugly coding in a standards based world. I am guessing they would not meet XHTML or CSS standards, OK so [I checked][3]. The CSS was all good, but the HTML was not Valid XHTML 1.0 Transitional.

What should one do? Write your own template. This is my current goal. I will offer it up for grabs once done.

If anyone has tips on an entirely CSS based joomla theme (aiming at visual design, light on bandwidth) then I would appreciate them.

 [1]: http://www.mambodocman.com/
 [2]: http://www.siteground.com/joomla-hosting/joomla-templates.htm
 [3]: http://www.w3.org/