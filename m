Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD85606A33D
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VgwgjrqT
Received: from list by lists.xenproject.org with outflank-mailman.1483602.1686956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8eD-0002ln-Ug; Wed, 11 Nov 2026 13:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483602.1686956; Wed, 11 Nov 2026 13:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8eD-0002lf-RW; Wed, 11 Nov 2026 13:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1483602;
 Wed, 11 Nov 2026 13:45:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8eC-0002kX-Ei
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:45:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8eB-00GELq-RV
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:45:55 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47188-e002-0a2a0a5209dd-0a2a4502b42c-38
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:45:55 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47193-6ca4-0a2a45020019-d155802eb9f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:45:55 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so34339065e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:45:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba09536ebfsm63430455e9.5.2026.11.11.05.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:45:54 -0800 (PST)
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
        d=suse.com; s=google; t=1794404755; x=1795009555; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=glTebN+bzp9EEDMYbWBmEB99hSUuAHt3NiVKWvepcvU=;
        b=VgwgjrqTGDoElIav1kIFzGvFBmlO7Cvz2UTQ0IKcM/rPAEXTao2K3tgV+MyoEekg1f
         yPK9Rw/mdldYQhR7RLbomg020Ue1Wq5qfPufiWZDav0fTZi/opCdVdt7MjHitTaCarbR
         A7P8lts+3l/Lfqo0ozia5Ox+Uy3l/ANmgTsx8xAkl+FUfHEtR+sRPrFbnxXfJD3o1XAC
         MPsS94tmPRp+fh+EMUuK8w/LKiu6ZQJv0GnHzeqeYAvdAeN+aCNCM6AZZnN/7Uigee98
         A+n1nfTCwVm80gcvlfq+VujR7N2KNblWpn8ncDC3oUTyvBJQH7k1rKJIx1Fr7mMvyKHY
         iYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404755; x=1795009555;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=glTebN+bzp9EEDMYbWBmEB99hSUuAHt3NiVKWvepcvU=;
        b=gix1kRHJYAxSQ0G6ip/yaQgS4j13YQ6eWJrtM5lm3TqiviIbB+IPsqftLC65ugu5mW
         rqhNw9AIDHCyiF8Bj9xJM6d8wDY8ixW3f+8BUooDXiGUif24v0VCSxn4i7nEXP8u6GuW
         Z5msGJ83mmuqaf7+eU5kL9G304ceCDmufpLAsYByUnngYmTqOKYnAI92Bcha+Ef7qBN/
         +gZ5fu8OcV4R4wow2SGReArBgq/dZJcCrJQK8C4DD7KbFnmrlnufctnjZZfjSghrJHdC
         b2ZSoa/J3TPRqD4IXSqEiHnSnWTqdSMRPXYQ1nBNEU9o+eUllAzSPSNcBhQNBtTZSSUc
         JcMA==
X-Gm-Message-State: APuU4Z8J9o1XBycLu7XvHY6AdzgujY96DSHJbgDiuTPlfy51JC4ItIEx
	TYjhonTv3z7FqV/pvzlnfXNn88uixxtTNTVbApDvodFPoyatl+aMUNym09anaGQGcJ/USZkS22O
	PPNZsVw==
X-Gm-Gg: AYBFou3R4GBHEl1ZUrZX+JtIsysfa8qV9oPLxUnSabMOnBW6dQmJJnGOdrA054g9Rl1
	RQGDKliq3gtnt/28z1Ph/ec19eaZkeeOnBTuF3qAkVb/Gdc6crZxWxK0HlXOLEcYaq84DsiobRw
	txcajUa81IVGEa4JHZw3RDLQl8xJV9qfFpePxmkd48Hy8mMPTQW+p3KVrXPtyK7eVT51NcJ40ZD
	qDaNpIYta221skjsS8xCjXcMARvRHJOhFffQKwTSATVOfbQKP/cw83Vi3NjrvI5SXTXx07lWhp4
	9Z9zjDHtOZkfCKkQ90kqnSglAa9zLIMFJJAeeWbgmDMBaURPAO5pCBwTcfBtYdWS/ACIC1IiY5F
	+YTvfnvIlJaUoxexvrjX4yalWTKu8RwEAnbLIkNgxOYFOA1/Zu5bt6v35FodoT6/7YclpgwDaui
	w20vnDGgGe6bclLc04VifgYI3iqzVTkNTRoZqIRU7k99HT/FxpmdPmq9bDt2iuEJEyV9MmWMv9y
	RJpyEbG3+BHyrYVk/ZLjlMC5wN6YRHROt1R1Z7+Laiv5QQXZvSuXhHLUeZaRIAy/HKI18G7QsE0
	TAlS+K2vyxFa3gI3Qm3A7MF60qGpxeqQ5z6eK/oG62Larm4F85760360kWe4H1/YCgh0f4im6Xc
	B4WXekyt5XCNCH/bp0w==
X-Received: by 2002:a05:600d:4121:b0:4ba:6d8:dfa8 with SMTP id 5b1f17b1804b1-4ba09392a12mr41199565e9.33.1794404755206;
        Wed, 11 Nov 2026 05:45:55 -0800 (PST)
Message-ID: <3f339c90-01aa-4009-8404-d944aae90ef3@suse.com>
Date: Wed, 11 Nov 2026 14:45:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 09/19] x86/CPUID: enable AVX10.2 sub-leaf
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
X-purgate-ID: tlsNG-720697/1794404755-674BE2AC-FFE8D377/10/78276251493
X-purgate-type: spam
X-purgate-size: 5597
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The logic is modeled as closely as possible after that of leaf 7
sub-leaf handling.

