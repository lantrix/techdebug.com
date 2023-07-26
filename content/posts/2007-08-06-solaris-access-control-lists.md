---
title: Solaris Access Control Lists
author: Tech Debug
type: post
date: 2007-08-06T04:48:41+00:00
url: /blog/2007/08/06/solaris-access-control-lists/
categories:
  - unix

---
A quick lesson (for my own benefit as much as yours) in applying Access Control Lists (ACL) on files and directories under Solaris (in this case Solaris 9).

To allow group &#8220;somegroup&#8221; read only access to a folder recursively, you need to set the ACL on EVERY directory and file. This is due to the fact that the Solaris setfacl command does not have a recursive option (do not confuse -r with recurse).

To start you change to your parent folder, and then apply the ACL to the top level fodler you want the group to have read access to. The _-r_ switch is to recalculate the ACL mask, and the _-m_ allows you to modify existing permissions to add this ACL.  
`<br />
$ cd /apps/folder<br />
$ setfacl -r -m group:somegroup:r-x application_folder<br />
$ getfacl application_folder<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> file: application_folder<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> owner: user123<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> group: groupxyz<br />
user::rwx<br />
group::rwx #effective:rwx<br />
group:somegroup:r-x #effective:r-x<br />
mask:rwx<br />
other:---<br />
` 

As you can see, the &#8220;somegroup&#8221; group now has access to this folder. You MUST give read AND execute permissions however, as without execute on the directories, the users of &#8220;somegroup&#8221; cannot cd to any given folder. Lastly due to not having a recursive switch, you need to set `r-x` on each sub directory on our application, and `r--` on each sub file. Two methods are shown below, and both are just as effective.

  * method 1  
    `<br />
$ cd /apps/folder/application_folder<br />
$ find . -type d -exec setfacl -r -m group:somegroup:r-x {} \;<br />
$ find . -type f -exec setfacl -r -m group:somegroup:r-- {} \;<br />
` 
  * method 2  
    ``<br />
$ cd /apps/folder/application_folder<br />
$ for i in `find . -type d`; do setfacl -r -m \<br />
group:somegroup:r-x $i; done<br />
$ for i in `find . -type f`; do setfacl -r -m \<br />
group:somegroup:r-- $i; done<br />
``