Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607E9C5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 20:25:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387851.1629078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWYU-0008BI-CZ; Mon, 10 Aug 2026 20:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387851.1629078; Mon, 10 Aug 2026 20:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWYU-0008BA-7x; Mon, 10 Aug 2026 20:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1387851;
 Mon, 10 Aug 2026 20:25:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtWYT-0008B2-Ef
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:25:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtWYS-008oBz-Nt
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:25:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a338b-e002-0a2a0a5209dd-0a2a450ab88a-48
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:25:04 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a339f-f2d2-0a2a450a0019-ac6904fec464-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:25:04 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C188600C8;
 Mon, 10 Aug 2026 20:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1170A1F00A3A;
 Mon, 10 Aug 2026 20:25:00 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786393502;
	bh=gxVI8+t6FDLO0exgPZ+hQfCrbo7kQS0z1o3LAYRyTyY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=eHQOo6aIOJxHktTDbJpmx0VK457JDJz76LBHm3iQKr6i0JBDyWkHpuAKYDxPrTCoN
	 wAqN8R04g1Ga2xQa/J32c8StfxaXt+eJSNqks1dbQrTtTd0Zci8kwoE8CJXspeZoOj
	 64hxbvpLdmWtz76CnrKq+2Ig7GA3m34sv+NMp4d1jk4Vx+BMv6v2j+hLKwSgL5IIyh
	 9uYmpnt7VKa0AMlvDeSYthA71IQiZfHQ6T7IQsOWtc352dYIMjuQtsyAfUuLfBlvlR
	 c8inPZwgxYMsP+jwaUPdEzlykqoj9q0wYVaeJU3j29xL5MIA2sOB8RX11hDHRbe9ld
	 lbwyjvXLEgIlA==
Date: Mon, 10 Aug 2026 13:24:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 5/7] xen/console: use memcpy() in conring_puts()
In-Reply-To: <20260728065049.1318143-6-dmukhin@ford.com>
Message-ID: <8b114d89-e026-686c-167c-6ebe1006be4c@kernel.org>
References: <20260728065049.1318143-1-dmukhin@ford.com> <20260728065049.1318143-6-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1786393504-5A9D9CFC-38BA3D9D/0/0
X-purgate-type: clean
X-purgate-size: 1757

On Mon, 27 Jul 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Make conring_puts() more efficient by using memcpy()'s, rather than
> copying the ring a byte at a time.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v7:
> - hardended len check in conring_puts()
> ---
>  xen/drivers/char/console.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 09282a7a4f8e..a1b8e5f5b507 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -361,12 +361,24 @@ static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
>  /* NB: Do not send conring VIRQs during panic. */
>  static bool conring_no_notify;
>  
> -static void conring_puts(const char *str, size_t len)
> +static void conring_puts(const char *str, unsigned int len)
>  {
> +    unsigned int src = len;
> +
> +    /* There are no callers with strings longer than PAGE_SIZE. */
> +    BUG_ON(len > PAGE_SIZE);

Should be an ASSERT


>      ASSERT(rspin_is_locked(&console_lock));
>  
> -    while ( len-- )
> -        conring[CONRING_IDX_MASK(conringp++)] = *str++;
> +    while ( src < len )

src is initialized to len, so this is a problem?


> +    {
> +        unsigned int dst = CONRING_IDX_MASK(conringp + src);
> +        unsigned int n = min(conring_size - dst, len - src);
> +
> +        memcpy(&conring[dst], &str[src], n);
> +        src += n;
> +    }
> +
> +    conringp += len;
>  
>      if ( conringp - conringc > conring_size )
>          conringc = conringp - conring_size;
> -- 
> 2.54.0
> 

