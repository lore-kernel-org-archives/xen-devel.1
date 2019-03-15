From: "John L. Poole" <jlpoole56@gmail.com>
Subject: Re: [BUG] Sporadic boot of Xen Kernel 4.12.0,
 hangs at random EXTInt
Date: Fri, 15 Mar 2019 14:50:14 -0700
Message-ID: <84ce2f6e-684b-898b-ea52-273de99b2484@gmail.com>
References: <48347a1c-add2-2a2a-e8fa-77f26597a31e@gmail.com>
 <b132cc90-3b02-d740-9389-5445418e35f6@citrix.com>
 <e36ab4e1-a2b7-f957-34ee-2ee44ca9cb6b@citrix.com>
Reply-To: jlpoole56@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6567885863671323416=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e36ab4e1-a2b7-f957-34ee-2ee44ca9cb6b@citrix.com>
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
Cc: xen@gentoo.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============6567885863671323416==
Content-Type: multipart/alternative;
 boundary="------------A7DF9AC5A294EA8913B591B7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A7DF9AC5A294EA8913B591B7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/15/2019 2:30 PM, Andrew Cooper wrote:
> On 15/03/2019 20:49, Andrew Cooper wrote:
>> On 15/03/2019 18:35, John L. Poole wrote:
>>> I have a Supermicro Intel Atom based server with UEFI.  I purchased the
>>> server in November 2016 intending to run Xen server.  I was able
>>> to overcome some problem in 2016 with help from the Xen Project and
>>> I was able to load a xen kernel built in Gentoo for Gentoo VMs manually
>>> using the EFI command.  At that time, I was told grub2 was not UEFI
>>> ready.
>>>
>>> Now I have been trying to integrate grub2 with Xen using kernel version
>>> 4.19.23-gentoo.  I am witnessing boot attempts that fail at different
>>> points just after calls to setup_local_APIC in apic.c. Sometimes I am
>>> successful in loading the Xen Kernel and then everything goes smoothly
>>> loading the DOM0 session.  I can then load the VMs and everything
>>> seems okay.  But most of the time, the boot up hangs in
>>> between calls to the function setup_local_APIC in apic.c.
>>>
>>> I had posted to the XEN Users list and had little, if any, response.
>>> I have created two bugs within Gentoo's system, differentiated by
>>> xen kernels:
>>>
>>> 4.11.1       athttps://bugs.gentoo.org/679826
>>> 4.12.0_rc4   athttps://bugs.gentoo.org/680472
>>>
>>> What is really vexing is the randomness of results.  For instance, here
>>> a log from this morning of success vs. failures:
>>>
>>> 9:17 AM 3/15/2019   2   (XEN) [2019-03-15 16:17:33] Adding cpu 2 to
>>> runqueue 0
>>> 9:18 AM 3/15/2019   5   (XEN) [2019-03-15 16:18:53] Adding cpu 5 to
>>> runqueue 0
>>> 9:19 AM 3/15/2019   SUCCESS!!
>>> after * key in serial port for "diagnostics all", shutdown by watchdog.
>>> 9:30 AM 3/15/2019   SUCCESS!!
>>> (XEN) [2019-03-15 16:32:54] Hardware Dom0 shutdown: watchdog rebooting
>>> machine
>>> 9:34 AM 3/15/2019   Before 1: (XEN) [2019-03-15 16:34:14] HVM: HAP
>>> page sizes: 4kB, 2MB
>>> 9:35 AM 3/15/2019   3
>>> 9:36 AM 3/15/2019   4   (XEN) [2019-03-15 16:37:21] Adding cpu 4 to
>>> runqueue 0
>>> 9:37 AM 3/15/2019   Before 1: (XEN) [2019-03-15 16:38:33] HVM: HAP
>>> page sizes: 4kB, 2MB
>>> 9:39 AM 3/15/2019   SUCCESS!!
>>>
>>> My attempt to isolate the failure point has been unsuccessful. I'm
>>> prepared
>>> to patch 4.12.0_rc4 if that will help, my previous attempt in 4.11.1 only
>>> allowed me to conclude that the problem is not within apic.c.
>> You have a floating serial line, which is simulating you typing characters.
>>
>> The '*' key is "run all diagnostic keyhandlers", and later it passes an
>> 'R' which instructs Xen to reboot.
>>
>> The keyhandlers start functioning as soon as we can possibly make them
>> after enabling interrupts, which is why you see it shortly after
>> setup_local_APIC()
>
> Right - I've done some trawling through your bug tickets.
>
> Please please please always start with a full and complete serial log 
> showing all of Xen's boot up until the point things go wrong.
>
> Using the log from https://bugs.gentoo.org/679826#c6 , we get the 
> following things:
>
> (XEN) Xen version 4.11.1 (@[unknown]) (x86_64-pc-linux-gnu-gcc (Gentoo 7.3.0-r3 p1.4) 7.3.0) debug=n  Wed Mar  6 19:34:00 PST 2019
> (XEN) Latest ChangeSet:
>
> Not directly related to your issue, but something is missing the 
> changeset information in your build, and you typically want to be 
> using a debug build of Xen for investigations like this.
>
> (XEN) Bootloader: GRUB 2.02
>
> but
>
> (XEN) ACPI Error (tbxfroot-0217): A valid RSDP was not found [20070126]
>
> So the first problem is that there aren't any APCI tables to be 
> found.  You're presumably booting in EFI mode, but either Grub hasn't 
> handed the SystemTable/etc to Xen, or Xen wasn't built with an 
> EFI-capable toolchain and isn't capable of receiving them via the 
> extended multiboot2 protocol.  One way or another, this is the root of 
> the problem.
>
> Xen did however find:
>
> (XEN) Intel MultiProcessor Specification v1.4
> (XEN)     Virtual Wire compatibility mode.
>
> Which is the pre-APCI standard for multi-processor systems.  This is 
> also why we start masking ExtINT, because that is how such systems 
> were supposed to be set up.  However, it is almost certainly 
> interfering with some kind of BMC activity, probably an SMI.  I don't 
> think it is worth investigating, because it is an obsolete mode these 
> days which the system firmware won't be designed to cope with.
>
>
> For other areas of interest, I see:
>
> (XEN) Unrecognised CPU model 0x4d - assuming not reptpoline safe
>
> This particular server is Avaton/Rangely which is an Atom based 
> microserver.  It is almost certainly retpoline-safe, because it was 
> only Skylake generation systems which weren't, but I'll try and follow 
> up on this.
>
> Anyway - the root of your problem is that Xen can't find the ACPI 
> tables, which is either going to be a grub or a Xen build 
> misconfiguration.
>
> ~Andrew

