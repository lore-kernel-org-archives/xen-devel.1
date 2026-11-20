Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1736606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t/3oIJXi
Received: from list by lists.xenproject.org with outflank-mailman.1497983.1696003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULgd-00066K-2V; Fri, 20 Nov 2026 10:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497983.1696003; Fri, 20 Nov 2026 10:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULgc-00066D-VJ; Fri, 20 Nov 2026 10:17:42 +0000
Received: by outflank-mailman (input) for mailman id 1497983;
 Fri, 20 Nov 2026 10:17:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xULgb-000665-6c
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:17:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xULga-003dR8-Iw
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:17:40 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b001e42-e002-0a2a0a5209dd-0a2a45049cfa-6
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:17:40 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b001e44-b57f-0a2a45040019-d1558032dc39-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:17:40 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso7243655e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 02:17:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b10b2c9sm4879072f8f.31.2026.11.20.02.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 02:17:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169860; x=1795774660; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxRVtQfopnq10pQa094qofeElFGw6+8QxdaUW7MKNeA=;
        b=t/3oIJXiL5sUXdrUCEdpZeS1SxKFpOTc1x6AfknpaxolrNyXouK8a45/cn9yljpdwV
         Bh+pNyB6ciM6ZM7dfklxDoa+j5yClS8Db4Xh6XpqedCGk63DT74cN4mLK2JDb3Lmhdlg
         pawGO+TKrLcoOqZJYP0bNmEjN+zw4pqbydNQC57xqADuuZCaz42In266WPAtFH7hg3DA
         u7fN3FjmCcfpc/IZbglRZu1wkO5844RXyZY+z0PVuEqLTi2WJXqdp5ovb3UY1XxRcO/G
         f1AGINXdZROygVAwsFhNHCLrjazTGwF16c3cbj/c65RUowNad+IiV98oMRK4IvVtins1
         UD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169860; x=1795774660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxRVtQfopnq10pQa094qofeElFGw6+8QxdaUW7MKNeA=;
        b=IgmCvj9gk+46VE5kivjrL13FCjcZ3vLWBmzhXo3H34km2cyuiwZvCPU0gYnimSEJRr
         LbI6j+k+iAKR20IATLuiUGUrX6NF/7T/b5MZm4uMZQj+Ol67FwdOy8g3+HB345AguBbr
         AvDQMWHggo/peiHoFJLiCh5oyXyNM5nqJNOn2Wueyb4RvRXBoCplRV4MzzS5ZXwBZAB8
         ch+ZyOOvHG0G4XDZHL7Ecq/ao0EkXV3vD+bBwdz1qowDLHUTTxr2RDrlqG6sXhn83Eg2
         lBJ93215c8u43BPqul+YVsyqcchwsqaRu73qTLoQFTG4/HU6flQpOVtHxN7KZ8euVohL
         MTeQ==
X-Forwarded-Encrypted: i=1; AL+hErHiPjfAocoFb319iI+s7Hvd1NGhW903QcMNTog5s3tgXYCIpK8FYHZcc+P9yaTo20SQQWHMW84pn6k=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+8hxEuasXt9i09S44RaxCJfdtNJ9/QlvPQoKWm4InyYUae7xGW
	lGQzkp3VJkHvpamVyVtz0N+KtyHPQ7vCipEnMjjYrdQeObwlzUi9Y263
X-Gm-Gg: AYBFou0SNED2K/z1PtBErfQhgOkACmok8LwkwtfGeJBoDv1TeUOG5a6TMlWpEXN0MKx
	f0MhryyxO0TRSyTso4N6N45W9TG7nqbUv4yd6gNCjDwQgE/J8EWAmhV6YVE3gDVUrbtCJDgc/1J
	OP0Fk77XwiDYwyNWJyoHp039B1iVUVUGe/BlR4u+/tOmRa5xYY+cUwUcFrkiiQgAWnsFoz0PkKe
	H1hpYl3/rrtqt1ta81NNWJt6ZL9T19o13MHGB++ZThcC0sIj9QySpABgqo6+6VnMJqatjBV9zCK
	uE56GhG2+ycUEg11AEIAAX+LjFpia8C4BOGTg2uOVF6Af/Cna6Ogc5pAGQaTsHKSG3hfctCl3BW
	5y8EKW7vPN7hlC+OXkISsa/gx2aRIq4s7wNWD3Vlux9zpLAgxMrS1xkRT817F0t3bMIDZ0/9rOz
	6x6jEMSD1ykRJ00cDbB5Bx5vd2kidnc5cBmc+cJYsYxxwHGtHrC/HmiZPOtGb4pNVLN32OnP89j
	wOqwwtv6eUA7ieWSQob46+I1f/RF8/Y2hKlYu1SNdvU21xj53WCfRk5k1TdaepB57K1D1rQ5zJ6
	5BEzbs2DKDqP8zI6QDblHxvn1tKfk9MABtC0tEMAbo0QJMFutUWmOA1xvXXLI/rdQgB6w2aYkcj
	y1Q==
