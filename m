From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 00/18] xen/arm64: Suspend to RAM support for
 Xen
Date: Mon, 12 Nov 2018 12:37:53 +0100
Message-ID: <CAKPH-NjmaZENb8gT=+FobrAycRF01_--6GuRA2ck9Di5wiudhA@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2461032106181588287=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xmwf=nx=aggios.com=mirela.simonovic@srs-us1.protection.inumbo.net>)
 id 1gMAXe-0000v2-Fo
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 11:38:06 +0000
Received: by mail-qk1-x743.google.com with SMTP id d135so12630072qkc.12
 for <xen-devel@lists.xenproject.org>; Mon, 12 Nov 2018 03:38:04 -0800 (PST)
In-Reply-To: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen Devel <xen-devel@lists.xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

--===============2461032106181588287==
Content-Type: multipart/alternative; boundary="000000000000578331057a76222f"

--000000000000578331057a76222f
Content-Type: text/plain; charset="UTF-8"

Hi,

One thing I screwed - I forgot to remove changes log from an internal
review, so please ignore it. This is officially the first version.

Thanks,
Mirela

On Mon, Nov 12, 2018 at 12:31 PM Mirela Simonovic <
mirela.simonovic@aggios.com> wrote:

> This series contains support for suspend to RAM (in the following text just
> 'suspend') for Xen on arm64. The implementation is aligned with the design
> specification that has been proposed on xen-devel list:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html
>
> At a high-level the series contains:
> 1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call
> 2) Support for resuming a guest on an interrupt targeted to that guest
> 3) Support for suspending Xen after dom0 finalizes the suspend
> 4) Support for resuming Xen on an interrupt that is targeted to a guest
>
>
> --------------------------------------------------------------------------------
> In more details:
>
> *** About suspending/resuming guests
>
> The patches included in this series allow PSCI compliant guests that have
> support for suspend to RAM (e.g. echo mem > /sys/power/state in Linux) to
> suspend and resume on top of Xen without any EL1 code changes.
>
> During their suspend procedure guests will hot-unplug their secondary CPUs,
> triggering Xen's virtual CPU_OFF PSCI implementation, and then finalize the
> suspend from their boot CPU, triggering Xen's virtual SYSTEM_SUSPEND PSCI.
> Guests will save/restore their own EL1 context on suspend/resume.
>
> A guest is expected to leave enabled interrupts that are considered to be
> its
> wake-up sources. Those interrupts will be able to wake up the guest. This
> holds
> regardless of the state of the underlying software layers, i.e. whether
> Xen gets
> suspended or not doesn't affect the ability of the guest to wake up.
>
> First argument of SYSTEM_SUSPEND PSCI call is a resume entry point, from
> which
> the guest assumes to start on resume. On resume, guests assume to be
> running in
> an environment whose state matches the CPU state after reset, e.g. with
> reset
> register values, MMU disabled, etc. To ensure this, Xen has to 'reset' the
> VCPU context and save the resume entry point into program counter before
> the
> guest's VCPU gets scheduled in on resume. This is done when the guest
> finalizes
> its suspend by calling PSCI SYSTEM_SUSPEND. In addition, we need to ensure
> that
> the resume-ready VCPU's context does not get overwritten later upon the
> context
> switch when the VCPU is scheduled out.
> Xen also needs to take care that the guest's view of GIC and timer gets
> saved.
> Also, while a guest is suspended its watchdogs are paused, in order to
> avoid
> watchdog triggered shutdown of a guest that has been asleep for a period
> of time
> that is longer than the watchdog period.
>
> After this point, from Xen's point of view a suspended guest has one VCPU
> blocked, waiting for an interrupt. When such an interrupt comes, Xen will
> unblock the VCPU of the suspended domain, which results in the guest
> resuming.
>
> *** About suspending/resuming Xen
>
> Xen starts its own suspend procedure once dom0 is suspended. Dom0 is
> considered to be the decision maker for EL1 and EL2.
> On suspend, Xen will first freeze all domains. Then, Xen disables physical
> secondary CPUs, which leads to physical CPU_OFF to be called by each
> secondary
> CPU. After that Xen finalizes the suspend from the boot CPU.
>
> This consists of suspending the timer, i.e. suppressing its interrupts (we
> don't
> want to be woken up by a timer, there is no VCPU ready to be scheduled).
> Then
> the state of GIC is saved, console is suspended, and CPU context is saved.
> The
> saved context tells where Xen needs to continue execution on resume.
> Since Xen will resume with MMU disabled, the first thing to do in resume
> is to
> resume memory management in order to be able to access the context that
> needs to
> be restored (we know virtual address of the context data). Finally Xen
> calls
> SYSTEM_SUSPEND PSCI to the EL3.
>
> When resuming, all the steps done in suspend need to be reverted. This is
> completed by unblocking dom0's VCPU, because we always want the dom0 to
> resume,
> regardless of the target domain whose interrupt woke up Xen.
>
> *** Handling of unprivileged guests during Xen suspend/resume
>
> Any domU that is not suspended when dom0 suspends will be frozen, domUs
> that are
> already suspended remain suspended. On resume the suspended domUs still
> remain
> suspended (unless their wake interrupt caused Xen to wake) while the
> others will
> be thawed.
>
> For more details please refer to patches or the design specification:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html
>
>
> --------------------------------------------------------------------------------
> The series does not include:
> a) UART driver-specific suspend/resume that gets called when console
> suspends
> b) SMMU suspend/resume
> c) Suspend coordination support that would allow dom0 to request domUs to
> suspend
> These will be submitted in the following series.
>
> Mirela Simonovic (16):
>   xen/arm: Implement PSCI system suspend call (virtual interface)
>   xen/arm: Save GIC and virtual timer context when the domain suspends
>   xen/arm: While a domain is suspended put its watchdogs on pause
>   xen/arm: Trigger Xen suspend when Dom0 completes suspend
>   xen/x86: Move freeze/thaw_domains into common files
>   xen/arm: Freeze domains on suspend and thaw them on resume
>   xen/arm: Disable/enable non-boot physical CPUs on suspend/resume
>   xen/arm: Add rcu_barrier() before enabling non-boot CPUs on resume
>   xen/arm: Implement GIC suspend/resume functions (gicv2 only)
>   xen/arm: Suspend/resume GIC on system suspend/resume
>   xen/arm: Suspend/resume timer interrupt generation
>   xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical interface)
>   xen/arm: Resume memory management on Xen resume
>   xen/arm: Save/restore context on suspend/resume
>   xen/arm: Resume Dom0 after Xen resumes
>   xen/arm: Suspend/resume console on Xen suspend/resume
>
> Saeed Nowshadi (2):
>   xen/arm: Move code that initializes VCPU context into a separate
>     function
>   xen/arm: Convert setting MMU page tables code into a routine
>
>  xen/arch/arm/Makefile            |   1 +
>  xen/arch/arm/arm64/entry.S       | 178 ++++++++++++++++++++++++
>  xen/arch/arm/arm64/head.S        | 265 ++++++++++++++++++-----------------
>  xen/arch/arm/domain.c            |  62 ++++++---
>  xen/arch/arm/gic-v2.c            | 147 ++++++++++++++++++++
>  xen/arch/arm/gic.c               |  27 ++++
>  xen/arch/arm/mm.c                |   1 +
>  xen/arch/arm/psci.c              |  16 +++
>  xen/arch/arm/suspend.c           | 292
> +++++++++++++++++++++++++++++++++++++++
>  xen/arch/arm/time.c              |  22 +++
>  xen/arch/arm/vpsci.c             |  19 +++
>  xen/arch/x86/acpi/power.c        |  28 ----
>  xen/common/domain.c              |  29 ++++
>  xen/common/schedule.c            |  38 +++++
>  xen/include/asm-arm/gic.h        |   8 ++
>  xen/include/asm-arm/perfc_defn.h |   1 +
>  xen/include/asm-arm/psci.h       |   3 +
>  xen/include/asm-arm/suspend.h    |  39 ++++++
>  xen/include/asm-arm/time.h       |   3 +
>  xen/include/xen/domain.h         |   1 +
>  xen/include/xen/sched.h          |  11 ++
>  xen/include/xen/timer.h          |   3 +
>  22 files changed, 1019 insertions(+), 175 deletions(-)
>  create mode 100644 xen/arch/arm/suspend.c
>  create mode 100644 xen/include/asm-arm/suspend.h
>
> --
> 2.13.0
>
>

