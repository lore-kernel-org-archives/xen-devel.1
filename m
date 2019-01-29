From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 6/8] xen/arm: Implement workaround
 for Cortex-A76 erratum 1165522
Date: Mon, 28 Jan 2019 16:52:32 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901281646070.17936@sstabellini-ThinkPad-X260>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-7-julien.grall@arm.com>
 <alpine.DEB.2.10.1901231610020.17936@sstabellini-ThinkPad-X260>
 <2a4755f3-42ff-9cd6-fb42-d82f6cd3588e@arm.com>
 <alpine.DEB.2.10.1901251313330.17936@sstabellini-ThinkPad-X260>
 <2aaba5bd-ce24-f752-0b6e-4395fc41dac2@arm.com>
 <d4f83b91-4c5c-70c5-ab4e-c82a78168b32@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1813873900-1548723153=:17936"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vl7d=QF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1goHdi-000566-OT
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 00:52:34 +0000
In-Reply-To: <d4f83b91-4c5c-70c5-ab4e-c82a78168b32@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, James Morse <james.morse@arm.com>, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1813873900-1548723153=:17936
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 28 Jan 2019, Julien Grall wrote:
> On 1/27/19 9:55 AM, Julien Grall wrote:
> > Hi,
> > 
> > On 1/25/19 9:36 PM, Stefano Stabellini wrote:
> > > On Thu, 24 Jan 2019, Julien Grall wrote:
> > > > @James, please correct me if I am wrong below :).
> > > > 
> > > > On 24/01/2019 00:52, Stefano Stabellini wrote:
> > > > > On Wed, 28 Nov 2018, Julien Grall wrote:
> > > > ... in the context of the errata, you have to imagine what can happen if
> > > > an AT
> > > > instruction is inserted (via speculation) between each instruction and
> > > > what
> > > > happen if the system registers are re-ordered.
> > > > 
> > > > The key of the erratum is VTTBR_EL2. This is what will stop a speculated
> > > > AT
> > > > instruction to allocate a TLBs entry because you are not allowed to
> > > > cache a
> > > > translation that will fault. Without the isb() here, the VTTBR_EL2 may
> > > > be
> > > > synchronized before the rest of the context, so a speculated AT
> > > > instruction
> > > > may use an inconsistent state and allocate a TLB entry with an
> > > > unexpected
> > > > translation against the guest.
> > > > 
> > > > So here, we want to ensure the rest of the context is synchronized
> > > > before
> > > > writing to VTTBR_EL2, hence the isb().
> > > 
> > > OK. I understand the explanation, thank you.
> > > 
> > > I just thought that the CPU would be smart enough to only reorder system
> > > registers writes when appropriate, especially when the CPU is also doing
> > > speculation at the same time. Why would it speculate if it knows that it
> > > is reordering sysreg writes that can badly affect the speculation
> > > itself? Let me say that it doesn't sound like a "sane" behavior to me.
> > > But if it behaves this way, it behaves this way...
> > 
> > I hope you are aware we are speaking about an erratum here... Not what the
> > Arm Arm allows.

I know -- we are talking about a specific CPU implementation. That is
why it seems strange to me that a CPU would reorder things that it
should know they cause trouble to speculation. Anyway, no point in
discussing hardware design choices at this stage.


