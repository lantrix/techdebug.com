---
title: IM Status Applescript for iChat Adium and Skype
author: Tech Debug
type: post
date: 2008-12-19T01:04:42+00:00
url: /blog/2008/12/19/im-status-applescript-for-ichat-adium-and-skype/
wp-syntax-cache-content:
  - |
    a:2:{i:1;s:1928:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="applescript" style="font-family:monospace;"><span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;Adium&quot;</span> <span style="color: #ff0033; font-weight: bold;">to</span> go away <span style="color: #ff0033; font-weight: bold;">with</span> message <span style="color: #009900;">&quot;In Meeting&quot;</span>
    &nbsp;
    <span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;iChat&quot;</span>
    	<span style="color: #ff0033; font-weight: bold;">set</span> status message <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #009900;">&quot;In Meeting&quot;</span>
    <span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">tell</span>
    &nbsp;
    <span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;Skype&quot;</span>
    	send command <span style="color: #009900;">&quot;SET PROFILE MOOD_TEXT In Meeting&quot;</span> <span style="color: #ff0033; font-weight: bold;">script</span> <span style="color: #0066ff;">name</span> <span style="color: #009900;">&quot;IMStatus&quot;</span>
    <span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">tell</span></pre></td></tr></table><p class="theCode" style="display:none;">tell application &quot;Adium&quot; to go away with message &quot;In Meeting&quot;
    
    tell application &quot;iChat&quot;
    	set status message to &quot;In Meeting&quot;
    end tell
    
    tell application &quot;Skype&quot;
    	send command &quot;SET PROFILE MOOD_TEXT In Meeting&quot; script name &quot;IMStatus&quot;
    end tell</p></div>
    ";i:2;s:18128:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="applescript" style="font-family:monospace;"><span style="color: #808080; font-style: italic;">-- IMStatus</span>
    <span style="color: #808080; font-style: italic;">-- version 1.0, Lantrix (https://techdebug.com)</span>
    <span style="color: #808080; font-style: italic;">-- idea conceived from script by Jason Kenison &quot;theWebGuy&quot; Blog at:</span>
    <span style="color: #808080; font-style: italic;">--        http://www.jasonkenison.com/blog.html?id=22</span>
    &nbsp;
    <span style="color: #808080; font-style: italic;">(*
    Copyright (c) 2008, TechDebug.com
    &nbsp;
    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted, provided that the above
    copyright notice and this permission notice appear in all copies.
    &nbsp;
    THE SOFTWARE IS PROVIDED &quot;AS IS&quot; AND THE AUTHOR DISCLAIMS ALL WARRANTIES
    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
    *)</span>
    &nbsp;
    <span style="color: #808080; font-style: italic;">-- Display Dialog</span>
    <span style="color: #ff0033; font-weight: bold;">set</span> imState <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #0066ff;">display dialog</span> <span style="color: #009900;">&quot;For Skype/iChat/Adium choose&quot;</span> <span style="color: #0066ff;">buttons</span> <span style="color: #000000;">&#123;</span><span style="color: #009900;">&quot;Available&quot;</span>, <span style="color: #009900;">&quot;Away&quot;</span>, <span style="color: #009900;">&quot;Meeting&quot;</span><span style="color: #000000;">&#125;</span> default button <span style="color: #000000;">1</span>
    &nbsp;
    <span style="color: #808080; font-style: italic;">--Check App Status, to only act on apps if running</span>
    <span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;System Events&quot;</span> <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #ff0033; font-weight: bold;">set</span> AdiumIsRunning <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #000000;">&#40;</span><span style="color: #0066ff;">count</span> <span style="color: #ff0033; font-weight: bold;">of</span> <span style="color: #000000;">&#40;</span><span style="color: #ff0033;">every</span> process <span style="color: #ff0033;">whose</span> <span style="color: #0066ff;">name</span> <span style="color: #ff0033; font-weight: bold;">is</span> <span style="color: #009900;">&quot;Adium&quot;</span><span style="color: #000000;">&#41;</span><span style="color: #000000;">&#41;</span> &gt; <span style="color: #000000;">0</span>
    <span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;System Events&quot;</span> <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #ff0033; font-weight: bold;">set</span> iChatIsRunning <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #000000;">&#40;</span><span style="color: #0066ff;">count</span> <span style="color: #ff0033; font-weight: bold;">of</span> <span style="color: #000000;">&#40;</span><span style="color: #ff0033;">every</span> process <span style="color: #ff0033;">whose</span> <span style="color: #0066ff;">name</span> <span style="color: #ff0033; font-weight: bold;">is</span> <span style="color: #009900;">&quot;iChat&quot;</span><span style="color: #000000;">&#41;</span><span style="color: #000000;">&#41;</span> &gt; <span style="color: #000000;">0</span>
    <span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;System Events&quot;</span> <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #ff0033; font-weight: bold;">set</span> SkypeIsRunning <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #000000;">&#40;</span><span style="color: #0066ff;">count</span> <span style="color: #ff0033; font-weight: bold;">of</span> <span style="color: #000000;">&#40;</span><span style="color: #ff0033;">every</span> process <span style="color: #ff0033;">whose</span> <span style="color: #0066ff;">name</span> <span style="color: #ff0033; font-weight: bold;">is</span> <span style="color: #009900;">&quot;Skype&quot;</span><span style="color: #000000;">&#41;</span><span style="color: #000000;">&#41;</span> &gt; <span style="color: #000000;">0</span>
    &nbsp;
    <span style="color: #808080; font-style: italic;">-- Meeting</span>
    <span style="color: #ff0033; font-weight: bold;">if</span> <span style="color: #ff0033;">the</span> button returned <span style="color: #ff0033; font-weight: bold;">of</span> imState <span style="color: #ff0033; font-weight: bold;">is</span> <span style="color: #009900;">&quot;Meeting&quot;</span> <span style="color: #ff0033; font-weight: bold;">then</span>
    	<span style="color: #808080; font-style: italic;">-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> AdiumIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;Adium&quot;</span> <span style="color: #ff0033; font-weight: bold;">to</span> go away <span style="color: #ff0033; font-weight: bold;">with</span> message <span style="color: #009900;">&quot;In Meeting&quot;</span>
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    	<span style="color: #808080; font-style: italic;">-- iChat</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> iChatIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;iChat&quot;</span>
    			<span style="color: #ff0033; font-weight: bold;">set</span> status <span style="color: #ff0033; font-weight: bold;">to</span> away
    			<span style="color: #ff0033; font-weight: bold;">set</span> status message <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #009900;">&quot;In Meeting&quot;</span>
    		<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">tell</span>
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    	<span style="color: #808080; font-style: italic;">-- Skype</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> SkypeIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;Skype&quot;</span>
    			send command <span style="color: #009900;">&quot;SET USERSTATUS DND&quot;</span> <span style="color: #ff0033; font-weight: bold;">script</span> <span style="color: #0066ff;">name</span> <span style="color: #009900;">&quot;IMStatus&quot;</span>
    			send command <span style="color: #009900;">&quot;SET PROFILE MOOD_TEXT In Meeting&quot;</span> <span style="color: #ff0033; font-weight: bold;">script</span> <span style="color: #0066ff;">name</span> <span style="color: #009900;">&quot;IMStatus&quot;</span>
    		<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">tell</span>
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    <span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    &nbsp;
    <span style="color: #808080; font-style: italic;">-- Away</span>
    <span style="color: #ff0033; font-weight: bold;">if</span> <span style="color: #ff0033;">the</span> button returned <span style="color: #ff0033; font-weight: bold;">of</span> imState <span style="color: #ff0033; font-weight: bold;">is</span> <span style="color: #009900;">&quot;Away&quot;</span> <span style="color: #ff0033; font-weight: bold;">then</span>
    	<span style="color: #808080; font-style: italic;">-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> AdiumIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;Adium&quot;</span> <span style="color: #ff0033; font-weight: bold;">to</span> go away
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    	<span style="color: #808080; font-style: italic;">-- iChat</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> iChatIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;iChat&quot;</span>
    			<span style="color: #ff0033; font-weight: bold;">set</span> status <span style="color: #ff0033; font-weight: bold;">to</span> away
    		<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">tell</span>
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    	<span style="color: #808080; font-style: italic;">-- Skype</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> SkypeIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;Skype&quot;</span>
    			send command <span style="color: #009900;">&quot;SET USERSTATUS AWAY&quot;</span> <span style="color: #ff0033; font-weight: bold;">script</span> <span style="color: #0066ff;">name</span> <span style="color: #009900;">&quot;My Script&quot;</span>
    		<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">tell</span>
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    <span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    &nbsp;
    <span style="color: #808080; font-style: italic;">-- Available</span>
    <span style="color: #ff0033; font-weight: bold;">if</span> <span style="color: #ff0033;">the</span> button returned <span style="color: #ff0033; font-weight: bold;">of</span> imState <span style="color: #ff0033; font-weight: bold;">is</span> <span style="color: #009900;">&quot;Available&quot;</span> <span style="color: #ff0033; font-weight: bold;">then</span>
    	<span style="color: #808080; font-style: italic;">-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> AdiumIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;Adium&quot;</span> <span style="color: #ff0033; font-weight: bold;">to</span> go available
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    	<span style="color: #808080; font-style: italic;">-- iChat</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> iChatIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;iChat&quot;</span>
    			<span style="color: #ff0033; font-weight: bold;">set</span> status <span style="color: #ff0033; font-weight: bold;">to</span> available
    			<span style="color: #ff0033; font-weight: bold;">set</span> status message <span style="color: #ff0033; font-weight: bold;">to</span> <span style="color: #009900;">&quot;&quot;</span>
    		<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">tell</span>
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    	<span style="color: #808080; font-style: italic;">-- Skype</span>
    	<span style="color: #ff0033; font-weight: bold;">if</span> SkypeIsRunning <span style="color: #ff0033; font-weight: bold;">then</span>
    		<span style="color: #ff0033; font-weight: bold;">tell</span> <span style="color: #0066ff;">application</span> <span style="color: #009900;">&quot;Skype&quot;</span>
    			send command <span style="color: #009900;">&quot;SET USERSTATUS ONLINE&quot;</span> <span style="color: #ff0033; font-weight: bold;">script</span> <span style="color: #0066ff;">name</span> <span style="color: #009900;">&quot;My Script&quot;</span>
    			send command <span style="color: #009900;">&quot;SET PROFILE MOOD_TEXT&quot;</span> <span style="color: #ff0033; font-weight: bold;">script</span> <span style="color: #0066ff;">name</span> <span style="color: #009900;">&quot;IMStatus&quot;</span>
    		<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">tell</span>
    	<span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span>
    <span style="color: #ff0033; font-weight: bold;">end</span> <span style="color: #ff0033; font-weight: bold;">if</span></pre></td></tr></table><p class="theCode" style="display:none;">-- IMStatus
    -- version 1.0, Lantrix (https://techdebug.com)
    -- idea conceived from script by Jason Kenison &quot;theWebGuy&quot; Blog at:
    --        http://www.jasonkenison.com/blog.html?id=22
    
    (*
    Copyright (c) 2008, TechDebug.com
    
    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted, provided that the above
    copyright notice and this permission notice appear in all copies.
    
    THE SOFTWARE IS PROVIDED &quot;AS IS&quot; AND THE AUTHOR DISCLAIMS ALL WARRANTIES
    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
    *)
    
    -- Display Dialog
    set imState to display dialog &quot;For Skype/iChat/Adium choose&quot; buttons {&quot;Available&quot;, &quot;Away&quot;, &quot;Meeting&quot;} default button 1
    
    --Check App Status, to only act on apps if running
    tell application &quot;System Events&quot; to set AdiumIsRunning to (count of (every process whose name is &quot;Adium&quot;)) &gt; 0
    tell application &quot;System Events&quot; to set iChatIsRunning to (count of (every process whose name is &quot;iChat&quot;)) &gt; 0
    tell application &quot;System Events&quot; to set SkypeIsRunning to (count of (every process whose name is &quot;Skype&quot;)) &gt; 0
    
    -- Meeting
    if the button returned of imState is &quot;Meeting&quot; then
    	-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)
    	if AdiumIsRunning then
    		tell application &quot;Adium&quot; to go away with message &quot;In Meeting&quot;
    	end if
    	-- iChat
    	if iChatIsRunning then
    		tell application &quot;iChat&quot;
    			set status to away
    			set status message to &quot;In Meeting&quot;
    		end tell
    	end if
    	-- Skype
    	if SkypeIsRunning then
    		tell application &quot;Skype&quot;
    			send command &quot;SET USERSTATUS DND&quot; script name &quot;IMStatus&quot;
    			send command &quot;SET PROFILE MOOD_TEXT In Meeting&quot; script name &quot;IMStatus&quot;
    		end tell
    	end if
    end if
    
    -- Away
    if the button returned of imState is &quot;Away&quot; then
    	-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)
    	if AdiumIsRunning then
    		tell application &quot;Adium&quot; to go away
    	end if
    	-- iChat
    	if iChatIsRunning then
    		tell application &quot;iChat&quot;
    			set status to away
    		end tell
    	end if
    	-- Skype
    	if SkypeIsRunning then
    		tell application &quot;Skype&quot;
    			send command &quot;SET USERSTATUS AWAY&quot; script name &quot;My Script&quot;
    		end tell
    	end if
    end if
    
    -- Available
    if the button returned of imState is &quot;Available&quot; then
    	-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)
    	if AdiumIsRunning then
    		tell application &quot;Adium&quot; to go available
    	end if
    	-- iChat
    	if iChatIsRunning then
    		tell application &quot;iChat&quot;
    			set status to available
    			set status message to &quot;&quot;
    		end tell
    	end if
    	-- Skype
    	if SkypeIsRunning then
    		tell application &quot;Skype&quot;
    			send command &quot;SET USERSTATUS ONLINE&quot; script name &quot;My Script&quot;
    			send command &quot;SET PROFILE MOOD_TEXT&quot; script name &quot;IMStatus&quot;
    		end tell
    	end if
    end if</p></div>
    ";}