--000000000000578331057a76222f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>One thing I screwed - I forgot to r=
emove changes log from an internal review, so please ignore it. This is off=
icially the first version.</div><div><br></div><div>Thanks,</div><div>Mirel=
a</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Nov 12=
, 2018 at 12:31 PM Mirela Simonovic &lt;<a href=3D"mailto:mirela.simonovic@=
aggios.com">mirela.simonovic@aggios.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">This series contains support for suspend to RAM (in the=
 following text just<br>
&#39;suspend&#39;) for Xen on arm64. The implementation is aligned with the=
 design<br>
specification that has been proposed on xen-devel list:<br>
<a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg=
01574.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproject.o=
rg/archives/html/xen-devel/2017-12/msg01574.html</a><br>
<br>
At a high-level the series contains:<br>
1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call<br>
2) Support for resuming a guest on an interrupt targeted to that guest<br>
3) Support for suspending Xen after dom0 finalizes the suspend<br>
4) Support for resuming Xen on an interrupt that is targeted to a guest<br>
<br>
---------------------------------------------------------------------------=
-----<br>
In more details:<br>
<br>
*** About suspending/resuming guests<br>
<br>
The patches included in this series allow PSCI compliant guests that have<b=
r>
support for suspend to RAM (e.g. echo mem &gt; /sys/power/state in Linux) t=
o<br>
suspend and resume on top of Xen without any EL1 code changes.<br>
<br>
During their suspend procedure guests will hot-unplug their secondary CPUs,=
<br>
triggering Xen&#39;s virtual CPU_OFF PSCI implementation, and then finalize=
 the<br>
