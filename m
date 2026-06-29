Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11727C43327
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 14:29:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347597.1605430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCyd-0002V9-WB; Mon, 29 Jun 2026 14:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347597.1605430; Mon, 29 Jun 2026 14:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCyd-0002V2-S5; Mon, 29 Jun 2026 14:28:47 +0000
Received: by outflank-mailman (input) for mailman id 1347597;
 Mon, 29 Jun 2026 14:28:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weCyb-0002Up-Qm
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:28:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCyb-00DAp9-7h
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:28:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a428119-5cb7-0a2a0a5109dd-0a2a45038e06-2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:28:45 +0200
Received: from [209.85.208.172] (helo=mail-lj1-f172.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a42811c-ec1a-0a2a45030019-d155d0acc1a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:28:45 +0200
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-39ad1d25561so16735041fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:28:45 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b1b9c195dsm595771fa.12.2026.06.29.07.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:28:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743324; x=1783348124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+x630J9QzZSI9T5s98kUPiwFenWP9vXggTiowjroyc=;
        b=Ax2x16tOgfvWSGTtCar3ffCzBBtmXRnKhjTxvgotkZJ9oQxAW9iglXWXG17dUEUlZT
         ThMAHMRwtV+PvI7AtcnXeecHXemoE1wS8JnzS+IDphYRQeXnQ6/yLARkgIkBy3nLBHAc
         4Aip/l/MscICjV6lCjzcDnqthKqC8Qh1uidjYOfGTnY92gxCSCAlbhjUDXHWUkKMO16R
         HEFVeeszHWQRrN5nyvmgi5RnOiM31ITFh8CJy0TL16Orp4DAVYE3LXLT6dCJwlM54YXp
         dyBDRlzn3u5g2rH5EgBNdf14uu2BX39rbMYW1Jo47WZ51wW6Sn+5qGmF2DDD31NsBHRj
         aaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743324; x=1783348124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+x630J9QzZSI9T5s98kUPiwFenWP9vXggTiowjroyc=;
        b=K5evLg4NMDe+mb8xsc2pcz4NF/wP5tKoTuPM+CJQUjpTByu9qda7vcskBhz2MFUQzV
         7JQTU3Zs4eq2h7w3H4IKq+SEBBJOqnZ7OmnV/vUyl1nNhqSu+mxEgau/srI1foiEXI5D
         Qk48Uf3kiYP1IG6dW3FzH+rtfh9SzzrSApHC3ITKghT3NAu3sh95NPzTyCZRh+0u+BMm
         sT6d0ErbYo/VhVfM+QZ8C6ncZ52zjhxWMwxhekq+Q7N//B3Zl8BZrdBTTiWeibL48fln
         /Evmm5kNAjfI7JyI9hu4Faxz7jvJnVpu2ifmE2HH4OlBDagceO13teqOGIiF1+dJNfgv
         0G7A==
X-Forwarded-Encrypted: i=1; AHgh+RolPMtUahyHE5HYlktzp48O2B+TxfGjr4bFY2fupkNpgjQWrD3nJj4N9b4q4gaNyP1mPvPM8qa491c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz57PNQpzzefnPGi3ksyjEp5ISra7E+O8iAf/bVPQyl7GidZ6rG
	fcym8cHZ9SAV39BW7A27VHtDkt1nocXGkPhKiqhubR2B2RFXVaIwRXjm
X-Gm-Gg: AfdE7cmB4Br6UAW8IQXCeA+/a94qe8YL+JAYhfx6r5h1h7ZSFuTSuZVhXZ0EFk9vF+I
	oXGmN+MC5U/XyIGcrJqXYawxGUlLQCgFCn7cwiR+ItbaEFH4mC067ntfv4agNFFjOhU4kJx99SB
	pOd6tNXvBZ4H+66kN2Be3SvzmZi7fZ21jdZ1Rf8GuSy5KcnGuWokCtE4MgzKVlT6O3ivfcEjXMA
	84fwpfIi7r1VBigMY7UZY+iJuJ69bXirBpEG2gzZIvJftE7S8oPoSCyjgFVALhxi0UwTxFwvqXc
	Vov+cI/x9r8Y1pXomiiHfUGTyNRwslvB5enrR1LaaR8r5kFG85d0NfeBxwj1is73Ik07WaHJFqY
	cKy9Z8CJqO/OCPDu94kPwLLntPXDwbEasLpCyzHCaXYdkskNn+zO+UzhPN+HHIxLOvMEWN4vc4u
	soUXeJ48xuY3FOAmYsCYIX7SYAKGDpsIxeGjd4qFMvhjs+YeOxiDh7MNRcSEjzU8e+WwDXnzd93
	2driQ==
X-Received: by 2002:a2e:bc85:0:b0:396:dc1e:7824 with SMTP id 38308e7fff4ca-39b1ab17177mr2050661fa.22.1782743324155;
        Mon, 29 Jun 2026 07:28:44 -0700 (PDT)
Message-ID: <733cab8c-a082-4a0e-b082-06509855e789@gmail.com>
Date: Mon, 29 Jun 2026 16:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xmalloc: drop pool list
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cd22dc70-9496-4f18-8476-62d445ff4518@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cd22dc70-9496-4f18-8476-62d445ff4518@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782743325-061315D1-20A0B7E3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1637



On 6/29/26 4:06 PM, Jan Beulich wrote:
>  From its introduction it has been used solely to add and remove pools.
> No list traversal or alike did ever occur. Drop all of this as being dead
> code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -66,9 +66,6 @@
>   #define PREV_FREE       (0x2)
>   #define PREV_USED       (0x0)
>   
> -static DEFINE_SPINLOCK(pool_list_lock);
> -static LIST_HEAD(pool_list_head);
> -
>   struct free_ptr {
>       struct bhdr *prev;
>       struct bhdr *next;
> @@ -113,8 +110,6 @@ struct xmem_pool {
>       xmem_pool_get_memory *get_mem;
>       xmem_pool_put_memory *put_mem;
>   
> -    struct list_head list;
> -
>       char name[MAX_POOL_NAME_LEN];
>   };
>   
> @@ -340,10 +335,6 @@ struct xmem_pool *xmem_pool_create(
>   
>       spin_lock_init(&pool->lock);
>   
> -    spin_lock(&pool_list_lock);
> -    list_add_tail(&pool->list, &pool_list_head);
> -    spin_unlock(&pool_list_lock);
> -
>       return pool;
>   }
>   
> @@ -373,10 +364,6 @@ void xmem_pool_destroy(struct xmem_pool
>                  "%lu bytes still in use.\n",
>                  pool->name, pool, xmem_pool_get_used_size(pool));
>   
> -    spin_lock(&pool_list_lock);
> -    list_del_init(&pool->list);
> -    spin_unlock(&pool_list_lock);
> -
>       pool_bytes = ROUNDUP_SIZE(sizeof(*pool));
>       pool_order = get_order_from_bytes(pool_bytes);
>       free_xenheap_pages(pool,pool_order);
> 

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


