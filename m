Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C8606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Dk09X6Wh
Received: from list by lists.xenproject.org with outflank-mailman.1484155.1687523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA02-0008H5-Bh; Wed, 11 Nov 2026 15:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484155.1687523; Wed, 11 Nov 2026 15:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA02-0008Gw-8m; Wed, 11 Nov 2026 15:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1484155;
 Wed, 11 Nov 2026 15:12:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA01-0008GS-6s
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:12:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA00-00ETjz-Fz
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:12:32 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af485d3-bab6-0a2a0a5309dd-0a2a4501919a-34
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:12:29 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af485dd-5984-0a2a45010019-d1558033c489-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:12:29 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so24318805e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:12:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-499823761f5sm6555654f8f.2.2026.11.11.07.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:12:28 -0800 (PST)
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
        d=suse.com; s=google; t=1794409949; x=1795014749; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KbPa9KTVu1sGHaotzkYLjs2kMyPUeGrrYssX8ssBUbg=;
        b=Dk09X6WhjBe6gZERXvAIF/pFFVyn75p225tjWGMmCdjxVY2QtOnzQNTectBIfOeSCg
         JaKOWkOzaot+JROP0ZDZ0frjvzvelqTvI7LUjc077gmXzjAWSd3RTYSO2GnARBvcVZS0
         1ct3rp8eVdIBABMEGPkxvNvYi9rf6jLNB7Aogki/rhpGhag/zeyWlSanZE1jUwsDinae
         y55UyWFzufUQO/++9SPlVk7eOUD49OCq4Z2viwf/w8KJWIyA2rS9hhVPHDxlLul8YGt1
         9yj4KZtDhVr+yhrroN6Eo1TVN42LYOfJKCGH1fzoJSqzBVCPUWeIgBKVyd9LfDbvYnCl
         87Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409949; x=1795014749;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KbPa9KTVu1sGHaotzkYLjs2kMyPUeGrrYssX8ssBUbg=;
        b=fNh5J2KggvFF+nVnq8JV7mh/3UIEOWhHLaoPEzY7KLksBkHIuG5+qV1PFgJ9Fzv5e2
         3Bok4FPEtGnTwH1FiMuwwu7n+UpuKYhnKys7JoxmPS6JQxwYXb5nsSiV6veuj6a91x8x
         PmX+fCn99aDfHq0c3GChBaPMf25i7CvPLj911AKe5rpe5YaWphse/mpHsrSDtQQm2af1
         10OQChMZmKQyssZ5/UnBvsYHh6z/D2ABqEYIZJz7uQmeHJiSHF8Fu6/xmf+g0kf9NegQ
         udQlTiO7lnTBZvRskF8J0V7ReqmGJWwR66Pt9Pq7/ZtaqdzCVTTw5th7cdUoFCA9TQSK
         ++qA==
X-Gm-Message-State: APuU4Z//QWJzqq9QCtbGUrO0EvRpTswXsseyjxJJf8L3YDiztbEwvcFR
	Oj793LC+mErwgMuBFkPWfhQ0P6RPnD90YghJEHy9p8GMTWHQKUzP4Fj4V67YqONG5UfICbJVao/
	ONE1Klw==
X-Gm-Gg: AYBFou3Rr0Wh3iOKPL1QXemVFZeIz9zQQOa92DPU3H6uZGKYXCtOmbiqLngnT6P86Gt
	0T7cQ/yGfwyiZ+O/JwO9W6Tm+y68GLm/hfJFDw+G13JJO0dgt0AzfS1q4tdo9a8qKqiYaXOHoMt
	aIyJhyJHKyzc4fe5vWeg52Ue/p2LEgjTiuTDD6jCy/bgQWMGlxs27XV5aFgoQSxXgH7BSrKOmgH
	gCMnQpxNW58kI39zZ90WgiOJwKxmlWPfk8EhNKREzLOMKK5R0kPmfRIhp+3drmqrTUzXTJ9G37o
	HLOhTORURjOBRyL5bbFGvSMubJNfGdak+DYuyiJRSv+2GM512BThQGhzLZ/fkPc1W1xKepEs7VR
	N8H8TpOjluDfkRvn73jeg65VWgd7d1NJBt6vUnB9Pf5bodSUPFqMyIDar8oP0RH2ne7lrH6kE+Z
	cBTlnM4wz8s93bFI7ckmHS4631eqB3ywzQxuyhF+7IuW9e9zhfhHdqEB/YXDSeL/nb+7/DMESQw
	4vQyxeXtW4/C1a9g8iiBVxYjE9e9EdfPDCpkXan10jjA8zJmz+NNun4Qz7PYtDa7GwPyxRwNz32
	FIYlyQdlHOmsDhnindT2nanBCmld80rt8y+7ao8O8FJBG3ERES06nYbFWAdt1K+Qg+dxzLRF3yo
	MMhO0zgHJlQtab7ew3Q==
