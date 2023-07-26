---
title: Cloudformation stack creation – scripting via bash
author: Tech Debug
type: post
date: 2016-07-29T03:44:13+00:00
url: /blog/2016/07/29/bash-script-create-cloudformation-stacks/
categories:
  - 2012

---
Find yourself creating the same AWS Cloudformation stack a lot during testing?  
Wasting too much time repeating typing in tags?

A simple post today with a quick solution.

Put your stack tags and parameters into json files and use this bash wrapper script to create the cloudformation stack. This script wraps the _aws cloudformation create-stack_ command, but lets you create the stacks again and again with different names. The benefit is the parameters and tags are pre-defined. Thus this script will save you time if you are doing this from the AWS console regularly.

An example of running the script with parameters (that are ordinal on purpose):

`create-stack.sh MockStack3 deploy/MockServices.template stackParams.json stackTags.json`

Provide your own template file, and modify the stackParams and stackTags to your own needs. Below you&#8217;ll find the [GitHub gist of the script][1] and sample json files.

Tested on Bash in Windows 10 insider preview 🙂

 [1]: https://gist.github.com/lantrix/8269da3e93ed6196541e86c160b82a07