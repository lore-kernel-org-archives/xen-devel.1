Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB4AC433B4
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 11:09:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D04461221
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 11:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D04461221
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128168.240663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lib7S-0001E1-QT; Mon, 17 May 2021 11:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128168.240663; Mon, 17 May 2021 11:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lib7S-0001Dt-NA; Mon, 17 May 2021 11:09:06 +0000
Received: by outflank-mailman (input) for mailman id 128168;
 Mon, 17 May 2021 11:09:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lib7R-0001Cj-Kl
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 11:09:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12ccbfdf-e298-4f82-aa07-e4f375556a82;
 Mon, 17 May 2021 11:09:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC31FACAD;
 Mon, 17 May 2021 11:09:03 +0000 (UTC)
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
X-Inumbo-ID: 12ccbfdf-e298-4f82-aa07-e4f375556a82
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621249743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NjEdIiDKtNAoSDdn93yV72T7E4qq1qeSCiIJdfWX3Qs=;
	b=cW0LduHsIJP07rJWe4sxJtAM24z3+Yg+X9VJV4cmz/vbHZJrPcu9pslEAdy5142t2sCELM
	kKvHfCBpJRepOf+kU5zucWs+N7luJviHaNkSYTabN4/7gDMSc/G8xdcPPMJ0dDUAb94a7o
	ya3ucXebXFc9PWs9jD8zHYs7fIhr0Y8=
Subject: Re: [PATCH] libelf: improve PVH elfnote parsing
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210514135014.78389-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ef298f4-24b5-e133-fc3e-87a67132a61b@suse.com>
Date: Mon, 17 May 2021 13:09:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514135014.78389-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.05.2021 15:50, Roger Pau Monne wrote:
> @@ -426,7 +426,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
>      }
>  
>      /* Initial guess for virt_base is 0 if it is not explicitly defined. */
> -    if ( parms->virt_base == UNSET_ADDR )
> +    if ( parms->virt_base == UNSET_ADDR || hvm )
>      {
>          parms->virt_base = 0;
>          elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",
> @@ -442,7 +442,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
>       * If we are using the modern ELF notes interface then the default
>       * is 0.
>       */
> -    if ( parms->elf_paddr_offset == UNSET_ADDR )
> +    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
>      {
>          if ( parms->elf_note_start )
>              parms->elf_paddr_offset = 0;

Both of these would want their respective comments also updated, I
think: There's no defaulting or guessing really in PVH mode, is
there?

> @@ -456,8 +456,13 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
>      parms->virt_kstart = elf->pstart + virt_offset;
>      parms->virt_kend   = elf->pend   + virt_offset;
>  
> -    if ( parms->virt_entry == UNSET_ADDR )
> -        parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
> +    if ( parms->virt_entry == UNSET_ADDR || hvm )
> +    {
> +        if ( parms->phys_entry != UNSET_ADDR32 )

Don't you need "&& hvm" here to prevent ...

> +            parms->virt_entry = parms->phys_entry;

... this taking effect for a kernel capable of running in both
PV and PVH modes, instead of ...

> +        else
> +            parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);

... this (when actually in PV mode)?

Jan

