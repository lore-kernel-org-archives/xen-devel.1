Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848B3606A330
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IIdBDrlv
Received: from list by lists.xenproject.org with outflank-mailman.1484217.1687586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA3J-0003MC-A1; Wed, 11 Nov 2026 15:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484217.1687586; Wed, 11 Nov 2026 15:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA3J-0003M5-4e; Wed, 11 Nov 2026 15:15:57 +0000
Received: by outflank-mailman (input) for mailman id 1484217;
 Wed, 11 Nov 2026 15:15:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA3I-0003Lq-6B
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:15:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA3H-00F2Lx-Iq
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:15:55 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af486a7-bab6-0a2a0a5309dd-0a2a450b9c20-8
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:15:55 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af486ab-b7e8-0a2a450b0019-d1558029d9ff-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:15:55 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so25987725e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:15:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08e35e44sm60478035e9.1.2026.11.11.07.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:15:54 -0800 (PST)
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
        d=suse.com; s=google; t=1794410155; x=1795014955; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ElbYy2SWjLpax67ocSNvvEnwCusUKZRr7/NrwkxGjrI=;
        b=IIdBDrlvUJm8PwEq6P0NB0TUhEAeU9Z98cGRaZXUO2om12uAxa7uNApPwrGyhy12xL
         VCHnaMp54ClE9t+uQwT2nDST8mmaqPxxQyjFN35IRCRZu2XpBtm28guCEBRp33KrnDH5
         6ZDgvyU8b5uaXEBperZGzZBxg5Al0uHnTjE96dm7QgVkQa+UyZObov2jUDYtaKE9F4Q5
         ay8+u6iJb3774wwSBWfTxt4IN4UdnrQ8LW/YX125zefhg4zFWbm0KmvV0vrOf/A7aQaK
         HHiCmtKLCP2CW1zEuvXZGaOerzDKuqQyvfin8//tM8iCt2+06POCtFDV82TOUY8saAnB
         ErTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410155; x=1795014955;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ElbYy2SWjLpax67ocSNvvEnwCusUKZRr7/NrwkxGjrI=;
        b=UsE2EZ6KqEdeL+TwAKOTl0oXmCmb9r/cXz6Os1wHk7aOK1GeyNr3HL+kvhjWBx069b
         lmzGfk8Y6xvyFH8zlxTGq7q8rAmQx0457pvzOCyI3uzVnihPtwZVXQDdcd++M5Ptarc6
         Gn6wFYsTEr/JFVQBwAqx6IY1y4xTuLmyQbI5KvDNnGzP/u1IdzAPxA+gBK9NTQLaRrzl
         Dm+8AzsFvGKjEnIQDxzeb10UpZFGlxx7x/QT2rhahl1bTJTZ75047fidUgtQRWwuDIvj
         1fOgb1ztoBeOLqWru0eE1lhUnLJoPYzFKmQnos5Ze0BpLc2z5WhpZoHtMGzq2MtDdA1J
         ZfcA==
X-Gm-Message-State: APuU4Z+hdpr4l/b16sg0tEO/3bxje1Sj3o07xegnqq6jK5abudmkyCzR
	SEIg13Di8YsVu/7kOqKYBGusjw8xHpCcsxt3bKV14Cy9F1WUU/eoiAqXfCopazZR2YvZ/x6bE4q
	qSMhovA==
X-Gm-Gg: AYBFou3mHVRSjUqN0WR7qrABirD8CZE2ZU7q+1TlbByVlZ/NXCUc3IPX+WFWhfMZXzX
	EyPHtOUwp6zLbldSr9vt+A20n8Vmi8bE2DfNmVMUlZp8/ccfQTWHgRJtzTsLLgTX2TF+xiQ+CFF
	NM+RNYBNf29WHPyv4qLfjv0aw29pJO1eu9Y/s0bmO/6VcM+Uk5HjFmcjeP3f5r6shEWnwHZLYgl
	AuMCPDt+WzakKFFNinIHrlDr5Yn0ajNiY8OEQswq7OnHH8CUl+PalOHKzZ/OLR/D4DU+Ag9rIS8
	kX/QWj6dZKTG7NA7cR/hmo6tI01q6/i4Bq7w2/Yr010Hkmq30aBn5BHPDH6/LtlTXGN0T6EdlUu
	KIDpjtXjmkzYmEVcjgGwznhpDZvNYc8kknfsHF56Nq4VXJWPS5J9ym6UNWpONSq2SrbBRVnVSVI
	rT5s3poE2gfU9S+ES38UKqiWSAHVGl9ZVNRwSkBsNbYPpsdeDWQuU1xFtdDLvyhG9nJc/Wp8FgO
	DVEQLW5CHdWp881iZ9G9E+opleIuo+J6uFyEgMAx9PSd/Q6jExbyObxZm4W63xCK+lkG/tMCyeG
	pPTZoE7UrgEDeq73RUm6l7f5xIJT7B6HKwKZKLaGxIJfafXi4mwDwBBdQzNhHWc+GpXkWaQ8iW0
	OjrzvVJFc+yQG3rrogA==
