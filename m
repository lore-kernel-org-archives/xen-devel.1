Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE1606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d4gUB+03
Received: from list by lists.xenproject.org with outflank-mailman.1484247.1687613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA4W-0004ut-2R; Wed, 11 Nov 2026 15:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484247.1687613; Wed, 11 Nov 2026 15:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA4V-0004um-Vu; Wed, 11 Nov 2026 15:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1484247;
 Wed, 11 Nov 2026 15:17:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA4V-0004ua-I0
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:17:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA4U-00BAps-Uu
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:17:10 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af486f6-8faa-0a2a0a5109dd-0a2a45088bc2-6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:17:10 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af486f6-f659-0a2a45080019-d155dd36cd59-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:17:10 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so2800248f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:17:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4982eedfb36sm11722464f8f.0.2026.11.11.07.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:17:09 -0800 (PST)
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
        d=suse.com; s=google; t=1794410230; x=1795015030; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U+LDV8GkDOAWHBJVRQxxIHZ20u/zfhRdGlGbs0/xmQQ=;
        b=d4gUB+03eiIHRMRy06zl8xH39Omi7u3ZWVp+jZ868SebPM3VXAWGD0kcRUhyanJYvh
         nwzgaz4OvErTwgcujbkVuFl3zcO50yyOOQk74CMpUzrFUbq6yHulnk3tvvrt9xAtGNCI
         C1L0u9qLRzymwPnwFBR12BQOSqSMOso/jewAAQtKAdVIzSbCjNTp8doDFs59kBGM6fUJ
         tX5mQfj9Ct4wj/CU3cA21lYq8gpdiMKXPLfuskEiR43X6ENW6pI9NL/pnFCp8xaXBlw9
         gD5qyqaYpuh7JYmqXCx0jfBeiPWfDDgxrShywQr2QX43mTjDHU/mXJs8KRS/05rxSMTf
         Pn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410230; x=1795015030;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U+LDV8GkDOAWHBJVRQxxIHZ20u/zfhRdGlGbs0/xmQQ=;
        b=dWAqW0YhJcPU8RkNtF4eLbqo/Y/FPkvhCEQ1abdSA98vkkyBWmx4wKletnlMtJlL0p
         KT9R2J2yGKTuA21HM7K8bJVcUKwlJQRKxG3nAt80HrfYau8LapVozyJm7kHiZ49RljVi
         MEviap+gjwafG3k7ulCsnDY3uLuUKkFH1olrcKFV96cF6G5EreXqxt6M19cj7WXZviMi
         oolLsiWZeuivcsD7Ay+gPBNbDRkE/wrmGeA4qls696wzbEogP7PQVEjYwdbyBylowtr0
         BVrXLUShpVmCVa1Rc+PUYV4ETpYX3S+9pnYN3Eoyty4/U9ZBrfzKqqw08UMI7oFiBrSV
         sz/A==
X-Gm-Message-State: APuU4Z97F/Pm+cRXTGy9iQuRarzZHeI7WmypGo5m8O+FvB8DtiD33cV1
	YvzfbcYlSnlrtsBVr/2tFU+6vbhMCoOn5jdCFKzVwAhBS4MriMGgspZJ3rmimdGgADqBBTb8gzL
	XHkFBDw==
X-Gm-Gg: AYBFou3Ldl0FLYuLkzn9Dzv3uK5gLpHrAlNQiFKaM7tbxX41FrnH7R8UQEHISLc13IM
	djp+NNEdgY2oB+hzLw/9y3YSD0Nr/txO6TSAJb1iBQeTtvRvYlCmKqSk4S62frtR8ojBTaFOhUw
	+uSXYUTD/SqjwsBhtRJQzHvBgVNsYzVf8gmHGVP6z5vQ1kJiGda1pYPMRTQCiJ3xqVo5huJuQeg
	RijBQogLtT5/XyBwcziMb/tPuTBazaGyySJR83nymgCNeCO7WJUS1ze0l+7TivuVtQ504qzlMcI
	DX+hf6G2/jz5SDZru6VKUSC26MwueTYzhNJPE4TfNwoKIW9hMNGb+U60vR92jPAn606nP6BztmL
	BuFUeFzAJTGmaWCKVjdjTch/w+VDAOSFxdAt/JVMnphwY1cgbm4KIPGJVA2IILwDwUcyL+m3vwy
	l+l29uf6AVQhJCycu72g/5ooNN4Vc0RuoBwx8ppP6CfOsUJLCUE++7gc4suTZhtx6mWL6fb38mj
	UYcT9ww4Y6k7u/TOttX+F8fSgkjzcvir/fAXuuhmdG4qroA2YiaAiUYa6VmutmKG1856blox7rG
	/F1oREwaao+8jfruL9yg7zpx/Vrc1jxgJfurBxX0j2Frf1OpJRhRGp+/axPtwYgn0evV/m0oR9W
	nxgLdzZE/Xvvis3Rk
