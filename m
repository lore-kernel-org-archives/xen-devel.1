Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE612606A327
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Zr+4CBtF
Received: from list by lists.xenproject.org with outflank-mailman.1465539.1676056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMjtW-0004Tl-Q9; Fri, 30 Oct 2026 10:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465539.1676056; Fri, 30 Oct 2026 10:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMjtW-0004Te-N1; Fri, 30 Oct 2026 10:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1465539;
 Fri, 30 Oct 2026 10:31:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMjtV-0004TY-4n
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 10:31:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMjtU-002Xxc-HJ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 11:31:32 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae47203-bab6-0a2a0a5309dd-0a2a4501912a-10
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 11:31:32 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae471fc-5984-0a2a45010019-d155802de1b6-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 11:31:24 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a7992e2f7dso5057805e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 03:31:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa813d2950sm126960505e9.8.2026.10.30.03.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 03:31:23 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793356284; x=1793961084; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deRLmB/n79/Yd5s8hISompFCxEi2gPTUo3fHtmadflo=;
        b=Zr+4CBtFX0117q/Z/hQBgtuhFNZ5GRaDw+naBk/L8urSav2R+SPljGDWkGnpLCY27G
         /2cjUaOoiwJV73sl1deu+1tz7uK60YGn2XxsnOP23IT1nYVJr/wMinCfh/QNMCt/udU7
         r8jZh4s96JHbQiLF16Zc4Rzv4oksxteluHunipCRFntFytcMSVcSKt8XWKP6n74l+PwW
         +JFHX53UaRp8mXm6Ad0GpEcHggNnH4v1tExRC697ejjdU6tNyz3wabeJlWlI8Ayprflk
         //Y0UUQaC51yJoDWB69o526WLIlX+DY1ZQFjf2015cX4zTY1s9XzYqEmxQW2WWHDshgx
         kxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356284; x=1793961084;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deRLmB/n79/Yd5s8hISompFCxEi2gPTUo3fHtmadflo=;
        b=2QHV6kDdD6g2+uXTL5FjOXB1DuYcsF2bM9T7oiP/0rV+gYCvMCNeFd9+Y0ib5J62GX
         Kuz8XUyudheCCje5U+ceKxn6if5zStefSHrsiL5lQKNlsjmxKSMDZFJciri3SEuLyNVd
         UT5m6A6wZvW9TqM9m0vyJJX9kFJL3SfZ249AAxiBIgNMCIH48cKJN1Rn16p/YIk0Chxu
         +BNkdOM9wNeNmDgMh9mUH6qZ9MomceiwCLMsFGscy7c4uE4IyyY8mLUK4VLWbYzY89xv
         LIDn30h05+sTSySnwCU9TwpedXDRfz/EsDwxGnoYqa9a3xgQQlr6pOQ53L+GSOnKo8gm
         rJwQ==
X-Gm-Message-State: AFq9FYIPuXp7KIuBJdt5jVfaoCss4ldSX8KNgtvCjcoEQfQUUhTRPEft
	wObitD7EcbmmX+QlJTrcHKofeClQi7iGnlt1hDxLa3+n1X/YPBsJNXdKBY4fw+gTqhDbwnB+dRD
	bQaRpfQ==
