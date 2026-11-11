Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA56606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dGf0/KNc
Received: from list by lists.xenproject.org with outflank-mailman.1483545.1686884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8aG-0007Oi-Lh; Wed, 11 Nov 2026 13:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483545.1686884; Wed, 11 Nov 2026 13:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8aG-0007Oa-HR; Wed, 11 Nov 2026 13:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1483545;
 Wed, 11 Nov 2026 13:41:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8aF-0007OR-27
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:41:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8aE-00EjQL-BL
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:41:50 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4709e-e002-0a2a0a5209dd-0a2a4505dfa4-0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:41:50 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4709e-4cb1-0a2a45050019-d155802cb9d3-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:41:50 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so34282795e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:41:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0223c41csm145505785e9.14.2026.11.11.05.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:41:49 -0800 (PST)
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
        d=suse.com; s=google; t=1794404510; x=1795009310; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7OLf+s3Ln8uPi/inwlf42SCnDCAx9wGF3Pctmch46Lo=;
        b=dGf0/KNcX25Ykl12laRuqHsh1vJSWScfgTfagRxy2J64YC+FRqvS8NoOfSqlBCEyPr
         FcOlQoB/eeccEu0hisWa4O52jDPWbR+vZE5untYuLGRzxhLV+zkDbNhJQMcNKD/Z0UaZ
         t8DX6Otn9dYwFNnunY++EtJ5oHd+Z2BA3AfLG+knS1LWSk+3IdndHSzcFWeK+EA+fLxH
         gbPGps7jTCkecCTbBNvYt/+1Pw71Or22zZHRh6Zz3Q5IhjBRXQzWMO4/WcONOk4OpcwR
         cjxSIk6fl6QY6CUWIMTU6aWzzsv63uytTLYQ8ndpDToHyGPqw9Zb1H1r7MapXwqnstWw
         ixlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404510; x=1795009310;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7OLf+s3Ln8uPi/inwlf42SCnDCAx9wGF3Pctmch46Lo=;
        b=cpY7LV2kNTMfMYDkMrFA5E3r7PDPCSuQ0Hd7HZ6cbAtcbpcViSPSbuQasKndQxFdt6
         OqMEmQxgyepMK1f5UBGUxZefOFmIt3yqRGedd5lju1c4bTKnNgdeT/BvohQtEalZDi2I
         TSqcFqi5/flG6GAgN/DRqptM95bi6P4m5nYH8DHtaBEEF6x2f0mO953MChJq/CmeQTyQ
         xSFNMfULX18XGjBt6HSH6TDnUFpJrhlyoOUA9E8BjxzGPGMevOPbJruvStD04fmX5JGF
         26y5s6tIeXG0/SZ4pGr2S7EYoonEf+09/tR+FQvoIen6CABKGR2vmGGyKqwITwptF992
         4QpA==
X-Gm-Message-State: APuU4Z9RresEWuVNxrcBL+tygINfjmb0X2nECYfC/7OhqOw3LCxnATZv
	TSIZYyaka3RprAsA0Ob6b+yoF2FlSPppjAQcQ/FZj8md/3a0eYJsAdvRm83px6kzWbQhGhQ7Bhz
	9X42s0g==
X-Gm-Gg: AYBFou06AyilV+JLBbYA437+uBj5LoRwnhBSCrhFuNP81EhzXE3fERESjPme30RUDAX
	ZGMPSrWkqnspuwYMXC21QiQ5MGHTfrs28Bw+NgmIPlPcVFyMjVOXcn2MVGFE4NJFHHfE4PqnLI+
	2GjVIgObs1oA2Gfa9rJzb9g64MRVRzfDLC10tDNRQNuSCtKFU4JfX2NGQVqTCIyLZMOcR3d9ZUo
	gU8ndvL4RDu2IIkZomYMi2R+RCRN2QWT55TAKdXZ8rZ0UYzKdHEu1zkhoDBqifqTNd657D9VIYx
	4c+bxqgWtX69UydVpO+2sW12OsvAjJinOtaa3l4cWPZyqOyP/n5LAiadsxOUW+9fiP/uWds4aPE
	UbMg9Gsqn7JgvVeM81HxtOGfzJwTzjkbqK93GWC4lYqPyenCS4B7izPridB/LGipW2MlOsGan3V
	i48Yuextpl28uG5ZdWNiYEMS+RBdneW5PcG1N8GkkBpm99tBvampgZ9AnWOi738jVV+Pdf9k6kJ
	ULsnlmk13kM5bJO074wZak1Dmdo1KvYfRKwYn8kkzfylC+KR01uRArHBRnNpO6IYfaqB5pY0Mjm
	EgQERPR261mcSGMKX9y3w6Z+d2V0YglDlquUApPEUXLk6AiVoWznwPS+iRgQzyISO+fVrA7FjcN
	SUEqf+D+t1o6f1h5P
