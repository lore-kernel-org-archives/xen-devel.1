Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8075CCC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 11:05:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446998.1663163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGaK5-0004q4-D4; Tue, 13 Oct 2026 11:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446998.1663163; Tue, 13 Oct 2026 11:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGaK5-0004px-A7; Tue, 13 Oct 2026 11:05:33 +0000
Received: by outflank-mailman (input) for mailman id 1446998;
 Tue, 13 Oct 2026 11:05:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGaK4-0004pr-4D
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:05:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGaK4-00000003LsH-0LhH;
 Tue, 13 Oct 2026 11:05:31 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGaK3-0000000CdGs-0TE9;
 Tue, 13 Oct 2026 11:05:31 +0000
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
	bh=+cjGdbKpLKHdnIx9aWSVdVDtVIl50WZDJui5V4rAR4M=; b=pXRNCVZLmQ/MgALj03ZiDigP/W
	gNw4nFRNphmLpzatHCXHuqfSxIh1jdDULTCMa4GgZZ+uHsDZbrclo9oPjXBCoAG2kL8z4CDMVXLnG
	dcCphjL77FZwjVm71G1xePtRB2vTE/Ocv0tGmBn5qoyAvqn7+MHQzrKr96HkTT8h9z54=;
Date: Tue, 13 Oct 2026 13:05:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 03/15] x86/setup: break out E820_RAM accumulation
Message-ID: <as4QeRrfi3k9hMnZ@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <d1a67360-838e-4d9b-8b91-1ebfd9e6f613@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1a67360-838e-4d9b-8b91-1ebfd9e6f613@suse.com>

On Mon, Oct 12, 2026 at 10:20:16AM +0200, Jan Beulich wrote:
> We already have two instances of this, and we're about to gain a third.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger@xenproject.org>

> 
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1007,6 +1007,17 @@ static unsigned int __init copy_bios_e82
>      return n;
>  }
>  
> +static unsigned long __init nr_ram_pages(void)
> +{
> +    unsigned long nr_pages = 0;
> +
> +    for ( unsigned int i = 0; i < e820.nr_map; i++ )
> +        if ( e820.map[i].type == E820_RAM )
> +            nr_pages += e820.map[i].size >> PAGE_SHIFT;

Do we want/need to ensure size is page-aligned here?  AFAICT this is
the sanitized memory map, so it should have all regions aligned to
page boundaries.

Thanks, Roger.

