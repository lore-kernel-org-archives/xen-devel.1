Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B22C531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:18:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371505.1618991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIPY-0005p9-0K; Mon, 27 Jul 2026 10:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371505.1618991; Mon, 27 Jul 2026 10:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIPX-0005p2-Ts; Mon, 27 Jul 2026 10:18:15 +0000
Received: by outflank-mailman (input) for mailman id 1371505;
 Mon, 27 Jul 2026 10:18:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIPX-0005ow-2H
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:18:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIPV-0014YU-W5
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:18:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a67305f-5cb7-0a2a0a5109dd-0a2a450bce78-18
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:18:13 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673065-b7e8-0a2a450b0019-d155802be487-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:18:13 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso16997825e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:18:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f9ae5c3sm307607475e9.3.2026.07.27.03.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:18:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785147493; x=1785752293; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f0XNwtTTak4FmqNHzfb96PDYay5Kpx+jXWx6lZvUsxE=;
        b=MI+8liniAaHtrqy8Xl4HIsW8tXT6xJ3rGMZYkc769Q3tBxFltj3L/b46I2pNvE5N6q
         suwooWW8NYkNU+7cM6xjZuKsCeDSnn4EWeutcc2ob0zlDMo09uoLTSrzZ3hiYZNEXbdw
         yJSYsTtn6PLAmFQ8UKmXNKuWClaJOMB0sYox6mrD7bq9y+alsl7ubTMK7yQ753xzxm3s
         dN2fvYCdDF/7u/lHpN9m7tbDicJcHkQVqyUWTHv9qv/V8wQVctKOcG3JYxGh01y0Aa6C
         9qTWhF9KMmPWXRP4lh7+rMIt0QXctLqpOBTTJDluSiJbhHHfPNnlK+U5x4f2XvV5GY0W
         aq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147493; x=1785752293;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0XNwtTTak4FmqNHzfb96PDYay5Kpx+jXWx6lZvUsxE=;
        b=qv4j1hO/3pWt9KpgJdSZKLVrjwLL28WWWyq0Vhz3LCTq0ckB+GBz+LUity87xSe7dz
         lwEke2VayPPsdJlwnqnK2LHKSMOhmUpsZakXkAy8pQSPiwxxVt89cRrcunTBudlJIzPB
         w1ADP33K3VaJgZsq/BUIERNvsdXHP2idrku1ySb7W6rkthutQOwSuAS+fkqnlejVerpo
         EUmX83COPCY8vKZKlqLelSAaQWtOXmJJ7qBgcmr4EfKIMhbUSKQx355vdxjNIP6RcDGc
         j53Sfbr0cmebhEwr0B0A7MKvDd/IUNd7ysMjc2+KZQfRmjwRTZpoj6e0abI7CH9bwjX4
         0DrA==
X-Gm-Message-State: AOJu0YwzP/eEAuWqCbm5K02AsZBbqsAbqaPCfY9SZ2KhGXu3D7Le1cbX
	nwJTpu+wd/y49fWkT24N6LPaxzugSWtgBUKheN6fiBA3tGOVLb+TEljvUEATC/lrCaXyPUDrrOF
	aSzt0PA==
X-Gm-Gg: AR+sD11Y79wZwo4SJd1uGxhzHPj3XgKgvTbGloSZW5qQGjSSwBWIzDj+PiQRgs1fNyy
	26jX2+otNOnHmMsJFxTrdz/lVIAaUWje15VurWpoNKt3AXC7LpI5ka06AqpNwf37mvItn41bJTQ
	SwlWRK9AQdNBzmhGSkM1VCJwdnO6pyMQd55gZq/oQGliLm4iqjTjFjZ5GonUlAOL3xuz2LpfXlI
	xU8zXxVKrpOnVYTalbH8feW3tTWghB1oscTvmO8vtZmmKpo/JbgKff4siwreKS0tmSIMi/oDlx5
	ZqWEGIHpcZncBgVis6vPz/ymvSefEb8nlEz6CzBZgM1YH51tnS4YthvTldnyFykeEPHZ5ZoLdLI
	J6bIZZG+S4FjhMT+/q2YaLaYluqxmGkjARaEDggj9APVqF1Ro2b8wRed7nvhkGwZrKzmprpfYqy
	r6pW4VOwsVFepNIJeVyC6BwO1Z/8yZX+kABKRI7NNShvd9s0onPym/lB08qD6SU2QEOQ==
X-Received: by 2002:a05:600c:3b86:b0:495:665d:75df with SMTP id 5b1f17b1804b1-496b5719f90mr108197575e9.23.1785147493153;
        Mon, 27 Jul 2026 03:18:13 -0700 (PDT)
Message-ID: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
Date: Mon, 27 Jul 2026 12:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86: "brk" allocator
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785147493-1BAD09EA-D052D060/0/0
X-purgate-type: clean
X-purgate-size: 545

Derive for our purposes something similar to what Linux has been having for
a long while.

v2 is merely a re-base, mainly targeted at reminding people that this series
is still pending review.

1: x86: introduce "brk" allocator
2: x86/EFI: replace ebmalloc()
3: xhci-dbc: use brk_alloc()

To reduce padding holes, .bss.page_aligned and per-CPU data may want moving
immediately ahead of __brk_start[]. Albeit then the tail of per-CPU data will
all be padding space; sadly the TSS wants/needs page-aligning for XPTI
purposes.

Jan

