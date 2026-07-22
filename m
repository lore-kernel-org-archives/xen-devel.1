Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8CDC4452D
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 07:20:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368156.1617640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRF4-0005hK-Pc; Wed, 22 Jul 2026 07:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368156.1617640; Wed, 22 Jul 2026 07:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRF4-0005hD-My; Wed, 22 Jul 2026 07:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1368156;
 Wed, 22 Jul 2026 07:19:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wmRF3-0005h7-Lo
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 07:19:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmRF2-00EeqY-Rf
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 09:19:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a606f0b-bab6-0a2a0a5309dd-0a2a450b94ac-8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:19:44 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a606f10-b7e8-0a2a450b0019-d1558032d840-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:19:44 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49547fc63a0so25964845e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 00:19:44 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956537c6besm115844845e9.8.2026.07.22.00.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 00:19:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784704784; x=1785309584; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYfrHYMdUAdnXkzp0AqDONGHxfephlOlXI+ZXomHBXs=;
        b=Z8kMnqUvr6zMgz3soJIE6Uoib0ql2gNvay5HQL8GCLiEr24NmlXbgQoNTDFODPdqtu
         sYtHNpEEKPe9J9QhQpBRPDy8uNS76a/4rKWKMpe/ZOqGgGaBUZYkn1GMaZeL5PQIsqwY
         F16cngLtwBRO+F52RmMIi6CAMa/waSgXfbgTc1TnArQU9wvPdGbmujNmroIXxLXWV4LJ
         99TMCTudjFOvAIoMle4J31G/I6dcy2BiVV294d8372KYgyyKVNLkOIFlJqxpytqC3D8F
         OGe87fI6b+uzq+hHyU8cea5QzovjMu/bzx2EztNf9eOXvr5xBbqDuzAfkj3VvehvYmIm
         EbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704784; x=1785309584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYfrHYMdUAdnXkzp0AqDONGHxfephlOlXI+ZXomHBXs=;
        b=nZ4fx3fUizn7far+2kfzqQaJ8k0tVMoRQosjlz29ck7jpeh0FqJbNMtEKkvQnpTPDL
         H76zSaZV2bAkRVf+4h5DPKUf/xwLU/T8crzQAruKijyko2NEsy/FHKsmF/ExDiR+ixTp
         5+16hikSh/QmbsVJxSVL6VW8HnP3ZhCBdbAym+bs72tFbYNCw2CpGmMUacnjwgataoVA
         DHTYxFTRcLAWm1iAQidzjwB8VxcY70NCRpT42pErhmzVMmdKcMFZicJTwG68qkCvtSdz
         4o0pggiMGflR7mBB4OwRkguSN46kZz+Qhez2NYqrDtEcr3PbdviO/IemU37MqmK9J6Ny
         QBsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqBUkpT7hfY2ohLeXGtI8PNb2LderRsunZv6XU8fq1SKDmVyViPxVAhs48SVEuhRD0JJKWc6D1cQI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPYya8HOhmaM9JV/XdNZDOJJS/B6HvGpxEZXbTabB7Mnxc4ae0
	L6D4gBofJbhgcQuy6SFlbK4u6csmAxcpYnbT3eyUBCap81j5Ty+ZlwBA
X-Gm-Gg: AR+sD13rYJnURb2oiZ9t6NXAdVhW7GIvl1A999ManfHlhVw8rAPda4Zpqx1jj5O+lrP
	j+36UlKTbw6eBs8BsVY9d8ma7qb1vZNVSWqPQ3xXDe1q0i/WCwkykDRfNI/W4F94C8JVduV5xXl
	oiXvVl8bYuMBKwJEwszZZI9Ehz3+M2LoXk9dqhvsusytX4v50vwP8xp6GNzbyQOHpXbo2M7Akmd
	SkvHpCDEShaXPoK0qTTvO8MknZox177kq/CryyKpEzY7jV6smKjWMy5O2DPkg/IsNUACCYdl/RZ
	nHa0yHl0BUk/IqlDM0zN/GkPrZhG4Zc7220aSmeLjdLBOyubSE1EVwXhZUoBVHT5leO+UaqGIux
	Gkilm/Ybo36nX9BIyUxHw+TaauyAoc4MMAOxCz+sc2CXfMCS0+sMrEUjIamsGsWXsaf8rTiVIM7
	cZEfIE7d8ax6mYRucFtb1Hv2qoeDYpxWVmqbhhecRmS1m/mwSoAFi4swsSzbxjhhIkFiY=
X-Received: by 2002:a05:600c:190b:b0:495:4d35:5eab with SMTP id 5b1f17b1804b1-4954d5a2d76mr217568305e9.24.1784704784027;
        Wed, 22 Jul 2026 00:19:44 -0700 (PDT)
Message-ID: <09e5a478-6337-480b-bd5f-f4d4e11e9861@gmail.com>
Date: Wed, 22 Jul 2026 09:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from
 I/O port mapping
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
 <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1784704784-1ACDF9EA-3E12EA9D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1966



On 6/30/26 3:54 PM, Jan Beulich wrote:
> Rather than granting permissions when mapping (an operation that DM-s are
> allowed to carry out, while they can't invoke ioport-permission), check
> whether permissions actually were granted when adding a mapping. This then
> also allows relaxing the necessary locking.
> 
> While no longer granting permissions upon mapping is "only" at risk of
> breaking guests, no longer revoking permissions upon unmapping strictly
> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
> else a security issue would arise. In-tree code already does so.
> 
> While there switch to using %pd in the two log messages.
> 
> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
> I/O ports look to be treated equally.
> 
> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
> region special in any way? Clearly this can't work from a stubdom.
> ---
> v3: Further extend ChangeLog entry.
> v2: Avoid double evaluation of "add". Add ChangeLog entry.
> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,11 @@ The format is based on [Keep a Changelog
>   ## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
>   ### Changed
> + - On x86:
> +   - XEN_DOMCTL_ioport_mapping no longer implicitly grants or revokes
> +     permissions for the port range in question.
> +     XEN_DOMCTL_ioport_permission now needs invoking up front /
> +     afterwards.
>   
>   ### Added
>  
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