suspend from their boot CPU, triggering Xen&#39;s virtual SYSTEM_SUSPEND PS=
CI.<br>
Guests will save/restore their own EL1 context on suspend/resume.<br>
<br>
A guest is expected to leave enabled interrupts that are considered to be i=
ts<br>
wake-up sources. Those interrupts will be able to wake up the guest. This h=
olds<br>
regardless of the state of the underlying software layers, i.e. whether Xen=
 gets<br>
suspended or not doesn&#39;t affect the ability of the guest to wake up.<br=
>
<br>
First argument of SYSTEM_SUSPEND PSCI call is a resume entry point, from wh=
ich<br>
the guest assumes to start on resume. On resume, guests assume to be runnin=
g in<br>
an environment whose state matches the CPU state after reset, e.g. with res=
et<br>
register values, MMU disabled, etc. To ensure this, Xen has to &#39;reset&#=
39; the<br>
VCPU context and save the resume entry point into program counter before th=
e<br>
guest&#39;s VCPU gets scheduled in on resume. This is done when the guest f=
inalizes<br>
its suspend by calling PSCI SYSTEM_SUSPEND. In addition, we need to ensure =
that<br>
the resume-ready VCPU&#39;s context does not get overwritten later upon the=
 context<br>
switch when the VCPU is scheduled out.<br>
Xen also needs to take care that the guest&#39;s view of GIC and timer gets=
 saved.<br>
Also, while a guest is suspended its watchdogs are paused, in order to avoi=
d<br>
watchdog triggered shutdown of a guest that has been asleep for a period of=
 time<br>
that is longer than the watchdog period.<br>
<br>
After this point, from Xen&#39;s point of view a suspended guest has one VC=
PU<br>
blocked, waiting for an interrupt. When such an interrupt comes, Xen will<b=
r>
unblock the VCPU of the suspended domain, which results in the guest resumi=
ng.<br>
<br>
*** About suspending/resuming Xen<br>
<br>
Xen starts its own suspend procedure once dom0 is suspended. Dom0 is<br>
considered to be the decision maker for EL1 and EL2.<br>
On suspend, Xen will first freeze all domains. Then, Xen disables physical<=
br>
secondary CPUs, which leads to physical CPU_OFF to be called by each second=
ary<br>
CPU. After that Xen finalizes the suspend from the boot CPU.<br>
<br>
This consists of suspending the timer, i.e. suppressing its interrupts (we =
don&#39;t<br>
want to be woken up by a timer, there is no VCPU ready to be scheduled). Th=
en<br>
the state of GIC is saved, console is suspended, and CPU context is saved. =
The<br>
saved context tells where Xen needs to continue execution on resume.<br>
Since Xen will resume with MMU disabled, the first thing to do in resume is=
 to<br>
resume memory management in order to be able to access the context that nee=
ds to<br>
be restored (we know virtual address of the context data). Finally Xen call=
s<br>
SYSTEM_SUSPEND PSCI to the EL3.<br>
<br>
When resuming, all the steps done in suspend need to be reverted. This is<b=
r>
completed by unblocking dom0&#39;s VCPU, because we always want the dom0 to=
 resume,<br>
regardless of the target domain whose interrupt woke up Xen.<br>
<br>
*** Handling of unprivileged guests during Xen suspend/resume<br>
<br>
Any domU that is not suspended when dom0 suspends will be frozen, domUs tha=
t are<br>
already suspended remain suspended. On resume the suspended domUs still rem=
ain<br>
suspended (unless their wake interrupt caused Xen to wake) while the others=
 will<br>