X-Received: by 2002:a05:600c:888d:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4ba495c2fe5mr31938525e9.9.1794409948849;
        Wed, 11 Nov 2026 07:12:28 -0800 (PST)
Message-ID: <d218f48c-a94e-4d6e-b3c1-83bffc3c8a0c@suse.com>
Date: Wed, 11 Nov 2026 16:12:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 13/28] x86emul: support TILELOADD{,T1} and TILESTORED
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
X-purgate-ID: tlsNG-d62444/1794409949-1F063757-36526A3B/10/78276251493
X-purgate-type: spam
X-purgate-size: 14847
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In order to be flexible about future growth of tile dimensions, use a
separately allocated scratch buffer to read/write individual rows of a
tile.

Note that the separate write_tilecfg() function is needed because
LDTILECFG wouldn't serve the purpose: It clears various state, unlike
XRSTOR / XRSTORC. To keep things simple, the test harness variant of it
leverages the state save/restore around library calls. To be sure the
actual data gets restored (and not init state put in place), an extra
override for the XSTATE_BV field is introduced.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Correct store de-duplication faulting behavior. Reject non-memory
    forms of the encodings. Correct invoke_stub() constraint. Use
    X86_EXC_*. Re-base, in particular also over the earlier CPUID
    adjustment.
v3: New.
---
TBD: ISA extensions document 043 doesn't clarify either way whether
     duplicate stores to the same (linear) memory ranges may get
     squashed by TILESTORED just like is documented for AVX-512
     scatters. Similar behavior was informally confirmed.

--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -76,6 +76,13 @@
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
 