Also include AVX10-BMM right away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the "AVX10" infix is necessary everywhere, the "avx10" prefix on
the bitfield name is redundant with the containing structure's field
name (see "x86emul: support AVX10.2 media insns" for how this looks like
in actual use). Do we want to special-case this in gen-cpuid.py?
---
v5: Add AVX10.2-aux and AVX10-BMM.
v4: New.

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -343,6 +343,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         MSR_ENTRY(0x10a, CPUID_REG_EAX),
         MSR_ENTRY(0x10a, CPUID_REG_EDX),
         CPUID_ENTRY(0x80000021, NA, CPUID_REG_ECX),
+        CPUID_ENTRY(0x00000024,  1, CPUID_REG_ECX),
 #undef MSR_ENTRY
 #undef CPUID_ENTRY
     };
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -38,6 +38,7 @@ static const struct {
     { "MSR_ARCH_CAPS.lo",         "m10Al" },
     { "MSR_ARCH_CAPS.hi",         "m10Ah" },
     { "CPUID 0x80000021.ecx",      "e21c" },
+    { "CPUID 0x00000024:1.ecx",    "24c1" },
 };
 
 #define COL_ALIGN "24"
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -594,6 +594,17 @@ void identify_cpu(struct cpuinfo_x86 *c)
 			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
 
+	if (cpu_has(c, X86_FEATURE_AVX10) && c->cpuid_level >= 0x24) {
+		uint32_t max_subleaf;
+
+		cpuid_count(0x24, 0, &max_subleaf, &tmp, &tmp, &tmp);
+		if (max_subleaf >= 1)
+			cpuid_count(0x24, 1,
+				    &tmp, &tmp,
+				    &c->x86_capability[FEATURESET_24c1],
+				    &tmp);
+	}
+
 	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability)) {
 		val = rdmsr(MSR_ARCH_CAPABILITIES);
 		c->x86_capability[FEATURESET_m10Al] = val;
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -277,6 +277,9 @@ static void recalculate_misc(struct cpu_
     p->avx10.raw[0].b &= 0x000700ff;
     p->avx10.raw[0].c = 0;
     p->avx10.raw[0].d = 0;
+    p->avx10.raw[1].a = 0;
+    p->avx10.raw[1].b = 0;
+    p->avx10.raw[1].d = 0;
     if ( !p->feat.avx10 || !p->avx10.version ||
          !p->avx10.vsz512 || !p->avx10.vsz256 || !p->avx10.vsz128 )
     {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -409,6 +409,11 @@ XEN_CPUFEATURE(ITS_NO,             16*32
 XEN_CPUFEATURE(TSA_SQ_NO,          18*32+ 1) /*A  No Store Queue Transitive Scheduler Attacks */
 XEN_CPUFEATURE(TSA_L1_NO,          18*32+ 2) /*A  No L1D Transitive Scheduler Attacks */
 
+/* x86-ecosystem-defined CPU features, CPUID level 0x00000024:1.ecx, word 19 */
+XEN_CPUFEATURE(AVX10_BMM,          19*32+ 1) /*   AVX10-BMM Instructions */
+XEN_CPUFEATURE(AVX10_V1_AUX,       19*32+ 2) /*   AVX10 V1 Auxiliary Instructions */
+XEN_CPUFEATURE(AVX10_V2_AUX,       19*32+ 3) /*   AVX10 V2 Auxiliary Instructions */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -23,6 +23,7 @@
 #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
 #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
 #define FEATURESET_e21c      18 /* 0x80000021.ecx      */
+#define FEATURESET_24c1      19 /* 0x00000024:1.ecx    */
 
 struct cpuid_leaf
 {
@@ -64,7 +65,7 @@ const char *x86_cpuid_vendor_to_str(unsi
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
-#define CPUID_GUEST_NR_AVX10      (0u + 1)
+#define CPUID_GUEST_NR_AVX10      (1u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
 #define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
@@ -275,6 +276,14 @@ struct cpu_policy
             bool vsz128:1, vsz256:1, vsz512:1;
             uint32_t :13;
             uint32_t /* c */:32, /* d */:32;
+
+            /* Subleaf 1. */
+            uint32_t /* a */:32, /* b */:32;
+            union {
+                uint32_t _24c1;
+                struct { DECL_BITFIELD(24c1); };
+            };
+            uint32_t /* d */:32;
         };
     } avx10;
 
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -82,6 +82,7 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_m10Al]     = p->arch_caps.lo;
     fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
     fs[FEATURESET_e21c]      = p->extd.e21c;
+    fs[FEATURESET_24c1]      = p->avx10._24c1;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -106,6 +107,7 @@ void x86_cpu_featureset_to_policy(
     p->arch_caps.lo          = fs[FEATURESET_m10Al];
     p->arch_caps.hi          = fs[FEATURESET_m10Ah];
     p->extd.e21c             = fs[FEATURESET_e21c];
+    p->avx10._24c1           = fs[FEATURESET_24c1];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -310,6 +310,9 @@ def crunch_numbers(state):
         AVX512BW: [AVX512_VBMI, AVX512_VBMI2, AVX512_BITALG, AVX512_BF16,
                    AVX512_FP16, AVX512_BMM],
 
+        # AVX10 discrete features.
+        AVX10: [AVX10_BMM, AVX10_V1_AUX, AVX10_V2_AUX],
+
         # Extensions with VEX/EVEX encodings keyed to a separate feature
         # flag are made dependents of their respective legacy feature.
         PCLMULQDQ: [VPCLMULQDQ],


