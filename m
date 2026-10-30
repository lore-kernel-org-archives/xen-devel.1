Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4000606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 03:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfFyyJu9
Received: from list by lists.xenproject.org with outflank-mailman.1465396.1675978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMdVS-0005ch-Lg; Fri, 30 Oct 2026 03:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465396.1675978; Fri, 30 Oct 2026 03:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMdVS-0005cZ-Gg; Fri, 30 Oct 2026 03:42:18 +0000
Received: by outflank-mailman (input) for mailman id 1465396;
 Fri, 30 Oct 2026 03:42:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <visitorckw@gmail.com>) id 1xMdVR-0005cT-NF
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 03:42:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMdVQ-00G6oN-Sp
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 04:42:16 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6ae411cd-e002-0a2a0a5209dd-0a2a4502d5a2-40
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 04:42:16 +0100
Received: from [74.125.82.176] (helo=mail-dy1-f176.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6ae41217-6ca4-0a2a45020019-4a7d52b0d474-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 04:42:16 +0100
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-35c76e9614aso508268eec.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 20:42:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:2039:4:738d:5089:c912:2b72])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a42a61a0csm3456804eec.22.2026.10.29.20.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 20:42:13 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793331735; x=1793936535; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PcaN2VMoTk4jjrAkI7QtTwmvCihb0JhvG2tPXWeOx0=;
        b=lfFyyJu91lsh0AxQo2xWVSSyA7sbgDxs/I7jjOUDxiVmxKwthsKnEoXOcDjE3v9BQ2
         Qeby/qYHcTsNHSsEY0yTjqOx584GRTRCHR8yM/C+WQM97GdvrTHfBpVCOmbv7QvmoGlB
         yr+ZUdatU0F+dU4sD4vqUi00pHZocPW2Z+x5tTFphMV9IwNGN1FuyvMoadYNfd0Ed2GF
         r3BgzhrgZhY15bygHi2cHcABpDYqHs8cBCS9w0WZNbVdr+n37M6Ig4jTHNErunR84XwC
         I89NbKPax28nctErWb2IhqDJnzpljjcQ78FNO/4Lvrdml44AxbSSPIZSb8VdUsIIX+G3
         nBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793331735; x=1793936535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PcaN2VMoTk4jjrAkI7QtTwmvCihb0JhvG2tPXWeOx0=;
        b=SoFd96eoqz0b/TKSgjj+UdIPPx+dlnjE+hGzK3rtIIJbiKbpemG1W3HSP3DUs61YT9
         HaBpl0G4fopRy2p/PSk1xnfiB5RIKybnNbYRfEfY65GzID7ta3Xpr6AaVNOMrfMCydIl
         XzERWchDn3eyhI9HoWsky9ZTC1tdZNGj0TltHabRvee1pnk+KXLQfvLh1JP4SpGCrvsT
         cyZXEKR3GG4Ej6wQpnA0tQBtgNZi5dC0dyxQMjhHGjOdKt6956P9N/qlG6ePAEj15//F
         M8LggThdYKQ6aljyYXPHRuQjRh/Tr9EKBwXzlet7U4HtqJww+KCzgH83O89UWLHlbYaB
         FLmw==
X-Gm-Message-State: AFq9FYLzBbhkn8gYU9xPpggPz34XdHkqw4wRHDzPwgoKlihrj5oNOG3b
	wMN/shoVdYvXPeoid3ElektP04oXZJkFEGt/Z7COyyoH7FRnBvKaTwJn
X-Gm-Gg: AYBFou35YscuPWpEZvn/2mycZh04kt8hoPrrpLotL3CZgvLo9Wbhkk2xSUFr1/SBu0v
	L12EUaWxHhjeH/thhJobZZF0A3b6mmCSe9v8wUWOis/LwtZTHIX0aDdTtTFfqRLXa5ZzprNneN1
	Pd8H/LbTYhWNSkBDlMWsbm+wtcIi6rcjC04kUp7MwZr5YhvcQoMa9PZjasea6DrP3diZaLM9j+t
	IIqu4feSxdc4lM7vEAjn+bgZtGMsPHk7s6NCjrHrDNNTIti6IXqwPJIfLNf5yyMUIpQFdAQb6tR
	K0WUo9TMTMD6U1Y0lh8fQ23P3U8hJbW8CwEfpNlqE0Avpvc12vtB28uTWHP7ZGeHNzLAUby7GXI
	ZT5G0WW2Le86+ujjMe3LmHpbd6OXai/Lb6VHF6s6s+Y86i975vtLQYrQ3rBb2M5gd/r6O/nIElH
	2gV9Y31v22tXWF6tiCpHC749o+5Pxcfud49AAkM7z2dhgSsl3ewCQ0SVRjNQ+lHeOyd1ODkBgLe
	zSO6p+FbDtAgIZOYGa4F6M3BpTwWaZ06dK4vadXaGs3vOnbwHCfuGmWHT075z4GTxFuCwpJRz59
	5dUkSaDRaURxMLQpAFPXZRixqkjN4vfrwUk3Nu/W7rFewnCZpeIjzo+rBvPk8yh/2zVQcAVLMQE
	TBjvb/4e1Jg==
X-Received: by 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr1902055eec.3.1793331734454;
        Thu, 29 Oct 2026 20:42:14 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:42:10 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/dt: Don't advertise Xen static-heap region to hwdom
Message-ID: <auQSEsdNOCjL53Y6@google.com>
References: <20261029104305.169036-1-michal.orzel@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029104305.169036-1-michal.orzel@amd.com>
X-purgate-ID: tlsNG-720697/1793331736-66EB32AC-77036E61/0/0
X-purgate-type: clean
X-purgate-size: 1938
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 11:43:05AM +0100, Michal Orzel wrote:
> bootinfo.reserved_mem is used to store different types of memory that
> Xen considers as reserved: domU static mem, normal /reserved-memory,
> FDT memreserve and Xen static heap. make_memory_node(), invoked during
> FDT generation for a hwdom for reserved memory, only skips the domU
> static memory and FDT memreserve. This results in advertising Xen static
> heap (if used) to a hwdom as /memory. This memory is not mapped in P2M
> and guest attempt to access it fails. Interestingly, if the
> /reserved-memory node is placed after /chosen, there is no problem because
> of the check at the beginning of make_memory_node() that finds the first
> memory range using the correct type.
> 
> Fixes: 4596329291f5 ("docs, xen/arm: Introduce static heap memory")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

I guess git will treat this as conflicting with my dt patch when
applying. Let me know if this gets merged first and you would like me
to rebase and resend.

Regards,
Kuan-Wei

> ---
>  xen/common/device-tree/domain-build.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index 30a59abfa722..634a26946c24 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -541,8 +541,7 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
>          u64 start = mem->bank[i].start;
>          u64 size = mem->bank[i].size;
>  
> -        if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
> -             (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
> +        if ( mem->bank[i].type != MEMBANK_DEFAULT )
>              continue;
>  
>          nr_cells += reg_size;
> -- 
> 2.43.0
> 
> 
> 