categories:
  - mac
tags:
  - adium
  - applescript
  - ichat
  - skype
  - status

---
I use iChat, Adium and Skype all at the same time. I was looking for a quick way to change the status of all three of them with one fell swoop.

Looking at what other people had written I came across a [good example at Jason Kenison&#8217;s blog][1]. He had implemented a method whereby you select Away or Available and then the script will change the status of all three. It worked for Skype and iChat but not for Adium.  
<!--more-->

  
The method of setting the status as Jason had done no longer works under Adium 1.3+ and to that end someone had raised a [support ticket][2] with the Adium team. The details in the ticket and some further googling led me to the Adium [Applescript interface documentation][3]. The means of setting the status now is as simple as  
`tell application "Adium" to go away`  
This solved the problem with Adium.

But of course I was not happy with that. If you only had two of the programs running, and did not want the third running e.g. Skype, the script would launch the application to set the status. This is where [Apples Language guide][4] did the trick. One can check to see if a process is running like this  
`ell application "System Events" to set SkypeIsRunning to (count of (every process whose name is "Skype")) > 0`  
The variable _SkypeIsRunning_ could be used as a true/false variable for logical testing.

Still not satisfied, I wondered if there was a way to set the &#8220;Status Text&#8221; for the applications, say if I was in a meeting. I knew how to do this for iChat and Adium but what about Skype? The [developers documentation][5] shows how this can be achieved and then it was as simple as setting that status text like this for all three applications

<pre lang="Applescript">tell application "Adium" to go away with message "In Meeting"</p>


<p>
  tell application "iChat"<br />
  	set status message to "In Meeting"<br />
  end tell
</p>


<p>
  tell application "Skype"<br />
  	send command "SET PROFILE MOOD_TEXT In Meeting" script name "IMStatus"<br />
  end tell<br />
  </code><br />
  So now I have a way to quickly tell the application to be Available, Away or In a Meeting.
</p>


<p>
  Here is the final script with all the included ideas.
</p>


<pre lang="Applescript">
-- IMStatus<br />
-- version 1.0, Lantrix (https://techdebug.com)<br />
-- idea conceived from script by Jason Kenison "theWebGuy" Blog at:<br />
--        http://www.jasonkenison.com/blog.html?id=22</p>


<p>
  (*<br />
  Copyright (c) 2008, TechDebug.com
</p>


<p>
  Permission to use, copy, modify, and/or distribute this software for any<br />
  purpose with or without fee is hereby granted, provided that the above<br />
  copyright notice and this permission notice appear in all copies.
</p>


<p>
  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES<br />
  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF<br />
  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR<br />
  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES<br />
  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN<br />
  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF<br />
  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.<br />
  *)
</p>


<p>
  -- Display Dialog<br />
  set imState to display dialog "For Skype/iChat/Adium choose" buttons {"Available", "Away", "Meeting"} default button 1
</p>


<p>
  --Check App Status, to only act on apps if running<br />
  tell application "System Events" to set AdiumIsRunning to (count of (every process whose name is "Adium")) > 0<br />
  tell application "System Events" to set iChatIsRunning to (count of (every process whose name is "iChat")) > 0<br />
  tell application "System Events" to set SkypeIsRunning to (count of (every process whose name is "Skype")) > 0
</p>


<p>
  -- Meeting<br />
  if the button returned of imState is "Meeting" then<br />
  	-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)<br />
  	if AdiumIsRunning then<br />
  		tell application "Adium" to go away with message "In Meeting"<br />
  	end if<br />
  	-- iChat<br />
  	if iChatIsRunning then<br />
  		tell application "iChat"<br />
  			set status to away<br />
  			set status message to "In Meeting"<br />
  		end tell<br />
  	end if<br />
  	-- Skype<br />
  	if SkypeIsRunning then<br />
  		tell application "Skype"<br />
  			send command "SET USERSTATUS DND" script name "IMStatus"<br />
  			send command "SET PROFILE MOOD_TEXT In Meeting" script name "IMStatus"<br />
  		end tell<br />
  	end if<br />
  end if
</p>


<p>
  -- Away<br />
  if the button returned of imState is "Away" then<br />
  	-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)<br />
  	if AdiumIsRunning then<br />
  		tell application "Adium" to go away<br />
  	end if<br />
  	-- iChat<br />
  	if iChatIsRunning then<br />
  		tell application "iChat"<br />
  			set status to away<br />
  		end tell<br />
  	end if<br />
  	-- Skype<br />
  	if SkypeIsRunning then<br />
  		tell application "Skype"<br />
  			send command "SET USERSTATUS AWAY" script name "My Script"<br />
  		end tell<br />
  	end if<br />
  end if
