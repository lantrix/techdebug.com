---
title: Attempt to Deploy Netflix Edda on Wildfly 8.x
author: Tech Debug
type: post
date: 2015-04-08T09:32:45+00:00
url: /blog/2015/04/08/attempt-to-deploy-netflix-edda-on-wildfly-8-x/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:1039;}'
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.7";s:14:"tweet_template";b:0;s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:2;s:13:"tweet_log_ids";a:1:{i:0;i:1039;}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - java
  - tech
tags:
  - edda
  - gradle
  - jboss
  - jersey
  - netflix
  - resteasy
  - wildfly

---
I&#8217;ve been trying to find a production platform for [Edda][1], the Netflix OSS app for tracking AWS resources.

The application is written in Scala, which gets compiled as Java bytecode. The build toolset used by Netflix is [gradle][2], and they deploy the application for testing into [Jetty][3]. Jetty can be used in a production environment, but the setup that comes with the build set with Edda is not really designed with a production server in mind. That said, a lot of people just end up running Edda by manually running up Jetty as a background process on a Linux box. Since I&#8217;ve been using Java application servers for quite a number of years (Websphere AS, Tomcat, Glassfish); I understand the need to run compiled Java web apps in production infrastructure. Therefore, I have been trying to find a reliable, OpenSource Java Web Application Server (WAS) to host Edda.

I&#8217;ve been thinking of trying out JBoss in the past, and the 8th major release of Jboss is now known as Wildfly, it seemed like a likely target for deploying Edda to.

The gradle build of Edda produces a WAR file, ready for deployment to a WAS. However, the war file from the gradle build won&#8217;t deploy by default on Wildfly, as shown with this error:

`01:12:50,021 ERROR [org.jboss.as.server] (XNIO-1 task-10) JBAS015870: Deploy of deployment "edda-2.1.war" was rolled back with the following failure message:<br />
{"JBAS014671: Failed services" => {"jboss.undertow.deployment.default-server.default-host.\"/edda-2.1\"" => "org.jboss.msc.service.StartException in service jboss.undertow.deployment.default-server.default-host.\"/edda-2.1\": Failed to start service<br />
    Caused by: com.sun.jersey.api.container.ContainerException: The ResourceConfig instance does not contain any root resource classes."}}`

Edda uses [Jersey][4] (a standard and portable JAX-RS API) for RESTful Web services, but the WAR file won&#8217;t deploy properly with the servlets configured to use Jersey. This is due to the fact that Jersey is no longer a (default) option for JAX-RS web services on Wildfly. It comes integrated with [RestEasy][5] as the JAX-RS implementation instead.

Using RestEasy makes it necessary to change your Web.xml file because Jersey and RestEasy have different deployment configurations. This will likely to apply to any Wildfly 8.2 release, even though I&#8217;m using 8.2.0

The solution for Edda; is to [modify][6] the web.xml that gets built into the WAR file. I&#8217;ve [committed the modification for web.xml][7] to a branch on my fork of Edda. This solves the deployment issue when you try to deploy Edda as a WAR file into Wildfly.

Yet after all this; I can&#8217;t actually get Edda to work properly on Wildfly.

In the end I went for the good old Tomcat Java Web App Server, and Edda runs with an out of the box build.

 [1]: https://github.com/Netflix/edda/wiki#What_is_Edda
 [2]: http://gradle.org/
 [3]: http://eclipse.org/jetty/
 [4]: https://jersey.java.net/
 [5]: http://resteasy.jboss.org/
 [6]: http://docs.jboss.org/resteasy/docs/3.0.1.Final/userguide/html/Installation_Configuration.html#d4e111
 [7]: https://github.com/lantrix/edda/commit/dc7e8957d5fb828d59b96f8d7274cecea8c4a6ea