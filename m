Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47033C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 21:36:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387892.1629122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtXfQ-0004el-3L; Mon, 10 Aug 2026 21:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387892.1629122; Mon, 10 Aug 2026 21:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtXfQ-0004ee-03; Mon, 10 Aug 2026 21:36:20 +0000
Received: by outflank-mailman (input) for mailman id 1387892;
 Mon, 10 Aug 2026 21:36:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtXfP-0004eY-Cl
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 21:36:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtXfO-009naE-7B
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 23:36:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a4452-2eae-0a2a0a5409dd-0a2a450ccc58-0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 23:36:18 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a4450-f479-0a2a450c0019-aceafc1fe26c-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 23:36:17 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3438340110;
 Mon, 10 Aug 2026 21:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2111F000E9;
 Mon, 10 Aug 2026 21:36:14 +0000 (UTC)
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
	s=k20260515; t=1786397776;
	bh=Dxn4ZrksVwI2spn1hMaPK022GKaG2Go1NXbLkJDX6Lo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=m8fDnUFYqTYIghoC6HAWYNXjg+hbRmOzAF4f7EVMLXCRAtOUxGyBCHKpah0594Nfl
	 7fe7/VE43EiJ6/r2WuB8a4+yGrG6h3o5E2CTjo7OFP/IfAw+w//ln/GI7uNitgovd+
	 H6ObFYNgB6fOM6IEW3ZmsIauFQRxKP8v1OQCjeHHfazfFaaKcQbhyIBJ7t4zNUr287
	 YGdq1nH2ssbE5nt3AJ5hRjDpGO8ZELAcgM1nxWrAiarqTHjX/B+erK0/vMyh3ifGS0
	 sCjN0o8FJxS68w7cAlZD9fz9TT4qvd7g5u3OVeEIaoBOL/wF3Nfbd2miZXgT/G1AFC
	 kU0ObfLlt5q1w==
Date: Mon, 10 Aug 2026 14:36:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 5/7] xen/console: use memcpy() in conring_puts()
In-Reply-To: <20260728065049.1318143-6-dmukhin@ford.com>
Message-ID: <e0de78c5-2530-375e-91a3-b1138d2ea6d2@kernel.org>
References: <20260728065049.1318143-1-dmukhin@ford.com> <20260728065049.1318143-6-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1786397778-026DEA5B-B99070F0/0/0
X-purgate-type: clean
X-purgate-size: 1732

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

Here, I think it would be better to keep it size_t


>  {
> +    unsigned int src = len;
> +
> +    /* There are no callers with strings longer than PAGE_SIZE. */
> +    BUG_ON(len > PAGE_SIZE);
>      ASSERT(rspin_is_locked(&console_lock));
>  
> -    while ( len-- )
> -        conring[CONRING_IDX_MASK(conringp++)] = *str++;
> +    while ( src < len )
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

