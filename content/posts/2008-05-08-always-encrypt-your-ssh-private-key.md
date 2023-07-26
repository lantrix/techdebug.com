---
title: Always encrypt your ssh private key
author: Tech Debug
type: post
date: 2008-05-08T02:44:31+00:00
url: /blog/2008/05/08/always-encrypt-your-ssh-private-key/
tags:
  - cryptography
  - keypair
  - openssh
  - putty
  - unix
categories:
  - unix

---
Recently someone I know advised other IT people to generate their SSH [keypair][1] using the default options &#8220;using just enter to answer all the questions&#8221;. This means that the Private Key generated has no password against it (and is unencrypted). 

In this case your private key is stored unprotected on your own computer, and anybody who gains access to that will be able to generate signatures (login to servers) as if they were you They will be able to log in to your server under your account.  
**I&#8217;ll reiterate that**: This will allow _ANYONE_ holding this file to _access ANY server AS YOU where you have uploaded the public keys_.

This means that in the case your laptop or computer is lost or stolen, your unix accounts are effectively compromised.

For this reason, your private key is recommended to be encrypted when it is stored on your local machine, using a pass phrase of your choice. To minimise this risk you should **choose a strong pass phrase** to be applied to the private key when generation occurs.

There are two ways to generate a key pair.

  1. If you are using openssh then generate the keypair under your unix login as follows:  
    `<br />
$ ssh-keygen -C "My development key 05 May 2008" -t rsa<br />
Generating public/private rsa key pair.<br />
Enter file in which to save the key (/home/lantrix/.ssh/id_rsa):<br />
Enter passphrase (empty for no passphrase): **type in a strong password here**<br />
Enter same passphrase again: **retype in your strong password here**<br />
Your identification has been saved in /home/lantrix/.ssh/id_rsa.<br />
Your public key has been saved in /home/lantrix/.ssh/id_rsa.pub.<br />
The key fingerprint is:<br />
1a:aa:bb:44:09:38:ec:1d:1c:2d:27:c8:cc:dd:ee:ff My development key 05 May 2008<br />
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys<br />
`  
    Then copy ~/.ssh/id_rsa the _password protected and encrypted_ private key to a secure place on your client machine to use (placing it in your ~/.ssh/ folder &#8211; remember to set permissions to 600).</p> 
    If you want to use this openssh keypair with putty on a windows client, you will need to follow [an extra step][2]. Use PuttyGen menu to load your generated &#8220;id_rsa&#8221; file you transferred to your windows client. </li> 
    
      * If you are only going to use putty to connect to UNIX servers it is better to generate the keypair in putty  
        See the [putty documentation][3] for instructions on generating your key pair.  
        Ensure you export the public keyfile to ~/.ssh/authorized_keys on each UNIX server you want to login (and chmod 600 on the file). </ol> 
    
    #### A Helpful tip
    
    You can use putty to &#8220;cache&#8221; your key (to prevent constant retyping of your password when logging into servers) in a secure fashion using [this component][4] of putty.
    
    Dont think of SSH keypairs as a means of easier logins. **When used correctly it will in fact provide a more secure login**; as your password is never passed over the network.

 [1]: http://en.wikipedia.org/wiki/Keypair
 [2]: http://the.earth.li/~sgtatham/putty/0.60/htmldoc/Chapter8.html#puttygen-conversions
 [3]: http://the.earth.li/~sgtatham/putty/0.60/htmldoc/Chapter8.html#pubkey-puttygen
 [4]: http://the.earth.li/~sgtatham/putty/0.60/htmldoc/Chapter9.html#pageant