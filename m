Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BE0606A327
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Lq0u9ohF
Received: from list by lists.xenproject.org with outflank-mailman.1483537.1686875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8Yq-0006wH-AQ; Wed, 11 Nov 2026 13:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483537.1686875; Wed, 11 Nov 2026 13:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8Yq-0006wA-7h; Wed, 11 Nov 2026 13:40:24 +0000
Received: by outflank-mailman (input) for mailman id 1483537;
 Wed, 11 Nov 2026 13:40:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8Yp-0006w4-3F
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:40:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8Yo-003XFV-GI
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:40:22 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47045-2eae-0a2a0a5409dd-0a2a4504e124-2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:40:22 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47046-b57f-0a2a45040019-d155dd2beccf-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:40:22 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-498f5fa4f70so1543658f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:40:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c990sm10490471f8f.3.2026.11.11.05.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:40:21 -0800 (PST)
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
        d=suse.com; s=google; t=1794404422; x=1795009222; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DgHwxxz8f6+Hdd3T7ok/JMRgaXaIOfsM1c6CJ3kHet4=;
        b=Lq0u9ohFpaNbEGKYnBJu4GeYDs2zSwnfXoDrAdSJxrCWUmwnEVDx67j4jXUZlPHFBD
         2/U0nV6ifJVPGCTUdwX/cZLOv4jOI2DK/p/3pov36/v5nRnEZRYNxomQQehaVsMdv3Rg
         iGHKnQJd3jsUJ/6iRZ0h7fuYJ4bQbzOjavqO9FUVs8ik1/Ers8eNU3PCwYeJwZSQkric
         E9y0bH7kh39di4RwJcmrjFNp6Vxh30qdqM/z8KRp+tH6yOWzMzKFpG9AbtRwgBKtQVtq
         WyIMWG7BAOM0PprmoJFGaHGfYhKFbJUo8FKYJwP3pXldMOrS1VWdAyTRJ6FYBQHMy0oZ
         payA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404422; x=1795009222;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgHwxxz8f6+Hdd3T7ok/JMRgaXaIOfsM1c6CJ3kHet4=;
        b=Iw0catA2SAzilylf/IbXou1bvu7juPlCdWcK4MpnrqsElwWpzrTZYkq4DA2p0MrFyy
         Dz441DNTduYb6WTmhX5A/6dXAgTUg6Y0SnG4OVYzvdQ4CdfZVP6evfFUGD/lj0BhO8VV
         FDDrCbT0iaU/qV5NfTU5V9k9G6W7AbOszPokQgARki/8fsj8bfRa7JI1/YxOlxvVfyBj
         aDUQiFe7oFKdUiUDltVxNCEu8dHF2yadE6oMkDyAWWl31Smbtu4VNAOfiSw3+z/LI5rn
         FG+wCl/fXeul4PI3mdi2jCVNeBINEi1h3E8gwoUbmTSskOAWto7iOUSefPUaQPKKB2M1
         Xo9A==
X-Gm-Message-State: APuU4Z963Fe4t7P2NPw1kN24AbBLNky6slYRX8LW0AGHkxjCtKeC2bHN
	dcHSTMAgQnjAb5cqWb7sS35WWpSE4dUSCQK6C23xprcsuObBwkxEjhyce73vWzJhAkOGfqufUYP
	eqRBA6Q==
X-Gm-Gg: AYBFou2JwnXHgKaGrgwv7nyDuQSejHc9d6vMMxEWkjTsin+vKYA0U8mj51HzWQjnTEn
	SwE5Cj2LRLKf+rtdA7Rc8q1RchUWoI52QjayV6rnI399E4mhWRrkXEAkLRmUuqohNnIXlMp6B3A
	6CVKcirHcFZ1i0k8HIDzWRzLRCv9CgtLU7p0+eYU/fbjqI3iYvTWRiPk1JIn2LwQu8YQemlKYl2
	cxcsEAg3K4k0e8mYl8Oh+/+XUe5eQjdQ0Km9WR9E8nhWnALSqElZfp0TEVtHGGF+git9vFPuT+w
	hALS5xP9Tp8TZrEeYbAvc10W1df17tD9EiZlOdqWYnEXoIuuKCRYO4rbzer6+2FyHgMtHXyZ2ZL
	lumKJGTKdkOuL38gafMWUegMbhjYdlPCHJYOlvYautkFntJpPBdWjudLb3OxWc65a6j9PohGiEP
	Gv+nLdnXojcGbj7XRU0JThQG18xvv8US/lKUJAwiC2G6xaIJMGGmSxoiz7HUFIBCZ6Nub6SXUB1
	KqtcyLxNKK9EZNDT5AfnBoJayBhVIZjsnZQGZUMhY0WXbjVIlyjN3aECrkmioIcyQbxH8lp3ZCZ
	/TQKw7jpB1uycx5OvolInYMzqLBDWRWTo08hlDD/3pOS3GTeargXVe4WDXFJwUaH58Q/B8OLy9a
	2FrWRvR7dh05Q6shI
X-Received: by 2002:a05:6000:2411:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-499c7dfca0cmr4187290f8f.51.1794404421831;
        Wed, 11 Nov 2026 05:40:21 -0800 (PST)
Message-ID: <1be43887-4494-4ff5-a801-0c6bab90c80d@suse.com>
Date: Wed, 11 Nov 2026 14:40:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 00/19] x86: support AVX10
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
X-purgate-ID: tlsNG-ebf023/1794404422-52ECEB50-C57DB5D7/10/78276251493
X-purgate-type: spam
X-purgate-size: 1763
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AVX10.1 is just a re-branding of certain AVX512 (sub)features, i.e.
adds no new instructions. Therefore it's mostly relaxation that needs
doing. Luckily the 256-bit-only case and an unnecessary restriction on
the mask register insns was taken out again, simplifying the actual
emulator adjustments quite a bit.

AVX10.2 is adding quite a few new insns, support for which is roughly
added chapter-wise as the spec has them (perhaps not in the order of
the chapters there). Same for AVX10.2-aux (new in v5).

AVX10.3 has just had its specification published, so isn't covered
yet.

While it probably could be re-based ahead, the series in this form
depends on the previously submitted "[PATCH v5 0/3] x86/CPUID: leaf
pruning" (which is supposed to be replaced by logic in the toolstack)
and parts of "[PATCH v10 00/10] x86emul: misc additions (MSR accesses)".

01: x86/CPUID: enable AVX10 leaf
02: x86emul: support SIMD MOVRS
03: x86emul: support AVX10.2 forms of SM4 insns
04: x86emul: support AVX10.1
05: x86emul/test: use simd_check_avx512*() in main()
06: x86emul/test: drop cpu_has_avx512vl
07: x86emul: AVX10.1 testing
08: x86emul/test: engage AVX512VL via command line option
09: x86/CPUID: enable AVX10.2 sub-leaf
10: x86emul: support AVX10.2 scalar compare insns
11: x86emul: support AVX10.2 partial copy insns
12: x86emul: support AVX10.2 media insns
13: x86emul: support AVX10.2 minmax insns
14: x86emul: support AVX10.2 BFloat16 insns
15: x86emul: support AVX10.2 saturating convert insns
16: x86emul: support other AVX10.2 convert insns
17: x86emul: support AVX10.2-aux misc insns
18: x86emul: support AVX10.2-aux {B,H}F{4,6} <-> {B,H}F8 converts
19: x86emul: support AVX10.2-aux PS <-> {B,H}F8{,S} converts

Jan