+/* Base-2 logarithm */
+#define __L2(x)  (((x) & 0x00000002U) ?   1                     : 0)
+#define __L4(x)  (((x) & 0x0000000cU) ? ( 2 + __L2( (x) >> 2))  : __L2( x))
+#define __L8(x)  (((x) & 0x000000f0U) ? ( 4 + __L4( (x) >> 4))  : __L4( x))
+#define __L16(x) (((x) & 0x0000ff00U) ? ( 8 + __L8( (x) >> 8))  : __L8( x))
+#define ilog2(x) (((x) & 0xffff0000U) ? (16 + __L16((x) >> 16)) : __L16(x))
+
 #ifndef __must_check
 #define __must_check __attribute__((__warn_unused_result__))
 #endif
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1347,6 +1347,9 @@ static const struct vex {
     { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
     { { 0x49, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tilezero */
+    { { 0x4b, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddt1 */
+    { { 0x4b, VSIB(0) }, 3, F, W, pfx_f3, W0, L0 }, /* tilestored */
+    { { 0x4b, VSIB(0) }, 3, F, R, pfx_f2, W0, L0 }, /* tileloadd */
     { { 0x50 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuud */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
     { { 0x50 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsud */
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -8,6 +8,8 @@ struct cpu_policy cpu_policy;
 
 static char fpu_save_area[0x4000] __attribute__((__aligned__((64))));
 static bool use_xsave;
+/* This will be OR-ed into xstate_bv prior to restoring state. */
+static uint64_t xstate_bv_or_mask;
 
 /*
  * Re-use the area above also as scratch space for the emulator itself.
@@ -33,13 +35,19 @@ void emul_restore_fpu_state(void)
 {
     /* Older gcc can't deal with "m" array inputs; make them outputs instead. */
     if ( use_xsave )
+    {
+        *(uint64_t *)&fpu_save_area[0x200] |= xstate_bv_or_mask;
+        xstate_bv_or_mask = 0;
         asm volatile ( "xrstor %[ptr]"
                        : [ptr] "+m" (fpu_save_area)
                        : "a" (~0ul), "d" (~0ul) );
+    }
     else
         asm volatile ( "fxrstor %0" : "+m" (fpu_save_area) );
 }
 
+static void *tile_row;
+
 bool emul_test_init(void)
 {
     union {
@@ -101,6 +109,17 @@ bool emul_test_init(void)
     if ( fxs->mxcsr_mask )
         mxcsr_mask = fxs->mxcsr_mask;
 
+    if ( cpu_policy.tile.max_palette >= 1 )
+    {
+        unsigned int max_bytes = cpu_policy.tile.palette1.bytes_per_row;
+
+        if ( !cpu_policy.xstate.comp[ilog2(X86_XCR0_TILE_CFG)].offset )
+            max_bytes = 0;
+
+        if ( !max_bytes || !(tile_row = malloc(max_bytes)) )
+            cpu_policy.feat.amx_tile = false;
+    }
+
     /*
      * Mark the entire stack executable so that the stub executions
      * don't fault
@@ -255,4 +274,22 @@ void wrpkru(unsigned int val)
     pkru = val;
 }
 
+static void *get_tile_row_buf(void)
+{
+    return tile_row;
+}
+
+static void write_tilecfg(const struct x86_tilecfg *tilecfg)
+{
+    /*
+     * Leverage the fact that the wrapper (saves and) restores all extended
+     * state around the actual library call. Invoke the wrapper explicitly to
+     * make sure the compiler won't inline the call.
+     */
+    xstate_bv_or_mask = X86_XCR0_TILE_CFG;
+    __wrap_memcpy((fpu_save_area +
+                   cpu_policy.xstate.comp[ilog2(X86_XCR0_TILE_CFG)].offset),
+                  tilecfg, sizeof(*tilecfg));
+}
+
 #include "x86_emulate/x86_emulate.c"
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -208,6 +208,7 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_rtm_always_abort boot_cpu_has(X86_FEATURE_RTM_ALWAYS_ABORT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_hybrid          boot_cpu_has(X86_FEATURE_HYBRID)
+#define cpu_has_amx_tile        boot_cpu_has(X86_FEATURE_AMX_TILE)
 #define cpu_has_arch_caps       boot_cpu_has(X86_FEATURE_ARCH_CAPS)
 
 /* CPUID level 0x00000007:1.eax */
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -94,6 +94,8 @@ uint64_t get_xcr0(void);
 void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
+struct x86_tilecfg;
+void write_tilecfg(const struct x86_tilecfg *tilecfg);
 void xsave(struct vcpu *v, uint64_t mask);
 void xrstor(struct vcpu *v, uint64_t mask);
 void xstate_set_init(uint64_t mask);
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -364,6 +364,7 @@ static const struct ext0f38_table {
     [0x44] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
     [0x45 ... 0x47] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x49] = { .simd_size = simd_other, .two_op = 1 },
+    [0x4b] = { .simd_size = simd_other, .two_op = 1, .vsib = 1 },
     [0x4c] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0x4d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x4e] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
@@ -1268,6 +1269,7 @@ decode_0f38(struct x86_emulate_state *s,
         break;
 
     case X86EMUL_OPC_VEX_66(0, 0x49): /* sttilecfg */
+    case X86EMUL_OPC_VEX_F3(0, 0x4b): /* tilestored */
         s->desc = DstMem | SrcImplicit | Mov;
         break;
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -97,6 +97,77 @@ static const uint16_t _3dnow_ext_table[1
 /* Shift values between src and dst sizes of pmov{s,z}x{b,w,d}{w,d,q}. */
 static const uint8_t pmov_convert_delta[] = { 1, 2, 3, 1, 2, 1 };
 
+# ifdef __XEN__
+
+#  include <xen/cpu.h>
+#  include <xen/xvmalloc.h>
+
+static DEFINE_PER_CPU_READ_MOSTLY(void *, tile_row);
+static unsigned int __read_mostly tile_row_max_bytes;
+
+static int cf_check amx_cpu_init(struct notifier_block *nfb,
+                                 unsigned long action, void *hcpu)
+{
+    int rc = 0;
+    void **prow = &per_cpu(tile_row, (unsigned long)hcpu);
+
+    switch ( action )
+    {
+    case CPU_UP_PREPARE:
+        *prow = xvmalloc_array(uint8_t, tile_row_max_bytes);
+        if ( !*prow )
+            rc = -ENOMEM;
+        break;
+
+    case CPU_UP_CANCELED:
+    case CPU_DEAD:
+        XVFREE(*prow);
+        break;
+
+    default:
+        /* Notifier pattern */
+        break;
+    }
+
+    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+}
+
+static struct notifier_block amx_cpu_nfb = {
+    .notifier_call = amx_cpu_init,
+};
+
+static int __init cf_check amx_init(void)
+{
+    const struct cpu_policy *p = &host_cpu_policy;
+
+    if ( !cpu_has_amx_tile )
+        return 0;
+
+    if ( p->tile.max_palette >= 1 &&
+         p->tile.palette1.bytes_per_row > tile_row_max_bytes )
+        tile_row_max_bytes = p->tile.palette1.bytes_per_row;
+
+    if ( !tile_row_max_bytes )
+    {
+        setup_clear_cpu_cap(X86_FEATURE_AMX_TILE);
+        return 0;
+    }
+
+    amx_cpu_init(&amx_cpu_nfb, CPU_UP_PREPARE,
+                 (void *)(unsigned long)smp_processor_id());
+    register_cpu_notifier(&amx_cpu_nfb);
+
+    return 0;
+}
+presmp_initcall(amx_init);
+
+static void *get_tile_row_buf(void)
+{
+    return this_cpu(tile_row);
+}
+
+# endif /* __XEN__ */
+
 static void sttilecfg(struct x86_tilecfg *tilecfg)
 {
     /* sttilecfg (%rdi) */
@@ -6691,6 +6762,119 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x4b): /* tileloaddt1 mem,tmm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x4b): /* tilestored tmm,mem */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x4b): /* tileloadd mem,tmm */
+    {
+        struct x86_tilecfg *cfg = &mmvalp->tilecfg;
+        unsigned int row, iter;
+        void *data;
+
+        if ( ea.type != OP_MEM )
+            goto unrecognized_insn;
+        generate_exception_if(!mode_64bit() || vex.l || vex.w || vex.reg != 0xf,
+                              X86_EXC_UD);
+        vcpu_must_have(amx_tile);
+        get_fpu(X86EMUL_FPU_tile);
+        sttilecfg(cfg);
+        generate_exception_if(!tile_valid(modrm_reg, cfg, PALETTE(AMX)),
+                              X86_EXC_UD);
+        generate_exception_if(cfg->colsb[modrm_reg] & 3, X86_EXC_UD);
+        row = i = cfg->start_row;
+        iter = n = cfg->rows[modrm_reg];
+        generate_exception_if(i >= n, X86_EXC_UD);
+
+        /* Calculate stride. */
+        if ( state->sib_index != 4 )
+            ea.val = truncate_ea(*decode_gpr(ctxt->regs, NULL,
+                                             state->sib_index) <<
+                                 state->sib_scale);
+
+        if ( vex.pfx == vex_f3 && n > 1 )
+        {
+            /*
+             * hvmemul_linear_mmio_access() will find a cache slot based on
+             * linear address.  hvmemul_phys_mmio_access() will crash the
+             * domain if observing varying data getting written to the same
+             * cache slot.  Assume that squashing earlier writes to fully
+             * overlapping addresses is permitted and that later writes may
+             * complete before earlier faults (like for AVX-512 scatters).
+             * To maintain correct faulting behavior we need to report a low
+             * enough start_row in the event of an exception.
+             */
+            if ( !ea.val )
+                row = n - (iter = 1);
+            else if ( !(ea.val &
+                        ((1ul << ((ad_bytes - sizeof(*cfg->rows)) * 8)) - 1)) )
+            {
+                unsigned int clr = __builtin_ffsl(ea.val) - 1;
+
+                iter = 1u << (ad_bytes * 8 - clr);
+                if ( iter < n - i )
+                    row = n - (n % iter ?: iter);
+                else
+                    iter = n;
+            }
+        }
+
+        data = get_tile_row_buf();
+        switch ( cfg->palette )
+        {
+        case 1: /* AMX */
+            memset(data, -1, cp->tile.palette1.bytes_per_row);
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            generate_exception(X86_EXC_GP, 0);
+        }
+
+        /* Set up stub. */
+        opc = init_prefixes(stub);
+        opc[0] = b;
+        /* Convert memory operand to (%rax,%riz,1) */
+        vex.b = 1;
+        vex.x = 1;
+        opc[1] = modrm & 0x3f;
+        opc[2] = 0x20;
+        place_ret(&opc[3]);
+        copy_VEX(opc, vex, false);
+
+        do {
+            if ( row >= n )
+                row -= iter;
+            /* Limit rows to just as many to cover the next one to access. */
+            cfg->start_row = row;
+            cfg->rows[modrm_reg] = row + 1;
+            write_tilecfg(cfg);
+
+            if ( vex.pfx != vex_f3 )
+                rc = ops->read(ea.mem.seg,
+                               truncate_ea(ea.mem.off + i * ea.val),
+                               data, cfg->colsb[modrm_reg], ctxt);
+
+            invoke_stub("", "", "+m" (*(uint8_t(*)[64])data) : "a" (data));
+
+            if ( vex.pfx == vex_f3 )
+                rc = ops->write(ea.mem.seg,
+                                truncate_ea(ea.mem.off + i * ea.val),
+                                data, cfg->colsb[modrm_reg], ctxt);
+        } while ( rc == X86EMUL_OKAY && (++row, ++i < iter) );
+
+        put_stub(stub);
+
+        if ( rc == X86EMUL_OKAY )
+            cfg->start_row = 0;
+        else if ( vex.pfx == vex_f3 )
+            cfg->start_row = i;
+        cfg->rows[modrm_reg] = n;
+        write_tilecfg(cfg);
+
+        state->simd_size = simd_none;
+        dst.type = OP_NONE;
+        break;
+    }
+
     case X86EMUL_OPC_VEX   (0x0f38, 0x50): /* vpdpbuud [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0x50): /* vpdpbsud [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0x50): /* vpdpbssd [xy]mm/mem,[xy]mm,[xy]mm */
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -16,6 +16,7 @@
 #include <asm/i387.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
+#include <asm/x86-types.h>
 #include <asm/xstate.h>
 
 /*
@@ -1082,6 +1083,37 @@ uint64_t read_bndcfgu(void)
     return xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR ? bndcsr->bndcfgu : 0;
 }
 
+void write_tilecfg(const struct x86_tilecfg *tilecfg)
+{
+    unsigned long cr0 = read_cr0();
+    struct xsave_struct *xstate
+        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
+
+    ASSERT(cpu_has_amx_tile);
+    clts();
+
+    memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
+    xstate->xsave_hdr.xstate_bv = X86_XCR0_TILE_CFG;
+
+    if ( cpu_has_xsavec )
+    {
+        xstate->xsave_hdr.xcomp_bv = XSTATE_COMPACTION_ENABLED |
+                                     X86_XCR0_TILE_CFG;
+
+        memcpy(xstate + 1, tilecfg, sizeof(*tilecfg));
+    }
+    else
+        memcpy((void *)xstate + xstate_offset(ilog2(X86_XCR0_TILE_CFG)),
+               tilecfg, sizeof(*tilecfg));
+
+    asm volatile ( ".byte 0x0f,0xae,0x2f\n" /* xrstor */
+                   :: "m" (*xstate), "D" (xstate),
+                      "a" (X86_XCR0_TILE_CFG), "d" (0) );
+
+    if ( cr0 & X86_CR0_TS )
+        write_cr0(cr0);
+}
+
 void xstate_set_init(uint64_t mask)
 {
     unsigned long cr0 = read_cr0();


