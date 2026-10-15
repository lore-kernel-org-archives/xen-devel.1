Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9330CCC6B39
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 15:20:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450792.1666198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNFp-0002fL-Tv; Thu, 15 Oct 2026 15:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450792.1666198; Thu, 15 Oct 2026 15:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNFp-0002fE-R1; Thu, 15 Oct 2026 15:20:25 +0000
Received: by outflank-mailman (input) for mailman id 1450792;
 Thu, 15 Oct 2026 15:20:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xHNFo-0002f7-PE
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:20:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHNFo-00000006l7u-3MVF;
 Thu, 15 Oct 2026 15:20:24 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHNFn-0000000AbdR-3RYE;
 Thu, 15 Oct 2026 15:20:24 +0000
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
	bh=y/oqXhE54M41mqvopAsQBnP4IiyOrRxKOdKllmlqVYA=; b=fudTACOPFWENbsQ4HEVLkD4NoS
	/XlnGBT9tyvzLBkldU1HBeLEF17MNH+Xthe0dnRou60vSvGiBy0dFQL0cKVCStaXq6VEZ8KztDKNR
	jC9qcmQK/1sO6lI1gl8/Mo1cecCoUgjWR+j2MEaT3yucM2VyYbB4lNODlYDbT7FVlkkg=;
Date: Thu, 15 Oct 2026 17:20:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 10/15] x86/PVH: convert find_memory() to using a rangeset
Message-ID: <atDvNeMKy__hL2IV@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <c27c214a-da72-419d-ae30-2315b85d0c83@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c27c214a-da72-419d-ae30-2315b85d0c83@suse.com>

On Mon, Oct 12, 2026 at 10:24:44AM +0200, Jan Beulich wrote:
> Subsequently we will need to exclude a 2nd range here. To avoid
> complicating the logic when it needs to cover two ranges, follow the
> suggestion left in a code comment and convert to using a rangeset.
> 
> Suggested-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

> ---
> The Suggested-by: is based on the respective commit's S-o-b. I didn't go
> hunt for whether this may have been suggested in review of that patch.
> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -518,14 +518,38 @@ static int __init pvh_populate_p2m(
>  #undef MB1_PAGES
>  }
>  
> +struct mem_info {
> +    size_t size;
> +    paddr_t addr;
> +};
> +
> +static int cf_check __init _find_memory(

I don't really like underscore prefixed functions, I would rather name
this check_memory_range() or similar.

Thanks, Roger.