be thawed.<br>
<br>
For more details please refer to patches or the design specification:<br>
<a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg=
01574.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproject.o=
rg/archives/html/xen-devel/2017-12/msg01574.html</a><br>
<br>
---------------------------------------------------------------------------=
-----<br>
The series does not include:<br>
a) UART driver-specific suspend/resume that gets called when console suspen=
ds<br>
b) SMMU suspend/resume<br>
c) Suspend coordination support that would allow dom0 to request domUs to<b=
r>
suspend<br>
These will be submitted in the following series.<br>
<br>
Mirela Simonovic (16):<br>
=C2=A0 xen/arm: Implement PSCI system suspend call (virtual interface)<br>
=C2=A0 xen/arm: Save GIC and virtual timer context when the domain suspends=
<br>
=C2=A0 xen/arm: While a domain is suspended put its watchdogs on pause<br>
=C2=A0 xen/arm: Trigger Xen suspend when Dom0 completes suspend<br>
=C2=A0 xen/x86: Move freeze/thaw_domains into common files<br>
=C2=A0 xen/arm: Freeze domains on suspend and thaw them on resume<br>
=C2=A0 xen/arm: Disable/enable non-boot physical CPUs on suspend/resume<br>
=C2=A0 xen/arm: Add rcu_barrier() before enabling non-boot CPUs on resume<b=
r>
=C2=A0 xen/arm: Implement GIC suspend/resume functions (gicv2 only)<br>
=C2=A0 xen/arm: Suspend/resume GIC on system suspend/resume<br>
=C2=A0 xen/arm: Suspend/resume timer interrupt generation<br>
=C2=A0 xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical interface)<br>
=C2=A0 xen/arm: Resume memory management on Xen resume<br>
=C2=A0 xen/arm: Save/restore context on suspend/resume<br>
=C2=A0 xen/arm: Resume Dom0 after Xen resumes<br>
=C2=A0 xen/arm: Suspend/resume console on Xen suspend/resume<br>
<br>
Saeed Nowshadi (2):<br>
=C2=A0 xen/arm: Move code that initializes VCPU context into a separate<br>
=C2=A0 =C2=A0 function<br>
=C2=A0 xen/arm: Convert setting MMU page tables code into a routine<br>
<br>
=C2=A0xen/arch/arm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0xen/arch/arm/arm64/entry.S=C2=A0 =C2=A0 =C2=A0 =C2=A0| 178 ++++++++++=
++++++++++++++<br>
=C2=A0xen/arch/arm/arm64/head.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 265 ++++++++++=
++++++++-----------------<br>
=C2=A0xen/arch/arm/domain.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 62 ++++++---<br>
=C2=A0xen/arch/arm/gic-v2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 147 =
++++++++++++++++++++<br>
=C2=A0xen/arch/arm/gic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 27 ++++<br>
=C2=A0xen/arch/arm/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0xen/arch/arm/psci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 16 +++<br>
=C2=A0xen/arch/arm/suspend.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 292 =
+++++++++++++++++++++++++++++++++++++++<br>
=C2=A0xen/arch/arm/time.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 22 +++<br>
=C2=A0xen/arch/arm/vpsci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 19 +++<br>
=C2=A0xen/arch/x86/acpi/power.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 ----<=
br>
=C2=A0xen/common/domain.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 29 ++++<br>
=C2=A0xen/common/schedule.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 38 +++++<br>
=C2=A0xen/include/asm-arm/gic.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 =
++<br>
=C2=A0xen/include/asm-arm/perfc_defn.h |=C2=A0 =C2=A01 +<br>
=C2=A0xen/include/asm-arm/psci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 =
+<br>
=C2=A0xen/include/asm-arm/suspend.h=C2=A0 =C2=A0 |=C2=A0 39 ++++++<br>
=C2=A0xen/include/asm-arm/time.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 =
+<br>
=C2=A0xen/include/xen/domain.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0xen/include/xen/sched.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 =
++<br>
=C2=A0xen/include/xen/timer.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +<br>
=C2=A022 files changed, 1019 insertions(+), 175 deletions(-)<br>
=C2=A0create mode 100644 xen/arch/arm/suspend.c<br>
=C2=A0create mode 100644 xen/include/asm-arm/suspend.h<br>
<br>
-- <br>
2.13.0<br>
<br>
</blockquote></div>

--000000000000578331057a76222f--


--===============2461032106181588287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2461032106181588287==--
