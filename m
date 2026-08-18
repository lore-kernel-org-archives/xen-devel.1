Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BFEC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:49:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393476.1632287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDd0-0003nm-SO; Tue, 18 Aug 2026 06:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393476.1632287; Tue, 18 Aug 2026 06:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDd0-0003nf-PH; Tue, 18 Aug 2026 06:48:54 +0000
Received: by outflank-mailman (input) for mailman id 1393476;
 Tue, 18 Aug 2026 06:48:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwDcz-0003nZ-W8
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:48:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwDcy-007wxv-Qk
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:48:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84004b-2eae-0a2a0a5409dd-0a2a450cac0e-42
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:48:52 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a840054-f479-0a2a450c0019-d155dd2be171-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:48:52 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so3700666f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 23:48:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783d1sm9741189f8f.25.2026.08.17.23.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 23:48:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787035732; x=1787640532; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xx1Wdt2gxZFYTf9eirquKL7iCA2KvE+DVau7VDFh+X4=;
        b=UX/u5bf/fn4eTEwBOeT6V092U8s8THaki6U18lM8zhURKzbqGwMWGFeqXNjKtd1C+/
         yHGMHaHrTQv1roWsAlYrzcp/RYBKm+tDb8/UXynxK0Ya0MTwXa/Spy6tp8jcf9+c1SRI
         VrnUMHAyh3Ri3y1KBS+GNlG6/S/HJE3MQqswtX4WSKzXtQvfyE2tJXlGTyVKCwguFjNF
         SZhQfaJg68+kV5Ri0jqeakbWCVtE/KlFt5IOBnkHtkw2lyht3SNL49GzmdJM7XAVl5KU
         eWwNQZJpSzaBsxbqv1ug46QuJ/dJ5hp1HaKUxnTIvMNmuBSjVTrEKvp/EpALbYYpop+Z
         PXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787035732; x=1787640532;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xx1Wdt2gxZFYTf9eirquKL7iCA2KvE+DVau7VDFh+X4=;
        b=k1UERO+uX6e+FavO8R0b9XWQ0MZg5a2OXLIN5qT/86u56wO+TmMuB6JQbbRz8fDm2o
         EmdIyS/ZoX4RZSXgpFfaz2TEQ2t7NI1CAzgAQGofeSKeziFbaYboTcpk2g6iwKJ0yaaR
         x7QUUmZwXRP/4TZi3vlyR9MvFpPtdu2QfEbGrLwhKduikxjDemiY0zhMJ/68iDFzcjwi
         sXRXD3WdSRmYM7rxwglNTWew1I6E/ZFanOVDrfo3GHggz8L3QkpjVcOyRF+c05SuhAfN
         dReXVB/k260968fG3gkZ++Qwg6kEXTti58C0mjWINrIX6qT6hbkZxeFrkOWz3alYqRJW
         WL1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpWExInshsTS784ws7itVtdEDoodkjK2DvlRM0jpon62RptIX9L4dniRM7fN2e4bHRjcOlDgsbhyGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZalNhevz98nrnjS5UZiHS+hjDkeslpJamcmVAQlRLh3oCReic
	kHfiFGyNoztKkhklIctcbyX6nDZG7guB6bIodgrrZCsX0BarixLeJD5addItMpRaiw==
X-Gm-Gg: AR+sD10Pgq3f7M7me62kGqtpbILo0oos2PIErTi65hP1T5gOPi0/wh09gwfbz4a2qJ2
	pwgwx9MW5SMEQwoTc64kSUsK4vYbQ2lzdHv8CcEGyu6Yo0f48mIf+5RmJn2TNVfGQ+QslopfBCJ
	4E1bSpy1ubfAmrs5zhG518TnRgR4Yl9LMfD0eGaAeOGkknfbM9DbF4aQh+1p2SRCXwz6B8iUCat
	yn/8M2ozzzAvDuH/MLS+/3shLGmZzgkxaD6KpoKfVlljfwjixGC14OdmGZZg4dtJlUxbSj2L+TR
	wdEl0i4gI54VKl7ysyQhow/tkakc/JNEMIeeY4Sih6CYCY/v2GaKB11t+41F1ARH0/q0OcxI9Cc
	J9no9llxZxHIYmQGb1ZVpglt9SZuCHPbD5WpXoFDHYgIGLbsfVJmGhRQBH2OQjDohyBqpAQ9T9G
	rpi2aqF2ZM5VqTXwOCddysou5E1hli8liSYhECmyCvOZ733+qVZI18UzYIiCt7A0jwEX+vrD7FM
	ykcpPQYbHInQcaBGLSLUY5Cs4eadLxzS2NnqgsRI18sPaIhKjSX
X-Received: by 2002:a05:6000:46c8:b0:482:552f:ef68 with SMTP id ffacd0b85a97d-482552fef9bmr31887304f8f.19.1787035732210;
        Mon, 17 Aug 2026 23:48:52 -0700 (PDT)
Message-ID: <d0b7d31d-f824-46ec-a085-84c01fd4f1b1@suse.com>
Date: Tue, 18 Aug 2026 08:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/sched: fix crashes when vcpu creation fails
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260818063259.18733-1-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1787035732-5113AA5B-72496303/0/0
X-purgate-type: clean
X-purgate-size: 388

On 18.08.2026 08:32, Furkan Caliskan wrote:
> Furkan Caliskan (2):
>   xen/sched: core: skip missing vcpu slots in sched_move_domain()
>   xen/sched: core: kill unarmed timers on sched_init_vcpu() failure
> 
>  xen/common/sched/core.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Just one formal remark: Both patches look to be in want of Fixes: tags.

Jan

