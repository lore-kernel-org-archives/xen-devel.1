Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E112D606A331
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UCH9WIno
Received: from list by lists.xenproject.org with outflank-mailman.1483721.1687074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9CR-0007kI-BH; Wed, 11 Nov 2026 14:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483721.1687074; Wed, 11 Nov 2026 14:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9CR-0007kB-7t; Wed, 11 Nov 2026 14:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1483721;
 Wed, 11 Nov 2026 14:21:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9CP-0007jq-Ja
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:21:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9CP-00EKcj-0P
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:21:17 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af479c8-bab6-0a2a0a5309dd-0a2a45059c5e-48
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:21:16 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af479dc-4cb1-0a2a45050019-d155802bc16e-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:21:16 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so20720325e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:21:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01fe2c5asm219346005e9.5.2026.11.11.06.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:21:15 -0800 (PST)
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
        d=suse.com; s=google; t=1794406876; x=1795011676; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t4ILqBhaZ7bQTm1WQpT8wEWQPQ4i8TREUn6rrui/tyA=;
        b=UCH9WIno9ou7P/2RSIhE62MIlONNZMfOcynQEFiAHIOOs2zrRjLKTZ9ckdQtw/vl7r
         8Ely1+ggbNbQpBw7TOADXiz9MxRBWKGpZwB+UoE3/n197xaaYuM32dVyRoxezDhSbOaZ
         kUZwMrpakFUIFJCIpH8N8cm9HSVlm43WndkvMxyUejFR99kSMSEyLV4oAK9csxQuJ6g/
         BMmL+3QZg0QE/l3Buw+rqjPCbZq05AySuv0FyaYzN+36yqCQKokQJd5cjtyJvwhx76Z0
         aAnndQ0yvZ/FDflxHKk9Gtm8zvcjS+eaehwQ/K0TzKcSyA1zvwGOXdYOsiSuQuqmHAmn
         38Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406876; x=1795011676;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t4ILqBhaZ7bQTm1WQpT8wEWQPQ4i8TREUn6rrui/tyA=;
        b=X0HxBCkaX/AubseO3OErMt62SVoYsJG9OXsTRcFtCHF7o/8hz3ch7rlHH74O/lEdo9
         ZS/aY4n8/fvEpD0Ak90K6b+6xmNVDx3GqS/qriNir4wqzCZLX5xP8gnitEpStBEo+Ihr
         mX6E62IDoUR3ynMFj1Nr7SGlOcnOBACvvyill8Et53WzqtrJLY6UxNFEC+wwDslIYsj+
         tXufnU5I/WhmozM4nt+zPtcWOaVdXK+B8OhW75DcoZg7h0d9xDmrIq+Z2NvoL4X5agpl
         bsvulMl/6dhLILbqON0OtqB1oec4rVrwzU2OwQDIo5EKW2ce/owZhWT8P+Xmkm6z6m5X
         6NSA==
X-Gm-Message-State: APuU4Z+AOKFnfJCgVLHwIkmDigNj/dgPB2pyWc8VQYOHDnGjWnODdBbZ
	q16tOjB4GdauISvWotWx7ixF0AGB53mYnbeq98EsMjFZ+il1Kwv2PBIO1C/2YT0DfMXSFCO60Rv
	AAJbhhw==
X-Gm-Gg: AYBFou24gSlI0uX88fG0fude8Qf4CPhF51JgqVdyKMpa9lVssh2+sWjpxaluNGBJ+4+
	fuMT4Kg+pKhb8sQQLQ6KObJeDXWnBlg+eUFFfOVb9bXYBQV/xLT4TDmoX9jgbNQE4z77UJjB1yn
	wnPLV2qJYzwk5JrE1Nx5QpoqFlL0Yoq4EEFMutKUEamQbFF89Bc6mkcpdHWC5PbUZJl7invi52a
	qXUnNQT8TNbMHunDkOyFExWMTyt0m3EtvkRHnjEUR3/oHQHY5744RIfLVyssa6jKG3azZknRO9G
	yXJ2ir9jtUYS9gr2s5BhybmPuwmjA5jMvBPLjpSnZ2kSnOVsk/oy4a6l/nS0e/82/0cOnxq8Z6P
	D45a6S/QRJqAiCQHVvvYp/XyKaIKqM6zN0x5dZLql0dLxInQfeSrkUAB5Uy/ZoziaUb8Pmk9/vJ
	KEyrFqwzzbVsAnKcnfjBvvxCqfU7ZpYW0YKtBxNcAbf1Bb5cOsZwvDQDkG/f58XYmkFcOIwAfC7
	BPDWOIluNmwufTFLCa/s929xk3JiOAhZL8AS5hMQWKVL9s1xhpjOdIqQUyjRgTZG7HnUbHVmHTy
	FFOAcv4tDQLT1p32hUmxUNfIsjuMk+vzhLLR2EmiuZbl6NPil/a/gT5NserbSTvkjshf2gGn6zO
	yBreNe2U6STUXgi3IrNYq7enbp1Rw4Wr8zUuO5g==
