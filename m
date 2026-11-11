Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB735606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=b2Mtm0YO
Received: from list by lists.xenproject.org with outflank-mailman.1484163.1687533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA0N-0000KN-M5; Wed, 11 Nov 2026 15:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484163.1687533; Wed, 11 Nov 2026 15:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA0N-0000KG-IF; Wed, 11 Nov 2026 15:12:55 +0000
Received: by outflank-mailman (input) for mailman id 1484163;
 Wed, 11 Nov 2026 15:12:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA0M-0000Jf-4b
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:12:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA0L-00ETnO-H5
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:12:53 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af485e6-bab6-0a2a0a5309dd-0a2a450c856c-42
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:12:53 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af485f5-f479-0a2a450c0019-d1558033b5be-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:12:53 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so36837545e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:12:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a3f4esm12481610f8f.53.2026.11.11.07.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:12:52 -0800 (PST)
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
        d=suse.com; s=google; t=1794409973; x=1795014773; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xJ0R3yxWh6S1tAlqiKO4W6J1/MXkaG1DT5AxXrJNZBg=;
        b=b2Mtm0YOfaeVLLD/bYyUh1alv1p8c7LZFCyI9LQWqqJZyVgFzjRV8zgzAv0E78CP1P
         ai55UdQcqEwh87rADnxIfwUrDuMRwQqVK/tvglTmAE5pIM6ohuV0/tbreK2+BY2NBBwE
         3ZoiGPNR940oEu7JBXPQvrEEYKUUjJG9bmaCYhOv/T782+S/Kh7k7/nIUKZwZz+DDWJV
         nKXJ8YnoR9zHGQ+Pub+yUVzGSL6Lh4dtAaEooPDKNU/iKfp7XTbtu6ch7PAYqDhR4JAM
         UqIUMTtByl9jcWMjyKHEJq1ATLO3F/7olyeVVS16WF48bGZq9D8e8TOST+dz4aBnPLE4
         k/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409973; x=1795014773;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xJ0R3yxWh6S1tAlqiKO4W6J1/MXkaG1DT5AxXrJNZBg=;
        b=KxPDSS6isWXNi5dIAao6oO3Wszfmxu4OuE3GgYdaZEuFfQCDkPvXYYP7WkwzrVn0x5
         /xCNhmbukGIPHz64Mj0jdAbyVetj6qUFSFx82W4soWvETH6hkFvl6Df6J5HZH/9YGOKO
         CvjFQS7BzZVywabWZqfFBOpxvng1zHvj5xOM2S63GOnLOQK1s3UP9WS9H36mmor30IjW
         SHWjDwBhqqb5OtPvS91jK6EmFhWrZXutGC+6UKXGkG864iaXdEbbXZV2IEvKi1f4inxN
         cEAvsTDecu84Vvsls+4aVJnK/TBUzMtgpZtI/rUB/A1RNUWOozoSvqTHQlJouuFFTNW/
         q6pQ==
X-Gm-Message-State: APuU4Z8IL+djQKB7b1Qi4I0eO3djlotf4VjqijwWDWuJ4ciTl9p+VLcu
	sJX3o2Yr0SgaTYVXsmI1swPy7zdyrrhqCE8RRslZssuvrsY5WgmGfZuJSEi9TDVihLSwwSZ4r/h
	zfmjXNg==
X-Gm-Gg: AYBFou2n02cd5fLqHy05xgMUDyISqyaV4EChRR365LhTYIAIGk99wI2rNZW8w15nJnC
	R3EZDGd/VtwraOckv/VjMoYU8+xZrvt3EJnZ1gWJ6wCcd1746urCgZ1GInHDKx3CJW/K98SxugG
	eSoJVfIjU+IoohuaMpFv4ZMDVNHlL9jVjHoMRQyYckCiUasM3EzHecYd4Etdlb3VaaVcIY52kMt
	Hhtvoge0jvIkGNrQJRS+j/wO58zpCbcGo2yguM6+A/Oc1mMT2RJ7A9wZf8MmmhZT0KWb2Ni0DsN
	DlxihX5YYJ583oQgz+wnkfBQzKM9oT1Y36H8NwEZa2nELUjJRsbpx7WsWL127adJ92PoFbtC9oo
	O5Bpqe7juWYw3I0AhA2s9WboemxyidsdnJZdTWvU/b0WYQ3d2BIaz0plVT0940f/MmWo/9xUFuk
	0mXS7S4FgX/bp0ocSqhZ5lq/4Rpj3TiIyu7mQb8sQWAFFlHO7KKQ58IdLU3p2ZUai/ovZgbJob7
	g64vP3DdB7pkaGg26Lsh2veRm66iSdP2QwK3PIORC0gP+LEMToH1E74MymYra6f8Zt7TR4BuB1y
	4GNx3Z9j0vkmXVwSS7RnJdXi1qEXdtPXnX+Bt0FK7iZ0UsdKmvlxgYBpq1ksRhOL3o3Zp/GHUFw
	zUltabcoikaKbAO677w==
X-Received: by 2002:a05:6000:470e:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-499c6027b16mr4382996f8f.18.1794409972726;
        Wed, 11 Nov 2026 07:12:52 -0800 (PST)
Message-ID: <163dcd61-aca8-4c27-9da3-4e83b489a8be@suse.com>
Date: Wed, 11 Nov 2026 16:12:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 14/28] x86emul: support tile multiplication insns
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
X-purgate-ID: tlsNG-d25034/1794409973-50520A5B-C0E08AC5/10/78276251493
X-purgate-type: spam
X-purgate-size: 7572
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since these don't allow for memory operands, the main thing to do here
is to check the large set of #UD conditions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: AMX-FP16 and AMX-COMPLEX. Comment out yet another redundant #UD
    check. Drop (wrong) use of "unimplemented_insn". Use X86_EXC_*.
    Re-base.
