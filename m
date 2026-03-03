Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D96FEDEBF5
	for <xen-devel@archiver.kernel.org>; Tue,  3 Mar 2026 23:55:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1245059.1544420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxZa9-0000ow-GK; Tue, 03 Mar 2026 23:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245059.1544420; Tue, 03 Mar 2026 23:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxZa9-0000op-Ck; Tue, 03 Mar 2026 23:55:17 +0000
Received: by outflank-mailman (input) for mailman id 1245059;
 Tue, 03 Mar 2026 23:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fOER=BD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vxZa7-0000oj-QX
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 23:55:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a5d1fe7-175c-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 00:55:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E0756057A;
 Tue,  3 Mar 2026 23:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FA5C116C6;
 Tue,  3 Mar 2026 23:55:09 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6a5d1fe7-175c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772582110;
	bh=xouWky2sw6d1G/taXa1LN4i8BoL1w/j4IygNALCKloo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ybah0X9N1tWItjtGs5gchsKsOnAy4S5/e8M1jCvlKc789VoHQzKTmuXGUtu5LFj0W
	 4Pu2/n2+bbE303jCAdgUhjDYAPX/6NJzzZtNWBiOAFmGueXeILsVtg+VSnwLIBHmPu
	 tOlC+YKeRblxUpL/H9qRRcLU5niEgXiRt3MNMOMv51akeDAY4xUOtuiZdhaIIUjTcH
	 1L1uoh0viYpAooewYBZdVM4CFneXgzS5Ge+Jmf7tnbgIwDpfIB44r7TaFmldh1ETiu
	 nEZA0Oxn3eASC0Bh/x+CrUDsCapyEUBVunBJEI8Jjl9fwwjejlq8rCVsgknOdc5mgm
	 gAd9WCIr8rr6Q==
Date: Tue, 3 Mar 2026 15:55:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
In-Reply-To: <CE531E44-2AD4-4164-8A86-1D6084A6EAE1@arm.com>
Message-ID: <alpine.DEB.2.22.394.2603031550270.3148344@ubuntu-linux-20-04-desktop>
References: <cover.1768293759.git.mykyta_poturai@epam.com> <63892f56f227fae75d78e2ef2ee63887e74c523a.1768293759.git.mykyta_poturai@epam.com> <6080438F-DB60-4A50-8264-1CD04761B196@arm.com> <48a84d44-def9-4181-ac67-5aeb31ffb529@epam.com>
 <CE531E44-2AD4-4164-8A86-1D6084A6EAE1@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1743651114-1772582111=:3148344"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1743651114-1772582111=:3148344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 5 Feb 2026, Bertrand Marquis wrote:
