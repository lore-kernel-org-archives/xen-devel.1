Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24F1CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:34:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445996.1661902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBUF-0008Jy-Qi; Mon, 12 Oct 2026 08:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445996.1661902; Mon, 12 Oct 2026 08:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBUF-0008Jr-Nj; Mon, 12 Oct 2026 08:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1445996;
 Mon, 12 Oct 2026 08:34:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBUE-0008Jl-5w
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBUC-00DprD-S8
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:34:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9b8a-e002-0a2a0a5209dd-0a2a4501e37e-34
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:34:20 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9b8c-5984-0a2a45010019-d1558029bc36-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:34:20 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a171b677d2so9103405e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:34:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19303d4a8sm111092365e9.2.2026.10.12.01.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:34:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791794060; x=1792398860; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKrzVRURgsqxMnlxn6tsEXwvnxfCko5owfMEa5IQtSM=;
        b=WKNMrZP4HUVxJpu9IvKSALDwIVnoZdjTXc9rSwqGlKovUemz7psFvJq+dI/MNJzK34
         voNYZ9BUWz2ou0PXgDWLcyg+Qu1DRpBAWJZ0996FZiCOJp176lZcFNek+Ct9KVCcB2MG
         A8vXpgLX9k8GJliWXZK3RgJjgwd+9IAdjrHRqXAe4mNjJyWjH/HCPasEAdCOQ+Z6SlPK
         enR6tZxYhGWC3DTugimFF6U3XER6XsmCkFIjkVkYxcj8Fyv75m+mRoFd01pIpKOkT+hK
         cYYW8L+Dt8fiJWUH5Fby34q2k/UA8D95cvJzJvxyji1jrBrf0sFXhAa1HbTUg5Oa/pHe
         zwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794060; x=1792398860;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKrzVRURgsqxMnlxn6tsEXwvnxfCko5owfMEa5IQtSM=;
        b=C99LyeVIIaYj+fnylSYjljA+18krX6cPEYuyWrgvIf5V3tp8PZTUvowUNOHTuh6f/H
         IJdKlxM6wXjc3Z9xDnPewsrd28Bc66A0PTIDNHlmXFTw7YiV8SgR3irQsk44GrP6/uaK
         YdH9UkXt8lE0mqrmqf9hBdzclf65lkwR7+yLnqghKBX3NvuImKX8mNHxK5OMU4NlWNkQ
         DxWvk5yqLLtl/lgwJIHNefYt9JwMPvHbE5jAe6qHiHwWAKqcPJRWw3N+iQD5Ee7HRHMu
         KPw/2ISkV68M7P/r0b42Nd3kds/hEqJhPUI1NsEZna2qclvkPsIxuJQxx4yq1nTFIwKI
         UR6A==
X-Gm-Message-State: AFq9FYLv6CqVS2VEcO0VHvNAWABZk0MJNFo5RgOT6FPTlyyOli7dQTr4
	fVug8TMe2TYcygwmWjPleAfmSxRBKcSevZRwemY7GWgXY+8wYkAcfwTZSGAyvak1vq0GptclBRB
	q1XKeBg==
X-Gm-Gg: AYBFou1BUOE2W0evuiw8wsInD5sDmBVJO3UrNqYoS3FwNppp9czNdGb8eqDqs14POxL
	kj/OknFjGfbV6YQEJ2GKAl2vovryYQbuxnR9FYAVAKX0voUvEwHNt3k0ky/8yVJ3W2GS+R7THBA
	F5fuptZG6BeT0FV86tJTbhhBai4tXpkOtUT8wDcBiejkHvfiiY4cKICbGIYDzb9zQtiQc3Zuphu
	mngZxv8XXssRp2f/VmAYsgE5MxwkeP7zPLXkP4Lsj0wHgqMkPfK+e9DO7cFqTQIFQpVeYENkrXV
	RWhtbi8TeiATHrMewEQiDMYtMi87vEyhpsz2/V0FqyWr3T3BG0nSGERYIDjtUHciWQ6Yl+xyqmb
	FvD2SUGhpUocDgdbKuie0FvnmF33TfYIv7HNJpKYRgQ6sS6AOha3PDdW7cfkX1hSIGzZHDHJc5S
	c5ZbLOGC+JPGL56nErvnorVuiZ3SB4X2owFUhmkOsWX2MJqhAtj5+FFOCMJZNpl1iQOnymQowFx
	0uxoTo06DOh0CK/lc1sbhl3xywXc82d6zirCE784buViKJ+eo+IjYOOOFWQ21AG3AqJCN57
X-Received: by 2002:a05:600c:e557:20b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a18e4bff94mr103407215e9.25.1791794060036;
        Mon, 12 Oct 2026 01:34:20 -0700 (PDT)
Message-ID: <56cdf5c7-2a2f-4d46-91ed-ba0a361ea649@suse.com>
Date: Mon, 12 Oct 2026 10:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cannot boot PVH dom0 with big initrd
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <aY6iVr990vWeO2p5@mail-itl>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <aY6iVr990vWeO2p5@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1791794060-BEA66757-44AAA372/10/78276251493
X-purgate-type: spam
X-purgate-size: 1446

On 13.02.2026 05:02, Marek Marczykowski-Górecki wrote:
> After fixing the xhci crash, I hit another issue - booting with 236MB
> initrd doesn't work, I get:
> 
>     (XEN) [    3.151856] *** Building a PVH Dom0 ***
>     ...
>     (XEN) [    3.593940] Unable to allocate memory with order 0!
>     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
>     (XEN) [    3.599884] 
>     (XEN) [    3.602482] ****************************************
>     (XEN) [    3.605272] Panic on CPU 0:
>     (XEN) [    3.607928] Could not construct d0
>     (XEN) [    3.610692] ****************************************
>     (XEN) [    3.613463] 
>     (XEN) [    3.616035] Reboot in five seconds...
>     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
> 
> Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f2899781755762f565
> 
> If I skip initrd, then it boots just fine (but dom0 is not happy about
> that). 164MB initrd failed too, but 13MB started ok.
> Just in case, I tried skipping XHCI console, but it didn't change
> anything.

You may want to give [1] a try, minimally up to patch 11 (patches 01
and 02 are unrelated, so could be omitted as well).

> Interestingly, this appear to have worked on Xen 4.19.3.

If so, then - judging from the changes which needed making - only out of
luck.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-10/msg00491.html

