Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10AACC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 07:24:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451307.1666397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHcIh-0002Iz-O9; Fri, 16 Oct 2026 07:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451307.1666397; Fri, 16 Oct 2026 07:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHcIh-0002Is-L9; Fri, 16 Oct 2026 07:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1451307;
 Fri, 16 Oct 2026 07:24:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xHcIf-0002Im-QF
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 07:24:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHcIf-00000008GHx-2ATv;
 Fri, 16 Oct 2026 07:24:21 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHcIe-00000006uLu-2B1v;
 Fri, 16 Oct 2026 07:24:21 +0000
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
	bh=zX5vRCFuQdz/w9vGXgrcEsBep9Kj6oCh6lAGjzfOiWo=; b=6U3iDdABInDGKbLGdaBtSVV8GN
	+rIRTvU/pWEykdSh3AFGjsrfwmkXw0z7X7/sEF5Tz4yupyCMCAB0Pinh+7Iw64OFtipfBSjXS7nQu
	hPYfpvJKOwUfLK9dU1Ni5Kt1FTgSwoAb94TK1QZLArDDPW4N+vGxdzWCTdgKCNMG5qhE=;
Date: Fri, 16 Oct 2026 09:24:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 14/15] x86/PVH: log Dom0's E820 map earlier
Message-ID: <atHRIjktRnqUGEZd@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <f5cb5cdc-17b0-4678-aa0b-36a0a8a00cc3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5cb5cdc-17b0-4678-aa0b-36a0a8a00cc3@suse.com>

On Mon, Oct 12, 2026 at 10:26:24AM +0200, Jan Beulich wrote:
> Do this as soon as it's final. For debug builds also mark it final, with
> assertions put in place to make sure it won't further be altered. (For a
> release build such further altering isn't the end of the world normally,
> so the situation is left alone there.)
> 
> Switch to using %pd while moving the code up.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -46,6 +46,9 @@
>   */
>  #define HVM_VM86_TSS_SIZE 265
>  
> +/* Marker set once Dom0's E820 isn't supposed to change anymore */
> +static bool __initdata e820_finalized;
> +
>  static unsigned int __initdata acpi_intr_overrides;
>  static struct acpi_madt_interrupt_override __initdata *intsrcovr;
>  
> @@ -195,6 +198,8 @@ static int __init pvh_steal_ram(struct d
>      struct e820entry *good = NULL;
>      unsigned int i = d->arch.nr_e820;
>  
> +    ASSERT(!e820_finalized);
> +
>      /*
>       * Alignment 0 should be set to 1, so it doesn't wrap around in the
>       * calculations below.
> @@ -241,6 +246,8 @@ static int __init pvh_add_mem_range(stru
>      struct e820entry *map;
>      unsigned int i;
>  
> +    ASSERT(!e820_finalized);
> +
>      for ( i = 0; i < d->arch.nr_e820; i++ )
>      {
>          uint64_t rs = d->arch.e820[i].addr;
> @@ -1759,6 +1766,13 @@ int __init dom0_construct_pvh(const stru
>  
>      pvh_place_initrd(bd, &elf, &initrd, &blob_start, &blob_end);
>  
> +    if ( opt_dom0_verbose )
> +    {
> +        printk("%pd memory map:\n", d);
> +        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
> +        e820_finalized = true;

You want to pull setting e820_finalized out of the if body, so it's
not tied to opt_dom0_verbose being set I think?

The rest LGTM, so:

Acked-by: Roger Pau Monné <roger@xenproject.rog>

With the above change.

Thanks, Roger.

