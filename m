From: "John L. Poole" <jlpoole56@gmail.com>
Subject: Re: [BUG] Sporadic boot of Xen Kernel 4.12.0,
 hangs at random EXTInt
Date: Fri, 15 Mar 2019 14:18:48 -0700
Message-ID: <ae110d07-cb06-91d0-aa9f-97cd74b2cf44@gmail.com>
References: <48347a1c-add2-2a2a-e8fa-77f26597a31e@gmail.com>
 <b132cc90-3b02-d740-9389-5445418e35f6@citrix.com>
Reply-To: jlpoole56@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7305207916155093817=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b132cc90-3b02-d740-9389-5445418e35f6@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============7305207916155093817==
Content-Type: multipart/alternative;
 boundary="------------4179DBAE4264DE543C7F80BC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4179DBAE4264DE543C7F80BC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/15/2019 1:49 PM, Andrew Cooper wrote:
> On 15/03/2019 18:35, John L. Poole wrote:
>> I have a Supermicro Intel Atom based server with UEFI.  I purchased the
>> server in November 2016 intending to run Xen server.  I was able
>> to overcome some problem in 2016 with help from the Xen Project and
>> I was able to load a xen kernel built in Gentoo for Gentoo VMs manually
>> using the EFI command.  At that time, I was told grub2 was not UEFI
>> ready.
>>
>> Now I have been trying to integrate grub2 with Xen using kernel version
>> 4.19.23-gentoo.  I am witnessing boot attempts that fail at different
>> points just after calls to setup_local_APIC in apic.c. Sometimes I am
>> successful in loading the Xen Kernel and then everything goes smoothly
>> loading the DOM0 session.  I can then load the VMs and everything
>> seems okay.  But most of the time, the boot up hangs in
>> between calls to the function setup_local_APIC in apic.c.
>>
>> I had posted to the XEN Users list and had little, if any, response.
>> I have created two bugs within Gentoo's system, differentiated by
>> xen kernels:
>>
>> 4.11.1       at  https://bugs.gentoo.org/679826
>> 4.12.0_rc4   at  https://bugs.gentoo.org/680472
>>
>> What is really vexing is the randomness of results.  For instance, here
>> a log from this morning of success vs. failures:
>>
>> 9:17 AM 3/15/2019   2   (XEN) [2019-03-15 16:17:33] Adding cpu 2 to
>> runqueue 0
>> 9:18 AM 3/15/2019   5   (XEN) [2019-03-15 16:18:53] Adding cpu 5 to
>> runqueue 0
>> 9:19 AM 3/15/2019   SUCCESS!!
>> after * key in serial port for "diagnostics all", shutdown by watchdog.
>> 9:30 AM 3/15/2019   SUCCESS!!
>> (XEN) [2019-03-15 16:32:54] Hardware Dom0 shutdown: watchdog rebooting
>> machine
>> 9:34 AM 3/15/2019   Before 1: (XEN) [2019-03-15 16:34:14] HVM: HAP
>> page sizes: 4kB, 2MB
>> 9:35 AM 3/15/2019   3
>> 9:36 AM 3/15/2019   4   (XEN) [2019-03-15 16:37:21] Adding cpu 4 to
>> runqueue 0
>> 9:37 AM 3/15/2019   Before 1: (XEN) [2019-03-15 16:38:33] HVM: HAP
>> page sizes: 4kB, 2MB
>> 9:39 AM 3/15/2019   SUCCESS!!
>>
>> My attempt to isolate the failure point has been unsuccessful. I'm
>> prepared
>> to patch 4.12.0_rc4 if that will help, my previous attempt in 4.11.1 only
>> allowed me to conclude that the problem is not within apic.c.
> You have a floating serial line, which is simulating you typing characters.
>
> The '*' key is "run all diagnostic keyhandlers", and later it passes an
> 'R' which instructs Xen to reboot.
>
> The keyhandlers start functioning as soon as we can possibly make them
> after enabling interrupts, which is why you see it shortly after
> setup_local_APIC()
>
> ~Andrew
Thank you for the clarification.  I'm new to this and relied on the 
self-documentation.

If I am understanding you correctly, perhaps this change may help?