X-Received: by 2002:a05:6000:26c8:b0:48e:d88:55e2 with SMTP id ffacd0b85a97d-499c7a23565mr5091351f8f.42.1794410229781;
        Wed, 11 Nov 2026 07:17:09 -0800 (PST)
Message-ID: <fe9f6ad0-2824-4422-9dd5-b4bff2342507@suse.com>
Date: Wed, 11 Nov 2026 16:17:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 22/28] x86emul: support AMX-AVX512 insns with GPR operand
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
X-purgate-ID: tlsNG-c1860d/1794410230-CCB7187B-EE0E0B00/10/78276251493
X-purgate-type: spam
X-purgate-size: 9047
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since both tile and zmm state are accessed by these insns, this requires
introducing a new enumerator to pass into get_fpu().

As of ISE 056 the APX interaction is unclear; EVEX.V' is supposed to be
set as per the respective exception type, yet the bit needs to be clear
to be able to access eGPR-s. Respective handling is therefore guesswork
for now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1948,6 +1948,8 @@ static const struct evex {
     { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x4a, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddrst1 */
     { { 0x4a, VSIB(0) }, 3, F, R, pfx_f2, W0, L0 }, /* tileloaddrs */
+    { { 0x4a, 0xc0 }, 2, F, N, pfx_66, W0, L2 }, /* tilemovrow */
+    { { 0x4a, 0xc0 }, 2, F, N, pfx_f3, W0, L2 }, /* tcvtrowd2ps */
     { { 0x4b, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddt1 */
     { { 0x4b, VSIB(0) }, 3, F, W, pfx_f3, W0, L0 }, /* tilestored */
     { { 0x4b, VSIB(0) }, 3, F, R, pfx_f2, W0, L0 }, /* tileloadd */
@@ -1982,6 +1984,10 @@ static const struct evex {
     { { 0x66 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{b,w} */
     { { 0x67 }, 2, T, R, pfx_66, W0, Ln }, /* vcvt2ps2phx */
     { { 0x68 }, 2, T, R, pfx_f2, Wn, Ln }, /* vp2intersect{d,q} */
+    { { 0x6d, 0xc0 }, 2, F, N, pfx_no, W0, L2 }, /* tcvtrowps2phh */
+    { { 0x6d, 0xc0 }, 2, F, N, pfx_66, W0, L2 }, /* tcvtrowps2phl */
+    { { 0x6d, 0xc0 }, 2, F, N, pfx_f3, W0, L2 }, /* tcvtrowps2bf16l */
+    { { 0x6d, 0xc0 }, 2, F, N, pfx_f2, W0, L2 }, /* tcvtrowps2bf16h */
     { { 0x70 }, 2, T, R, pfx_66, W1, Ln }, /* vpshldvw */
     { { 0x71 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshldv{d,q} */
     { { 0x72 }, 2, T, R, pfx_66, W1, Ln }, /* vpshrdvw */
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -247,6 +247,10 @@ int emul_test_get_fpu(
     default:
         return X86EMUL_UNHANDLEABLE;
 
+    case X86EMUL_FPU_zmm_tile:
+        if ( !cpu_has_amx_avx512 )
+            return X86EMUL_UNHANDLEABLE;
+        fallthrough;
     case X86EMUL_FPU_tilecfg:
     case X86EMUL_FPU_tile:
         return cpu_has_amx_tile ? X86EMUL_OKAY : X86EMUL_UNHANDLEABLE;
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -249,6 +249,9 @@ void wrpkru(unsigned int val);
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
+#define cpu_has_amx_avx512          (cpu_policy.tmul.amx_avx512 && \
+                                     xcr0_mask(X86_XCR0_TILE_CFG | \
+                                               X86_XCR0_TILE_DATA))
 #define cpu_has_amx_movrs           (cpu_policy.tmul.amx_movrs && \
                                      xcr0_mask(X86_XCR0_TILE_CFG | \
                                                X86_XCR0_TILE_DATA))
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -384,7 +384,7 @@ static const struct ext0f38_table {
     [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x67] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x68] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x6c] = { .simd_size = simd_other },
+    [0x6c ... 0x6d] = { .simd_size = simd_other },
     [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x74] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x75 ... 0x76] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
@@ -1312,8 +1312,15 @@ decode_0f38(struct x86_emulate_state *s,
     case X86EMUL_OPC_VEX_F2(0, 0xf7): /* shrx */
         break;
 
+    case X86EMUL_OPC_EVEX_66(0, 0x4a): /* tileloaddrst1 / tilemovrow */
+        if ( s->modrm_mod == 3 )
+        {
+    case X86EMUL_OPC_EVEX_F3(0, 0x4a): /* tcvtrowd2ps */
+            s->desc &= ~Mov;
+            break;
+        }
+        fallthrough;
     case X86EMUL_OPC_EVEX(0, 0x49):    /* ldtilecfg */
-    case X86EMUL_OPC_EVEX_66(0, 0x4a): /* tileloaddrst1 */
     case X86EMUL_OPC_EVEX_F2(0, 0x4a): /* tileloaddrs */
     case X86EMUL_OPC_EVEX_66(0, 0x4b): /* tileloaddt1 */
     case X86EMUL_OPC_EVEX_F2(0, 0x4b): /* tileloadd */
@@ -2101,7 +2108,9 @@ int x86emul_decode(struct x86_emulate_st
             {
                 generate_exception_if(evex_encoded() && !s->evex.u,
                                       X86_EXC_UD);
-                d |= vSIB;
+
+                if ( b != 0x4a || s->modrm_mod != 3 )
+                   d |= vSIB;
             }
             s->simd_size = ext0f38_table[b].simd_size;
             if ( evex_encoded() )
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -628,6 +628,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
 #define vcpu_has_amx_fp8()     (ctxt->cpuid->tmul.amx_fp8)
+#define vcpu_has_amx_avx512()  (ctxt->cpuid->tmul.amx_avx512)
 #define vcpu_has_amx_movrs()   (ctxt->cpuid->tmul.amx_movrs)
 
 #define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -511,6 +511,12 @@ int x86emul_get_fpu(
 
     switch ( type )
     {
+    case X86EMUL_FPU_zmm_tile:
+        ASSERT(mode_64bit());
+        if ( !(state->xcr0 & X86_XCR0_TILE_CFG) ||
+             !(state->xcr0 & X86_XCR0_TILE_DATA) )
+            return X86EMUL_UNHANDLEABLE;
+        fallthrough;
     case X86EMUL_FPU_zmm:
         if ( !(state->xcr0 & X86_XCR0_ZMM) ||
              !(state->xcr0 & X86_XCR0_HI_ZMM) ||
@@ -572,6 +578,9 @@ int x86emul_get_fpu(
 
         switch ( type )
         {
+        case X86EMUL_FPU_zmm_tile:
+            xcr0_needed = X86_XCR0_TILE_DATA;
+            fallthrough;
         default:
             if ( cr0 & X86_CR0_EM )
             {
@@ -6772,6 +6781,9 @@ x86_emulate(
         goto unrecognized_insn;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4a): /* tileloaddrst1 mem,tmm */
+        if ( ea.type != OP_MEM )
+            goto tilemovrow;
+        fallthrough;
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x4a): /* tileloaddrs mem,tmm */
         generate_exception_if((evex.lr || evex.brs || evex.opmsk || !evex.RX),
                               X86_EXC_UD);
@@ -6951,6 +6963,49 @@ x86_emulate(
         generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
+    tilemovrow:                             /* tilemovrow r32,tmm,zmm */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x4a): /* tcvtrowd2ps r32,tmm,zmm */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x6d): /* tcvtrowps2phh r32,tmm,zmm */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0x6d): /* tcvtrowps2phl r32,tmm,zmm */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x6d): /* tcvtrowps2bf16l r32,tmm,zmm */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x6d): /* tcvtrowps2bf16h r32,tmm,zmm */
+        if ( ea.type != OP_REG )
+            goto unrecognized_insn;
+        vcpu_must_have(amx_avx512);
+        generate_exception_if((evex.w || evex.brs || evex.opmsk ||
+                               evex.lr != 2 ||
+                               (!evex.RX && !(state->xcr0 & X86_XCR0_APX))),
+                              X86_EXC_UD);
+
+        get_fpu(X86EMUL_FPU_zmm_tile);
+        sttilecfg(&mmvalp->tilecfg);
+
+        generate_exception_if(!tile_valid(modrm_rm, &mmvalp->tilecfg,
+                                          PALETTE(AMX)),
+                              X86_EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_rm] & 3,
+                              X86_EXC_UD);
+
+        ea.reg = decode_evex_gpr(evex.reg | (evex.RX << 4), &_regs,
+                                 &state->egpr, ctxt);
+
+        opc = init_evex(stub);
+        opc[0] = b;
+        /* Convert GPR source to %eax. */
+        evex.reg = 0xf;
+        evex.RX = 1;
+        opc[1] = modrm;
+        insn_bytes = EVEX_PFX_BYTES + 2;
+        place_ret(&opc[2]);
+
+        copy_EVEX(opc, evex);
+        invoke_stub("", "", "=g" (dummy) : "a" (*ea.reg));
+
+        put_stub(stub);
+        state->simd_size = simd_none;
+        dst.type = OP_NONE;
+        break;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4d): /* vrcp14s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4f): /* vrsqrt14s{s,d} xmm/mem,xmm,xmm{k} */
         visa_check(f);
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -87,6 +87,7 @@ enum x86_emulate_fpu_type {
     X86EMUL_FPU_zmm, /* AVX512 instruction set (%zmm0-%zmm7/31) */
     X86EMUL_FPU_tilecfg, /* AMX configuration (tilecfg) */
     X86EMUL_FPU_tile, /* AMX instruction set (%tmm0-%tmmN) */
+    X86EMUL_FPU_zmm_tile, /* AMX and AVX512/AVX10 instruction sets */
     /* This sentinel will never be passed to ->get_fpu(). */
     X86EMUL_FPU_none
 };


