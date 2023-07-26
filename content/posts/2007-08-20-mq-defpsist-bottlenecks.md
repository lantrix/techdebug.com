---
title: MQ DEFPSIST Bottlenecks
author: Tech Debug
type: post
date: 2007-08-19T22:23:05+00:00
url: /blog/2007/08/20/mq-defpsist-bottlenecks/
categories:
  - MQ
  - unix

---
Recently I posted about our Websphere MQ MQCONN 2195 errors, and how we needed to apply the minimal recommended Solaris Kernel tuning for Websphere MQ. Well, we applied the changes, rebooted and connection problems were gone. Our application was able to spawn multiple connections to MQ without the errors we were seeing before.

However, we were still getting climbing response times when doing load tests between a request message being sent and a reply message arriving back. In conjunction with these times, we saw (using iostat) very high inferred disk utilisation from the SAN devices we had MQ and our application on.

So the team looked through the configuration of our clustered queue managers, and the logs, and application tuning (Triple writing vs. Single writing in MQ), and so on&#8230;.

[Our specialist tester][1] had written a customised load harness to test response and throughput, and his graphs showed a bottleneck somewhere in the system. We knew the environment was good, as a &#8220;cloned&#8221; development queue manager and application on the pre-production system was getting response times at around a 10 millisecond median.

We tried it in a number of combinations, but finally found that the configuration had _DEFPSIST(YES)_ on all local and alias queues. Changing all these to _DEFPSIST(NO)_ led to near perfect response times. A mean response time of 20 milliseconds!!!!

`<br />
	DESCRIPTIVE STATISTICS --<br />
	--------------------------------------------------------------------------</p>
<p>	                                RESPONSE TIME           THROUGHPUT<br />
	                                (millisecs)             (transactions/sec)<br />
	        MEDIAN          :       10.00                   19.05<br />
	        LOWER QUARTILE  :       10.00                   19.05<br />
	        UPPER QUARTILE  :       30.00                   19.05<br />
	        95th PERCENTILE :       50.00                   19.05<br />
	        MINIMUM         :       0.00                    0.00<br />
	        MAXIMUM         :       200.00                  19.05<br />
	        RANGE           :       200.00                  19.05<br />
	        IQR             :       20.00                   0.00<br />
	        COUNT           :       2,000.00                2,000.00<br />
	        MEAN            :       20.45                   19.02<br />
	        STD DEV         :       15.66                   0.74</p>
<p>	--------------------------------------------------------------------------<br />
`  
We are going to need to do some tuning &#8211; as persistence turned on across the board appears to be the major performance hog, and yet we need some persistence to cover queues where that functionality is needed. But at least we found the two major causes to our bottleneck and 2195 errors.

 [1]: http://www.90kts.com/