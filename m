Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F69C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 08:55:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405366.1638865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gke-0007mQ-Jy; Wed, 02 Sep 2026 08:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405366.1638865; Wed, 02 Sep 2026 08:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gke-0007mJ-GU; Wed, 02 Sep 2026 08:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1405366;
 Wed, 02 Sep 2026 08:55:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1gkd-0007mD-NJ
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:55:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1gkb-00AqSt-9Q
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 10:55:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97e472-2eae-0a2a0a5409dd-0a2a450999c6-18
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:55:21 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97e476-be1a-0a2a45090019-d1558029e1bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:55:18 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49cd9add88aso4680395e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 01:55:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce58da3acsm80590125e9.0.2026.09.02.01.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 01:55:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1788339318; x=1788944118; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nA2s6HuoziJ0Mqf7gcg+y4QLcc/T8IpHG9vT0Iw59h4=;
        b=Zyg81cTfr4uGJB0T1uULem0KhGD0CeoVJ2ecOvgkpfrMJCmpt/Gt2BdKS3SjvHaG7j
         tskRbNmnjNnKhTI4ZXEK2FQfr+RTYq9a2y1gl6zKCipdiopUTVagl2f8kKlf1d3zY9Q8
         mwLPZ7vUNI2VjYj7HiTOTC7xc5M/1dudUoonnpyk8qggncjgm2PdM/MBzXKKwpgGhKKy
         NFNYFv9YQJxTp+sCbglyxkFJ0SRHo55DlBXvps6Us2JS3O7qc8jCJEZxXNf+qqu0BnU0
         RI8C3TMNyk/8zWtV+XFA6Vr+lP65X3S13g+zkEuPDhMkjDCS8mSptk0VDG/4gPe8E6+q
         hqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339318; x=1788944118;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nA2s6HuoziJ0Mqf7gcg+y4QLcc/T8IpHG9vT0Iw59h4=;
        b=d/RYAxIEQpdMkv+0NVY1ITsN2tDs0iWsHsWINmWiJp6JRsZZWNp8xN+WVB92WLsQt+
         50acLPoUj5riATPIizHiMWReDKBVndYy61ieXvJwbiJhmvBDHohT8rBqCsmqrforGP3n
         4kz0eW7PBQ8grEe7bsnIe3qtDlEDZNjrb2nlg5YSPR3WHg/WaAgM9H/nP2zjCBtvG+Ba
         9AqZv65+fkwrHxm2HCOfoyjLZNG1XuWNJcICPQ53mVABw5lZw4iPKqkOMraXNXbXTSER
         MTy5TE0s62NtmAdM5LQMnGv8pVD8DnTzqvwkBqxqZRAaDBsc/8WIb7SX5/xJef4unhSD
         6NcA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw5dd2NMhzaPDDRUWeekAAjMU3f0j1mKPSkTLw0SenxGvd/0EkcOONTvvj9ls+/4mUlce1vNWign8=@lists.xenproject.org
X-Gm-Message-State: AFuF++k+7kw8HGkX4Aq6R4PRMrtaDU0anCDPR/J6fWmGoQS1mB+Ibwsy
	UUzfOxUOeXLT/aJY8OfmN+H9hwMwNXwpnMLfMWVSSxl3neLVY7nte8Q7nR+mPaOAcw==
X-Gm-Gg: AR+sD10yiem5oOSF3F30+MPLPlX5XCWhQmtxtiTh3FudZ5xo0+5nmu/dhG91fXcublW
	KfiotErbb/oWT+ZTmyq31jEj48Dte58M/Ag7b1ySYenD3kI/DlC4pAO6750+y7BVsyVDlvyAEVD
	yzjPu3q6+eQnAa6VUkIELcxel8RSBi7OsD7lswMm1wlPyYzOYu5WviMuKcU/FCR/HWwDLqcHCf4
	UhMCunPzsd/Uh+m4F0GOe8I6eUuxit3mLIxpD3NWjF5gvW6EcZcTXJWio5iZmJkY+ZCXG9QPbs9
	nz+cxaRbadHMXDMZSNnq0z+pGgpRbE9pHu7cxdW9uMwy5Z0i0rN/ENe1OSugQk5ZWWfS7Wifc4r
	Iqd/Sdk8nDijb/QOs9m6SttjN5vkckAbfGlWz/iK4zn72nnG2xX4kynTtdsSvX8dwAEWL5Dq71b
	+I4EhY4LETHq1OAUT85SkCeCj6sGNJbLvpAxJ6Uttd0ME8wuIbqjCDQcbtOpdt49X+CbVRc9i1C
	jFH7BwtvBWmf2U4C2r5cUyq/WpB/9TRO5QoJhynHwbYH3pmnayz
X-Received: by 2002:a05:600c:8b63:b0:49b:c8e:8e6 with SMTP id 5b1f17b1804b1-49ce558ebd8mr62707605e9.0.1788339317713;
        Wed, 02 Sep 2026 01:55:17 -0700 (PDT)
Message-ID: <37872f45-8078-44ef-9db8-a9868c9b79aa@suse.com>
Date: Wed, 2 Sep 2026 10:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cmdline: Document console=dtuart option
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260902073606.61062-1-michal.orzel@amd.com>
 <20260902073606.61062-2-michal.orzel@amd.com>
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
In-Reply-To: <20260902073606.61062-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788339318-FCA16034-6078AA62/0/0
X-purgate-type: clean
X-purgate-size: 1354

On 02.09.2026 09:36, Michal Orzel wrote:
> Document the default console= option on Arm and RISC-V that is
> "dtuart" indicating a generic UART parsed from a device tree or
> ACPI SPCR table. This serial utilizes SERHND_DTUART handle.
> 
> Take the opportunity to:
>  - fix documented x86 default to vga to match OPT_CONSOLE_STR,

I first wanted to object to this part, as I was sure this used to be
"com1,vga". Yet indeed it's been almost 19 years ago when this was
changed (92877a1f9ab2 ["x86: Auto-probe the serial port baud rate if
'com1' or 'com2' is"]).

>  - mark dtuart option as available on RISC-V,
>  - document fall back to /chosen/stdout-path.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -430,9 +430,10 @@ The following are examples of correct specifications:
>  Specify the size of the console ring buffer.
>  
>  ### console
> -> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
> +> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | dtuart | none ]`
>  
> -> Default: `console=com1,vga`
> +> Default (x86): `console=vga`
> +> Default (Arm, RISC-V): `console=dtuart`

Any reason to not also cover PPC here?

Jan

