Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BA606A33B
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=e8aR6pNh
Received: from list by lists.xenproject.org with outflank-mailman.1484059.1687406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9tu-0000TC-P7; Wed, 11 Nov 2026 15:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484059.1687406; Wed, 11 Nov 2026 15:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9tu-0000T5-Lr; Wed, 11 Nov 2026 15:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1484059;
 Wed, 11 Nov 2026 15:06:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9tt-0000SX-1Y
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:06:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9ts-009vYB-ER
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:06:12 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4845a-e002-0a2a0a5209dd-0a2a4508e31e-14
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:06:07 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4845f-f659-0a2a45080019-d155dd36acc9-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:06:07 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so1773559f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:06:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836c835fcsm10991598f8f.59.2026.11.11.07.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:06:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794409567; x=1795014367; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vRBBla/gXafluiIAsUvM3PYNHQgPWYxs5+l3SNEUupg=;
        b=e8aR6pNh9Zcz+liUVSocWuBdehss9jvIDTmnwHC3cfSBdGce8rr87W26Go552rRdn/
         fZALwdhnfl79bCWo94DAxwowxJL4h4oZZa22hGFFsZ4gtS0NhHoM3d03fyJ+Z0xmEcQu
         5Ixcym9Qacm35mzW+YPL1XsT5UDU5XJbZizmKldvR8/dBHLB1r9VLWAnj2w0n+TkJn+a
         wEPwdAcXT2mhjGNmm0Cmf/rIIGTiE/p0ZBgeBhUVYV0Nwk79WuHH8dPAph8nu7o/3Lfn
         P40/h4p1/thVya9j++YPfvXniJi6DPTEdaztEOtIcP9qim0jWg2hgfzpWN+0WxwFM12m
         qHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409567; x=1795014367;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRBBla/gXafluiIAsUvM3PYNHQgPWYxs5+l3SNEUupg=;
        b=LvSZ1nHEm2PbmVPwR3WbzJR691aRbK3fo2Qqixo1TUs84FWufdiBkVG1GUPT7Hb2hj
         lKmLaNeFVupb3D5LP5gVXNMGzVJ1KL3dqOuc/tUtCT0NRMVuoKit4Vbv2Y4F1SlA/JG9
         FcIJ8I9CNEgPXhIhLNhra6wYiXfFHFzhc+Sql6pGdndkjHd3aGKm39KreyZiOGlMk2ow
         zyTIfvPHxKC1qQ/yPTHL6H266D8VAQfW4h7J9lF+/FWllx+muAasZD8H5vCjF3AxoTfX
         M961Uts5jtG5Y8N+mKzegZsZqlc6JdyOpgJkpwhpU9SoZL07m9Cshi3pX2Z3djt1wQU2
         4uIQ==
X-Gm-Message-State: APuU4Z/EvetVKxrnMpEVLPYN6l3254HwgI/3s5kP72V7n+zJFgz7GyQt
	wQBJ8LvqfgTW4GUSx5+PgAAp+yyEVZZ0WKKy/In9shd/oElwqy9sdrnYrzb9CaUbIRZeSqrlYJ/
	s9sdGyg==
X-Gm-Gg: AYBFou1ByhVlJD281e3atv5esWLt/GvBbjiiO+4J+L5/k5o0AnWBnvykqclA6mk/DvT
	gCW5gHs6dZ82MpeNgr5CvvXkVz9jhNsstG9Ri/qOU0RCRSdTxZd13Jg+EOqwt2Gg/xAA5KzKuHn
	uDMV97OzsDkoISbonCAKm3aO0GR0+Jv+r34BGNdGlADwbpekeIuwuSwbJgmjCq03I4cqgitOj70
	p0Ke+4/VadiuQzpph+GGOGKb1/aHRmylvHoHmg9eYFvJtbTTE22GZeWFPpHLAhumuYDs5tEtdDX
	chuHw2mheJGkXO144LSskghyjfiuavY+jDEuU0BhJmFCOKCcpoXNQH94CoT+cieqwgMWND9/bjT
	wfk5SEam37w9DNeR5pUP0BM6qNxHLRcgz1FDou9TrqVrMQUA+76q9qPswQ7iiojm0FWmsn1p1ko
	/IBw+XpFTIk7VUjErPqJqA7dQ2ezYExy+VqxaRUOVebCGN1wWrQodlcVfiJgtE1fV0GIYXFd0gx
	W6uUos6DfTwLkrKvzY9ozXehUfEJT+bt+Eubo+oxmKlODPFRtE5I+xQ6mc3/I/dWX4khxEI/rvb
	ItiR7HAkAdgk3kAwek+h+k9VkRj9HX6+Nd84eDgeq8dzAD+UbOrQkufhd4p2lDFWI1NosxnAZiN
	coHBAiyCyuT4Gu6RtcA==
X-Received: by 2002:a05:6000:186c:b0:48f:e879:5887 with SMTP id ffacd0b85a97d-499c640643fmr4913107f8f.28.1794409566908;
        Wed, 11 Nov 2026 07:06:06 -0800 (PST)
Message-ID: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Date: Wed, 11 Nov 2026 16:06:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 00/28] x86 xstate area / AMX+XFD / ACE
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
X-purgate-ID: tlsNG-c1860d/1794409567-CCD7087B-02E2FC1B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1573
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While this re-posting is long overdue, this series now sitting on top
of the APX one doing so didn't make sense without first posting that
dependency. Still, this is already lagging behind again - ACEv2 support
is missing for now.

01: x86/xstate: re-size save area when CPUID policy changes
02: x86/xstate: drop xstate_offsets[] and xstate_sizes[]
03: x86/xstate: replace xsave_cntxt_size and drop XCNTXT_MASK
04: x86/xstate: avoid accounting for unsupported components
05: x86: use xvmalloc() for extended context buffer allocations
06: x86/CPUID: enable AMX leaves
07: x86: XFD enabling
08: x86emul: introduce X86EMUL_FPU_{tilecfg,tile}
09: x86emul: support TILERELEASE
10: x86emul: support {LD,ST}TILECFG
11: x86emul: support TILEZERO
12: x86/HVM: respect AMX tile dimensions for emulation caching
13: x86emul: support TILELOADD{,T1} and TILESTORE
14: x86emul: support tile multiplication insns
15: x86emul: test AMX insns
16: x86emul: support APX forms of {LD,ST}TILECFG
17: x86emul: support APX forms of TILE{LOADD{,T1},STORED}
18: x86: permit guests to use AMX and XFD
19: x86/CPUID: TMUL subleaf 1
20: x86emul: support AMX-MOVRS(-only) insns
21: x86emul: support AMX-FP8 insns
22: x86emul: support AMX-AVX512 insns with GPR operand
23: x86emul: support AMX-AVX512 insns with immediate operand
24: x86/CPUID: enable ACE
25: x86emul: enable tile management insns for ACE
26: x86emul: enable tile data movement insns for ACE
27: x86emul: enable block scale register insns for ACE
28: x86emul: enable outer product insns for ACE

Jan