zeta /home/jlpoole/xenmods # diff keyhandler.c keyhandler_jlpoole.c
60c60
<     IRQ_KEYHANDLER('*', run_all_keyhandlers, "print all diagnostics", 0),
---
 >     IRQ_KEYHANDLER('*', run_all_keyhandlers, "print all diagnostics 
and reboot", 0),
zeta /home/jlpoole/xenmods #


-John


--------------4179DBAE4264DE543C7F80BC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/15/2019 1:49 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b132cc90-3b02-d740-9389-5445418e35f6@citrix.com">
      <pre class="moz-quote-pre" wrap="">On 15/03/2019 18:35, John L. Poole wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I have a Supermicro Intel Atom based server with UEFI.  I purchased the
server in November 2016 intending to run Xen server.  I was able
to overcome some problem in 2016 with help from the Xen Project and
I was able to load a xen kernel built in Gentoo for Gentoo VMs manually
using the EFI command.  At that time, I was told grub2 was not UEFI
ready.

Now I have been trying to integrate grub2 with Xen using kernel version
4.19.23-gentoo.  I am witnessing boot attempts that fail at different
points just after calls to setup_local_APIC in apic.c. Sometimes I am
successful in loading the Xen Kernel and then everything goes smoothly
loading the DOM0 session.  I can then load the VMs and everything
seems okay.  But most of the time, the boot up hangs in
between calls to the function setup_local_APIC in apic.c.

I had posted to the XEN Users list and had little, if any, response.
I have created two bugs within Gentoo's system, differentiated by
xen kernels:

4.11.1       at  <a class="moz-txt-link-freetext" href="https://bugs.gentoo.org/679826">https://bugs.gentoo.org/679826</a>
4.12.0_rc4   at  <a class="moz-txt-link-freetext" href="https://bugs.gentoo.org/680472">https://bugs.gentoo.org/680472</a>

What is really vexing is the randomness of results.  For instance, here
a log from this morning of success vs. failures:

9:17 AM 3/15/2019   2   (XEN) [2019-03-15 16:17:33] Adding cpu 2 to
runqueue 0
9:18 AM 3/15/2019   5   (XEN) [2019-03-15 16:18:53] Adding cpu 5 to
runqueue 0
9:19 AM 3/15/2019   SUCCESS!!
after * key in serial port for "diagnostics all", shutdown by watchdog.
9:30 AM 3/15/2019   SUCCESS!!
(XEN) [2019-03-15 16:32:54] Hardware Dom0 shutdown: watchdog rebooting
machine
9:34 AM 3/15/2019   Before 1: (XEN) [2019-03-15 16:34:14] HVM: HAP
page sizes: 4kB, 2MB
9:35 AM 3/15/2019   3
9:36 AM 3/15/2019   4   (XEN) [2019-03-15 16:37:21] Adding cpu 4 to
runqueue 0
9:37 AM 3/15/2019   Before 1: (XEN) [2019-03-15 16:38:33] HVM: HAP
page sizes: 4kB, 2MB
9:39 AM 3/15/2019   SUCCESS!!

My attempt to isolate the failure point has been unsuccessful. I'm
prepared
to patch 4.12.0_rc4 if that will help, my previous attempt in 4.11.1 only
allowed me to conclude that the problem is not within apic.c.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You have a floating serial line, which is simulating you typing characters.

The '*' key is "run all diagnostic keyhandlers", and later it passes an
'R' which instructs Xen to reboot.

The keyhandlers start functioning as soon as we can possibly make them
after enabling interrupts, which is why you see it shortly after
setup_local_APIC()

~Andrew
</pre>
    </blockquote>
    <div class="moz-signature">Thank you for the clarification.  I'm new
      to this and relied on the self-documentation.</div>
    <div class="moz-signature"><br>
    </div>
    <div class="moz-signature">If I am understanding you correctly,
      perhaps this change may help?</div>
    <div class="moz-signature"><br>
    </div>
    <div class="moz-signature">zeta /home/jlpoole/xenmods # diff
      keyhandler.c keyhandler_jlpoole.c<br>
      60c60<br>
      &lt;     IRQ_KEYHANDLER('*', run_all_keyhandlers, "print all
      diagnostics", 0),<br>
      ---<br>
      &gt;     IRQ_KEYHANDLER('*', run_all_keyhandlers, "print all
      diagnostics and reboot", 0),<br>
      zeta /home/jlpoole/xenmods #</div>
    <p><br>
    </p>
    <p><font size="2"><font face="Verdana">-John</font></font><br>
    </p>
  </body>
</html>

--------------4179DBAE4264DE543C7F80BC--


--===============7305207916155093817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7305207916155093817==--
