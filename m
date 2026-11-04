Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD38606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d9knW2Lp
Received: from list by lists.xenproject.org with outflank-mailman.1471651.1679902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYWE-0005AE-A1; Wed, 04 Nov 2026 10:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471651.1679902; Wed, 04 Nov 2026 10:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYWE-0005A7-7F; Wed, 04 Nov 2026 10:47:02 +0000
Received: by outflank-mailman (input) for mailman id 1471651;
 Wed, 04 Nov 2026 10:47:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOYWC-0005A0-Ao
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 10:47:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOYWB-00AI82-Nt
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:46:59 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb0d22-8faa-0a2a0a5109dd-0a2a45049130-12
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:46:59 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb0d1e-b57f-0a2a45040019-d155dd2ef0c9-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:46:54 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48e04773687so201815f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 02:46:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fecac1a1csm3153700f8f.12.2026.11.04.02.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 02:46:53 -0800 (PST)
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
        d=suse.com; s=google; t=1793789214; x=1794394014; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30A1bfQ7LdKKRF9Zidp9+TUWRKwU2+ZacTc/RxfXgCQ=;
        b=d9knW2LpeyAgdo/pCTbzz/g402AgYHE4nAiyZr4qp5PYYgwc9eW5OoDFHPHA3xvc3h
         2wxI4ObO5Co5+1Ct5fwhiuNKyczB7Wn3n9zhZ7Kh/lCDVSgotY+LXYDGZWVBL0HMaKLl
         CULYQ3do7JMWm5ucO0nNdo2r6Cvk4vKZqrrzqUQeEyy1Jh1YVm9d+4OxdkYtGpXD0Ibl
         16DRnFBSuYk2A2FvzK9Bw1QHpYksawr3abjvMP2QxrFvAnaR4VSWpKTBE9XqTa0gaosF
         jRp1c2jCx6TgsBdYsubH7klfA6Fvl+Ex+8zyZAyQwmTyVkAdsgFm5nfjGQvUu5uDBmyi
         cd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789214; x=1794394014;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30A1bfQ7LdKKRF9Zidp9+TUWRKwU2+ZacTc/RxfXgCQ=;
        b=sTEQwOFPfi3oMSX4awuQPPHKLi0waW17NkLeNCh0BFhYgnks59RU2zBFAFC8e/2sau
         apgtJc0wMwSqAe9lN+1RcKCvDfvX2h9KgHHO/+J9LAM1BUhsHEbgHaUveTVzVxZac3hL
         HP/U0Rc6BoSwdBBEiyCixQjegxDadJl9vfPctG3HZzynkCbT13x5GFBhoebN7jfm5oXD
         wU659dCiPlxU1GTr2vZKfwxQ9g7ZkMiaxTRbt66mJbnjoCCf1vTS9wgj5PQVUKHobHka
         C5pWH7na/Qxr0/emWP/hChuDoJ6dy3HSQHoHW/wLLfryENtTDEf0vpb5u7HG23iIfQ2R
         RYFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxufTPsaojKUHi+b2mnTxvAgknqylvfxPg/TYJBM3E8MYCCaHekDfz5DJstr5JboLLZxK2r/Ps1gYU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+OJgOrDNPM/VaSGBGPBy/WSDPInQ3hBkkZ6xpnpXAZlcFS4S15
	oO3eh21PQSgePQtKm0Al7Ehdzal/gLMmOV1UEp9A5xiXeLdD2hzdP48pS5yEetozjQ==