X-Gm-Gg: AYBFou2ks7+ht7utGgAb1r0Ryg++gEdox0dyRI63f1Zi+NmaiqbspQFC0ZzhWxendKK
	oilCZBzkAsbF2yhXgqdmBiu5rN/puoqV4cjbwFav/1yvtLL66DKTnFlulDIWwpuqBgWpl7ivB76
	pK42Uyeh8U0H9ROkVjaRQbHPGpqNy0/nK8XvMC10Pt+cWLzbc4BELxfyJNbx0T6ebKNIDcabtEz
	hGwkLLg22Zabbj0uQBzvJH1QXQ/Cf7zac38k++4j0jICjXrpjpelJBQy6c3nZoiVqTsbws7S/GF
	QImqVIaNDMwatMg6UrKiPTGwlllXH1zVDoQEPi7+Mqa+kRGSuO1frMjwwBCkus2VzlG6VFX/kXj
	h9DYTfgimNY6XDO44RG91GnIwvTIQNN/1vW409/US7yCYgma+zM8K0LGpZ9x7D/CzqIBfx+zQZi
	a4Xo5dMTqResdBVq7c1SqPiI/9myaHkBxBGkHPeKwpBOV0ura3vzQ7bbe8qOIkU54a2ew+GhB8+
	bhSrA1VoGiwYS0sEUZJbPqFbxCOjyXyu58Yi7Pw6rFyv/JSNlrxz4ASuf51tAilMfmcmoSWjfIh
	S6utVGXA1qyTd2Pcb5/CBUDEWj+HyniHrvc8MJTqXBPMQ3dsyRlvn5pmzDLxcMJg7tg4b1eJ2QW
	v4Rw9Jqnin7jd1EEx
X-Received: by 2002:a05:600c:6214:b0:4a2:9cda:57cb with SMTP id 5b1f17b1804b1-4ac151a9077mr42569745e9.1.1793356284018;
        Fri, 30 Oct 2026 03:31:24 -0700 (PDT)
Message-ID: <7028568e-8b24-417e-9fe8-f0a4d4f8b0a6@suse.com>
Date: Fri, 30 Oct 2026 11:31:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] Introduce dynamic tracer using Livepatch
To: Ryo Takakura <takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793356284-C5146757-2B58B600/10/78276251493
X-purgate-type: spam
X-purgate-size: 1883
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23.10.2026 06:48, Ryo Takakura wrote:
> Ryo Takakura (5):
>   xen/arm64: livepatch: enable attaching callbacks
>   xen/livepatch: Allow tracers to schedule livepatch
>   xen/tracing: prepare a livepatch payload and its controling interface
>   xen/tracing: Add a function tracer
>   xen/x86: livepatch: enable attaching callbacks
> 
>  xen/arch/arm/Kconfig                  |  13 +
>  xen/arch/arm/arch.mk                  |   3 +
>  xen/arch/arm/arm64/Makefile           |   1 +
>  xen/arch/arm/arm64/insn.c             |   5 +
>  xen/arch/arm/arm64/livepatch-asm.S    |  68 +++
>  xen/arch/arm/arm64/livepatch.c        |  39 ++
>  xen/arch/arm/include/asm/arm64/insn.h |   1 +
>  xen/arch/arm/xen.lds.S                |   5 +
>  xen/arch/x86/Kconfig                  |  13 +
>  xen/arch/x86/Makefile                 |   1 +
>  xen/arch/x86/arch.mk                  |   3 +
>  xen/arch/x86/livepatch-asm.S          |  60 +++
>  xen/arch/x86/livepatch.c              |  33 ++
>  xen/arch/x86/xen.lds.S                |   5 +
>  xen/common/Kconfig                    |  12 +
>  xen/common/Makefile                   |   6 +
>  xen/common/function_trace.c           | 274 ++++++++++
>  xen/common/hypfs_trace.c              | 743 ++++++++++++++++++++++++++
>  xen/common/livepatch.c                | 137 ++++-
>  xen/include/xen/hypfs_trace.h         |  42 ++
>  xen/include/xen/livepatch.h           |  14 +
>  xen/include/xen/livepatch_payload.h   |   7 +-
>  22 files changed, 1478 insertions(+), 7 deletions(-)
>  create mode 100644 xen/arch/arm/arm64/livepatch-asm.S
>  create mode 100644 xen/arch/x86/livepatch-asm.S
>  create mode 100644 xen/common/function_trace.c
>  create mode 100644 xen/common/hypfs_trace.c
>  create mode 100644 xen/include/xen/hypfs_trace.h

Nit: Dashes in favor of underscores please in new files' names.

Jan

