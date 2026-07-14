Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93614C43458
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2026 06:09:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362027.1614007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjWKC-0005GP-P9; Tue, 14 Jul 2026 06:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362027.1614007; Tue, 14 Jul 2026 06:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjWKC-0005GI-LN; Tue, 14 Jul 2026 06:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1362027;
 Tue, 14 Jul 2026 06:08:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjWKB-0005GC-Ig
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 06:08:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjWK9-00FxXW-78
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 08:08:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a55d266-5cb7-0a2a0a5109dd-0a2a4504eca6-4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 08:08:57 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a55d267-b1e5-0a2a45040019-d1558030b4d4-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 08:08:39 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso36083575e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 23:08:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2e77c2esm269267155e9.2.2026.07.13.23.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 23:08:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1784009319; x=1784614119; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4/KHBBQI5iS3VrM25O0/xUrlp9kYHI+wwEbVlZDuZ0=;
        b=fAfnCzA5AYzLwhRYa3qoEQf7FkQFaKuEngZND0MQLl3+GprE7KriT26bBG6bNDYjuo
         BLK9mFP78q3IRHKafG0e1J25XJE+qly7QAPIuiOI7hSlrAKXa8qjGWHGyWwweQIfXOKa
         YuN1M/RPYDe7mMbpJYuvRrUOe1hilXguY316OnNtYn4wJWuViMbrOx6Mb3uD2ZZTPJnv
         pxSCnBGrOj09MsDviz5dJgENRB4dqyrcZaf0ArXGuk9H0P5LOXlJVoRFc6/9dth2KOwU
         LejD3V0Pxn8MJVT0DKx/+Kwxu8/MIycb0VjSXYXGDtpur1tM0pEJheUoktmAXRyMpxvE
         hM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784009319; x=1784614119;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4/KHBBQI5iS3VrM25O0/xUrlp9kYHI+wwEbVlZDuZ0=;
        b=pv1sVvoGzDmeWJz8F0s0qDXtUSiln0YMvZ+WhDHmuu3J2hHmGwPahY7fVxik1Ohpw3
         p0o63tankX1HT2ySpC04VyYeJuwTR4CK8xRYlzzf1C5lmMaP0RpJsMr/+YVoUCmxUd1L
         K552S52DuyU8EdGISpdtsgtu7Xgt4YmCU9XP1TbPwC9TYmlhox03mes2br23xjhV3NWt
         jHJtkLR44jvTO6asfpjpCjxRUb+nLRJR+BGQ4Ssxv2l6jRxI8oGDiRzyfB0LoJnceWv7
         jDfy8ypXaMdq5xqV2C5x4N903G4k1X+kl9Ux5zJTj5PiSVM7J554KPQR0a1ODwYZXd82
         zUkg==
X-Forwarded-Encrypted: i=1; AHgh+RocgC2R7eVS14wUKNhIN4JwR9qt659YloiIxp8/PSYVJWL6G9gYP+0BW26HMmeCFVTuJjsCH8SdCzI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQ3EDQxpLXdZ/cnuuuj2p/X7hZlMFscmrquxJWbiLwVh7mpxNT
	9OeUIzE3HYiyAd5RyxuDXztAJUMOtLC6mDOHwIOg8tOZPJz4qtvcdss6NcaxqDEsLA==
X-Gm-Gg: AfdE7ckcrbAf0j9tCyhp+PnQXM9RjTd1pQ5cpQ7+Jd6v8n3v8Yv+NwP3X1NX59Qb1/U
	9HkkEo5jwxEvVm6WYPI8+bay+pU8/anoNRFHVGLrLd+V76eQFAoYWm3hO9HsoHMBHBrl/GhIpDn
	6GTsHXx0rYcWXq+mTwpvhXvb8kt3AvoFVhXyEivvoskSF/iT8bbWPlG0pPJdj4j/JEDhdBJG7gG
	IfqSaE47o+E57sbG7FImrBffC/mOc8bvgYG4U7bnduSJGCqGeOIx0PK1A22hjWy6Xh3ZniAyma0
	VbhAWDaOTsnr4gWXQ8yBE1CxTFuOCGwFEp3pP1o6bxKrDhrCUSF8mBIjkhA5pya87JWAZmlI8aM
	O9Vuf6jIXknn3IgJjlPrHJE9HWsngcT1cCgUCLiohANHPXDEqRnsnLhi2QWTr/y5DjwTlR0knEV
	TejDUmbSfqZKo6BlX3Ktn6lwlfalg2m7ORhMg6fIXDO3jpmYjnLqnPQz9gwecH/0H500j6ZnzyM
	n2Z
X-Received: by 2002:a05:600c:3e0f:b0:493:b8d9:f28b with SMTP id 5b1f17b1804b1-49538a02529mr8158395e9.23.1784009319428;
        Mon, 13 Jul 2026 23:08:39 -0700 (PDT)
Message-ID: <93763802-ae88-48ce-ac3f-2b0ab79b4431@suse.com>
Date: Tue, 14 Jul 2026 08:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] xen/console: promote conring{,_size} to
 __ro_after_init
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-2-dmukhin@ford.com>
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
In-Reply-To: <20260713181619.672176-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1784009320-6FD57FE7-2A980895/0/0
X-purgate-type: clean
X-purgate-size: 506

On 13.07.2026 20:16, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Both conring{,_size} should be RO after initialization is completed.
> 
> Change the conring integer parameters type to `unsigned int` as required
> by CODING_STYLE.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - rebased

With no changes, where did my A-b go (offered on v5 with the types adjusted)?

Jan

