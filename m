From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Mon, 12 Nov 2018 17:53:54 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811121738570.8259@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-220982353-1542073891=:8259"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+wyv=ny=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gMNtt-0000eV-7d
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 01:53:57 +0000
In-Reply-To: <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
Content-ID: <alpine.DEB.2.10.1811121751370.8259@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Xen Devel <xen-devel@lists.xen.org>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-220982353-1542073891=:8259
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1811121751371.8259@sstabellini-ThinkPad-X260>

On Mon, 12 Nov 2018, Andrew Cooper wrote:
> On 12/11/18 16:35, Mirela Simonovic wrote:
> > Hi Julien,
> >
> > Thanks for your feedback, I'll need to answer in iterations.
> >
> > On Mon, Nov 12, 2018 at 4:27 PM Julien Grall <julien.grall@arm.com> wrote:
> >> Hi Mirela,
> >>
> >> On 11/12/18 11:30 AM, Mirela Simonovic wrote:
> >>> The implementation consists of:
> >>> -Adding PSCI system suspend call as new PSCI function
> >>> -Trapping PSCI system_suspend HVC
> >>> -Implementing PSCI system suspend call (virtual interface that allows
> >>>   guests to suspend themselves)
> >>>
> >>> The PSCI system suspend should be called by a guest from its boot
> >>> VCPU. Non-boot VCPUs of the guest should be hot-unplugged using PSCI
> >>> CPU_OFF call prior to issuing PSCI system suspend. Interrupts that
> >>> are left enabled by the guest are assumed to be its wake-up interrupts.
> >>> Therefore, a wake-up interrupt triggers the resume of the guest. Guest
> >>> should resume regardless of the state of Xen (suspended or not).
> >>>
> >>> When a guest calls PSCI system suspend the respective domain will be
> >>> suspended if the following conditions are met:
> >>> 1) Given resume entry point is not invalid
> >>> 2) Other (if any) VCPUs of the calling guest are hot-unplugged
> >>>
> >>> If the conditions above are met the calling domain is labeled as
> >>> suspended and the calling VCPU is blocked. If nothing else wouldn't
> >>> be done the suspended domain would resume from the place where it
> >>> called PSCI system suspend. This is expected if processing of the PSCI
> >>> system suspend call fails. However, in the case of success the calling
> >>> guest should resume (continue execution after the wake-up) from the entry
> >>> point which is given as the first argument of the PSCI system suspend
> >>> call. In addition to the entry point, the guest expects to start within
> >>> the environment whose state matches the state after reset. This means
> >>> that the guest should find reset register values, MMU disabled, etc.
> >>> Thereby, the context of VCPU should be 'reset' (as if the system is
> >>> comming out of reset), the program counter should contain entry point,
> >>> which is 1st argument, and r0/x0 should contain context ID which is 2nd
> >>> argument of PSCI system suspend call. The context of VCPU is set
> >>> accordingly when the PSCI system suspend is processed, so that nothing
> >>> needs to be done on resume/wake-up path. However, in order to ensure that
> >>> this context doesn't get overwritten by the scheduler when scheduling out
> >>> this VCPU (would normally happen after the calling CPU is blocked), we need
> >>> to check whether to return early from ctxt_switch_from().
> >>>
> >>> There are variables in domain structure to keep track of domain shutdown.
> >>> One of existing shutdown reason is 'suspend' which this patch is using to
> >>> track the suspend state of a domain. Those variables are used to determine
> >>> whether to early return from ctxt_switch_from() or not.
> >>>
> >>> A suspended domain will resume after the Xen receives an interrupt which is
> >>> targeted to the domain, unblocks the domain's VCPU, and schedules it in.
> >>> When the VCPU is scheduled in, the VCPU context is already reset, and
> >>> contains the right resume entry point in program counter that will be
> >>> restored in ctxt_switch_to(). The only thing that needs to be done at this
> >>> point is to clear the variables that marked the domain state as suspended.
> >>>
> >>> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> >>> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> >>>
> >>> ---
> >>> Changes in v2:
> >>>
> >>> -Fix print to compile for arm32 and to align with Xen coding style
> >>> ---
> >>>   xen/arch/arm/Makefile            |   1 +
> >>>   xen/arch/arm/domain.c            |  13 +++
> >>>   xen/arch/arm/suspend.c           | 166 +++++++++++++++++++++++++++++++++++++++
> >>>   xen/arch/arm/vpsci.c             |  19 +++++
> >>>   xen/include/asm-arm/perfc_defn.h |   1 +
> >>>   xen/include/asm-arm/psci.h       |   2 +
> >>>   xen/include/asm-arm/suspend.h    |  16 ++++
> >>>   xen/include/xen/sched.h          |   1 +
> >>>   8 files changed, 219 insertions(+)
> >>>   create mode 100644 xen/arch/arm/suspend.c
> >>>   create mode 100644 xen/include/asm-arm/suspend.h
> >>>
> >>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> >>> index 23c5d9adbc..744b1a4dc8 100644
> >>> --- a/xen/arch/arm/Makefile
> >>> +++ b/xen/arch/arm/Makefile
> >>> @@ -43,6 +43,7 @@ obj-y += setup.o
> >>>   obj-y += shutdown.o
> >>>   obj-y += smp.o
> >>>   obj-y += smpboot.o
> >>> +obj-y += suspend.o
> >>>   obj-y += sysctl.o
> >>>   obj-y += time.o
> >>>   obj-y += traps.o
> >>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> >>> index e594b48d81..7f8105465c 100644
> >>> --- a/xen/arch/arm/domain.c
> >>> +++ b/xen/arch/arm/domain.c
> >>> @@ -97,6 +97,11 @@ static void ctxt_switch_from(struct vcpu *p)
> >>>       if ( is_idle_vcpu(p) )
> >>>           return;
> >>>
> >>> +    /* VCPU's context should not be saved if its domain is suspended */
> >>> +    if ( p->domain->is_shut_down &&
> >>> +        (p->domain->shutdown_code == SHUTDOWN_suspend) )
> >>> +        return;
> >> SHUTDOWN_suspend is used in Xen for other purpose (see
> >> SCHEDOP_shutdown). The other user of that code relies on all the state
> >> to be saved on suspend.
> >>
> > We just need a flag to mark a domain as suspended, and I do believe
> > SHUTDOWN_suspend is not used anywhere else.
> > Let's come back on this.
> 
> SHUTDOWN_suspend is used for migration.

That is true, but it is not only used for migration. It is also used
for suspending a guest and saving its state to file with the intention
of resuming it later from file.


> Grep for it through the Xen
> tree and you'll find several pieces of documentation, including the
> description of what this shutdown code means.
> 
> What you are introducing here is not a shutdown - it is a suspend with
> the intent to resume executing later.  As such, it shouldn't use Xen's
> shutdown infrastructure, which exists mainly to communicate with the
> toolstack.

Future work will need toolstack support for suspending/resuming guests.
SHUTDOWN_suspend is the most natural fit today; we don't want to hijack
domain pause, because if we do, then we can't normally pause a domain
anymore. From the Xen side of thing, there isn't a huge difference
between saving the state of a domain and writing it to file, or saving
the state of a domain in memory. However, I agree that there is a
difference.

If we don't want to reuse SHUTDOWN_suspend, then the only other option I
can think of is to introduce a new ARM specific suspend code for this
(and new xl commands and hypercalls in the future).
--8323329-220982353-1542073891=:8259
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-220982353-1542073891=:8259--
