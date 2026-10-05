Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C63CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:19:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441017.1658625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlPm-0006G8-NS; Mon, 05 Oct 2026 16:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441017.1658625; Mon, 05 Oct 2026 16:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlPm-0006G1-KW; Mon, 05 Oct 2026 16:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1441017;
 Mon, 05 Oct 2026 16:19:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xDlPl-0006Fv-P2
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:19:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDlPl-00G80U-1J;
 Mon, 05 Oct 2026 16:19:45 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDlPl-0038pV-0H;
 Mon, 05 Oct 2026 16:19:45 +0000
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
	bh=fdhhM+wVyT+RoEGbvryO9XRtui5cNWCzJ0UIki8brNs=; b=QJSDA41CbxySq2vi4Y6IwXhZp2
	ayjy/4YtpUyHmfNaUI6L2YoqCjizGxQvH4xIAYs3pToeE16bk0QjzsYjj4acxbtkzU1Fn/Xv7xFNr
	OSuO+FkZO/Y7UWJcz/lTNyuS/GsqY87r6DHng9Y4MYsCQOpaW+P8EmIx+qtcqR/wsK5g=;
Date: Mon, 5 Oct 2026 18:19:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/PVH: correct PVH Dom0 E820 region merge
Message-ID: <asPOHwUrYdlFJ3nx@Mac.lan>
References: <012de89f-000c-45b3-a600-544114346e5b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <012de89f-000c-45b3-a600-544114346e5b@suse.com>

On Mon, Oct 05, 2026 at 06:01:34PM +0200, Jan Beulich wrote:
> Folding with an immediately successive region can't be done by merely
> lowering the start of the region. The size of the region needs increasing
> as well.
> 
> Fixes: 5427134eae81 ("x86: populate PVHv2 Dom0 physical memory map")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

My bad...

Reviewed-by: Roger Pau Monné <roger@xenproject.org>

> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -229,6 +229,7 @@ static int __init pvh_add_mem_range(stru
>          if ( rs == e && d->arch.e820[i].type == type )
>          {
>              d->arch.e820[i].addr = s;
> +            d->arch.e820[i].size += e - s;

I think it would be simpler as:

d->arch.e820[i].size = re - s;

Thanks, Roger.