v3: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1363,6 +1363,14 @@ static const struct vex {
     { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastd */
     { { 0x59 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastq */
     { { 0x5a }, 2, F, R, pfx_66, W0, L1 }, /* vbroadcasti128 */
+    { { 0x5c, 0xc0 }, 2, F, N, pfx_f3, W0, L0 }, /* tdpbf16ps */
+    { { 0x5c, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tdpfp16ps */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tdpbuud */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_66, W0, L0 }, /* tdpbusd */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_f3, W0, L0 }, /* tdpbsud */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tdpbssd */
+    { { 0x6c, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tcmmrlfp16ps */
+    { { 0x6c, 0xc0 }, 2, F, N, pfx_66, W0, L0 }, /* tcmmimfp16ps */
     { { 0x72 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtneps2bf16 */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastb */
     { { 0x79 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastw */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -377,11 +377,14 @@ static const struct ext0f38_table {
     [0x59] = { .simd_size = simd_other, .two_op = 1, .d8s = 3 },
     [0x5a] = { .simd_size = simd_128, .two_op = 1, .d8s = 4 },
     [0x5b] = { .simd_size = simd_256, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x5c] = { .simd_size = simd_other },
+    [0x5e] = { .simd_size = simd_other },
     [0x62] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_bw },
     [0x63] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_bw },
     [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x67] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x68] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x6c] = { .simd_size = simd_other },
     [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x74] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x75 ... 0x76] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -606,7 +606,9 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
+#define vcpu_has_amx_bf16()    (ctxt->cpuid->feat.amx_bf16)
 #define vcpu_has_amx_tile()    (ctxt->cpuid->feat.amx_tile)
+#define vcpu_has_amx_int8()    (ctxt->cpuid->feat.amx_int8)
 #define vcpu_has_sha512()      (ctxt->cpuid->feat.sha512)
 #define vcpu_has_sm3()         (ctxt->cpuid->feat.sm3)
 #define vcpu_has_sm4()         (ctxt->cpuid->feat.sm4)
@@ -614,12 +616,14 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
+#define vcpu_has_amx_fp16()    (ctxt->cpuid->feat.amx_fp16)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
 #define vcpu_has_movrs()       (ctxt->cpuid->feat.movrs)
 #define vcpu_has_msr_imm()     (ctxt->cpuid->feat.msr_imm)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
+#define vcpu_has_amx_complex() (ctxt->cpuid->feat.amx_complex)
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6976,6 +6976,71 @@ x86_emulate(
         generate_exception_if(ea.type != OP_MEM || !vex.l || vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x5c): /* tdpbf16ps tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x5c): /* tdpfp16ps tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX   (0x0f38, 0x5e): /* tdpbuud tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x5e): /* tdpbusd tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x5e): /* tdpbsud tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x5e): /* tdpbssd tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX   (0x0f38, 0x6c): /* tcmmrlfp16ps tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x6c): /* tcmmimfp16ps tmm,tmm,tmm */
+    {
+        unsigned int vreg = vex.reg ^ 0xf;
+
+        if ( ea.type != OP_REG )
+            goto unrecognized_insn;
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, X86_EXC_UD);
+        if ( b == 0x5e )
+            vcpu_must_have(amx_int8);
+        else if ( b == 0x6c )
+            vcpu_must_have(amx_complex);
+        else if ( vex.pfx != vex_f2 )
+            vcpu_must_have(amx_bf16);
+        else
+            vcpu_must_have(amx_fp16);
+        generate_exception_if(modrm_reg == modrm_rm, X86_EXC_UD);
+        generate_exception_if(modrm_reg == vreg, X86_EXC_UD);
+        generate_exception_if(modrm_rm == vreg, X86_EXC_UD);
+
+        get_fpu(X86EMUL_FPU_tile);
+        sttilecfg(&mmvalp->tilecfg);
+
+        /* accum: modrm_reg */
+        generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg,
+                                          PALETTE(AMX)),
+                              X86_EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_reg] & 3,
+                              X86_EXC_UD);
+        /* src1: modrm_rm */
+        generate_exception_if(!tile_valid(modrm_rm, &mmvalp->tilecfg,
+                                          PALETTE(AMX)),
+                              X86_EXC_UD);
+        /*
+         * These are redundant with the checks just below.
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_rm] & 3,
+                              X86_EXC_UD);
+         * src2: vreg
+        generate_exception_if(!tile_valid(vreg, &mmvalp->tilecfg, PALETTE(AMX)),
+                              X86_EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.colsb[vreg] & 3, X86_EXC_UD);
+         */
+
+        generate_exception_if(mmvalp->tilecfg.rows[modrm_reg] !=
+                              mmvalp->tilecfg.rows[modrm_rm], X86_EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_reg] !=
+                              mmvalp->tilecfg.colsb[vreg], X86_EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_rm] !=
+                              mmvalp->tilecfg.rows[vreg] * 4, X86_EXC_UD);
+
+        generate_exception_if(mmvalp->tilecfg.colsb[vreg] >
+                              cp->tmul.maxn, X86_EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.rows[vreg] >
+                              cp->tmul.maxk, X86_EXC_UD);
+
+        op_bytes = 1; /* fake */
+        goto simd_0f_common;
+    }
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x62): /* vpexpand{b,w} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x63): /* vpcompress{b,w} [xyz]mm,[xyz]mm/mem{k} */
         visa_check(_vbmi2);


