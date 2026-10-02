Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9ABCA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 09:50:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438995.1657518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZtj-0006fr-2A; Fri, 02 Oct 2026 09:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438995.1657518; Fri, 02 Oct 2026 09:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZti-0006fg-Ux; Fri, 02 Oct 2026 09:49:46 +0000
Received: by outflank-mailman (input) for mailman id 1438995;
 Fri, 02 Oct 2026 09:49:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xCZtg-0006fa-PR
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 09:49:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCZtd-00B4aq-0Y;
 Fri, 02 Oct 2026 09:49:41 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCZtd-00ATs4-0L;
 Fri, 02 Oct 2026 09:49:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=g3AevK3NjJApXLc9lNvG8st2ygKRpA0rHjwXXRWiKuQ=; b=2yoBsCI0GazLjvPtPsxZxxAZ6W
	p8lJbDFBYuAE0PaKWF7L7uEUHogmUrWPiYPe2VqpGOO0bbhkChfpjie088Qcfpjf8iElAS+LIiYh+
	kJNIz4nRk3hba3ezAQogQJ6Pfzy37RFDOsq4sFORV3v7SJKwANHC6AWvPNUG6QHVdSxM=;
Date: Fri, 2 Oct 2026 11:49:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/domain: restrict context switch hooks for the idle
 domain
Message-ID: <ar9-MzoE08IupL29@Mac.lan>
References: <20261001142757.98255-1-roger@xenproject.org>
 <f3754c45-7899-4e76-bb29-dc8deca0903b@suse.com>
 <ar9htQD7BC6dRCRS@Mac.lan>
 <4eb32155-1b04-4f04-ab9b-f30e584cb033@suse.com>
 <ar9l3GKKZtIjfgaP@Mac.lan>
 <1226702d-5bb4-4e7a-8e6a-6534002cfd8c@suse.com>
 <ar94BX2_scfSZReQ@Mac.lan>
 <ar95cgbuoYYJzl0f@Mac.lan>
 <e8c21a28-508a-4cf5-b983-4983b2c0081c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8c21a28-508a-4cf5-b983-4983b2c0081c@suse.com>

On Fri, Oct 02, 2026 at 11:35:40AM +0200, Jan Beulich wrote:
> On 02.10.2026 11:29, Roger Pau Monné wrote:
> > On Fri, Oct 02, 2026 at 11:23:17AM +0200, Roger Pau Monné wrote:
> >> On Fri, Oct 02, 2026 at 10:09:02AM +0200, Jan Beulich wrote:
> >>> On 02.10.2026 10:05, Roger Pau Monné wrote:
> >>>> On Fri, Oct 02, 2026 at 09:55:09AM +0200, Jan Beulich wrote:
> >>>>> On 02.10.2026 09:48, Roger Pau Monné wrote:
> >>>>>> On Fri, Oct 02, 2026 at 07:45:07AM +0200, Jan Beulich wrote:
> >>>>>>> On 01.10.2026 16:27, Roger Pau Monne wrote:
> >>>>>>>> --- a/xen/arch/x86/domain.c
> >>>>>>>> +++ b/xen/arch/x86/domain.c
> >>>>>>>> @@ -813,8 +813,6 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
> >>>>>>>>  void __init arch_init_idle_domain(struct domain *d)
> >>>>>>>>  {
> >>>>>>>>      static const struct arch_csw idle_csw = {
> >>>>>>>> -        .from = paravirt_ctxt_switch_from,
> >>>>>>>> -        .to   = paravirt_ctxt_switch_to,
> >>>>>>>>          .tail = idle_loop,
> >>>>>>>>      };
> >>>>>>>
> >>>>>>> Leaving NULL pointers around isn't a good thing, though. May I suggest to
> >>>>>>> at least poison the pointers then?
> >>>>>>
> >>>>>> I don't mind doing so, but I don't think we usually do that for other
> >>>>>> hook structures, ie: hvm_function_table for example doesn't poison
> >>>>>> unset hooks (and it possibly can't, because there are .hook != NULL
> >>>>>> checks).
> >>>>>>
> >>>>>> TBH I'm missing a benefit of the poisoning here.  Using NULL or a
> >>>>>> poisoned value will both trigger a page-fault, and NULL has the
> >>>>>> benefit of callers easily checking whether the hook is set.
> >>>>>
> >>>>> NULL in the context of a HVM vCPU will #PF. NULL in the context of a PV
> >>>>> one may not, depending on what the guest may have put there.
> >>>>
> >>>> It still feels a bit arbitrary to do here but not in other places,
> >>>
> >>> We should imo resolve this by replacing NULLs wherever hooks could, due
> >>> to other issues, end up "in sight" on paths reachable for PV guests. This
> >>> would then also cover potential speculation along such paths.
> >>
> >> FTAOD, I plan to introduce a poison value using a non-canonical
> >> address, ie:
> >>
> >> #define POINTER_POISON ((void *)0xDEAD0000DEAD0000UL)
> > 
> > s/POINTER_POISON/FUNCTION_POISON/
> 
> Sure, if you think none of the present poisoning values we have is good to
> reuse here.

They maybe could, but I assumed we wanted differentiation between this
usage and ZERO_BLOCK_PTR for example.

Thanks, Roger.

