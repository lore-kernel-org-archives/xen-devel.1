Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542FE606A327
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OuxjixrD
Received: from list by lists.xenproject.org with outflank-mailman.1483584.1686929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8cR-0001OX-26; Wed, 11 Nov 2026 13:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483584.1686929; Wed, 11 Nov 2026 13:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8cQ-0001OP-Vi; Wed, 11 Nov 2026 13:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1483584;
 Wed, 11 Nov 2026 13:44:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8cQ-0001OF-9f
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8cP-00HZTq-Mm
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:44:05 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47109-bab6-0a2a0a5309dd-0a2a450791c2-48
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:44:05 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47125-b4ea-0a2a45070019-d155802be88e-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:44:05 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so22259655e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:44:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284cce7sm11559852f8f.8.2026.11.11.05.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:44:04 -0800 (PST)
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
        d=suse.com; s=google; t=1794404644; x=1795009444; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WflNrFZKB9hg2iSWUKmvYE9hDWj4R6MlyUW/aakgZfk=;
        b=OuxjixrDIxt6rJ7NuQLAiz+nKm83TE5O1FLQmZcRIQRdFKIV5xoO5OFIDRDM1ZtBbz
         eYKwUEI5Wm+jeJUki1o557nzyPHQmJAhZsx/0/yaRVxtb40WVwOAA+qKg/qF2w6EbWRH
         s1FHUWC3sNnocroAZlDJ0n/Ekd/g1WY4Vefhax925n+adHwXN373q3jlgVNsrcXTulCC
         hYrgru0p+NwbHHamIHNeTxGFu6tcaEobIEFvbxhQqMmd4K6eE4YsHH3eP2gCfQ5asqse
         JiQ53sjeeRf3/VMg6apMxb68MNvijK48e53rucM2nTC4am8Iw2ftJymPC4k7X7PtVZJ+
         qBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404644; x=1795009444;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WflNrFZKB9hg2iSWUKmvYE9hDWj4R6MlyUW/aakgZfk=;
        b=nHzowmZYwFfw6AXHdjm2CYWCWHm3iSf3uBnet/6vG3q1m6Q4NhjsJThwYJmm3PZKip
         sLM8R1mZu2B4T2JZ2QklfrOpM51gIMdy1K3srwI024OtQCrjibRjMTNc25ZOn1WG8BJR
         ww/kgKFiSZpdxcUaYv9nLJEH5sS/qzO/268VGEzV7ty6YTpJUxNoZcZHxvSu2UJDJRh1
         bF8ULkrHRKwOOfdRmFgvK4j6tEcAoeZfL/2UxkS1qPSU4pPmvETlm5zKGqe+nY5lAAIb
         TiG4u1DOpEZFvdqfSWjdIvHXwKTggKaR3f0YKYD0pLXw8n69CV8CNhST/KlpZD91GSZK
         4oAg==
X-Gm-Message-State: APuU4Z8qzkWDJZeQLewbyU0LJDRX5i7iQm3j4VjNTi4dAcwSdh8we51F
	PBnxrJvOjLEMV4o7rPgO7zD6xC1LNq8XlZ/kMHWYWTQfZCNn+ZTlFYy/bL3hcsMrdEOS1WPMVqL
	0MXLkRg==
X-Gm-Gg: AYBFou0BNtaYX8/UP1lAl3qLA5rs8tltsdB6TCDBiItfHXuC4rhRfGBTwcVHJq7z2+z
	0OYwWtLC2w2yAkLce5N1XfnHrRavFypJh31cdhGb6Yg2fph4BvS1dD3lXfkMQxji2GW0oblrVve
	WHYjHFXGvp0yv4kSX/FC6Bp5esIkCH07Bn7s3w3+haUZY6SqZrS/GL8ZMrj5m2K3xVdY2DJeY+P
	V4rIzdT21g3s7ScVwZtNIVtjGSu2c0OCLXFQ/3DS4s9tghGfnBkXxzYX1v99Ots9hW9HAYmexZz
	hhSHrcNZ91t4ZGI59jfCnaM7Om66KbOENSJek5MOi0W1M6UmKf9F87Fzgojrd8QCZKvdORaJ77F
	IVhindZEQ/C2XMdMTmNEdEcnE7FzgxJdU4/k+F+6l1gCLwi1b3U0fQ3oXXdbsrEwXT6kJS3q+Uu
	XQJzGkqvepH3viuCTI6pXwO/r/jD6qGbeLVU2hCbmeN9M55+8GFte5UprRopeCcdUvEcxxEYvQK
	y4SvY5bslqJrfylYO7DhT/ZRTiOcxxAjvW6/XVaPsO9EF0v7/Q81FpODNw6rL3E6bf/3TytQ5RB
	TQOWxhBgZWVOMLUz/x07xLofItRf4DAOH0xS7tqF6D3fL1ahjuxRJcP5sWaw10TNxh1tUXM246+
	dz9GXorjKTLoZikoc