> > Aside the erratum, a processor is allowed to do whatever it wants if it is
> > within the Arm Arm. These registers are described as out-of-context and
> > should not be used by speculation in EL2. If you want to use them in EL2,
> > you need an isb() before any instruction in EL2 using them otherwise you may
> > use an inconsistent context. This is giving enough freedom to the processor
> > while the impact in the software is minimal.
> > 
> > [...]
> > 
> > > > > 
> > > > > >            /* Ensure VTTBR_EL2 is synchronized before flushing the
> > > > > > TLBs */
> > > > > >            isb();
> > > > > >        }
> > > > > > @@ -1504,6 +1545,23 @@ static uint32_t __read_mostly vtcr;
> > > > > >    static void setup_virt_paging_one(void *data)
> > > > > >    {
> > > > > >        WRITE_SYSREG32(vtcr, VTCR_EL2);
> > > > > > +
> > > > > > +    /*
> > > > > > +     * ARM64_WORKAROUND_AT_SPECULATE: We want to keep the TLBs free
> > > > > > from
> > > > > > +     * entries related to EL1/EL0 translation regime until a guest
> > > > > > vCPU
> > > > > > +     * is running. For that, we need to set-up VTTBR to point to an
> > > > > > empty
> > > > > > +     * page-table and turn on stage-2 translation.
> > > > > 
> > > > > I don't understand why this is needed: isn't the lack of HCR_VM (due
> > > > > to
> > > > > your previous patch) supposed to be sufficient? How can there be
> > > > > speculation without HCR_VM?
> > > > 
> > > > HCR_EL2.VM unsets means the stage-2 will not be used for the EL1/EL0
> > > > translation regime. In the context of the erratum, the AT can still
> > > > speculate
> > > > except it will not take into account the stage-2. The dependencies on
> > > > VMID
> > > > stills applies when HCR_EL2.VM is unset, so from my understanding, the
> > > > entry
> > > > could get cached to whatever is VTTBR_EL2.VMID.
> > > 
> > > Damn! Even if at this point of the boot sequence there is no EL1 / EL0
> > > at all? How can that speculation happen? Shouldn't the first EL1 / EL0
> > > speculation occur after the first leave_hypervisor_tail?
> > 
> > How do you know EL1 was not run before hand? Imagine we did a soft reboot or
> > kexec Xen...
> > 
> > But the speculation in that context is may be because the processor noticed
> > an AT instruction targeting EL1 in the stream.

This seems to be extremely improbable, borderline impossible to me, but
I can imagine that we might want to be extra-paranoid to make sure all
potential issues are covered.


> > > > > Even if speculation happens without HCR_EL2, why do we need to set it
> > > > > now? Isn't setting empty_root_mfn enough?
> > > > 
> > > > The main goal here is to have the TLBs in a known state after the CPU
> > > > has been
> > > > initialized. After the sequence below, we are sure that the TLBs don't
> > > > contain
> > > > entries associated to the EL1/EL0 regime and and a speculated AT
> > > > instruction
> > > > will not be able to allocate more.
> > > > 
> > > > Without HCR_EL2.VM set, the stage-2 page-table will not get used. So a
> > > > speculated AT instruction could still allocate an entry in TLB. It is
> > > > not a
> > > > major issue as it would be against INVALID_VMID, yet it is not a very
> > > > sane
> > > > situation for the hypervisor.
> > > 
> > > I have a question on the tlb flush.  Do we need it because the tlb is
> > > not guaranteed to be clean after boot?
> > 
> > You don't know the state of the TLBs after boot.
> > 
> > > 
> > > Also, do we need a flush_tlb_all_local()? Would flush_tlb_local be
> > > enough, maybe executed immediately before switching VTTBR_EL2? I guess
> > > it depends on whether the speculation happens on the local VMID only.
> > 
> > Speculation can only happen using system registers. So only on the local
> > VMID only.
> > 
> > > If it only speculate on the local VMID, then flush_tlb_all_local()
> > > should suffice?
> > 
> > We have two VMIDs in play here: whatever was the value in VTTBR_EL2.VMID
> > before the function and INVALID_VMID. We would need to flush the former and
> > this would require empty root trick because speculation can happen as soon
> > as flush ended.
> > 
> > But then, you rely on Xen to only use a single VMID at boot. While this is
> > the case today, I can't tell if it will be in the future.
> > 
> > So the flush_tlb_local is the safest.
> 
> Hmmm, I meant flush_tlb_all_local here.

OK.


Overall, I think we could probably get away without a couple of changes
from this patch, but since it is basically impossible for me to prove
it, I'll give my Reviewed-by. I saw that you resent the series already.
I'll take care of committing it.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1813873900-1548723153=:17936
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1813873900-1548723153=:17936--