Thank you, thank you Andrew.  Your analysis is great news.  I'll work 
with the Xen Team at Gentoo and see what can be determined about the 
APCI tables.

-John

--------------A7DF9AC5A294EA8913B591B7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/15/2019 2:30 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e36ab4e1-a2b7-f957-34ee-2ee44ca9cb6b@citrix.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">On 15/03/2019 20:49, Andrew Cooper
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

4.11.1       at  <a class="moz-txt-link-freetext" href="https://bugs.gentoo.org/679826" moz-do-not-send="true">https://bugs.gentoo.org/679826</a>
4.12.0_rc4   at  <a class="moz-txt-link-freetext" href="https://bugs.gentoo.org/680472" moz-do-not-send="true">https://bugs.gentoo.org/680472</a>

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
        <pre class="moz-quote-pre" wrap="">You have a floating serial line, which is simulating you typing characters.

The '*' key is "run all diagnostic keyhandlers", and later it passes an
'R' which instructs Xen to reboot.

The keyhandlers start functioning as soon as we can possibly make them
after enabling interrupts, which is why you see it shortly after
setup_local_APIC()</pre>
      </blockquote>
      <br>
      Right - I've done some trawling through your bug tickets.<br>
      <br>
      Please please please always start with a full and complete serial
      log showing all of Xen's boot up until the point things go wrong.<br>
      <br>
      Using the log from <a class="moz-txt-link-freetext"
        href="https://bugs.gentoo.org/679826#c6" moz-do-not-send="true">https://bugs.gentoo.org/679826#c6</a>
      , we get the following things:<br>
      <br>
      <pre>(XEN) Xen version 4.11.1 (@[unknown]) (x86_64-pc-linux-gnu-gcc (Gentoo 7.3.0-r3 p1.4) 7.3.0) debug=n  Wed Mar  6 19:34:00 PST 2019
(XEN) Latest ChangeSet:</pre>
      <br>
      Not directly related to your issue, but something is missing the
      changeset information in your build, and you typically want to be
      using a debug build of Xen for investigations like this.<br>
      <br>
      <pre>(XEN) Bootloader: GRUB 2.02

but

(XEN) ACPI Error (tbxfroot-0217): A valid RSDP was not found [20070126]</pre>
      <br>
      So the first problem is that there aren't any APCI tables to be
      found.  You're presumably booting in EFI mode, but either Grub
      hasn't handed the SystemTable/etc to Xen, or Xen wasn't built with
      an EFI-capable toolchain and isn't capable of receiving them via
      the extended multiboot2 protocol.  One way or another, this is the
      root of the problem.<br>
      <br>
      Xen did however find:<br>
      <br>
      <pre>(XEN) Intel MultiProcessor Specification v1.4
(XEN)     Virtual Wire compatibility mode.</pre>
      <br>
      Which is the pre-APCI standard for multi-processor systems.  This
      is also why we start masking ExtINT, because that is how such
      systems were supposed to be set up.  However, it is almost
      certainly interfering with some kind of BMC activity, probably an
      SMI.  I don't think it is worth investigating, because it is an
      obsolete mode these days which the system firmware won't be
      designed to cope with.<br>
      <br>
      <br>
      For other areas of interest, I see:<br>
      <br>
      <pre>(XEN) Unrecognised CPU model 0x4d - assuming not reptpoline safe</pre>
      <br>
      This particular server is Avaton/Rangely which is an Atom based
      microserver.  It is almost certainly retpoline-safe, because it
      was only Skylake generation systems which weren't, but I'll try
      and follow up on this.<br>
      <br>
      Anyway - the root of your problem is that Xen can't find the ACPI
      tables, which is either going to be a grub or a Xen build
      misconfiguration.<br>
      <br>
      ~Andrew<br>
    </blockquote>
    <p>Thank you, thank you Andrew.  Your analysis is great news.  I'll
      work with the Xen Team at Gentoo and see what can be determined
      about the APCI tables.<br>
    </p>
    <div class="moz-signature"><font size="2"><font face="Verdana">-John</font></font></div>
  </body>
</html>

--------------A7DF9AC5A294EA8913B591B7--


--===============6567885863671323416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6567885863671323416==--
