Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65489CD3445
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2026 20:55:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304225.1577299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSE3-0007G6-JN; Fri, 08 May 2026 20:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304225.1577299; Fri, 08 May 2026 20:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSE3-0007Fy-Go; Fri, 08 May 2026 20:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1304225;
 Fri, 08 May 2026 20:55:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.brodsky@arm.com>) id 1wLSE1-0007Fr-Qk
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:55:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSE1-000AXG-0f
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:55:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fe4d03-2eae-0a2a0a5409dd-0a2a45078d66-40
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:55:08 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fe4dac-229c-0a2a45070019-d98c6eacd0de-1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:55:08 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A79F1C25;
 Fri,  8 May 2026 13:55:02 -0700 (PDT)
Received: from [10.57.35.132] (unknown [10.57.35.132])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B76E33F836;
 Fri,  8 May 2026 13:55:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778273707; bh=EYkONMkW0IatpZ5QawspWJ7T/VJZH158OZO7NH03taE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oT/QNC9yXHo4z1ugT7/FLiBNGDpaiDMdHzLuLsLDP/RfnuNDn7+RkOx6fUHYck5WY
	 4JiTtgOh/rHTuurIlP+VjgGp6OdeXiP8hc2bG238RdglsrJ4AC+VD81LgCQr74gaL9
	 avbGNpzxwH5AeadHWfiYrYy0idGktRIUI2usTaMk=
Message-ID: <362bc938-18ea-4f6a-938a-893dfb1c956d@arm.com>
Date: Fri, 8 May 2026 22:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: marmarek@invisiblethingslab.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20260508143933.493013-1-jgross@suse.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260508143933.493013-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778273708-23979C48-DAF182A4/0/0
X-purgate-type: clean
X-purgate-size: 2086

On 08/05/2026 16:39, Juergen Gross wrote:
> With the support of nested lazy mmu sections it can happen that
> arch_enter_lazy_mmu_mode() is being called twice without a call of
> arch_leave_lazy_mmu_mode() in between, as the lazy_mmu_*() helpers
> are not disabling preemption when checking for nested lazy mmu
> sections.

I think this is a correct description of the issue, i.e. potentially we
have arch_enter_lazy_mmu_mode() called twice *sequentially*. Therefore I
don't think that disabling preemption inside arch_enter_lazy_mmu_mode()
is enough - we have a problem with preemption occurring inside
lazy_mmu_mode_enable() generally, not necessarily inside
arch_enter_lazy_mmu_mode().

Preemption shouldn't matter if commit 291b3abed657 is reverted. AFAICT
this is the only easy fix.

- Kevin

> This is a problem when running as a Xen PV guest, as
> xen_enter_lazy_mmu() and xen_leave_lazy_mmu() don't tolerate this
> case.
>
> Fix that in xen_enter_lazy_mmu() and xen_leave_lazy_mmu() in order
> not to hurt all other lazy mmu mode users.
>
> Fixes: 291b3abed657 ("x86/xen: use lazy_mmu_state when context-switching")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/xen/mmu_pv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index c80d0058efd1..3eee5f84f8a7 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2145,7 +2145,10 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
>  
>  static void xen_enter_lazy_mmu(void)
>  {
> -	enter_lazy(XEN_LAZY_MMU);
> +	preempt_disable();
> +	if (xen_get_lazy_mode() != XEN_LAZY_MMU)
> +		enter_lazy(XEN_LAZY_MMU);
> +	preempt_enable();
>  }
>  
>  static void xen_flush_lazy_mmu(void)
> @@ -2182,7 +2185,8 @@ static void xen_leave_lazy_mmu(void)
>  {
>  	preempt_disable();
>  	xen_mc_flush();
> -	leave_lazy(XEN_LAZY_MMU);
> +	if (xen_get_lazy_mode() != XEN_LAZY_NONE)
> +		leave_lazy(XEN_LAZY_MMU);
>  	preempt_enable();
>  }
>  

