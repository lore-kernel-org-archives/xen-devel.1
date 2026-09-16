Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB659C88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 05:46:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422358.1647803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6iT6-0001JH-Im; Wed, 16 Sep 2026 05:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422358.1647803; Wed, 16 Sep 2026 05:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6iT6-0001JA-Fe; Wed, 16 Sep 2026 05:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1422358;
 Wed, 16 Sep 2026 05:46:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6iT5-0001J4-RV
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 05:46:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6iT4-004UW6-H2
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 07:46:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa2d1a-bab6-0a2a0a5309dd-0a2a4509956e-0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:46:02 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa2d19-be1a-0a2a45090019-4a7de18ca918-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:46:02 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccff31419so4495245e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 22:46:02 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83dba8f4sm46382725e9.13.2026.09.15.22.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 22:46:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789537561; x=1790142361; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LmDLvn/cNVsmLhARUce9FVScA940nFRVtC+xvvIuZY=;
        b=bB4ODZBZoEVzB8GPkjRBjeVaNIeEY18GQKlF52IzUnLlmS0fCWgq8+eehxETEStcK2
         hN4+RIvRADOnLSeOmJttygEBZINtm2msIpEGXPNY+pVDwvVma172Px0vo16I3sGNHud9
         0ggkq5NH5kFo9MTtRwzISuSrv3/ccdNiT9EFW80PfmrmTrAcQ/hmudmMQqs1Yu4sMBaM
         4pAGx6rPAasopMjB1wgFohpXpxPVgAu2cRg1U5mae1oAZxC95xE8XM+9J8RtBjMerska
         RW1ZSO8mDm2gvyAYWbXCKr/RU1e9Kl1bWwif5Yf13672AQw8t16q8JTGArJ/+4rhKSVM
         XZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537561; x=1790142361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LmDLvn/cNVsmLhARUce9FVScA940nFRVtC+xvvIuZY=;
        b=WABluYEAHMhvOIRgnMrSCcrjZKqaZdYh5OlMJ+bro702XK6cuxHUPQDkFC3deJ/6og
         0zZaglDJ6l9nDdv6yQ/+1rKpHWdS5iApDs0s+2r62l618GNsbYktwNd/4gnocfbYp7PI
         3vHRp5wuBJbvIH1DMDtjTK8C3R4ZwJf9QwpZx6wqI47xuMTbUMrOp7HBOpw/Ix7ZOAMO
         WNBLccW992C0X0vAbop+/qoEF6YgNv4KvzvdvzsyH4RagM/E8x1DVOExrfdS0AFGdEKb
         auqzVpwFWQLExIhfqVKcH9ns9Hn7Xa72STDb02KTRolhqmlfIVlynV7SidIfvrft6cfI
         sTVg==
X-Forwarded-Encrypted: i=1; AKwUvBzRgYBdcIaBlRXn27EroY44hhSW/mUlEDFxXpXBaiPPMZ9HKOfSGJpH2a+l99vMNgVVzzNetc22eR8=@lists.xenproject.org
X-Gm-Message-State: AFuF++kolPzFCzm3bVi5YqM78EthJy0Coz9xWIy9Rtrsv/oiPy2Ve7ne
	TchTz1ettp4lXtN+2cI6itx15VcWfZn7U3dZogOQG8gqXqsX4p3FsM4e3QuXHObhyQ==
X-Gm-Gg: AYBFou10mXEkDLC91+p49PZLAp5B/Hqh++tAmSee9Ydj69bWHUom2Okqh1xcWqn6Fec
	eQ+61mQOs8LlUc7Mcx+hhqEr0ZoAV7HHZPr1k2yRgRtOtuXRU/vWiSKvZsGaGmpZu47t9c61rPK
	OIr2gkxvVUwN4Y/y2x0/PMXLj/b4+F8VMSTplj98pB5TCWh6SmWnsLg6WnrpQEOAMf7zr85aTQQ
	Q5S4OhQeAoERN2V2JR4RTpQPCyUqC552CwPpKNdQ9IcUj38MXubzDeeafkRmk9IlIHNF1lU7mJg
	E/p3I3oMwJRGwUOgqGNp9czt4IolkJKqGEJw2NhlcvyS0qxmfet5AciBMDekzwink4g+fQVd9KU
	wCjoaQ5AXdU5/ChTLU9CZsL19p9wl7ueQxAy5Wjhx/eJLhGo5YhM0LUvHarfzWN2sNAiLEyqovX
	YUTf8uN0F+J1yTBhm03LQqS7areHqK4zg+GJzswZs1f0JSjiD8oqtBmKYThlHj4NJwhWqZBvkKS
	zE=
X-Received: by 2002:a05:600c:6290:b0:49d:797:8488 with SMTP id 5b1f17b1804b1-49eac45b9ecmr10956195e9.1.1789537561618;
        Tue, 15 Sep 2026 22:46:01 -0700 (PDT)
Message-ID: <2516df18-b239-4bf8-9f89-f1811515e5d8@suse.com>
Date: Wed, 16 Sep 2026 07:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: "teddy.astie@vates.tech" <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-4-kevin.lampis@citrix.com>
 <0aedfbad-29ae-4083-89b4-5c662398553d@citrix.com>
 <BY1PR03MB79965A43641C02BC2267E5A8F3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BY1PR03MB79965A43641C02BC2267E5A8F3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789537562-BE0C5034-5093CC0B/0/0
X-purgate-type: clean
X-purgate-size: 1462

On 15.09.2026 21:37, Kevin Lampis wrote:
>> This seems unwise.  I think you want a return 0 in the
>> paging_write_guest_entry() case because returning the input cannot
>> possibly lead to anything good.
> 
> This would make the calling code in mod_l1_entry() more complicated.
> 
> At the moment it shakes out like this
>     static int mod_l1_entry(l1_pgentry_t *pl1e,
>                             ...,
>                             l1_pgentry_t *ol1e_out)
>     {
>         l1_pgentry_t ol1e = l1e_read(pl1e);
>         ...
>         ol1e = UPDATE_ENTRY(l1, pl1e, ol1e, ...);
>         ...
>         put_page_from_l1e(ol1e, pt_dom);
>         ...
>         if ( ol1e_out )
>             *ol1e_out = ol1e;
>     }
> 
> But if UPDATE_ENTRY() sometimes returns 0 depending on what internal path it
> takes then we'll need two local ol1e variables, one that is always valid to
> give to put_page_from_l1e() and a different one to maybe assign to *ol1e_out.
> 
> When you say "returning the input cannot possibly lead to anything good", the
> current version of this patch series actually depends on it.

Does it? I've peeked ahead only to the next patch so far, but aren't you
going to use the new PTE_UPDATE_SWAP flag? And isn't ol1e_out being non-
NULL tied to that new flag being set? Mixing both is what I think Andrew
in concerned about. The "flag set, pointer non-NULL" case wouldn't hit
the "return 0" path, aiui.

Jan

