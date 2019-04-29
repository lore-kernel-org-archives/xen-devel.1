From: "John L. Poole" <jlpoole56@gmail.com>
Subject: Re: Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
Date: Mon, 29 Apr 2019 08:08:33 -0700
Message-ID: <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
References: <20190322075941.bdf6i3veheiblwzs@MacBook-Air-de-Roger.local>
 <9f9c4a21-b426-f0fc-7c09-2f5d392b488c@gmail.com>
 <5C98F95C0200007800221B56@prv1-mh.provo.novell.com>
 <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
 <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
Reply-To: jlpoole56@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3978920105339081176=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============3978920105339081176==
Content-Type: multipart/alternative;
 boundary="------------E8989E25E6CF240196060D32"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E8989E25E6CF240196060D32
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/29/2019 5:02 AM, Roger Pau Monné wrote:
> On Tue, Apr 16, 2019 at 09:23:11AM -0700, John L. Poole wrote:
>> On 3/27/2019 7:21 AM, Jan Beulich wrote:
>>>>>> On 27.03.19 at 14:25, <jlpoole56@gmail.com> wrote:
>>>> On 3/27/2019 1:14 AM, Jan Beulich wrote:
>>>>>>>> On 26.03.19 at 18:21, <jlpoole56@gmail.com> wrote:
>>>>>> zeta /usr/local/src/xen # cat xen/.config |grep CONFIG_HVM
>>>>>> # CONFIG_HVM is not set
>>>>>> zeta /usr/local/src/xen #
>>>>>>
>>>>>> # tried 2 boot attempts
>>>>>> log at: https://pastebin.com/nL4BWJ6Y
>>>>>>
>>>>>> Hang points at lines:
>>>>> Thanks for trying anyway; one further possibility eliminated. Looking
>>>>> at the logs I've had another thought (wild guess again, so not really
>>>>> much hope): Could you try "mwait-idle=no"?
>>>>>
>>>> I modified man_xen.cfg by adding at the end the kernel parameter:
>>>>
>>>> mwait-idle=no
>>>>
>>>> Rebooted.
>>>> Result: hung:
>>> Thanks. I'm afraid I'm out of ideas for the moment.
>>>
>>> Jan
>>>
>>>
>> Jan,
>>
>> Recall, the Xen kernel successfully launched in 2017 when I first built
>> Xen in Gentoo, that was about version 4.7.1.  I had to launch it
>> from an EFI console.  I've tried to revert back to 4.7.1 and
>> build a kernel and I have found it too difficult as certain
>> dependencies have since been removed from Gentoo.
> Unless some of us can get our hands on one of such systems I think
> your best bet would be to try to bisect the changes between 4.7 and
> 4.8 if 4.7 was indeed working on your system.
>
> Note that you only need to build the Xen hypervisor (make xen) in
> order to bisect this issue, there's no need to build the tools at
> all, which is where almost all of the dependencies come from. The
> hypervisor is mostly standalone and only have dependencies on a
> couple of tools.
>
> Roger.
Thank you, Roger.

In Gentoo, there are two packages of xen and xen-tools which
tend to progress with the same release number. When
I try to go back an install a 4.7.x set, my compiler errors out
in the xen-tools  with:
"directive writing up to 39 bytes into a region of size between 17 and 37 "
so I suspect the advancement of my compiler is finding problems
my compiler of 2 years ago could not.

I'll try to if I can modify a xen 4.7.x package pointing to a recent 
xen-tools,
e.g. 4.12.0.  If that doesn't work, I'll try using a xen source from your
repository and hand compile.

Yes, be assured I did, at one time, build xen on this machine as I have
a couple of VMs on there that I depend upon and I have to confess
that during my upgrade I did not take the step to back-up the
working xen kernel.  So now I am effectively locked out from my
day-to-day resources on my atom VMs which has compounded the
exasperation I experience.  have been without my working data
set locked up in a Gentoo kernel VM because I cannot launch Dom0.
A very painful lesson learned: always back up the working kernel
and EFI files before undertaking an upgrade.

--------------E8989E25E6CF240196060D32
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/29/2019 5:02 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger">
      <pre class="moz-quote-pre" wrap="">On Tue, Apr 16, 2019 at 09:23:11AM -0700, John L. Poole wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 3/27/2019 7:21 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On 27.03.19 at 14:25, <a class="moz-txt-link-rfc2396E" href="mailto:jlpoole56@gmail.com">&lt;jlpoole56@gmail.com&gt;</a> wrote:
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">On 3/27/2019 1:14 AM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">On 26.03.19 at 18:21, <a class="moz-txt-link-rfc2396E" href="mailto:jlpoole56@gmail.com">&lt;jlpoole56@gmail.com&gt;</a> wrote:
</pre>
                  </blockquote>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">zeta /usr/local/src/xen # cat xen/.config |grep CONFIG_HVM
# CONFIG_HVM is not set
zeta /usr/local/src/xen #

# tried 2 boot attempts
log at: <a class="moz-txt-link-freetext" href="https://pastebin.com/nL4BWJ6Y">https://pastebin.com/nL4BWJ6Y</a>

Hang points at lines:
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Thanks for trying anyway; one further possibility eliminated. Looking
at the logs I've had another thought (wild guess again, so not really
much hope): Could you try "mwait-idle=no"?

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I modified man_xen.cfg by adding at the end the kernel parameter:

mwait-idle=no

Rebooted.
Result: hung:
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Thanks. I'm afraid I'm out of ideas for the moment.

Jan


</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Jan,

Recall, the Xen kernel successfully launched in 2017 when I first built
Xen in Gentoo, that was about version 4.7.1.  I had to launch it
from an EFI console.  I've tried to revert back to 4.7.1 and
build a kernel and I have found it too difficult as certain
dependencies have since been removed from Gentoo.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Unless some of us can get our hands on one of such systems I think
your best bet would be to try to bisect the changes between 4.7 and
4.8 if 4.7 was indeed working on your system.

Note that you only need to build the Xen hypervisor (make xen) in
order to bisect this issue, there's no need to build the tools at
all, which is where almost all of the dependencies come from. The
hypervisor is mostly standalone and only have dependencies on a
couple of tools.

Roger.
</pre>
    </blockquote>
    <div class="moz-signature"><font size="2"><font face="Verdana">Thank
          you, Roger.</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">In
          Gentoo, there are two packages of xen and xen-tools which</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">tend
          to progress with the same release number. When</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I try
          to go back an install a 4.7.x set, my compiler errors out<br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">in
          the xen-tools  with:</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">"directive
          writing up to 39 bytes into a region of size between 17 and 37
          "</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">so I
          suspect the advancement of my compiler is finding problems</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">my
          compiler of 2 years ago could not.<br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I'll
          try to if I can modify a xen 4.7.x package pointing to a
          recent xen-tools,</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">e.g.
          4.12.0.  If that doesn't work, I'll try using a xen source
          from your</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">repository
          and hand compile.</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">Yes,
          be assured I did, at one time, build xen on this machine as I
          have</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">a
          couple of VMs on there that I depend upon and I have to
          confess</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">that
          during my upgrade I did not take the step to back-up the</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">working
          xen kernel.  So now I am effectively locked out from my</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">day-to-day
          resources on my atom VMs which has compounded the</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">exasperation
          I experience.  have been without my working data</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">set
          locked up in a Gentoo kernel VM because I cannot launch Dom0.</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">A
          very painful lesson learned: always back up the working kernel</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">and
          EFI files before undertaking an upgrade.<br>
        </font></font></div>
  </body>
</html>

--------------E8989E25E6CF240196060D32--


--===============3978920105339081176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3978920105339081176==--