</p>


<p>
  -- Available<br />
  if the button returned of imState is "Available" then<br />
  	-- Adium (works with 1.2+ as per http://trac.adiumx.com/wiki/AppleScript_Support_1.2 documentation)<br />
  	if AdiumIsRunning then<br />
  		tell application "Adium" to go available<br />
  	end if<br />
  	-- iChat<br />
  	if iChatIsRunning then<br />
  		tell application "iChat"<br />
  			set status to available<br />
  			set status message to ""<br />
  		end tell<br />
  	end if<br />
  	-- Skype<br />
  	if SkypeIsRunning then<br />
  		tell application "Skype"<br />
  			send command "SET USERSTATUS ONLINE" script name "My Script"<br />
  			send command "SET PROFILE MOOD_TEXT" script name "IMStatus"<br />
  		end tell<br />
  	end if<br />
  end if<br />
  </code>
</p>


<p>
  You can <a href='https://techdebug.com/wp-content/uploads/2008/12/imstatus.scpt'>download the script</a> and try it for yourself.
</p>


<p>
  Running this AppleScript will pop up a dialog box that gives you 3 options. You can customise the "In Meeting" to your own status. Have fun.
</p>

 [1]: http://www.jasonkenison.com/blog.html?id=22
 [2]: http://trac.adiumx.com/ticket/8809
 [3]: http://trac.adiumx.com/wiki/AppleScript
 [4]: http://developer.apple.com/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html
 [5]: https://developer.skype.com/Docs/ApiDoc/