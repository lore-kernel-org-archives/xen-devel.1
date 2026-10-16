Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139FECCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 07:16:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451298.1666388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHcB5-0000S3-40; Fri, 16 Oct 2026 07:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451298.1666388; Fri, 16 Oct 2026 07:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHcB4-0000Rv-UI; Fri, 16 Oct 2026 07:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1451298;
 Fri, 16 Oct 2026 07:16:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xHcB3-0000Rp-9C
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 07:16:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHcB3-00000008GAS-0La7;
 Fri, 16 Oct 2026 07:16:28 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHcB2-00000006XJj-07lr;
 Fri, 16 Oct 2026 07:16:28 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=HkUfA1gBIJwe/UOsPPHoqFrKLN3+biMQ6WaM29LpIDY=; b=2F7+4ZGXvm6lvGT41kiAvO7INI
	fhYTiP4lItCiShV5ozWyYEjYwn51O7fuJQim4920cLGplNsyszaPKBm+r8tQOYoMXK6mPonvZqi0G
	IgcSjOPGAbdosu/89quERwfxluQEwx6fSZyzylrURUNRuXsuWIc+zTdoKyEAZQh7e3Pg=;
Date: Fri, 16 Oct 2026 09:16:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 12/15] x86/PVH: heed the kernel in pvh_steal_ram()
Message-ID: <atHPRLewczIY8Qm1@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <032c1cb0-55b8-489d-bcf4-4d4c14a590ae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <032c1cb0-55b8-489d-bcf4-4d4c14a590ae@suse.com>

On Mon, Oct 12, 2026 at 10:25:40AM +0200, Jan Beulich wrote:
> While the function working downwards will typically result in no conflict
> with the kernel range, there's no guarantee of that.
> 
> Fixes: 1d74282c455f ("x86: setup PVHv2 Dom0 ACPI tables")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -186,8 +186,12 @@ static int __init pvh_populate_memory_ra
>  /* Steal RAM from the end of a memory region. */
>  static int __init pvh_steal_ram(struct domain *d, unsigned long size,
>                                  unsigned long align, paddr_t limit,
> +                                const struct elf_binary *elf,
>                                  paddr_t *addr)
>  {
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> +    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
> +                                 PAGE_SIZE);
>      unsigned int i = d->arch.nr_e820;
>  
>      /*
> @@ -203,6 +207,11 @@ static int __init pvh_steal_ram(struct d
>              continue;
>  
>          *addr = (entry->addr + entry->size - size) & ~(align - 1);
> +
> +        /* Avoid kernel range, if this is the region it lives in. */
> +        if ( *addr < kernel_end && *addr + size > kernel_start )
> +            *addr = (kernel_start - size) & ~(align - 1);
> +
>          if ( *addr < entry->addr ||
>               /* Don't steal from the low 1MB due to the copying done there. */
>               *addr < MB(1) )

If you clip addr to remove the kernel range for allocation purposes
you need to restore it before the `entry->size = *addr - entry->addr`
adjustment.

Overall I continue to think this will be much simpler if we passed
around a rangeset.  This series is adding a fair amount of extra code
to deal with overlaps between kernel/initrd allocations vs everything
else, which could be solved more easily by using a rangeset.

Thanks, Roger.

