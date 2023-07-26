---
title: AWS PowerShell Lambda Build Environment for Docker
author: Tech Debug
type: post
date: 2020-02-17T08:00:21+00:00
url: /blog/2020/02/17/aws-powershell-lambda-build-environment-for-docker/
categories:
  - 2012
tags:
  - AWS
  - buildkite
  - docker
  - dotnet core
  - lambda
  - powershell

---
If you&#8217;re deploying an AWS PowerShell Lambda (which is PowerShell Core 6.0) in a build pipeline, you&#8217;ll likely come across the fact that the older PowerShell docker images don&#8217;t have Dotnet Core installed.

The .NET Core 3.0 .NET Core 3.0 SDK Docker images now contain PowerShell Core, but since AWS still uses .NET Core 2.1 which is in Long Term Support, you&#8217;re out of luck.

Therefore if you&#8217;re deploying your lambda from your CI pipeline using docker, then you need a build environment which has:

  * PowerShell Core 6
  * .NET Core 2.1
  * AWS Tools for PowerShell

You&#8217;ve come to the right place. Here is a DockerFile you can use to build your Lambda deployment environment. Make sure you choose the [AWS PowerShell Tools module][1] you need in the last line:

An example of how you can build and use this image in a pipeline is below. I use [Buildkite][2], so YMMV:

 [1]: https://docs.aws.amazon.com/powershell/latest/reference/Index.html
 [2]: https://buildkite.com/