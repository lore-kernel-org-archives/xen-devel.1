Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08549CCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 07:35:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451323.1666406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHcSq-0004F4-Kz; Fri, 16 Oct 2026 07:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451323.1666406; Fri, 16 Oct 2026 07:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHcSq-0004Ew-Fx; Fri, 16 Oct 2026 07:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1451323;
 Fri, 16 Oct 2026 07:34:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xHcSp-0004Eq-1M
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 07:34:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHcSo-00000008GSU-3uFR;
 Fri, 16 Oct 2026 07:34:50 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHcSn-00000007F8N-40bs;
 Fri, 16 Oct 2026 07:34:50 +0000
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
	bh=w/6ZAigQZ7rrsmqXLLBcIjrnz1DrizXf/I/CGCUSdew=; b=I+GEwE2J1I6VXTG7WTRocdsEYU
	kxorK31vpPwBJPnqxTSiTmb9JbEtlkZX97ILNFHdg38eW1JBWlOfurfSrdaC4xWXVyhMo5YXVFZ5s
	JiZIjcjfIFdMSZEGqggGQuWwraxsxNT3CrMxNJCh6C/vl3JKJ1qWl2Kl807+RJlAOX3Y=;
Date: Fri, 16 Oct 2026 09:34:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 15/15] x86/PVH: simplify writing of Dom0's RSDP
Message-ID: <atHTl9du422xaY0v@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <bcf7efcc-2648-42e0-ba0b-7f6e32e65f11@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcf7efcc-2648-42e0-ba0b-7f6e32e65f11@suse.com>

On Mon, Oct 12, 2026 at 10:26:58AM +0200, Jan Beulich wrote:
> Now that we establish where the RSDP is to live before actually loading
> the kernel (and writing start-info there) we can simply hand the pointer
> there, eliminating the need for the (fragile) separate write to the field
> out of pvh_setup_acpi().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

One nit below.

> ---
> Alternatively we could move start_info to the top-level function, have
> pvh_load_kernel() and pvh_setup_acpi() fill what need filling, and do
> the write from the top-level function. Yet it looks to me as if this was
> more churn for little extra gain.
> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -976,7 +976,8 @@ static int __init pvh_load_kernel(
>      const struct boot_domain *bd,
>      struct elf_binary *elf,
>      struct hvm_modlist_entry *mod,
> -    paddr_t *start_info_addr)
> +    paddr_t *start_info_addr,
> +    paddr_t rsdp)
>  {
>      struct domain *d = bd->d;
>      struct boot_module *initrd = bd->initrd;
> @@ -1110,6 +1111,7 @@ static int __init pvh_load_kernel(
>  
>      start_info.magic = XEN_HVM_START_MAGIC_VALUE;
>      start_info.flags = SIF_PRIVILEGED | SIF_INITDOMAIN;
> +    start_info.rsdp_paddr = rsdp;
>      rc = hvm_copy_to_guest_phys(last_addr, &start_info, sizeof(start_info), v);
>      if ( rc )
>      {
> @@ -1587,10 +1589,7 @@ static int __init pvh_place_acpi(
>      return 0;
>  }
>  
> -static int __init pvh_setup_acpi(
> -    struct domain *d,
> -    struct acpi_info *info,
> -    paddr_t start_info)
> +static int __init pvh_setup_acpi(struct domain *d, struct acpi_info *info)
>  {
>      int rc;
>      struct acpi_table_rsdp *native_rsdp, rsdp = {
> @@ -1642,20 +1641,6 @@ static int __init pvh_setup_acpi(
>          return rc;
>      }
>  
> -    /* Copy RSDP address to start_info. */
> -    BUILD_BUG_ON(sizeof(info->rsdp) !=
> -                 sizeof_field(struct hvm_start_info, rsdp_paddr));

You add this BUILD_BUG_ON() in a previous patch and remove it here.
Maybe it's not worth adding?

Thanks, Roger.

