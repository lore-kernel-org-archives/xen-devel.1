Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAFFC5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 20:19:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387836.1629059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWTF-0006AN-IV; Mon, 10 Aug 2026 20:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387836.1629059; Mon, 10 Aug 2026 20:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWTF-0006AG-Fo; Mon, 10 Aug 2026 20:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1387836;
 Mon, 10 Aug 2026 20:19:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtWTD-0006AA-Fi
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:19:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtWTC-009fhM-CK
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:19:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a325a-8faa-0a2a0a5109dd-0a2a4503bbc4-0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:19:38 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a3259-fae8-0a2a45030019-ac6904fe8354-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:19:38 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 71016600AD;
 Mon, 10 Aug 2026 20:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8558F1F000E9;
 Mon, 10 Aug 2026 20:19:34 +0000 (UTC)
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
	s=k20260515; t=1786393176;
	bh=EwYj3j/RNOT5w84VixrvYZJ6FaxcWeo4bmm2TSRUaeY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=oj19ParByyAD4WD3xnzZWFAzjhcSyUXXhqsbH5aMgKr/6XO4IkZjuYxYpiqfRbAw4
	 U5W6QncYdRiQ9RT4PatuhMKBtc2zyyeo/SLieBauiOUaH3mR2JAwN/94m6m8VjnWtN
	 vTkzt3TbWiz+w0mkMomtVi7kiJfN1V45yEVOwT7SGiJxXzNDbk/+btm9nEhRp/42pN
	 9lMvdt0eeWA5OTaqv/n7p6ecUuH5mrO+M8vTyFJF31lVaZr8SpHSK2v1Nke2Uu5PtT
	 Lq28kOnO5KwWr2v66tqrUOl2WwKq/bjltk54qEUvh7ylTie3t8Wv5f03wUqiYI2VYJ
	 E1jZ9WtOY9N9Q==
Date: Mon, 10 Aug 2026 13:19:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 3/7] xen/console: switch conring runtime allocation
 to xvmalloc
In-Reply-To: <20260728065049.1318143-4-dmukhin@ford.com>
Message-ID: <59a85064-35d9-c3f5-c056-6c05677fc27a@kernel.org>
References: <20260728065049.1318143-1-dmukhin@ford.com> <20260728065049.1318143-4-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1786393178-768FA4E9-58A5BD5C/0/0
X-purgate-type: clean
X-purgate-size: 3554

On Mon, 27 Jul 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> The console ring only needs to be virtually contiguous; it does not need
> a naturally aligned or physically contiguous allocation. Replace the
> runtime xenheap allocation in console_init_ring() with an xvmalloc-backed
> buffer.
> 
> Also clamp the user-configured ring size to the supported range and emit
> warning when the requested size is adjusted.
> 
> Drop full stops in all diagnostic messages in console_init_ring() to align
> code with the common code pattern.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

There is another alloc_xenheap_pages in the same file, in conring_flush.
It would probably need to be changed as well.

> ---
> Changes since v7:
> - Jan's feedback from
>   https://lore.kernel.org/xen-devel/0fefa50c-46aa-4ede-a8e2-8c2c619bc2ab@suse.com/
> ---
>  xen/drivers/char/console.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 40355c1d14d6..09282a7a4f8e 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,6 +33,7 @@
>  #include <asm/setup.h>
>  #include <xen/sections.h>
>  #include <xen/consoled.h>
> +#include <xen/xvmalloc.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
> @@ -464,20 +465,30 @@ void __init console_init_ring(void)
>  {
>      char *ring;
>      unsigned int done, size, n;
> -    unsigned int order, memflags;
>      unsigned long flags;
>  
>      if ( !opt_conring_size )
>          return;
>  
> -    order = get_order_from_bytes(max(opt_conring_size, conring_size));
> -    memflags = MEMF_bits(crashinfo_maxaddr_bits);

The original code had MEMF_bits(crashinfo_maxaddr_bits).
crashinfo_maxaddr_bits is 64-bit by default but can be changed via
command line options. Now, the memflags is going away and there is no
way to bring it back because xvmalloc_array doesn't take memflags as a
parameter.

Andrew, Jan, is that OK?


> -    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
> +    if ( opt_conring_size < GB(2) )
>      {
> -        BUG_ON(order == 0);
> -        order--;
> +        unsigned int order = get_order_from_bytes(max(opt_conring_size,
> +                                                      conring_size));
> +
> +        opt_conring_size = PAGE_SIZE << order;
> +    }
> +    else
> +    {
> +        printk(XENLOG_WARNING
> +               "Limiting user-configured console ring size to 2 GiB\n");
> +        opt_conring_size = GB(2);
> +    }
> +
> +    while ( (ring = xvmalloc_array(char, opt_conring_size)) == NULL )

It looks like that if opt_conring_size is zero, then xvmalloc_array
would return ZERO_BLOCK_PTR which is != NULL. We need to have a
different check here for that condition


> +    {
> +        BUG_ON(opt_conring_size == 0);
> +        opt_conring_size >>= 1;
>      }
> -    opt_conring_size = PAGE_SIZE << order;
>  
>      nrspin_lock_irqsave(&console_lock, flags);
>  
> @@ -498,7 +509,7 @@ void __init console_init_ring(void)
>      conring_size = opt_conring_size;
>      nrspin_unlock_irqrestore(&console_lock, flags);
>  
> -    printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
> +    printk("Allocated console ring of %u KiB\n", opt_conring_size >> 10);
>  }
>  
>  /*
> -- 
> 2.54.0
> 