X-Received: by 2002:a05:600c:3b01:b0:4b7:6942:39be with SMTP id 5b1f17b1804b1-4ba0939b4c7mr44251265e9.24.1794404644325;
        Wed, 11 Nov 2026 05:44:04 -0800 (PST)
Message-ID: <0c0d9f0c-ec78-47cb-97f0-e060cefc23b7@suse.com>
Date: Wed, 11 Nov 2026 14:44:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 06/19] x86emul/test: drop cpu_has_avx512vl
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1be43887-4494-4ff5-a801-0c6bab90c80d@suse.com>
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
In-Reply-To: <1be43887-4494-4ff5-a801-0c6bab90c80d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794404645-A54C3AE4-7F4474D4/10/78276251493
X-purgate-type: spam
X-purgate-size: 2885
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AVX512VL not being a standalone feature anyway, but always needing
to be combined with some other AVX512*, replace uses of
cpu_has_avx512vl by just the feature bit check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over dropping of Xeon Phi support.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1025,7 +1025,8 @@ static void test_group(const struct test
     {
         for ( j = 0; j < nr_vl; ++j )
         {
-            if ( vl[0] == VL_512 && vl[j] != VL_512 && !cpu_has_avx512vl )
+            if ( vl[0] == VL_512 && vl[j] != VL_512 &&
+                 !cpu_policy.feat.avx512vl )
                 continue;
 
             switch ( tests[i].esz )
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -131,7 +131,7 @@ static bool simd_check_avx512f(void)
 
 static bool simd_check_avx512f_vl(void)
 {
-    return cpu_has_avx512f && cpu_has_avx512vl;
+    return cpu_has_avx512f && cpu_policy.feat.avx512vl;
 }
 #define simd_check_avx512vl_sg simd_check_avx512f_vl
 
@@ -143,7 +143,7 @@ static bool simd_check_avx512dq(void)
 
 static bool simd_check_avx512dq_vl(void)
 {
-    return cpu_has_avx512dq && cpu_has_avx512vl;
+    return cpu_has_avx512dq && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512bw(void)
@@ -154,7 +154,7 @@ static bool simd_check_avx512bw(void)
 
 static bool simd_check_avx512bw_vl(void)
 {
-    return cpu_has_avx512bw && cpu_has_avx512vl;
+    return cpu_has_avx512bw && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512vbmi(void)
@@ -164,7 +164,7 @@ static bool simd_check_avx512vbmi(void)
 
 static bool simd_check_avx512vbmi_vl(void)
 {
-    return cpu_has_avx512_vbmi && cpu_has_avx512vl;
+    return cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512vbmi2(void)
@@ -260,7 +260,7 @@ static bool simd_check_avx512fp16(void)
 
 static bool simd_check_avx512fp16_vl(void)
 {
-    return cpu_has_avx512_fp16 && cpu_has_avx512vl;
+    return cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl;
 }
 
 static void simd_set_regs(struct cpu_user_regs *regs)
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -181,8 +181,6 @@ void wrpkru(unsigned int val);
 #define cpu_has_sha                  cpu_policy.feat.sha
 #define cpu_has_avx512bw            (cpu_policy.feat.avx512bw && \
                                      xcr0_mask(0xe6))
-#define cpu_has_avx512vl            (cpu_policy.feat.avx512vl && \
-                                     xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi         (cpu_policy.feat.avx512_vbmi && \
                                      xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi2        (cpu_policy.feat.avx512_vbmi2 && \


