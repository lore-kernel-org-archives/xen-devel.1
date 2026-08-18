Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55F4C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 14:08:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394216.1633045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKU4-00051x-Ie; Tue, 18 Aug 2026 14:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394216.1633045; Tue, 18 Aug 2026 14:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKU4-00051q-FH; Tue, 18 Aug 2026 14:08:08 +0000
Received: by outflank-mailman (input) for mailman id 1394216;
 Tue, 18 Aug 2026 14:08:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwKU3-00051k-Ue
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:08:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwKU3-009Ia6-3E
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 16:08:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a846740-2eae-0a2a0a5409dd-0a2a4508aa6c-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:08:06 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a846746-f659-0a2a45080019-d155802fd571-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:08:06 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so45570565e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 07:08:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b2a176sm354293485e9.4.2026.08.18.07.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 07:08:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1787062086; x=1787666886; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEVtHaDdO9l8Kuslq6ElT4hhldlh7ZpnF3AWC38WmGg=;
        b=adSjjZQL2t/8CPRrkh0+puvNGZffkqUsRizqDNRXrWsEZ55Y9tGVBmLw79hCuwRIc0
         4NJXKwfbBNwF9C3jTx2HZNGs6Gajz1v/gFMeuHnlOtafeUNc9hrLO5o9XyHG477d+H9J
         Qt+WpVesWeYx2WGVcHFMPOuq9bbkw68rX2GNpYHiq8psJocaHmdZexI1bFl8iYSvzl8B
         VCXm5SvE+pdxxxtMY9BszWG61ZJLZq5x/EeSDWxk+w+EbSci62wha6+Z+6vNPFtr1mwY
         tVXLcWsKykrD2ROCSUk5GDweAQwRntDeXqmmjxsuqB0j8xMnN8Pnyya6rinUJa5hZdmo
         Bf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787062086; x=1787666886;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEVtHaDdO9l8Kuslq6ElT4hhldlh7ZpnF3AWC38WmGg=;
        b=QHs448mUo17pMrdHMVi8SvY0yUbPtJkNDhowLGJbATPsCMFoCxIG/aanTw4NdD7rXF
         yDhRlb2tyyPErXh0tirwc1uP80PdBjQCVXUaBo51pLi4Sq0EpljgcT8lbRux7OqqK8yH
         n+L7W6Q9Ca3gARQO3lDlhBHNwYzPoObHNFwA4CxN8Rb/ryBphSv9goExe5cGjQy1swTr
         mXuxmxgUSWh8rw3HGgK7n6I2Wh3z/YScBZLwR9texh5JTdY45YGcucPXPJA/p0rv8LqY
         JhQTbP5l55Ub4oIByh+1CdEEnLV75xpRp5F/B/5lH6I4Tguok0FKRAW6MlWys2nU/3TK
         eNWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXUc/n8eKsbU586Ys62JHSpqyexEqMhM+Epdq61N9L9YJbdg8u8qjJS6elxI/aPWLVccU2dovcQQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqH48RZc9phZXV+RiRIXwG8w7luQH6e8RLT86mPFFoE0qdIQmt
	XnzHpfxdicO2hgHwy1b1eu70e/Wfte1Hkv1rBiZQXFH0o/SxCusA8/56UiHZJAzNrQ==
X-Gm-Gg: AR+sD10eaz8tjS1SC0eJJ4YkHG4abD3nFu/ZzF07HZ2CkvG7RCCI8uNw+UREdU/QBIP
	bjvcdKDG8/gCyUb7Z+Jqd1AUqFmnab62goSsqvtQapfFM/lRBKJ35sf6l7Hs1lZ/wvHWQbINoeV
	fEQT74MeXsnL2YniMw4Woxm5aLPMl1ngqs6QbM2LA5r/fLRiG8tOFgvNd9a9zGnigC/xiICaVhx
	kYoaZNL0PD1MBWqBe8SpuDWt7jfSI7sOiKW/D5tXOmHdXjCdc9vbeZJ8uYpC+oiLAlaWIW28wMY
	aDuLyQ2gY9n8jjo6LbuxAU0Be+1JZLdeO7pa4RzMuL0ZDyVDxf4wrvJyNRbvzgH3eLpOT9o7C2h
	/k/tcnPdYUQPRDHdQljqnxrT8cCnONvjfbtIlIX2CLdxwvvk/lVf4uvxRxjQq9QlEADkmOl5+/g
	oBu0CpvNEy8x1zLc0NF4jVGUF763GxP6k3PP0V5ADhXaTZ0USYcFtk7tZ+a13uGQMkVWtYuxp8p
	xiIsxzwXUXYPB8VkPT1aAgllDlMc4JvK107LvzFy7Fcym6tUeth
X-Received: by 2002:a05:600c:1d0e:b0:495:7888:281c with SMTP id 5b1f17b1804b1-499878cd5bcmr485265185e9.0.1787062086458;
        Tue, 18 Aug 2026 07:08:06 -0700 (PDT)
Message-ID: <23816f6d-57eb-4567-b6da-93269e6a1c23@suse.com>
Date: Tue, 18 Aug 2026 16:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Support multiple ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
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
In-Reply-To: <20260420093820.825969-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787062086-D534D87B-7C5CBEC2/0/0
X-purgate-type: clean
X-purgate-size: 1459

On 20.04.2026 11:38, Julian Vetter wrote:
> Julian Vetter (3):
>   ioreq: switch ioreq page allocation to vmap
>   ioreq: Indent ioreq_server_alloc_mfn() body one level deeper
>   x86/ioreq: Extend ioreq server to support multiple ioreq pages
> 
>  xen/arch/x86/hvm/ioreq.c |  63 ++++++++++++++++---
>  xen/common/ioreq.c       | 127 ++++++++++++++++++++++++++-------------
>  xen/include/xen/ioreq.h  |  13 +++-
>  3 files changed, 151 insertions(+), 52 deletions(-)

For (future) reference, in case it wasn't said earlier:

To be able to test this, at least the last patch here will want to wait
until the apic_id == vcpu_id * 2 issue was addressed. Andrew said he'd pick
up Alejandro's work there, thus - once finished - permitting up to 255
vCPU-s (i.e. requiring 2 IOREQ pages).

Once (really: before) we grow the number of vCPU-s for HVM, we need to
revisit the amount of VA space set aside for vmap(). For many years we've
been adding new uses of vmap() without making sure its reserved range is
still adequately sized.

Since multi-page functionality added here will also need qemu changes, and
since we did determine (elsewhere) that ioreq_t needs to grow as well, it
remains to be decided whether the two changes wouldn't better be done
together, to keep the qemu backwards compatibility logic somewhat limited
in size / complexity. Anthony (in particular) - thoughts?

There may be more aspects which I forget.

Jan

