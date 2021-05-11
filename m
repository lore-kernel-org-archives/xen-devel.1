Return-Path: <SRS0=u2kx=KG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C028C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 11 May 2021 22:58:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A13961919
	for <xen-devel@archiver.kernel.org>; Tue, 11 May 2021 22:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A13961919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.126069.237307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgbKL-0006xi-BI; Tue, 11 May 2021 22:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126069.237307; Tue, 11 May 2021 22:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgbKL-0006xb-7m; Tue, 11 May 2021 22:58:09 +0000
Received: by outflank-mailman (input) for mailman id 126069;
 Tue, 11 May 2021 22:58:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgbKK-0006xU-5e
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 22:58:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1713af57-8e9f-4e5a-8f35-6e05c3f6aba6;
 Tue, 11 May 2021 22:58:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 942C661606;
 Tue, 11 May 2021 22:58:06 +0000 (UTC)
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
X-Inumbo-ID: 1713af57-8e9f-4e5a-8f35-6e05c3f6aba6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620773886;
	bh=AfnKJc+x+W2uE2rWH86MkMQkcq/aZaV3HsIHhNCA1RM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c1ldVjtHflZ6MVcpwx9FC3cN1uqRv12TGF5pPWCW6B1PoheUA0XLxt2a0pgbhcY6/
	 HQm+igs/S7FNXjW3X6pxkYqxqdKiKeouuKxR0aN2epl3IstLZmSR/JQ33jB7U8ThL8
	 2KtmIT4Sg8UB32KFHO3GKVzjea3dgPzzSfbEDr5vsFmJFpQQSfN0mqorAuls+064pT
	 GOanK48JQHuhBlOwo+yG7OdFMRBXqotcBiHaMtcB9Nk/AyoTv+zzmP0Ke9zgNSYLOk
	 MucwWYOFcK4QRHrZ3g9xdPXvpsoPvzbw/uHGzetBNaW3QODAwy2PgrmdKawQK6IDXH
	 Ve2Ts2MkwjC6g==
Date: Tue, 11 May 2021 15:58:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH RFCv2 06/15] xen/arm: mm: Don't open-code Xen PT update
 in remove_early_mappings()
In-Reply-To: <20210425201318.15447-7-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105111557510.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-7-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that xen_pt_update_entry() is able to deal with different mapping
> size, we can replace the open-coding of the page-tables update by a call
> to modify_xen_mappings().
> 
> As the function is not meant to fail, a BUG_ON() is added to check the
> return.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - Stay consistent with how function name are used in the commit
>         message
>         - Add my AWS signed-off-by
> ---
>  xen/arch/arm/mm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 1fe52b3af722..2cbfbe25240e 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -598,11 +598,11 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>  void __init remove_early_mappings(void)
>  {
> -    lpae_t pte = {0};
> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
> -              pte);
> -    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
> +    int rc;
> +
> +    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
> +                             _PAGE_BLOCK);
> +    BUG_ON(rc);
>  }
>  
>  /*
> -- 
> 2.17.1
> 