X-Received: by 2002:a05:600c:64c6:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ba0937fedcmr46077135e9.22.1794404509575;
        Wed, 11 Nov 2026 05:41:49 -0800 (PST)
Message-ID: <ac51260f-6109-4a76-a99a-84ca93c5035d@suse.com>
Date: Wed, 11 Nov 2026 14:41:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 01/19] x86/CPUID: enable AVX10 leaf
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
X-purgate-ID: tlsNG-c201ff/1794404510-F5AAF2A1-63D94A58/10/78276251493
X-purgate-type: spam
X-purgate-size: 13690
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This requires bumping the number of basic leaves we support. Apart from
this the logic is modeled as closely as possible after that of leaf 7
handling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The gen-cpuid.py adjustment is merely the minimum needed. It's not
really clear to me whether someone turning off e.g. AVX512BW might then
also validly expect AVX10 to be turned off.

Do we want to synthesize AVX10 in the (max?) policies when all necessary
AVX512* features are available, thus allowing migration from an AVX10
host to a suitable non-AVX10 one?

The prior vsz<N> bits are now defined as reserved-at-1: No idea yet how
to represent this properly.

How a toolstack side equivalent (if any) of the init_dom0_cpuid_policy()
change would look like is entirely unclear to me. How much should we
take from the max policy, and how much should we permit/require the user
to specify (and how would the latter look like)?

While, as per a comment next to the call site of
recalculate_cpuid_policy(), recalculate_*() are supposed to go away when
x86_cpu_policies_are_compatible() is complete, some of the checking done
in recalculate_misc() really wouldn't below there. We'd need another "is
self-consistent" checking function.
---
v4: Drop all traces of AVX10/256. Add max_subleaf check to
    x86_cpu_policies_are_compatible(). Add/adjust vsz<N> checks in
    recalculate_misc(). In the max policies, synthesize AVX512* when
    AVX10 is available.