X-Received: by 2002:a05:600c:1c25:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ba093a9f02mr56022555e9.25.1794410154915;
        Wed, 11 Nov 2026 07:15:54 -0800 (PST)
Message-ID: <3e974205-eb25-4c86-952f-bd104b83e018@suse.com>
Date: Wed, 11 Nov 2026 16:15:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 19/28] x86/CPUID: TMUL subleaf 1
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
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
In-Reply-To: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794410155-AA0C59EA-991CF720/10/78276251493
X-purgate-type: spam
X-purgate-size: 10427
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

EAX holds yet another set of feature bits. Sadly some duplicate pre-
existing bits in the feature subleaves.

Note that the dependency on just AVX512F (and not AVX10) is sufficient,
as long as we synthesize AVX512* when we find AVX10 available.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The handling of the duplicated bits is minimal so far. Where / how
     the syncing between both instances should happen is tbd. The naming
     of the duplicate bits is also subject to better suggestions.
---
v4: New.

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -345,6 +345,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         CPUID_ENTRY(0x80000021, NA, CPUID_REG_ECX),
         CPUID_ENTRY(0x00000024,  1, CPUID_REG_ECX),
         CPUID_ENTRY(0x00000029,  0, CPUID_REG_EBX),
+        CPUID_ENTRY(0x0000001e,  1, CPUID_REG_EAX),
 #undef MSR_ENTRY
 #undef CPUID_ENTRY
     };
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -40,6 +40,7 @@ static const struct {
     { "CPUID 0x80000021.ecx",      "e21c" },
     { "CPUID 0x00000024:1.ecx",    "24c1" },
     { "CPUID 0x00000029:0.ebx",    "29b0" },
+    { "CPUID 0x0000001e:1.eax",    "1Ea1" },
 };
 
 #define COL_ALIGN "24"
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -218,7 +218,7 @@ static void test_cpuid_serialise_success
             .nr_leaves = 4 + 0x1d + 1 + 1,
         },
 
-        /* Leaf 0x1e serialisation stops at 0. */
+        /* Leaf 0x1e serialisation stops at max_subleaf. */
         {
             .name = "empty leaf 0x1e",
             .p = {
@@ -230,9 +230,10 @@ static void test_cpuid_serialise_success
             .name = "partial leaf 0x1e",
             .p = {
                 .basic.max_leaf = 0x1e,
+                .tmul.max_subleaf = 1,
                 .tmul.maxk = 16,
             },
-            .nr_leaves = 4 + 0x1e + 1,
+            .nr_leaves = 4 + 0x1e + 1 + 1,
         },
     };
 
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -594,6 +594,16 @@ void identify_cpu(struct cpuinfo_x86 *c)
 			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
 
