From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Ping: [PATCH 0/5] x86: more power-efficient CPU
 parking
Date: Wed, 3 Apr 2019 15:44:33 +0100
Message-ID: <d350614d-e3ec-5962-af7a-2e4acc0682d8@citrix.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC1F1@prv1-mh.provo.novell.com>
 <5B61C21202000078001F8805@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC6BD@prv1-mh.provo.novell.com>
 <5B61C212020000780020B6D8@prv1-mh.provo.novell.com>
 <5B61C21202000000000FF27E@prv1-mh.provo.novell.com>
 <5B61C2120200007800224310@prv1-mh.provo.novell.com>
 <5CA4870A0200007800224351@prv1-mh.provo.novell.com>
 <6dab54cd-0246-2dff-42dd-93477c7c19e3@citrix.com>
 <5CA4AA600200007800224448@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0499574282327550182=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/PYL=SF=citrix.com=prvs=98944cf01=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBhHR-000608-96
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 14:54:21 +0000
In-Reply-To: <5CA4AA600200007800224448@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0499574282327550182==
Content-Type: multipart/alternative;
	boundary="------------2A7B202C0A7076C7CE6C7D6C"
Content-Language: en-GB

--------------2A7B202C0A7076C7CE6C7D6C
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 03/04/2019 13:43, Jan Beulich wrote:
>>>> On 03.04.19 at 13:14, <andrew.cooper3@citrix.com> wrote:
>> On 03/04/2019 11:12, Jan Beulich wrote:
>>>>>> On 01.08.18 at 16:22,  wrote:
>>>> When putting CPUs to sleep permanently, we should try to put them into
>>>> the most power conserving state possible. For now it is unclear whether,
>>>> especially in a deep C-state, the P-state also matters, so this series only
>>>> arranges for the C-state side of things (plus some cleanup).
>>>>
>>>> 1: x86/cpuidle: replace a pointless NULL check
>>>> 2: x86/idle: re-arrange dead-idle handling
>>>> 3: x86/cpuidle: push parked CPUs into deeper sleep states when possible
>>>> 4: x86/cpuidle: clean up Cx dumping
>>>> 5: x86: place non-parked CPUs into wait-for-SIPI state after offlining
>>> So patch 5 is understandably controversial, and I'm explicitly
>>> excluding it from the ping.
>> Considering that it causes EFI firmware to explode in several
>> interesting ways, I'm afraid it is a complete nonstarter.
> I didn't know this - neither of my two EFI boxes have exploded in
> any way during the last half year. Care to share details?

It was an assertion failure when the CPU failed to call into the SMM
rendezvous.

LogLibaErrorLogSmmLib.c(276): ((BOOLEAN)(0==1))

This is a production Dell system IIRC (or maybe Supermicro, but either
way, a production firmware).

In retrospect, fully offlining a CPU behind the back of the firmware is
an extremely antisocial thing to do, and I'm not surprised that the
firmware doesn't tolerate it.

>>> Patch 1 has gone in long ago and
>>> patch 4 has been acked. While there was some feedback on
>>> 2 (albeit stalled then after my reply), I don't think I've had any
>>> substantial feedback on 3 though, yet _they_ are supposed to
>>> provide the main improvement here. Patch 5 really was meant
>>> to be more optional than I had expressed, hence its placement
>>> even after the pure cleanup patch 4.
>> Some of the patches have cycled out of my inbox, so I'm reviewing from
>> the mail archive.
>>
>> 2) Now that default_dead_idle() isn't a terminal function, you must use
>> spec_ctrl_enter_idle() on the way back out for safety.
> Ah, yes, perhaps better to add it, than to implicitly rely on callers
> (there's really exactly one) to be terminal. (I take it you mean
> spec_ctrl_exit_idle().)

I did, sorry.

>> I'm still going to insist on something about #MC, even if it is just a
>> note in the commit message saying "this doesn't yet make #MC any safer
>> for parked CPUs".
> I can add something like this, but what is it that's known unsafe
> for parked CPUs? They in particular retain their per-CPU data. If
> anything I see a problem with fully offline CPUs. For now I'll add
> a similar sentence, but with "parked" replaced.

Ah ok - my mistake.  Basically, for any CPU we have ever started, we
need to maintain a valid stack because we can take NMIs and MCEs.

This is also a strict requirement placed on the BIOS even for APs by the
various Bios Writers Guides.  At a minimum, this is the IVT and enough
stack to handle NMIs with just an IRET, and an SMM stack.

Even for AMD CPUs which don't broadcast MCEs, we have a non-zero chance
of legitimately taking an #MC on a core we have recently downed, for a
previous action which has taken a while to propagate back.