X-Received: by 2002:a05:600c:e545:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ba093bdb35mr35150355e9.26.1794406876303;
        Wed, 11 Nov 2026 06:21:16 -0800 (PST)
Message-ID: <160681f6-5c72-4319-93cb-3a15ef5b9ca1@suse.com>
Date: Wed, 11 Nov 2026 15:21:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 02/30] x86/CPUID: enable APX sub-leaf
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
X-purgate-ID: tlsNG-c201ff/1794406876-251182A1-ADB7526A/10/78276251493
X-purgate-type: spam
X-purgate-size: 11971
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The logic is modeled as closely as possible after that of leaf 7 and AVX10
sub-leaf handling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -344,6 +344,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         MSR_ENTRY(0x10a, CPUID_REG_EDX),
         CPUID_ENTRY(0x80000021, NA, CPUID_REG_ECX),
         CPUID_ENTRY(0x00000024,  1, CPUID_REG_ECX),
+        CPUID_ENTRY(0x00000029,  0, CPUID_REG_EBX),
 #undef MSR_ENTRY
 #undef CPUID_ENTRY
     };
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -39,6 +39,7 @@ static const struct {
     { "MSR_ARCH_CAPS.hi",         "m10Ah" },
     { "CPUID 0x80000021.ecx",      "e21c" },
     { "CPUID 0x00000024:1.ecx",    "24c1" },
+    { "CPUID 0x00000029:0.ebx",    "29b0" },
 };
 
 #define COL_ALIGN "24"
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -605,6 +605,11 @@ void identify_cpu(struct cpuinfo_x86 *c)
 				    &tmp);
 	}
 
+	if (cpu_has(c, X86_FEATURE_APX_F) && c->cpuid_level >= 0x29)
+		cpuid_count(0x29, 0, &tmp,
+			    &c->x86_capability[FEATURESET_29b0],
+			    &tmp, &tmp);
+
 	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability)) {
 		val = rdmsr(MSR_ARCH_CAPABILITIES);
 		c->x86_capability[FEATURESET_m10Al] = val;
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -287,6 +287,13 @@ static void recalculate_misc(struct cpu_
         memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
     }
 
+    zero_leaves(p->basic.raw, 0x25, 0x28);
+
+    p->apx.raw[0].c = 0;
+    p->apx.raw[0].d = 0;
+    if ( !p->feat.apx_f )
+        memset(p->apx.raw, 0, sizeof(p->apx.raw));
+
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
 
     /* Most of Power/RAS hidden from guests. */
@@ -423,6 +430,7 @@ static void __init guest_common_max_leav
     p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
     p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
     p->avx10.max_subleaf    = ARRAY_SIZE(p->avx10.raw) - 1;
+    p->apx.max_subleaf      = ARRAY_SIZE(p->apx.raw) - 1;
     p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
 }
 
@@ -432,6 +440,7 @@ static void __init guest_common_default_
     p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
     p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
     p->avx10.max_subleaf    = host_cpu_policy.avx10.max_subleaf;
+    p->apx.max_subleaf      = host_cpu_policy.apx.max_subleaf;
     p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
 }
 
