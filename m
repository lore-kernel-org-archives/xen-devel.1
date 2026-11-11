Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80323606A338
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BTGJx8Lw
Received: from list by lists.xenproject.org with outflank-mailman.1483717.1687064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9C1-0007Oz-3z; Wed, 11 Nov 2026 14:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483717.1687064; Wed, 11 Nov 2026 14:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9C1-0007Os-1D; Wed, 11 Nov 2026 14:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1483717;
 Wed, 11 Nov 2026 14:20:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Bz-0007Ok-KA
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:20:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Bz-00ErYO-0g
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:20:51 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af479c1-8faa-0a2a0a5109dd-0a2a450199ac-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:20:50 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af479c2-5984-0a2a45010019-d1558035d89c-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:20:50 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so26682035e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:20:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c518a6asm33735e9.10.2026.11.11.06.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:20:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794406850; x=1795011650; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B/I1H+e5/JfrForg2ReUVUl5ReLr7VIekFarbzejtLs=;
        b=BTGJx8LwywWhdI2NZERge7IppKFx6oAOkbA95WPqBcRAhCBYAQLPH8aeTlo2j1Zo6Y
         7bXAVVs9nmD0VF5uFCQS/3fGV+KTvi3VpTIEu4UZHnthqp0rGysGm43EbYBYk7Aqtids
         Z1zYhGlXU/5LHvixoahphMp5uGb9M6g1k2+yzNsMtN6EIH+Ftn+5NaaUo/MfIeW23TTZ
         EBEEJnexCcbMPYfQAloi1hf8RJFTql23KwJEYw1NWfWj9/PKdd4KKA78pff4V1Us2Xm9
         7Lto0iPoVR52JArVlWPain0qr9YkEW07z4dMmzSjuNNQ2dmHIlrbRB8glCFx5H6TIBad
         iyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406850; x=1795011650;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B/I1H+e5/JfrForg2ReUVUl5ReLr7VIekFarbzejtLs=;
        b=iFjShHZ3wS4mevbk1NInf+MjnmrlxnrRxtW3Z7qnvwBqsU4iQ8yT3lyflXk/tSPgBG
         GySzpSqNFAgfMGoFbbx4C2Qe7TLLlwXEuyBoHSNaeweDmFyBK4l2Oe9lVai7QCvMg5x1
         OYRaIQUgCpKDY8uBTuU6Csbo4Bl7UgD2C6edc6lDu5PhHcNHIs7q6BCvd12PdVKA4hyL
         Vd3eRtySZFBGUfAnqFvETMsSE9sBqZc2PVxP+geeZvzJ8UQtG5psHcZ2UjCcynjCdpdz
         PDwKOvoAsCfOIlZlZUcAyZ7IP0wcVwoQveTpqr31t9hNTgs2M3pp/06FGSxG05POyrrK
         KG8Q==
X-Gm-Message-State: APuU4Z8SOgj8PaxSMYCjHRCQInXB9+jkx0gSunhO0GIgu1JOnsxlBwVp
	O6neVYpqBaJ8FZApoTHIiOUBLJL8MzI2EefLEDw1/1Hrhv69BzAWA6B8hI+WK4vbtmRwoIFvtLh
	RtAHZxA==
X-Gm-Gg: AYBFou0RbicLGI3FRNQH3sZ2Q3PSpCay21uovRr8FSajZSbHOGVSEH0IiYJOA5/XXvm
	1O9Fm87dOCjrAE/mOk12uCN01EIGiSPFUmzto5DylPdKSdTXyAES+T4UBRRMsRbcqSltcJ43Fmg
	4CEqRBPFeSQFgOldoYLVekRLvFeFEURrYfoYhQ6EuDzYqJ4iZWu6MubhW9wToCf7Fzx1PjEIkbk
	21+gvyUyLkvJXTJR8wRQdtgeTH+N4tAS2AEZAKoRtTBwJiPzjIW0Tst4i71hUcoYSkDQMHjnwbS
	iEh1YIaELWu7cn72HP5HCIX9112P/uUdBFT6NKbxkLg74Ae+kQ1kUyHyoSR8jdDVubHSCJfvZp8
	9v5y0nvnTjoY+KSKVw6PmwCCwFEYwOi8BKq5TkZMkJYezrlTINI/rfapJEilAgplIFMLqbxG+Co
	PwZEbtpEZZ0EQueZoWcc0+M6DcBj/6XSbtT9ESSGSOYCd5kSTnw2yjcI7IEuNvisOynTD1Buuwr
	5UxH9GQfLHGyf/xpfABNlZP4rguwdbOSNrD4STKMc7Qp6J8Cb9f7aN9twvslcBt+R7Z/VTsnwT8
	wfWJ6IOO/8BfXQ+hijKL8FEczgFxIb7rdrVCCYFllcJ6P5yA/jLz8ztotCx2broz6CKDjbC7qAv
	TMQ9l1tdVJrjWG7/p
X-Received: by 2002:a05:600c:4f4a:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ba0938a45bmr56301555e9.14.1794406850232;
        Wed, 11 Nov 2026 06:20:50 -0800 (PST)
Message-ID: <749c1efe-aa8b-41b2-86bc-1d21631bd85f@suse.com>
Date: Wed, 11 Nov 2026 15:20:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 01/30] x86/CPUID: introduce APX_F
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
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
In-Reply-To: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794406850-1F86F757-3B234455/10/78276251493
X-purgate-type: spam
X-purgate-size: 1797
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add basic definitions and the dependencies of the feature.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -367,6 +367,7 @@ XEN_CPUFEATURE(USER_MSR,           15*32
 XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 XEN_CPUFEATURE(AVX10,              15*32+19) /*a  AVX10 Converged Vector ISA */
+XEN_CPUFEATURE(APX_F,              15*32+21) /*   APX Foundation Instructions */
 XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -260,7 +260,7 @@ def crunch_numbers(state):
         # instruction groups which are specified to require XSAVE for state
         # management.
         XSAVE: [XSAVEOPT, XSAVEC, XGETBV1, XSAVES,
-                AVX, MPX, PKU, AMX_TILE, LWP],
+                AVX, MPX, PKU, AMX_TILE, APX_F, LWP],
 
         # AVX is taken to mean hardware support for 256bit registers (which in
         # practice depends on the VEX prefix to encode), and the instructions
@@ -283,7 +283,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
-             LKGS, MOVRS, MSRLIST, USER_MSR, MSR_IMM],
+             LKGS, MOVRS, MSRLIST, USER_MSR, MSR_IMM, APX_F],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