> One other question (I apparently forgot about this aspect
> between putting together the series and posting it):
> acpi_dead_idle() has built-in loops as well. While it's not
> expected for a CPU to need waking from there (as no "even
> better" dead-idle handler could get installed) I wonder whether
> for consistency we wouldn't better drop the loops there too.

I think that would be a good idea, along with a similar speculative
adjustment.

> The downside of doing so would be added overhead in case
> of spurious wakeups (which ought to have a small chance of
> being possible in particular in the MWAIT case).

I really don't think that is a concern.  I don't think you'll be able to
measure the difference in the noise.

~Andrew

--------------2A7B202C0A7076C7CE6C7D6C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 03/04/2019 13:43, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5CA4AA600200007800224448@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 03.04.19 at 13:14, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">On 03/04/2019 11:12, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On 01.08.18 at 16:22,  wrote:
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">When putting CPUs to sleep permanently, we should try to put them into
the most power conserving state possible. For now it is unclear whether,
especially in a deep C-state, the P-state also matters, so this series only
arranges for the C-state side of things (plus some cleanup).

1: x86/cpuidle: replace a pointless NULL check
2: x86/idle: re-arrange dead-idle handling
3: x86/cpuidle: push parked CPUs into deeper sleep states when possible
4: x86/cpuidle: clean up Cx dumping
5: x86: place non-parked CPUs into wait-for-SIPI state after offlining
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">So patch 5 is understandably controversial, and I'm explicitly
excluding it from the ping.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Considering that it causes EFI firmware to explode in several
interesting ways, I'm afraid it is a complete nonstarter.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I didn't know this - neither of my two EFI boxes have exploded in
any way during the last half year. Care to share details?</pre>
    </blockquote>
    <br>
    It was an assertion failure when the CPU failed to call into the SMM
    rendezvous.<br>
    <br>
    <span class="c-message__body" dir="auto" data-qa="message-text">LogLibaErrorLogSmmLib.c(276):
      ((BOOLEAN)(0==1))<br>
      <br>
      This is a production Dell system IIRC (or maybe Supermicro, but
      either way, a production firmware).<br>
    </span> <br>
    In retrospect, fully offlining a CPU behind the back of the firmware
    is an extremely antisocial thing to do, and I'm not surprised that
    the firmware doesn't tolerate it.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5CA4AA600200007800224448@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Patch 1 has gone in long ago and
patch 4 has been acked. While there was some feedback on
2 (albeit stalled then after my reply), I don't think I've had any
substantial feedback on 3 though, yet _they_ are supposed to
provide the main improvement here. Patch 5 really was meant
to be more optional than I had expressed, hence its placement
even after the pure cleanup patch 4.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Some of the patches have cycled out of my inbox, so I'm reviewing from
the mail archive.

2) Now that default_dead_idle() isn't a terminal function, you must use
spec_ctrl_enter_idle() on the way back out for safety.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Ah, yes, perhaps better to add it, than to implicitly rely on callers
(there's really exactly one) to be terminal. (I take it you mean
spec_ctrl_exit_idle().)</pre>
    </blockquote>
    <br>
    I did, sorry.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5CA4AA600200007800224448@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I'm still going to insist on something about #MC, even if it is just a
note in the commit message saying "this doesn't yet make #MC any safer
for parked CPUs".
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I can add something like this, but what is it that's known unsafe
for parked CPUs? They in particular retain their per-CPU data. If
anything I see a problem with fully offline CPUs. For now I'll add
a similar sentence, but with "parked" replaced.</pre>
    </blockquote>
    <br>
    Ah ok - my mistake.  Basically, for any CPU we have ever started, we
    need to maintain a valid stack because we can take NMIs and MCEs.<br>
    <br>
    This is also a strict requirement placed on the BIOS even for APs by
    the various Bios Writers Guides.  At a minimum, this is the IVT and
    enough stack to handle NMIs with just an IRET, and an SMM stack.<br>
    <br>
    Even for AMD CPUs which don't broadcast MCEs, we have a non-zero
    chance of legitimately taking an #MC on a core we have recently
    downed, for a previous action which has taken a while to propagate
    back.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5CA4AA600200007800224448@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">
One other question (I apparently forgot about this aspect
between putting together the series and posting it):
acpi_dead_idle() has built-in loops as well. While it's not
expected for a CPU to need waking from there (as no "even
better" dead-idle handler could get installed) I wonder whether
for consistency we wouldn't better drop the loops there too.</pre>
    </blockquote>
    <br>
    I think that would be a good idea, along with a similar speculative
    adjustment.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5CA4AA600200007800224448@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">The downside of doing so would be added overhead in case
of spurious wakeups (which ought to have a small chance of
being possible in particular in the MWAIT case).</pre>
    </blockquote>
    <br>
    I really don't think that is a concern.  I don't think you'll be
    able to measure the difference in the noise.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------2A7B202C0A7076C7CE6C7D6C--


--===============0499574282327550182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0499574282327550182==--