> > On 5 Feb 2026, at 14:23, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
> > 
> > On 04.02.26 16:20, Bertrand Marquis wrote:
> >> Hi Mykyta.
> >> 
> >>> On 13 Jan 2026, at 09:45, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
> >>> 
> >>> Move IRQs from dying CPU to the online ones when a CPU is getting
> >>> offlined. When onlining, rebalance all IRQs in a round-robin fashion.
> >>> Guest-bound IRQs are already handled by scheduler in the process of
> >>> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
> >>> itself.
> >>> 
> >>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> >>> ---
> >>> v4->v5:
> >>> * handle CPU onlining as well
> >>> * more comments
> >>> * fix crash when ESPI is disabled
> >>> * don't assume CPU 0 is a boot CPU
> >>> * use insigned int for irq number
> >>> * remove assumption that all irqs a bound to CPU 0 by default from the
> >>>  commit message
> >>> 
> >>> v3->v4:
> >>> * patch introduced
> >>> ---
> >>> xen/arch/arm/include/asm/irq.h |  2 ++
> >>> xen/arch/arm/irq.c             | 54 ++++++++++++++++++++++++++++++++++
> >>> xen/arch/arm/smpboot.c         |  6 ++++
> >>> 3 files changed, 62 insertions(+)
> >>> 
> >>> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> >>> index 09788dbfeb..a0250bac85 100644
> >>> --- a/xen/arch/arm/include/asm/irq.h
> >>> +++ b/xen/arch/arm/include/asm/irq.h
> >>> @@ -126,6 +126,8 @@ bool irq_type_set_by_domain(const struct domain *d);
> >>> void irq_end_none(struct irq_desc *irq);
> >>> #define irq_end_none irq_end_none
> >>> 
> >>> +void rebalance_irqs(unsigned int from, bool up);
> >>> +
> >>> #endif /* _ASM_HW_IRQ_H */
> >>> /*
> >>>  * Local variables:
> >>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> >>> index 7204bc2b68..a32dc729f8 100644
> >>> --- a/xen/arch/arm/irq.c
> >>> +++ b/xen/arch/arm/irq.c
> >>> @@ -158,6 +158,58 @@ static int init_local_irq_data(unsigned int cpu)
> >>>     return 0;
> >>> }
> >>> 
> >>> +static int cpu_next;
> >>> +
> >>> +static void balance_irq(int irq, unsigned int from, bool up)
> >>> +{
> >>> +    struct irq_desc *desc = irq_to_desc(irq);
> >>> +    unsigned long flags;
> >>> +
> >>> +    ASSERT(!cpumask_empty(&cpu_online_map));
> >>> +
> >>> +    spin_lock_irqsave(&desc->lock, flags);
> >>> +    if ( likely(!desc->action) )
> >>> +        goto out;
> >>> +
> >>> +    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
> >>> +                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
> >>> +        goto out;
> >>> +
> >>> +    /*
> >>> +     * Setting affinity to a mask of multiple CPUs causes the GIC drivers to
> >>> +     * select one CPU from that mask. If the dying CPU was included in the IRQ's
> >>> +     * affinity mask, we cannot determine exactly which CPU the interrupt is
> >>> +     * currently routed to, as GIC drivers lack a concrete get_affinity API. So
> >>> +     * to be safe we must reroute it to a new, definitely online, CPU. In the
> >>> +     * case of CPU going down, we move only the interrupt that could reside on
> >>> +     * it. Otherwise, we rearrange all interrupts in a round-robin fashion.
> >>> +     */
> >>> +    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
> >>> +        goto out;
> >> 
> >> I am a bit lost here on what you are trying to do in the case where
> >> a cpu is coming up here, it feels like you are trying to change the
> >> affinity of all interrupts in this case to cycle everything.
> >> Is it really what is expected ?
> >> If affinity was set by a VM on its interrupts, I would not expect
> >> Xen to round-robin everything each time a cpu comes up.
> >> 
> > 
> > The idea is to evenly spread interrupts between CPUs when the new ones 
> > are being brought online. This is needed to prevent Xen-bound IRQs from 
> > piling up on CPU 0 when other cores are being offlined and then onlined 
> > back. It shouldn’t mess with guest affinities, as the code skips 
> > everything that is assigned to guests and leaves it to be handled by the 
> > scheduler/vgic. Performance-wise, it should also be okay, as from what 
> > I’ve seen, there are not many interrupts used by Xen, and I expect CPU 
> > hotplug operations to be fairly infrequent.
> 
> My fear here is a bit that by removing and adding a cpu we will completely
> change irq affinities. I am not so sure that those kind of random assignments
> are compatible with embedded or safety use cases and here there is no way
> to configure this.
> 
> @Julien, Stefano and Michal: What do you think here ?

I think Bertrand's concern is valid. We need to make sure that
balance_irq is not called in "normal" or safety use-cases. I am going by
the assumption that pCPU offline/online is not going to happen in safety
use-cases. So as long as balance_irq is not called unless CPU
offline/online happens, then I think we are good. It should definitely
not happen on normal boot.                                            
 
There is also the other thought that while I do not like the idea of
spreading the IRQ evenly, I also cannot suggest something better (unless
we want to keep track of which IRQ used to belong to which dead CPU, but
I think that is undesirable).
--8323329-1743651114-1772582111=:3148344--

