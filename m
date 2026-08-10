Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834DBC5B567
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 20:22:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387843.1629069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWVa-0007eA-V1; Mon, 10 Aug 2026 20:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387843.1629069; Mon, 10 Aug 2026 20:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWVa-0007e3-RB; Mon, 10 Aug 2026 20:22:06 +0000
Received: by outflank-mailman (input) for mailman id 1387843;
 Mon, 10 Aug 2026 20:22:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtWVa-0007dv-8M
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:22:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtWVZ-00FSC8-Cp
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:22:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a32c4-e002-0a2a0a5209dd-0a2a450c8e64-36
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:22:05 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a32eb-f479-0a2a450c0019-aceafc1febde-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:22:04 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E5C3241525;
 Mon, 10 Aug 2026 20:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFC51F000E9;
 Mon, 10 Aug 2026 20:22:00 +0000 (UTC)
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
	s=k20260515; t=1786393322;
	bh=TLEf/DOe2uG4L9xiUXANB+Tqddoo5pXA7QKWB02G6Tk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=lZ0ldktqSfXjFLQ/ohcHyrfS4H5nKI6fWUiwzDUPXsKhQ7NNpEqwPpqwgfALRfTxU
	 Q0KfYqidIN7+CNyn55JMHxI1AwOGWcXgL2xFoQfFHiCSEMTjGqKfFADjFXFUnHVXIb
	 oYsYIOp+epcZABd06xYVUoJfxwpG7cIgutnZerqdVo081uUJJv1qbR9dWdsz31xnFo
	 F/gCZBg5RaD9Zjr76j5B2PBQoDII324WUuJpNTkVTD2jyYUzISQkOpU14aCte68y1l
	 KcblV5RXQqmaO5h355P8iMcSFWsqGMxOuEvV/51h1jc6LLrbThbo2tbaW0MoODD4NT
	 ZAoTk+1BBahpg==
Date: Mon, 10 Aug 2026 13:22:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 4/7] xen/serial: switch txbuf runtime allocation to
 xvmalloc
In-Reply-To: <20260728065049.1318143-5-dmukhin@ford.com>
Message-ID: <df8cf013-02a7-9498-003c-e86471c22867@kernel.org>
References: <20260728065049.1318143-1-dmukhin@ford.com> <20260728065049.1318143-5-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1786393325-768DDA5B-1F6D54E3/0/0
X-purgate-type: clean
X-purgate-size: 1316

On Mon, 27 Jul 2026, dmukhin@ford.com wrote:

> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Switch 'txbuf' allocation to xvmalloc_array() since there is no
> hard requirement to have buffer physically contiguous.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v7:
> - new patch
> ---
>  xen/drivers/char/serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> index e3c356408987..cf0abf1893e5 100644
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -12,6 +12,7 @@
>  #include <xen/param.h>
>  #include <xen/sections.h>
>  #include <xen/serial.h>
> +#include <xen/xvmalloc.h>
>  
>  #include <asm/processor.h>
>  
> @@ -524,8 +525,7 @@ void __init serial_async_transmit(struct serial_port *port)
>          serial_txbufsz = PAGE_SIZE;
>      while ( serial_txbufsz & (serial_txbufsz - 1) )
>          serial_txbufsz &= serial_txbufsz - 1;
> -    port->txbuf = alloc_xenheap_pages(
> -        get_order_from_bytes(serial_txbufsz), 0);
> +    port->txbuf = xvmalloc_array(char, serial_txbufsz);
>  }
>  
>  /*
> -- 
> 2.54.0
> 