X-Received: by 2002:a05:600c:4584:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4bb88817aa2mr51994185e9.22.1795169859819;
        Fri, 20 Nov 2026 02:17:39 -0800 (PST)
Message-ID: <ca34f34b-a6fc-4a14-899c-cd9e30437c85@gmail.com>
Date: Fri, 20 Nov 2026 11:17:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/26] emul/ns16x50: resolve physical I/O port sharing
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-19-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-19-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1795169860-C0EDEB50-8A013CC2/10/73395122804
X-purgate-type: spam
X-purgate-size: 3524
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Ensure NS16550 emulator does not share I/O ports with the physical I/O
> ports, which is essential for emulation in PVH hwdom case (dom0).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index cda21c15cf78..97e12a99368a 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -901,14 +901,27 @@ static int ns16x50_init(void *arg)
>       struct vuart_ns16x50 *vdev = arg;
>       const struct vuart_info *info;
>       struct domain *d;
> +    const char *as;
> +    int rc;
>   
>       ASSERT(vdev);
>   
>       d = vdev->owner;
>       info = vdev->info;
> +    as = (info->base_type & IORESOURCE_IO) ? "ioport": "iomem";
>   
>       if ( info->base_type & IORESOURCE_IO )
>       {
> +        /* Disallow sharing physical I/O port */
> +        rc = ioports_deny_access(d, info->base_addr,
> +                                 info->base_addr + info->size - 1);
> +        if ( rc )
> +        {
> +            ns16x50_err(info, "virtual %s range [%#"PRIx64"..%#"PRIx64"]: conflict w/ physical range\n",
> +                        as, info->base_addr, info->base_addr + info->size - 1);
> +            return rc;
> +        }
> +
>           register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
>       }
>       else if ( info->base_type & IORESOURCE_MEM )
> @@ -928,13 +941,20 @@ static int ns16x50_init(void *arg)
>   static void cf_check ns16x50_deinit(void *arg)
>   {
>       struct vuart_ns16x50 *vdev = arg;
> +    const struct vuart_info *info;
>       unsigned long flags;
>   
>       ASSERT(vdev);
>   
> +    info = vdev->info;
> +
>       ns16x50_lock(vdev, &flags);
>       ns16x50_fifo_tx_flush(vdev);
>       ns16x50_unlock(vdev, &flags);
> +
> +    if ( info->base_type & IORESOURCE_IO )
> +        ioports_permit_access(d, info->base_addr,
> +                              info->base_addr + info->size - 1);

Two things. d isn't declared in ns16x50_deinit() until 21/26, so this
patch, 19/26 and 20/26 don't build with CONFIG_VUART_NS16X50=y (see my
reply to the cover letter). And the permit is unconditional: for a
domain that never had access to the range (any domU), this grants it.
As deinit only runs when the domain is going away, I'd drop the permit;
otherwise it has to restore the state from before ns16x50_init() rather
than assume access was there.

Also, on the error paths of ns16x50_init() that follow (20/26, 21/26),
the range stays denied and the portio handler stays registered. That's
harmless only because the domain then fails to be created; worth a
comment at least.

Another one question I would like to rise is this is x86-specific (I/O 
ports, ioport_caps, the PVH hwdom I/O bitmap) in otherwise 
arch-independent code, and it isn't specific to an NS16550 either: any 
emulated device handed to a domain at a resource the domain could 
otherwise reach directly needs the same.

I'd do it in the framework, through a per-arch hook called by
vuart_init() before emulator->alloc() (together with the IRQ part from
20/26), rather than in ns16x50_init(). That's also where an MMIO-based
variant would use iomem_deny_access() instead.

~ Oleksii

