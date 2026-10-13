Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BA1CC6B0F
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 13:48:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447910.1663855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGcrZ-0005if-ED; Tue, 13 Oct 2026 13:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447910.1663855; Tue, 13 Oct 2026 13:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGcrZ-0005iY-Bg; Tue, 13 Oct 2026 13:48:17 +0000
Received: by outflank-mailman (input) for mailman id 1447910;
 Tue, 13 Oct 2026 13:48:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGcrY-0005iS-Ft
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 13:48:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGcrY-00000003PO1-235p;
 Tue, 13 Oct 2026 13:48:16 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGcrX-0000000HR2C-24ev;
 Tue, 13 Oct 2026 13:48:16 +0000
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
	bh=8A5W41pXzvY68nzpH7b8XvE3dy9RwW8LbQInY1wdP1c=; b=U+WWr6nY9wemN0m1rvHffEIKWH
	PIC4DLUTWnIBjsWnRDgH/HSQmA47EPBO3orbPIOPppGFQgcyGA+DOcLec5B9/xmuuZaZDTe2EkLcF
	F7tYKGeRzaa48dV9KmwzzZRPFY82xrsus9K0mCqXMSrT6dIA2vTQ3BARwZ3yBuaaFNgM=;
Date: Tue, 13 Oct 2026 15:48:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 06/15] x86/PVH: keep a copy of Dom0's initial E820 map
Message-ID: <as42mhs42tvU9XIL@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>

On Mon, Oct 12, 2026 at 10:21:55AM +0200, Jan Beulich wrote:
> pvh_populate_p2m() needs to populate RAM according to the initial map
> established, prior to any stealing by pvh_steal_ram(). Subsequently the
> invocations of those functions will (need to) move ahead of
> pvh_populate_p2m(), so what to act on is no longer Dom0's memory map at
> the time of invocation.

But (most of?) the uses of pvh_steal_ram() expect to access the stolen
RAM, and hence using pvh_steal_ram() ahead of pvh_populate_p2m() is
not a present use-case?

I assume you have a further use-case for pvh_steal_ram() that wants to
steal a range before it's populated, which might be worth mentioning
here, to add a bit more context?

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -13,6 +13,7 @@
>  #include <xen/multiboot.h>
>  #include <xen/pci.h>
>  #include <xen/softirq.h>
> +#include <xen/xvmalloc.h>
>  
>  #include <acpi/actables.h>
>  
> @@ -413,7 +414,10 @@ static void __init pvh_init_p2m(struct d
>      } while ( preempted );
>  }
>  
> -static int __init pvh_populate_p2m(struct domain *d)
> +static int __init pvh_populate_p2m(
> +    struct domain *d,
> +    const struct e820entry *e820,
> +    unsigned int nr_e820)
>  {
>      struct vcpu *v = d->vcpu[0];
>      unsigned int i;
> @@ -421,15 +425,15 @@ static int __init pvh_populate_p2m(struc
>  #define MB1_PAGES PFN_DOWN(MB(1))
>  
>      /* Populate memory map. */
> -    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    for ( i = 0; i < nr_e820; i++ )
>      {
>          unsigned long addr, size;
>  
> -        if ( d->arch.e820[i].type != E820_RAM )
> +        if ( e820[i].type != E820_RAM )
>              continue;
>  
> -        addr = PFN_DOWN(d->arch.e820[i].addr);
> -        size = PFN_DOWN(d->arch.e820[i].size);
> +        addr = PFN_DOWN(e820[i].addr);
> +        size = PFN_DOWN(e820[i].size);
>  
>          rc = pvh_populate_memory_range(d, addr, size);
>          if ( rc )
> @@ -438,11 +442,11 @@ static int __init pvh_populate_p2m(struc
>          if ( addr < MB1_PAGES )
>          {
>              uint64_t end = min_t(uint64_t, MB(1),
> -                                 d->arch.e820[i].addr + d->arch.e820[i].size);
> +                                 e820[i].addr + e820[i].size);
>              enum hvm_translation_result res =
>                   hvm_copy_to_guest_phys(mfn_to_maddr(_mfn(addr)),
>                                          mfn_to_virt(addr),
> -                                        end - d->arch.e820[i].addr,
> +                                        end - e820[i].addr,
>                                          v);
>  
>              if ( res != HVMTRANS_okay )
> @@ -1352,6 +1356,8 @@ int __init dom0_construct_pvh(const stru
>      paddr_t entry, start_info;
>      struct domain *d = bd->d;
>      struct elf_binary elf;
> +    struct e820entry *orig_e820;
> +    unsigned int nr_orig_e820;
>      int rc;
>  
>      printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
> @@ -1389,6 +1395,15 @@ int __init dom0_construct_pvh(const stru
>  
>      iommu_hwdom_init(d);
>  
> +    nr_orig_e820 = d->arch.nr_e820;
> +    orig_e820 = xvmalloc_array(struct e820entry, nr_orig_e820);
> +    if ( !orig_e820 )
> +    {
> +        printk("No memory for copy of E820 map (%u entries)\n", nr_orig_e820);

For some of the printks during dom0 PVH construction we already print
the domain (%pd), and I think it would be good to print it here also.
Some not-yet-upstream uses (hyperlaunch) create several domains using
this logic, it would be good to easily spot which domain triggered the
errors.

Thanks, Roger.