v3: Re-base.
v2: Add logic to init_dom0_cpuid_policy(). Drop vsz128 field. Re-base.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -211,7 +211,7 @@ static void recalculate_xstate(struct cp
     if ( p->feat.mpx )
         xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
 
-    if ( p->feat.avx512f )
+    if ( p->feat.avx512f || p->feat.avx10 )
         xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
 
     if ( p->feat.pku )
@@ -272,6 +272,18 @@ static void recalculate_misc(struct cpu_
 
     p->basic.raw[0xc] = EMPTY_LEAF;
 
+    zero_leaves(p->basic.raw, 0xe, 0x23);
+
+    p->avx10.raw[0].b &= 0x000700ff;
+    p->avx10.raw[0].c = 0;
+    p->avx10.raw[0].d = 0;
+    if ( !p->feat.avx10 || !p->avx10.version ||
+         !p->avx10.vsz512 || !p->avx10.vsz256 || !p->avx10.vsz128 )
+    {
+        p->feat.avx10 = false;
+        memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
+    }
+
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
 
     /* Most of Power/RAS hidden from guests. */
@@ -407,6 +419,7 @@ static void __init guest_common_max_leav
 {
     p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
     p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
+    p->avx10.max_subleaf    = ARRAY_SIZE(p->avx10.raw) - 1;
     p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
 }
 
@@ -415,6 +428,7 @@ static void __init guest_common_default_
 {
     p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
     p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
+    p->avx10.max_subleaf    = host_cpu_policy.avx10.max_subleaf;
     p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
 }
 
@@ -510,6 +524,28 @@ static void __init guest_common_max_feat
      * function correctly when migrated here, even if ERMS isn't available.
      */
     __set_bit(X86_FEATURE_ERMS, fs);
+
+    /*
+     * AVX10 is merely a re-declaration of a combination of AVX512 features.
+     * Synthesize the latter from the former, when available.  Doing it the
+     * other way around would also require synthesizing the AVX10 CPUID leaf.
+     */
+    if ( test_bit(X86_FEATURE_AVX10, fs) )
+    {
+        __set_bit(X86_FEATURE_AVX512F, fs);
+        __set_bit(X86_FEATURE_AVX512VL, fs);
+        __set_bit(X86_FEATURE_AVX512BW, fs);
+        __set_bit(X86_FEATURE_AVX512DQ, fs);
+        __set_bit(X86_FEATURE_AVX512_BF16, fs);
+        __set_bit(X86_FEATURE_AVX512_FP16, fs);
+        __set_bit(X86_FEATURE_AVX512CD, fs);
+        __set_bit(X86_FEATURE_AVX512_BITALG, fs);
+        __set_bit(X86_FEATURE_AVX512_IFMA, fs);
+        __set_bit(X86_FEATURE_AVX512_VBMI, fs);
+        __set_bit(X86_FEATURE_AVX512_VBMI2, fs);
+        __set_bit(X86_FEATURE_AVX512_VNNI, fs);
+        __set_bit(X86_FEATURE_AVX512_VPOPCNTDQ, fs);
+    }
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
@@ -972,6 +1008,7 @@ void recalculate_cpuid_policy(struct dom
 
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
+    p->avx10.max_subleaf = min(p->avx10.max_subleaf, max->avx10.max_subleaf);
     p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
                                             ((p->x86_vendor & (X86_VENDOR_AMD |
                                                                X86_VENDOR_HYGON))
@@ -1018,6 +1055,8 @@ void recalculate_cpuid_policy(struct dom
 
     if ( p->basic.max_leaf < XSTATE_CPUID )
         __clear_bit(X86_FEATURE_XSAVE, fs);
+    if ( p->basic.max_leaf < 0x24 )
+        __clear_bit(X86_FEATURE_AVX10, fs);
 
     sanitise_featureset(fs);
 
@@ -1087,9 +1126,18 @@ void __init init_dom0_cpuid_policy(struc
     /* Apply dom0-cpuid= command line settings, if provided. */
     if ( dom0_cpuid_cmdline )
     {
+        const struct cpu_policy *max = is_pv_domain(d)
+            ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
+            : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
         uint32_t fs[FSCAPINTS];
         unsigned int i;
 
+        if ( !max )
+        {
+            ASSERT_UNREACHABLE();
+            return;
+        }
+
         x86_cpu_policy_to_featureset(p, fs);
 
         for ( i = 0; i < ARRAY_SIZE(fs); ++i )
@@ -1099,6 +1147,13 @@ void __init init_dom0_cpuid_policy(struc
         }
 
         x86_cpu_featureset_to_policy(fs, p);
+
+        /*
+         * Default-off features with their own leaves need those leaves
+         * re-populated from the max policy.
+         */
+        if ( p->feat.avx10 )
+            p->avx10 = max->avx10;
     }
 
     /*
@@ -1131,6 +1186,8 @@ static void __init __maybe_unused build_
                  sizeof(raw_cpu_policy.feat.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.xstate) !=
                  sizeof(raw_cpu_policy.xstate.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.avx10) !=
+                 sizeof(raw_cpu_policy.avx10.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.extd) !=
                  sizeof(raw_cpu_policy.extd.raw));
 }
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -226,6 +226,15 @@ void guest_cpuid(const struct vcpu *v, u
             *res = array_access_nospec(p->xstate.raw, subleaf);
             break;
 
+        case 0x24:
+            ASSERT(p->avx10.max_subleaf < ARRAY_SIZE(p->avx10.raw));
+            if ( subleaf > min_t(uint32_t, p->avx10.max_subleaf,
+                                 ARRAY_SIZE(p->avx10.raw) - 1) )
+                return;
+
+            *res = array_access_nospec(p->avx10.raw, subleaf);
+            break;
+
         default:
             *res = array_access_nospec(p->basic.raw, leaf);
             break;
--- a/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
+++ b/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
@@ -123,6 +123,13 @@ int x86_cpuid_copy_to_buffer(const struc
             break;
         }
 
+        case 0x24:
+            for ( subleaf = 0;
+                  subleaf <= MIN(p->avx10.max_subleaf,
+                                 ARRAY_SIZE(p->avx10.raw) - 1); ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->avx10.raw[subleaf]);
+            break;
+
         default:
             COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
             break;
--- a/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
+++ b/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
@@ -108,6 +108,13 @@ int x86_cpuid_copy_from_buffer(struct cp
                 array_access_nospec(p->xstate.raw, data.subleaf) = l;
                 break;
 
+            case 0x24:
+                if ( data.subleaf >= ARRAY_SIZE(p->avx10.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->avx10.raw, data.subleaf) = l;
+                break;
+
             default:
                 if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
                     goto out_of_range;
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -125,6 +125,7 @@ void x86_cpu_policy_fill_native(struct c
         switch ( i )
         {
         case 0x4: case 0x7: case 0xb: case 0xd:
+        case 0x24:
             /* Multi-invocation leaves.  Deferred. */
             continue;
         }
@@ -218,6 +219,15 @@ void x86_cpu_policy_fill_native(struct c
         }
     }
 
+    if ( p->basic.max_leaf >= 0x24 )
+    {
+        cpuid_count_leaf(0x24, 0, &p->avx10.raw[0]);
+
+        for ( i = 1; i <= MIN(p->avx10.max_subleaf,
+                              ARRAY_SIZE(p->avx10.raw) - 1); ++i )
+            cpuid_count_leaf(0x24, i, &p->avx10.raw[i]);
+    }
+
     /* Extended leaves. */
     cpuid_leaf(0x80000000U, &p->extd.raw[0]);
     for ( i = 1; i <= MIN(p->extd.max_leaf & 0xffffU,
@@ -287,6 +297,9 @@ void x86_cpu_policy_clear_out_of_range_l
                     ARRAY_SIZE(p->xstate.raw) - 1);
     }
 
+    if ( p->basic.max_leaf < 0x24 )
+        memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
+
     zero_leaves(p->extd.raw,
                 ((p->extd.max_leaf >> 16) == 0x8000
                  ? (p->extd.max_leaf & 0xffff) + 1 : 0),
@@ -299,6 +312,8 @@ void __init x86_cpu_policy_bound_max_lea
         min_t(uint32_t, p->basic.max_leaf, ARRAY_SIZE(p->basic.raw) - 1);
     p->feat.max_subleaf =
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
+    p->avx10.max_subleaf =
+        min_t(uint32_t, p->avx10.max_subleaf, ARRAY_SIZE(p->avx10.raw) - 1);
     p->extd.max_leaf = 0x80000000U | min_t(uint32_t, p->extd.max_leaf & 0xffff,
                                            ARRAY_SIZE(p->extd.raw) - 1);
 }
@@ -326,6 +341,8 @@ void x86_cpu_policy_shrink_max_leaves(st
      */
     p->basic.raw[0xd] = p->xstate.raw[0];
 
+    p->basic.raw[0x24] = p->avx10.raw[0];
+
     for ( i = p->basic.max_leaf; i; --i )
         if ( p->basic.raw[i].a | p->basic.raw[i].b |
              p->basic.raw[i].c | p->basic.raw[i].d )
--- a/xen/arch/x86/lib/cpu-policy/policy.c
+++ b/xen/arch/x86/lib/cpu-policy/policy.c
@@ -24,6 +24,10 @@ int x86_cpu_policies_are_compatible(cons
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
         FAIL_CPUID(7, 0);
 
+    if ( guest->avx10.version > host->avx10.version ||
+         guest->avx10.max_subleaf > host->avx10.max_subleaf )
+        FAIL_CPUID(0x24, 0);
+
     if ( guest->extd.max_leaf > host->extd.max_leaf )
         FAIL_CPUID(0x80000000U, NA);
 
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -366,6 +366,7 @@ XEN_CPUFEATURE(PREFETCHI,          15*32
 XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
+XEN_CPUFEATURE(AVX10,              15*32+19) /*   AVX10 Converged Vector ISA */
 XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -59,11 +59,12 @@ unsigned int x86_cpuid_lookup_vendor(uin
  */
 const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 
-#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
+#define CPUID_GUEST_NR_BASIC      (0x24u + 1)
 #define CPUID_GUEST_NR_CACHE      (5u + 1)
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
+#define CPUID_GUEST_NR_AVX10      (0u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
 #define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
@@ -264,6 +265,19 @@ struct cpu_policy
         } comp[CPUID_GUEST_NR_XSTATE];
     } xstate;
 
+    /* Structured AVX10 information leaf: 0x000000024[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_AVX10];
+        struct {
+            /* Subleaf 0. */
+            uint32_t max_subleaf;
+            uint32_t version:8, :8;
+            bool vsz128:1, vsz256:1, vsz512:1;
+            uint32_t :13;
+            uint32_t /* c */:32, /* d */:32;
+        };
+    } avx10;
+
     /* Extended leaves: 0x800000xx */
     union {
         struct cpuid_leaf raw[CPUID_GUEST_NR_EXTD];
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -294,7 +294,7 @@ def crunch_numbers(state):
         # enabled.  Certain later extensions, acting on 256-bit vectors of
         # integers, better depend on AVX2 than AVX.
         AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_INT8,
-               AVX_VNNI_INT16, SHA512, SM4],
+               AVX_VNNI_INT16, SHA512, SM4, AVX10],
 
         # AVX512F is taken to mean hardware support for 512bit registers
         # (which in practice depends on the EVEX prefix to encode) as well