@@ -1043,6 +1052,7 @@ void recalculate_cpuid_policy(struct dom
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
     p->avx10.max_subleaf = min(p->avx10.max_subleaf, max->avx10.max_subleaf);
+    p->apx.max_subleaf  = min(p->apx.max_subleaf, max->apx.max_subleaf);
     p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
                                             ((p->x86_vendor & (X86_VENDOR_AMD |
                                                                X86_VENDOR_HYGON))
@@ -1091,6 +1101,8 @@ void recalculate_cpuid_policy(struct dom
         __clear_bit(X86_FEATURE_XSAVE, fs);
     if ( p->basic.max_leaf < 0x24 )
         __clear_bit(X86_FEATURE_AVX10, fs);
+    if ( p->basic.max_leaf < 0x29 )
+        __clear_bit(X86_FEATURE_APX_F, fs);
 
     sanitise_featureset(fs);
 
@@ -1188,6 +1200,8 @@ void __init init_dom0_cpuid_policy(struc
          */
         if ( p->feat.avx10 )
             p->avx10 = max->avx10;
+        if ( p->feat.apx_f )
+            p->apx = max->apx;
     }
 
     /*
@@ -1222,6 +1236,8 @@ static void __init __maybe_unused build_
                  sizeof(raw_cpu_policy.xstate.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.avx10) !=
                  sizeof(raw_cpu_policy.avx10.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.apx) !=
+                 sizeof(raw_cpu_policy.apx.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.extd) !=
                  sizeof(raw_cpu_policy.extd.raw));
 }
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -235,6 +235,15 @@ void guest_cpuid(const struct vcpu *v, u
             *res = array_access_nospec(p->avx10.raw, subleaf);
             break;
 
+        case 0x29:
+            ASSERT(p->apx.max_subleaf < ARRAY_SIZE(p->apx.raw));
+            if ( subleaf > min_t(uint32_t, p->apx.max_subleaf,
+                                 ARRAY_SIZE(p->apx.raw) - 1) )
+                return;
+
+            *res = array_access_nospec(p->apx.raw, subleaf);
+            break;
+
         default:
             *res = array_access_nospec(p->basic.raw, leaf);
             break;
--- a/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
+++ b/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
@@ -130,6 +130,13 @@ int x86_cpuid_copy_to_buffer(const struc
                 COPY_LEAF(leaf, subleaf, &p->avx10.raw[subleaf]);
             break;
 
+        case 0x29:
+            for ( subleaf = 0;
+                  subleaf <= MIN(p->apx.max_subleaf,
+                                 ARRAY_SIZE(p->apx.raw) - 1); ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->apx.raw[subleaf]);
+            break;
+
         default:
             COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
             break;
--- a/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
+++ b/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
@@ -115,6 +115,13 @@ int x86_cpuid_copy_from_buffer(struct cp
                 array_access_nospec(p->avx10.raw, data.subleaf) = l;
                 break;
 
+            case 0x29:
+                if ( data.subleaf >= ARRAY_SIZE(p->apx.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->apx.raw, data.subleaf) = l;
+                break;
+
             default:
                 if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
                     goto out_of_range;
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -83,6 +83,7 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
     fs[FEATURESET_e21c]      = p->extd.e21c;
     fs[FEATURESET_24c1]      = p->avx10._24c1;
+    fs[FEATURESET_29b0]      = p->apx._29b0;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -108,6 +109,7 @@ void x86_cpu_featureset_to_policy(
     p->arch_caps.hi          = fs[FEATURESET_m10Ah];
     p->extd.e21c             = fs[FEATURESET_e21c];
     p->avx10._24c1           = fs[FEATURESET_24c1];
+    p->apx._29b0             = fs[FEATURESET_29b0];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
@@ -127,7 +129,7 @@ void x86_cpu_policy_fill_native(struct c
         switch ( i )
         {
         case 0x4: case 0x7: case 0xb: case 0xd:
-        case 0x24:
+        case 0x24: case 0x29:
             /* Multi-invocation leaves.  Deferred. */
             continue;
         }
@@ -230,6 +232,15 @@ void x86_cpu_policy_fill_native(struct c
             cpuid_count_leaf(0x24, i, &p->avx10.raw[i]);
     }
 
+    if ( p->basic.max_leaf >= 0x29 )
+    {
+        cpuid_count_leaf(0x29, 0, &p->apx.raw[0]);
+
+        for ( i = 1; i <= MIN(p->apx.max_subleaf,
+                              ARRAY_SIZE(p->apx.raw) - 1); ++i )
+            cpuid_count_leaf(0x24, i, &p->apx.raw[i]);
+    }
+
     /* Extended leaves. */
     cpuid_leaf(0x80000000U, &p->extd.raw[0]);
     for ( i = 1; i <= MIN(p->extd.max_leaf & 0xffffU,
@@ -302,6 +313,9 @@ void x86_cpu_policy_clear_out_of_range_l
     if ( p->basic.max_leaf < 0x24 )
         memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
 
+    if ( p->basic.max_leaf < 0x29 )
+        memset(p->apx.raw, 0, sizeof(p->apx.raw));
+
     zero_leaves(p->extd.raw,
                 ((p->extd.max_leaf >> 16) == 0x8000
                  ? (p->extd.max_leaf & 0xffff) + 1 : 0),
@@ -316,6 +330,8 @@ void __init x86_cpu_policy_bound_max_lea
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
     p->avx10.max_subleaf =
         min_t(uint32_t, p->avx10.max_subleaf, ARRAY_SIZE(p->avx10.raw) - 1);
+    p->apx.max_subleaf =
+        min_t(uint32_t, p->apx.max_subleaf, ARRAY_SIZE(p->apx.raw) - 1);
     p->extd.max_leaf = 0x80000000U | min_t(uint32_t, p->extd.max_leaf & 0xffff,
                                            ARRAY_SIZE(p->extd.raw) - 1);
 }
@@ -345,6 +361,8 @@ void x86_cpu_policy_shrink_max_leaves(st
 
     p->basic.raw[0x24] = p->avx10.raw[0];
 
+    p->basic.raw[0x29] = p->apx.raw[0];
+
     for ( i = p->basic.max_leaf; i; --i )
         if ( p->basic.raw[i].a | p->basic.raw[i].b |
              p->basic.raw[i].c | p->basic.raw[i].d )
--- a/xen/arch/x86/lib/cpu-policy/policy.c
+++ b/xen/arch/x86/lib/cpu-policy/policy.c
@@ -28,6 +28,9 @@ int x86_cpu_policies_are_compatible(cons
          guest->avx10.max_subleaf > host->avx10.max_subleaf )
         FAIL_CPUID(0x24, 0);
 
+    if ( guest->apx.max_subleaf > host->apx.max_subleaf )
+        FAIL_CPUID(0x29, 0);
+
     if ( guest->extd.max_leaf > host->extd.max_leaf )
         FAIL_CPUID(0x80000000U, NA);
 
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -416,6 +416,9 @@ XEN_CPUFEATURE(AVX10_BMM,          19*32
 XEN_CPUFEATURE(AVX10_V1_AUX,       19*32+ 2) /*a  AVX10 V1 Auxiliary Instructions */
 XEN_CPUFEATURE(AVX10_V2_AUX,       19*32+ 3) /*a  AVX10 V2 Auxiliary Instructions */
 
+/* Intel-defined CPU features, CPUID level 0x00000029:0.ebx, word 20 */
+XEN_CPUFEATURE(APX_NCI_NDD_NF,     20*32+ 0) /*a  APX NCI/NDD/NF instruction forms */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -24,6 +24,7 @@
 #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
 #define FEATURESET_e21c      18 /* 0x80000021.ecx      */
 #define FEATURESET_24c1      19 /* 0x00000024:1.ecx    */
+#define FEATURESET_29b0      20 /* 0x00000029:0.ebx    */
 
 struct cpuid_leaf
 {
@@ -60,12 +61,13 @@ unsigned int x86_cpuid_lookup_vendor(uin
  */
 const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 
-#define CPUID_GUEST_NR_BASIC      (0x24u + 1)
+#define CPUID_GUEST_NR_BASIC      (0x29u + 1)
 #define CPUID_GUEST_NR_CACHE      (5u + 1)
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
 #define CPUID_GUEST_NR_AVX10      (1u + 1)
+#define CPUID_GUEST_NR_APX        (0u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
 #define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
@@ -287,6 +289,20 @@ struct cpu_policy
         };
     } avx10;
 
+    /* Structured APX information leaf: 0x000000029[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_APX];
+        struct {
+            /* Subleaf 0. */
+            uint32_t max_subleaf;
+            union {
+                uint32_t _29b0;
+                struct { DECL_BITFIELD(29b0); };
+            };
+            uint32_t /* c */:32, /* d */:32;
+        };
+    } apx;
+
     /* Extended leaves: 0x800000xx */
     union {
         struct cpuid_leaf raw[CPUID_GUEST_NR_EXTD];
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -355,6 +355,9 @@ def crunch_numbers(state):
         # computational instructions.  All further AMX features are built on top
         # of AMX-TILE.
         AMX_TILE: [AMX_BF16, AMX_INT8, AMX_FP16, AMX_COMPLEX],
+
+        # APX discrete features.
+        APX_F: [APX_NCI_NDD_NF],
     }
 
     deep_features = tuple(sorted(deps.keys()))


