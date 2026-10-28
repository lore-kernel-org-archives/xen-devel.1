Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE93606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MzsS3yhw
Received: from list by lists.xenproject.org with outflank-mailman.1462871.1673842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLxv6-0005tG-NE; Wed, 28 Oct 2026 07:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462871.1673842; Wed, 28 Oct 2026 07:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLxv6-0005t9-KU; Wed, 28 Oct 2026 07:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1462871;
 Wed, 28 Oct 2026 07:18:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLxv6-0005rc-0n
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 07:18:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLxv5-00Cfb3-3o
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:17:59 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1a193-e002-0a2a0a5209dd-0a2a4505ee1a-48
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:17:59 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1a1a6-4cb1-0a2a45050019-d155dd30ece5-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:17:59 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so507590f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 00:17:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb8d5sm28030129f8f.28.2026.10.28.00.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 00:17:58 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793171878; x=1793776678; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mk5WFW9eiHu8a4x/pXxrokyNBH9Wuvq6SjmaQiWU1dQ=;
        b=MzsS3yhwpgDT6kx5ynmHvGz1JqvAjIdQCvT0pDkHbDrykvJFpHGNEJ5qsz3dr8xFbb
         V6bPby5CUlt0wqE5MFwJogWnuDvVn+WCQhDtEpQy6b6jfOOKubpmuXkAEml1Fufjlwsv
         pzh17XS0BWvyo47+ca3uFRyg6MoJFIm5muGhwLi3rF3MzTWa6U+UzP5hbxL0EBILptlA
         W44lZEpuaNw7VMmPldd7sWdGG/VsHTkOb5WiFpVX8l/KiyDemlXxaeU/zxmT/PA3KYUp
         K02lMM0f5sOsNgTFWp+yEjBIxztugWid98IXwO+/HW2xEO5h+UDWN/dllmWKvBxbpZFD
         UdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171878; x=1793776678;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mk5WFW9eiHu8a4x/pXxrokyNBH9Wuvq6SjmaQiWU1dQ=;
        b=wP8ndkoU3sHNZJkScncfszHej1ycYwR2z3/dDsWg27Xx2hXI/Bk1EJ3WUJyEcKL0DM
         kQVluY+tgzgnZ1tJBjYlkkWH3fJN8KQ1oCgFR1cA5nfcqm/BjClHKZYytTcZ+4FT3he5
         oNlivLJL6CpKxfmfeRY0zfmjBQ9MLoXYh0yLSgFMD2hcK3lwWdlo+H5U0ReZhps/Z1b7
         DgjQoejjxt47fvafbLueSNZXdsCP/Zh8ZFjFkZgt/3Ru3apMXJgImcSinQqVU2Djq/iX
         7vtxO8n05mgthaBLM4Ob2MOFmsOGUJRhtioULNgLk5aL8dQdMyyQRNz7xV9E2pNXI5Y/
         pulw==
X-Forwarded-Encrypted: i=1; AKwUvBzfwRem30spVEWr9tXfd+vE/ZfCJdx7pUqN0gnfLKUjuE6k7cDfPsh7s9lZgwGJVdfCJFfelqevvLg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIC1S9Y+HRJxoT1Qu1ByeDWHvtCnlTamnK8F0std0CgfjwyBsG5
	76DwqdEVWoOQUqSrk/qWFP//LKSHICQwXiLDS4cDaFvetXtqTX9N/nPowFV1j4jW9w==
X-Gm-Gg: AYBFou3bHBz5ocCAilXBH+xt4MpVgjg9mYi9OB5WlVtU9EaXy0Y9Rb/nRbNUyLBBFBq
	B6dRjXgHVCAPus+ZsRE3SjIb3ixuIOp9cCeHlni2kC7hcXMLt6DTrtaRVivYi7zlnaHcRMYWxks
	W5atVJanJHqVlfqGF56ptYdwyfRK72inTrpU71sUsFOPOoawMqfx0ukmpX1PDFPbHdRcxonsd6c
	++xZtRA4aUnMPXhPExlVceTV+sLqOxu0SvbDrqDyBGgL9kL1VE1nUU9X2A8xDMRPiMSEzu1cWH2
	PtUzI6G9HXNjBztfnnJBoc0EZrUzKpJL2W+GxSRge+dRUKohb+ep6KuFuYPew6s87D/rEcmo5Su
	tuhh83cQ0YiTnq1abH7xbQx0NtQuhNn/9xI90DCFiQ/QVYCtl2cOcKT9n9crBaDxHg7dr9UiDZk
	2Z3TazTC5tM0+z83f1+h0ZdE7SdRtWvhGG8KEg9zo9PsXGat5tYYjI8bvkhSoRhD1qINvbd8/ex
	GNyY7S6LYLhU8qWHcu/CcdxJlnfsfkM4ZbxaYfTrrF5We+PNIXII7tFhT9MkZBcs6TyrmLJZ/Oq
	if+Prtj93KtuG4dlooiRT0OV49uFdLaA0vx+BTml6qBmUEU+PhYd6oe1/dDE8ifMKvErlmWu7UG
	tG98xsPqcBiNBUmmg8w==
X-Received: by 2002:a05:6000:26c7:b0:48b:108:48cf with SMTP id ffacd0b85a97d-48e5d45a4a0mr4281584f8f.25.1793171878454;
        Wed, 28 Oct 2026 00:17:58 -0700 (PDT)
Message-ID: <c06a30ae-9e74-413e-b4c8-7c7877907ed9@suse.com>
Date: Wed, 28 Oct 2026 08:17:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vcpu: Improve code generation for
 VCPUOP_register_runstate_memory_area
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261027201754.1307173-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261027201754.1307173-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793171879-F60AA2A1-2BD28BB7/10/78276251493
X-purgate-type: spam
X-purgate-size: 748
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 21:17, Andrew Cooper wrote:
> Both XLAT_vcpu_runstate_info() and __copy_to_guest() are common paths in their
> respective cases, but the optimiser can't/doesn't merge them.
> 
> Rearrange the code to do so explicitly.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>

Just to mention: This is only the x86 list of reviewers, whereas ...

> ---
>  xen/arch/x86/x86_64/domain.c | 13 ++++++-------
>  xen/common/domain.c          | 11 +++++------

... this is a common file you change.

Jan

