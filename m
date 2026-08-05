Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C07C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:42:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383496.1626768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbt2-0002Zb-5V; Wed, 05 Aug 2026 13:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383496.1626768; Wed, 05 Aug 2026 13:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbt2-0002ZU-2f; Wed, 05 Aug 2026 13:42:24 +0000
Received: by outflank-mailman (input) for mailman id 1383496;
 Wed, 05 Aug 2026 13:42:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrbt0-0002Z5-MB
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:42:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrbsz-0018PP-24
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:42:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a733db3-2eae-0a2a0a5409dd-0a2a45098ae0-20
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:42:20 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a733dbc-be1a-0a2a45090019-d155da29b591-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:42:20 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c15f020a223so165436866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:42:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c203625459dsm120745466b.20.2026.08.05.06.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 06:42:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1785937340; x=1786542140; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eh+aB4Fu1hQ4npYew960LgpTX0/RSp2uKRxnVc27sDs=;
        b=ei4VW/MOgQb/SM1Nm59KIH13r6zdr+1GKp2SGu47YR91/EsKHtrobFaHaq4NkWghh1
         LZRSVFNwtaxdgHjsWa2fqTLvLGR3si7LwQXGKbnBhzKov87o4ac05vm9QWq2jjhH6iDZ
         PGbPJIj/+DU9YPusLyasz9k3+/45VgiJy3eX4BhMOpQcv7UrlFPH1kcqT3JMswuqtGP+
         rjArJU4bHcoMPrPCMJgse3Vw4aylMkGh5BIr0sjDWBAtyXUgRG52HTX8dVkrhnQQlJtN
         6RS3XMFcWMQuaVXfRzgHcnm5HkCF392J2kcefBSlCSe8gKerPlLThD1c/v4lq0CRe17d
         +OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937340; x=1786542140;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eh+aB4Fu1hQ4npYew960LgpTX0/RSp2uKRxnVc27sDs=;
        b=hcOiOLtM8WEZnoHxIP4YO0A+5pQYenaTbCKXbP+icq0Wf7KnbWHe5TdaXdKG6meN8T
         yj4gx5yrnGh95qRjeGiNN3M1JurJFSaof/7srYO/yIWZwSa+5h0DzpanUPnBz1HDlMi1
         +NjcbDovxF4wfKOn/6/WZtnyiXV3RwKAX9HKm4/hv1yZ7ckjKjaMYsKGugOBfsj8/Ms0
         N+4DAvmouvXSMznvotUmebWvubf602rmYa7s3dAsDiCMuYkXk1CbO6kYk3EOW8A2GHbe
         FE3ADcB2tEWIC6H6QBiVZbxIKOLO3sv8OYfI6LalrbvThYu7tcmEe+Ha5hOAfBi+nvsM
         SaSg==
X-Forwarded-Encrypted: i=1; AHgh+Rre7Hu1LlL+lYMTOJloRA+7lLBE7PCNF4QG/mbxTKvTDLNkAfaWIxGgJ9MOyLmUn7bwf/iKlguwMkw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyj8WWrqmvkLjsYF3HkLe5YoxqvCGeFWbPeGDlYBsi9qghxfgJM
	ukZ6/8tm7Qy07+RNtpXRjQ4oEEEMo2J9l6coo/u4C8r+8A+4JE9GW7TudZeoNRTdmJQtdXHblv+
	poNK5EA==
X-Gm-Gg: AR+sD11/74hcg5RhKo+dfMuLpPezhKnA0ciKj0yTFrHdbJv2g3wjerL8C3NbwQgW9tL
	PkT78m7DsKK/5EkqUOEPaWayQORiNkyFBSedCHqbIqhEvuLmaHedRruZRGpCIVcQTqcFK6Qq+7J
	vfiPk737mAzQcOO6ee/jOwN/gLJYCPWB7nIGReDgXpR7at/iaSyiYKOVgIeY6EP6MJMBCNmGb40
	K4bn88Q9VZcl65E7KQeyJYkipLbWsmixSMgdCpHOC92aLD1IbqM+94jbpfydU5qHoALJI8nVoQ6
	zPQjtqInw354Sx+4vNpr2mtCPJFxq116Ly82iUwbEAou6+8HIWaKY5BgjOq0KWUefoN1OsX4vRV
	NuM4TiEUPDIGdC1hhGrA6l1g6mArDZ8Z9GJisqdXl+m5yrFOGq91/4RH3aSQM9lyfMeL4VRImTx
	msQZiQF/7F5aaWOiTR2RC925yhYiESNAllB70bk53OWpATF+ICLiOzY/xzDJGoCGCUPril89Pjf
	pnpG+v6PZmF8PIiMollKUbWaYhkvVIAqZ8LNVm8YN93zDanBeHN
X-Received: by 2002:a17:907:6d1b:b0:c16:242a:4722 with SMTP id a640c23a62f3a-c2039d1cae8mr291133066b.22.1785937340368;
        Wed, 05 Aug 2026 06:42:20 -0700 (PDT)
Message-ID: <e1e873d9-6dc0-4e08-90f5-e99ff42802a0@suse.com>
Date: Wed, 5 Aug 2026 15:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] x86/nmi: Watchdog fixes/improvement Part 1
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260805124525.105457-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1785937340-BF2DC034-09D12C29/0/0
X-purgate-type: clean
X-purgate-size: 1662

On 05.08.2026 14:45, Andrew Cooper wrote:
> This is the start of a very long rabbit hole to address the
> mis-classification of some watchdog NMIs as non-watchdog NMIs.  For
> now, just some simple and hopefully non-controvertial changes.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2733861049
> 
> Andrew Cooper (5):
>   x86/nmi: Drop {reserve,release}_lapic_nmi()
>   x86/nmi: Drop K7_NMI_EVENT
>   x86/nmi: Misc style fixes
>   x86/nmi: Check MSR_MISC_ENABLE for all Intel platforms
>   x86/nmi: Don't configure EvtSel repeatedly
> 
>  xen/arch/x86/include/asm/apic.h |   2 -
>  xen/arch/x86/nmi.c              | 153 ++++++++++----------------------
>  2 files changed, 47 insertions(+), 108 deletions(-)

This series, once again, is putting me in a difficult position: Should I look
at it, or should I let it sit for two years or more, just like my earlier
fixes in this area [1], [2] are? (Of course, as always so far, I will look at
the patches, and I will likely also accept them going in ahead of mine. But I
cannot exclude that at some point I might actually stop doing so, seeing how
many of my patches are in that state. While at the same time none of yours
are, afaict, i.e. as per the track record that I keep of what still needs
responding to.)

Yes, you did respond to [1], but is not being comfortable with a change really
a reason to block it, when it _is_ an improvement, and when the alternative
hasn't materialized in all the time?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2024-01/msg01365.html
[2] https://lists.xen.org/archives/html/xen-devel/2024-04/msg00194.html