+	if (cpu_has(c, X86_FEATURE_AMX_TILE) && c->cpuid_level >= 0x1e) {
+		uint32_t max_subleaf;
+
+		cpuid_count(0x1e, 0, &max_subleaf, &tmp, &tmp, &tmp);
+		if (max_subleaf >= 1)
+			cpuid_count(0x1e, 1,
+				    &c->x86_capability[FEATURESET_1Ea1],
+				    &tmp, &tmp, &tmp);
+	}
+
 	if (cpu_has(c, X86_FEATURE_AVX10) && c->cpuid_level >= 0x24) {
 		uint32_t max_subleaf;
 
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -282,6 +282,10 @@ static void recalculate_tile(struct cpu_
     p->tmul.raw[0].b &= 0x00ffffff;
     p->tmul.raw[0].c = 0,
     p->tmul.raw[0].d = 0;
+
+    p->tmul.raw[1].b = 0;
+    p->tmul.raw[1].c = 0; 
+    p->tmul.raw[1].d = 0;
 }
 
 /*
--- a/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
+++ b/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
@@ -132,7 +132,8 @@ int x86_cpuid_copy_to_buffer(const struc
 
         case 0x1e:
             for ( subleaf = 0;
-                  subleaf <= ARRAY_SIZE(p->tmul.raw) - 1; ++subleaf )
+                  subleaf <= MIN(p->tmul.max_subleaf,
+                                 ARRAY_SIZE(p->tmul.raw) - 1); ++subleaf )
                 COPY_LEAF(leaf, subleaf, &p->tmul.raw[subleaf]);
             break;
 
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -84,6 +84,7 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_e21c]      = p->extd.e21c;
     fs[FEATURESET_24c1]      = p->avx10._24c1;
     fs[FEATURESET_29b0]      = p->apx._29b0;
+    fs[FEATURESET_1Ea1]      = p->tmul._1Ea1;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -110,6 +111,7 @@ void x86_cpu_featureset_to_policy(
     p->extd.e21c             = fs[FEATURESET_e21c];
     p->avx10._24c1           = fs[FEATURESET_24c1];
     p->apx._29b0             = fs[FEATURESET_29b0];
+    p->tmul._1Ea1            = fs[FEATURESET_1Ea1];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
@@ -233,8 +235,14 @@ void x86_cpu_policy_fill_native(struct c
     }
 
     if ( p->basic.max_leaf >= 0x1e )
+    {
         cpuid_count_leaf(0x1e, 0, &p->tmul.raw[0]);
 
+        for ( i = 1; i <= MIN(p->tmul.max_subleaf,
+                              ARRAY_SIZE(p->tmul.raw) - 1); ++i )
+            cpuid_count_leaf(0x1e, i, &p->tmul.raw[i]);
+    }
+
     if ( p->basic.max_leaf >= 0x24 )
     {
         cpuid_count_leaf(0x24, 0, &p->avx10.raw[0]);
@@ -333,8 +341,12 @@ void x86_cpu_policy_clear_out_of_range_l
 
     if ( p->basic.max_leaf < 0x1e || !p->tile.max_palette ||
          (!p->feat.amx_int8 && !p->feat.amx_bf16 &&
-          !p->feat.amx_fp16 && !p->feat.amx_complex) )
+          !p->feat.amx_fp16 && !p->feat.amx_complex &&
+          !p->tmul._1Ea1) )
         memset(p->tmul.raw, 0, sizeof(p->tmul.raw));
+    else
+        zero_leaves(p->tmul.raw, p->tmul.max_subleaf + 1,
+                    ARRAY_SIZE(p->tmul.raw) - 1);
 
     if ( p->basic.max_leaf < 0x24 )
         memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
@@ -356,6 +368,8 @@ void __init x86_cpu_policy_bound_max_lea
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
     p->tile.max_palette =
         min_t(uint32_t, p->tile.max_palette, ARRAY_SIZE(p->tile.raw) - 1);
+    p->tmul.max_subleaf =
+        min_t(uint32_t, p->tmul.max_subleaf, ARRAY_SIZE(p->tmul.raw) - 1);
     p->avx10.max_subleaf =
         min_t(uint32_t, p->avx10.max_subleaf, ARRAY_SIZE(p->avx10.raw) - 1);
     p->apx.max_subleaf =
@@ -400,7 +414,12 @@ void x86_cpu_policy_shrink_max_leaves(st
     }
     p->basic.raw[0x1d] = p->tile.raw[0];
 
-    p->basic.raw[0x1e] = p->tmul.raw[0];
+    for ( i = p->tmul.max_subleaf; i; --i )
+        if ( p->tmul.raw[i].a | p->tmul.raw[i].b |
+             p->tmul.raw[i].c | p->tmul.raw[i].d )
+            break;
+    p->tmul.max_subleaf = i;
+    p->basic.raw[0x1e] = p->tmul.raw[i];
 
     p->basic.raw[0x24] = p->avx10.raw[0];
 
--- a/xen/arch/x86/lib/cpu-policy/policy.c
+++ b/xen/arch/x86/lib/cpu-policy/policy.c
@@ -41,8 +41,10 @@ int x86_cpu_policies_are_compatible(cons
             FAIL_CPUID(0x1d, 1);
     }
 
-    if ( ((guest->feat.amx_int8 || guest->feat.amx_bf16 ||
-           guest->feat.amx_fp16 || guest->feat.amx_complex) &&
+    if ( guest->tmul.max_subleaf > host->tmul.max_subleaf ||
+         ((guest->feat.amx_int8 || guest->feat.amx_bf16 ||
+           guest->feat.amx_fp16 || guest->feat.amx_complex ||
+           guest->tmul._1Ea1) &&
           (!guest->tmul.maxk || !guest->tmul.maxn)) ||
          guest->tmul.maxk > host->tmul.maxk ||
          guest->tmul.maxn > host->tmul.maxn )
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -419,6 +419,15 @@ XEN_CPUFEATURE(AVX10_V2_AUX,       19*32
 /* Intel-defined CPU features, CPUID level 0x00000029:0.ebx, word 20 */
 XEN_CPUFEATURE(APX_NCI_NDD_NF,     20*32+ 0) /*a  APX NCI/NDD/NF instruction forms */
 
+/* Intel-defined CPU features, CPUID level 0x0000001e:1.eax, word 21 */
+XEN_CPUFEATURE(AMX__INT8,          21*32+ 0) /*a  AMX-INT8 Instructions */
+XEN_CPUFEATURE(AMX__BF16,          21*32+ 1) /*a  AMX-BF16 Instructions */
+XEN_CPUFEATURE(AMX__COMPLEX,       21*32+ 2) /*a  AMX-COMPLEX Instructions */
+XEN_CPUFEATURE(AMX__FP16,          21*32+ 3) /*a  AMX-FP16 Instructions */
+XEN_CPUFEATURE(AMX_FP8,            21*32+ 4) /*   AMX-FP8 Instructions */
+XEN_CPUFEATURE(AMX_AVX512,         21*32+ 7) /*   AMX-AVX512 Instructions */
+XEN_CPUFEATURE(AMX_MOVRS,          21*32+ 8) /*   AMX-MOVRS Instructions */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -25,6 +25,7 @@
 #define FEATURESET_e21c      18 /* 0x80000021.ecx      */
 #define FEATURESET_24c1      19 /* 0x00000024:1.ecx    */
 #define FEATURESET_29b0      20 /* 0x00000029:0.ebx    */
+#define FEATURESET_1Ea1      21 /* 0x0000001e:1.eax    */
 
 struct cpuid_leaf
 {
@@ -67,7 +68,7 @@ const char *x86_cpuid_vendor_to_str(unsi
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
 #define CPUID_GUEST_NR_PALETTE    (1u + 1)
-#define CPUID_GUEST_NR_TMUL       (0u + 1)
+#define CPUID_GUEST_NR_TMUL       (1u + 1)
 #define CPUID_GUEST_NR_AVX10      (1u + 1)
 #define CPUID_GUEST_NR_APX        (0u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
@@ -293,9 +294,16 @@ struct cpu_policy
         struct cpuid_leaf raw[CPUID_GUEST_NR_TMUL];
         struct {
             /* Subleaf 0. */
-            uint32_t /* a */:32;
+            uint32_t max_subleaf;
             uint32_t maxk:8, maxn:16, :8;
             uint32_t /* c */:32, /* d */:32;
+
+            /* Subleaf 1. */
+            union {
+                uint32_t _1Ea1;
+                struct { DECL_BITFIELD(1Ea1); };
+            };
+            uint32_t /* b */:32, /* c */:32, /* d */:32;
         };
     } tmul;
 
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -302,7 +302,8 @@ def crunch_numbers(state):
         # AVX512 features are built on top of AVX512F
         AVX512F: [AVX512DQ, AVX512_IFMA, AVX512PF, AVX512ER, AVX512CD,
                   AVX512BW, AVX512VL, AVX512_4VNNIW, AVX512_4FMAPS,
-                  AVX512_VNNI, AVX512_VPOPCNTDQ, AVX512_VP2INTERSECT],
+                  AVX512_VNNI, AVX512_VPOPCNTDQ, AVX512_VP2INTERSECT,
+                  AMX_AVX512],
 
         # AVX512 extensions acting on vectors of bytes/words are made
         # dependents of AVX512BW (as to requiring wider than 16-bit mask
@@ -354,7 +355,8 @@ def crunch_numbers(state):
         # AMX-TILE means hardware support for tile registers and general non-
         # computational instructions.  All further AMX features are built on top
         # of AMX-TILE.
-        AMX_TILE: [AMX_BF16, AMX_INT8, AMX_FP16, AMX_COMPLEX],
+        AMX_TILE: [AMX_BF16, AMX_INT8, AMX_FP16, AMX_COMPLEX, AMX_FP8,
+                   AMX_AVX512, AMX_MOVRS],
 
         # APX discrete features.
         APX_F: [APX_NCI_NDD_NF],


