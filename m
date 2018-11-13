From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Tue, 13 Nov 2018 12:39:51 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811131108330.8259@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
 <alpine.DEB.2.10.1811121738570.8259@sstabellini-ThinkPad-X260>
 <34830ab6-53dc-52c5-680d-a654d4b1ce4f@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-758655672-1542136193=:8259"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+wyv=ny=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gMfTW-0003To-83
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 20:39:54 +0000
In-Reply-To: <34830ab6-53dc-52c5-680d-a654d4b1ce4f@arm.com>
Content-ID: <alpine.DEB.2.10.1811131110100.8259@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen Devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-758655672-1542136193=:8259
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1811131110101.8259@sstabellini-ThinkPad-X260>

On Tue, 13 Nov 2018, Julien Grall wrote:
> > > > > > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > > > > > index e594b48d81..7f8105465c 100644
> > > > > > --- a/xen/arch/arm/domain.c
> > > > > > +++ b/xen/arch/arm/domain.c
> > > > > > @@ -97,6 +97,11 @@ static void ctxt_switch_from(struct vcpu *p)
> > > > > >        if ( is_idle_vcpu(p) )
> > > > > >            return;
> > > > > > 
> > > > > > +    /* VCPU's context should not be saved if its domain is
> > > > > > suspended */
> > > > > > +    if ( p->domain->is_shut_down &&
> > > > > > +        (p->domain->shutdown_code == SHUTDOWN_suspend) )
> > > > > > +        return;
> > > > > SHUTDOWN_suspend is used in Xen for other purpose (see
> > > > > SCHEDOP_shutdown). The other user of that code relies on all the state
> > > > > to be saved on suspend.
> > > > > 
> > > > We just need a flag to mark a domain as suspended, and I do believe
> > > > SHUTDOWN_suspend is not used anywhere else.
> > > > Let's come back on this.
> > > 
> > > SHUTDOWN_suspend is used for migration.
> > 
> > That is true, but it is not only used for migration. It is also used
> > for suspending a guest and saving its state to file with the intention
> > of resuming it later from file.
> 
> Which is some sort of migration at the end. However, they don't have the same
> semantics as suspend/resume regarding the state of the vCPU.
 
Right

 
> > > Grep for it through the Xen
> > > tree and you'll find several pieces of documentation, including the
> > > description of what this shutdown code means.
> > > 
> > > What you are introducing here is not a shutdown - it is a suspend with
> > > the intent to resume executing later.  As such, it shouldn't use Xen's
> > > shutdown infrastructure, which exists mainly to communicate with the
> > > toolstack.
> > 
> > Future work will need toolstack support for suspending/resuming guests.
> > SHUTDOWN_suspend is the most natural fit today; we don't want to hijack
> > domain pause, because if we do, then we can't normally pause a domain
> > anymore. 
> 
> Why? suspend/resume is like pausing the domain but will be resumed on event
> (e.g interrupts) rather than user request.

I meant to say two things.

1) Which domain state should we use for suspended guests?

This patch is using SHUTDOWN_suspend. Taken on its own, a regular "pause
state" sounds like an option, in fact it is necessary to set the domain
as paused otherwise the scheduler will schedule it. But in addition we
need to distinguish a normal paused state from a PSCI system suspend
state. We need to know that the domain has been system-suspended with
PSCI, not just paused.


2) This ties into the discussion of what xl commands we want to use to
request a domU to suspend. We don't need to talk about it now, but at
some point we'll want something equivalent to "xl save" or "xl trigger
sleep" and "xl restore" or "xl trigger s3resume" for this suspended
state.

If we mark the domU simply as "paused" it will be difficult to implement
correctly "xl restore" / "xl trigger s3resume". We should be able to
distinguish a domain which is simply not running or paused (as in "xl
pause") from one that has been put to sleep.  Otherwise we won't be able
to use "xl pause" in its original sense anymore. "xl pause" will become
effectively "xl trigger sleep" on ARM. Which is something to consider
but I don't think that is what we want.

The most similar feature is ACPI S3 in x86-land but the current calls
are so ACPI/x86 specific that don't make much sense on a ACPI-less ARM
implementation. If I am not mistaken, on x86 there is a special struct
domain flag for this: d->arch.hvm.is_s3_suspended. 


Let's leave aside the "which commands should we use" discussion for now
because it doesn't related to this patch series. It seems to me that the
best option is to introduce a new ARM specific struct domain flag,
something akin to d->arch.hvm.is_s3_suspended but ARM PSCI specific.
--8323329-758655672-1542136193=:8259
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-758655672-1542136193=:8259--