X-Gm-Gg: AYBFou1Fclm82t9+6+1sfsBZg9coEBBQ8qcnsqYspWagJj88wt2G095Pb3jw1R0MgRv
	gvMeMYyBkvDzfwUG/oOcjmV1PzEURMwe62RaJ7PWSpFBwVnI4W0qEvD2bsOf/V6gdvS9bdrC/FT
	BB0MdLMbWIL2TlaoSuYFJF6xsvzDCo8FzJ0lMir2g2P7zm2WUlGruBx61wnZeK2pmBambneBuqK
	rZpd+I3sP/c+vu2U4t74tCoq1fkDwh4BTviOgtBjJcV5qY/h/HiYGCZz8dJgNoMaSYxNh3h1knF
	eINlkuVt6RsJgQ37XbsLjS2c2OqcvhjmIiOLTlP+M3/Sci2XEWN/UPiByHc8fu1qZG6Dq9R9sZz
	kDJSQYiyRDEYMb7eTXRLiiXZdS/YB6mweEAMVIXjtbE+IcG7gx/stNCVZOW920dPdvMHxINUIXX
	EjcQkqCDRSMWigm1QJLakBGcD4IuFYMN35XUGuFledMz1xn7OndcO5Wlpv4zzmuDDODYoHaG/GT
	SgiV1H5t04S3W13R1ygFrW5aG5wTcHGTH7afDwXsURhXU56BrLfzyW5YNc4C2fnEedTVMDk6k16
	OBsHb/ItsyiJvtSqPDPbm+52jPQ+8SGGpTuODMCBRoHObzz6Udh5U8lhLJur1cIMoadK72yKVy/
	XgjynVXzxOkvY9VI=
X-Received: by 2002:a05:6000:26cd:b0:48e:8882:6d91 with SMTP id ffacd0b85a97d-48e88826d9dmr15712896f8f.1.1793789213916;
        Wed, 04 Nov 2026 02:46:53 -0800 (PST)
Message-ID: <63d71f41-6d5d-4b53-9af4-9d0938a2ef7a@suse.com>
Date: Wed, 4 Nov 2026 11:46:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/44] x86/mm: allocate the per-domain L3 in
 arch_domain_create()
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
 <20261103-asi-hvm-v6-1-59dbc5ce9615@xenproject.org>
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
In-Reply-To: <20261103-asi-hvm-v6-1-59dbc5ce9615@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793789214-583C0B50-399E3915/10/78276251493
X-purgate-type: spam
X-purgate-size: 2023
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 23:13, George Dunlap wrote:
> init_xen_l4_slots() relies on d->arch.perdomain_l3_pg being non-NULL,
> or it will fill in a garbage value for slot 260.  Currently, this
> is allocated only implicitly, as a side effect of calling
> create_perdomain_mapping().  But depending on the specific
> circumstances, this may not happen until several hypercalls after the
> domain is created.  This is not robust: callers need to keep track of
> when exactly certain structures happen to be created to ensure that
> init_xen_l4_slots() operates properly.
> 
> Since fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT L3 slot at
> domain creation"), a PV domain gets its L3 with its first vCPU
> (pv_create_gdt_ldt_l1tab()).  Only mapcache_domain_init() makes it
> earlier, and release builds skip that unless memory hotplug is enabled
> or the host's memory reaches past the part of the directmap PV guests
> can see.  So in release builds on most hosts, an L4 that is promoted
> before XEN_DOMCTL_max_vcpus has created the domain's vCPUs gets a
> slot 260 entry made from a NULL page (0x803e900000000063).  libxl is
> unaffected: it creates the vCPUs before it builds or restores a domain.
> 
> Allocate it explicitly in arch_domain_create() instead.  Introduce
> allocate_perdomain_l3(), which will allocate a page with the
> appropriate parameters and zero it.  create_perdomain_mapping() now
> requires the L3 to exist, and BUG()s if it does not.
> 
> We return a pg rather than setting d->arch.perdomain_l3_pg directly,
> because later we'll use the same function to initialize the per-vCPU
> perdomain L3.
> 
> This removes the need to allocate it semi-implicitly (calling
> create_perdomain_mapping() with nr == 0) in hvm_domain_initialise().
> 
> Fixes: fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT L3 slot at domain creation")
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


