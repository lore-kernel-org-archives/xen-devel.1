Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5501BC43458
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 13:37:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347525.1605357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCAg-0007L4-Px; Mon, 29 Jun 2026 13:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347525.1605357; Mon, 29 Jun 2026 13:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCAg-0007Kx-Mg; Mon, 29 Jun 2026 13:37:10 +0000
Received: by outflank-mailman (input) for mailman id 1347525;
 Mon, 29 Jun 2026 13:37:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weCAf-0007Kr-FX
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 13:37:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCAe-00EcKm-8n
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:37:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4274f8-2eae-0a2a0a5409dd-0a2a450182da-40
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 15:37:08 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a427503-400f-0a2a45010019-d155d0b6ecad-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 15:37:08 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39669bcaadfso35660421fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 06:37:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad6954a63csm5751233e87.12.2026.06.29.06.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 06:37:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782740227; x=1783345027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zAhzn9WefsR3GOpsdi8q8Rxdn+skBuNnioTX+PM5M8=;
        b=RZby1/D9m0W2n/OdHymjBZwBuhnKTr37g5Tv5Hxd7tuXCrTFpRrCjQD5ImEBiJAqWW
         hgDS5jTHsFIxJvDMvEhaMoOXW3dE8bbvupaliETs302CQn6IeNTz+AqcwlLDK+XTClIe
         Nry9b5EwizRMkTZaFBdyItwpTaUa40M9urXkGPehMfb0ZIEpEzXd9ggAA1WQV2m8OgqP
         xA1PVlSi5KhulWvujCY1kYwS1M/eWOUoDzy3BeQCDB+ud0oSXsbVWvflrJSeAaxXDkQr
         SpSrSGDqOgvIlUTQOZbXaRmJTgvpMFHJsdhKteVVoonZStP9cPXSd0oPdSwqxwrKP3i3
         1yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740227; x=1783345027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zAhzn9WefsR3GOpsdi8q8Rxdn+skBuNnioTX+PM5M8=;
        b=n0lOoYAs04ydj+9hCoW6EKbucRir25vbkvOeC/JbGSvEFnL56ip7SqTuf41ldwlJXW
         4CDk7wvTEZd0Dp8S2eg7xpr4XUEOt8CRq60cfKP+7tLh7xQrKT5yNJ6FDwnX0699pQC+
         0kL2fxFEeBoYp4hVnXDJy4sk75mRKN4bQc9RBC8i1rMeajMpN0wLBxkxb9213krkq/NZ
         vUHQYtv8fZRZQSE5mf6GUn+0EJsT4F8gRcElyJzHtGlbP+lIi1yDlBz6TI6wmbPBCIlU
         PxZ0Ts3iYWMz8JdYNPLmk99KtFJV5no6nTqidF7/I7LmFntb1SJ+PH+TTSIVkVjh6ips
         swbw==
X-Forwarded-Encrypted: i=1; AHgh+RpkFmdCx0QG8A+vyOp7455WU19aUZOvMYHQQ4aIWOA43L8mZ9V0vVgJ9vMIpjbyMRAfbV12DXtLgcc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGFAfH/FP2FHF1HKCcdRo6KtLkJomV/sS0gsZ3z7mSoD0H5CfL
	rDkLuolnUD9DbQ2bwJh8+S6NVq8P7PeMMquRUiHiZgE4SHn6WxqDpzjq
X-Gm-Gg: AfdE7cnAGIhEmUDESHFiBBKLYUFSpGSlu43fLQ+P2tNEpGHkNoc9bTyVKd8vvvHzzFv
	UzCAxY51sZaQWidtBkBw2LVXy8eLA7JN6nrYZXJrxt+stWt3d0qgnPubqejMyB/fjVdPm2zYuT6
	PkB6YgDvILiw6LX72ORT7CYmR89C6l+BVDUibR1Slt8phIO9Yf1gD/NB25hMe7PLWC8GxZkHDj+
	E9FSzWh8jZoQmnQWkZTiVwzy2iPaahhFnqswOQBZyunca4D9yKPhoomVBV9PLS1vpqEHbn+MzAU
	tohPHse7kn3q9sApLfGBTc/8TMdic80bD2b0xLbxG9P8ingGCbaNdmgrpENFn+0jA9BpfCETfTS
	CbGJJfAzKX0ffq4lhbT58rJquSuVA4qrl6ZuD0g1qiKjGcc23rx1BLy9bwOOLC82duop24jDwky
	f4HmvSKZUm8AImqgWUxynef7XcjuqMPWXrZ1MdDxO7dlfoGPCl0ta1fFngKxgfl6JwSWHdmYRUf
	Gw6eQ==
X-Received: by 2002:a05:6512:1396:b0:5ae:ba0a:5984 with SMTP id 2adb3069b0e04-5aeba0a5a4cmr692378e87.53.1782740226859;
        Mon, 29 Jun 2026 06:37:06 -0700 (PDT)
Message-ID: <075c7302-d2c5-45d2-9fb7-bb7b49bc6dd6@gmail.com>
Date: Mon, 29 Jun 2026 15:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 3/4] xen/irq: handle IRQ being disabled while
 executing its handler
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-4-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260629094531.55555-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1782740228-832C51E0-908A275F/10/73395122804
X-purgate-type: spam
X-purgate-size: 740



On 6/29/26 11:45 AM, Roger Pau Monne wrote:
> It's possible for IRQ_DISABLED to be set while running the handler
> execution loop in do_IRQ().  Such disabling can be done by the handler
> itself, or from a remote CPU.
> 
> Check for IRQ_DISABLED not being set in the loop condition, as to not
> execute the handler if the IRQ has been disabled.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I wanted to add a fixes tag, but this has been broken since forever, and
> hence I should add:
> 
> Fixes: 4676bbf96dc8 ("bitkeeper revision 1.2 (3ddb79c9KusG02eh7i-uXkgY0IksKA)")
> 
> Which is pointless IMO.
> ---

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

