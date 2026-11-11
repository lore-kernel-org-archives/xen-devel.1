Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D65606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=enpZIBA9
Received: from list by lists.xenproject.org with outflank-mailman.1483629.1686991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8ff-0004e2-Ti; Wed, 11 Nov 2026 13:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483629.1686991; Wed, 11 Nov 2026 13:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8ff-0004dv-R5; Wed, 11 Nov 2026 13:47:27 +0000
Received: by outflank-mailman (input) for mailman id 1483629;
 Wed, 11 Nov 2026 13:47:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8fd-0004cY-VZ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:47:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8fd-009h31-C2
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:47:25 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af471e2-bab6-0a2a0a5309dd-0a2a4509e99a-24
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:47:25 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af471ed-be1a-0a2a45090019-d155dd34b800-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:47:25 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48fd2e38825so1927958f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:47:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835858f26sm11564985f8f.18.2026.11.11.05.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:47:24 -0800 (PST)
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
        d=suse.com; s=google; t=1794404845; x=1795009645; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5BbqmysP+rhVmXp6WqthnQoBPLfDQhUddVUOjAy31Yk=;
        b=enpZIBA92KBCdqH1Kp8GKUk7ZriK7MDo9rO1BhCxWk0nc1/vQG0fqB4HcGfYl1ms46
         1lxlCZqao7q6r6zIMKhdQxTrfsldmB4z7mUbx9sUqL/7cWMtEkHwRqt+3fUkc0Xk2kxJ
         J6DUKMrNmg3jv2QMJSknexYbbuIPItmJsMj+3VpAarsJaszVjr1XnIz/YiENJ4hng+bF
         2TffSRxrWhyScMLtZcxFCM/EwtbQQJi/msk9vUOSytlREkeZ5Al3V9wSor7sXxwPloQZ
         5donhD3NXjztiRqc+tRg9OZa/P0+S5TbTvwuueGLj8qNx2qpIPgKVNxER/oOn4vjFpAa
         VbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404845; x=1795009645;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5BbqmysP+rhVmXp6WqthnQoBPLfDQhUddVUOjAy31Yk=;
        b=rPR8Brl41clRGC0MEoTMoC+fm0NwBzbiu3cveTMwXspko6729Z6BVBKyu9LFd2l9sw
         0Dt+T9l9gOFjHJUSTkRGVVXGXuv2M0sFxDUQWHJ1x/JKrKvLmTWKgE4Q50YCzLBYYQya
         1AW0LdlvPGCcKPHVxQ786+bUuzQDhM5ZNwOCE0NYhT49J9ULfSljeb4wwUdlzaBLIHDy
         cww/ur5yb4UF3QQsdMKcE92MMnAsXxekS7cMFs6s+q5Ji0e0QDv6b7nyTctpLqZibjPu
         kidrRvmF6G3m6vpIxgT3XzHet55cVOhoeBVWVXY7cEnoRBz4NjT2SUR7geyb8BVk10IY
         OAkw==
X-Gm-Message-State: APuU4Z/sbY0IeYcQyPXZWrzh/TCJeI+MIX9AKh6oywil2ZAYDa2TVRQI
	DhvgSbpZ5vl86QYoSHlylAtLjTPpLzVYrw9ovpbcNb+LCnxt/zklQY/QxAsrPTz/cG/hsoXZ+fN
	ytt3yiQ==
X-Gm-Gg: AYBFou2XiJBbFCkH9pLI1eLkxf0BGAJHtbBWoP13RWZ9iwCR5gCK+o5LAQqFQAmzB4E
	1QmlnBDeSy8lkm3qinhy1Ajx/1kZVn8I2GUiaa2p/autmlR5SyB5qBdNdaU1dE4jMefOH/se0FO
	f4C0MIJdlnEWNrirDY9egKNStlmKKVUllLBz9ISXW8BWYcVd4QFYzX6mARWpJEeMgCyXDThNpry
	avEn2u8GaKN02oRga9tsmJHUPICoal32Qb6SkanATxcSQ4LvVBH50XZ+qCMrygG7lt6KUQb5M+a
	poZoOLVH8+/2McOWLIKbKHNM8AMiqzAxmDNbK0IK6g/AXSapYfr1y4GQeZ9hSHwk7+PXy93enDt
	mJmO7bfk9+bkU4y8XlfiESCnZh+GcOWa5MRY4YW0o81FuW/7G9Mq6ERA2v6kQxHmn89DqpDj5gH
	5FpMvdrarNzIIf3qXaK/42ZzI0qeSBpYTcV9SCV9Jh0KDiU7cbSRcAw7xXdvMiVFAHdKA4QcCtF
	IBjjnlNtRuTEm4QsW3qBI1kUlTcXg1TCGWqW72pvI4TTcgcR99NeHEbjajnnhAT/NIuf5yV5JWr
	DbyDTxYZBL/f9ihNQ/R8hh80PWhoo5d09wRY8yhqw/xqsSHzGNvLi20WHpEfP+wPGJ0YJrMl/0i
	ruO+QPV2k7OBHSqcP
X-Received: by 2002:a05:6000:3ca:b0:491:f34b:49b4 with SMTP id ffacd0b85a97d-499c727172fmr3811444f8f.44.1794404844619;
        Wed, 11 Nov 2026 05:47:24 -0800 (PST)
Message-ID: <8580612f-c11e-4701-b3a0-43e5f16cd720@suse.com>
Date: Wed, 11 Nov 2026 14:47:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 13/19] x86emul: support AVX10.2 minmax insns
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
X-purgate-ID: tlsNG-bad1c0/1794404845-3B6D2034-FC45883D/10/78276251493
X-purgate-type: spam
X-purgate-size: 4819
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While they use new major opcodes, they are still pretty similar to
various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Update to spec version 3. Switch to using fallthrough pseudo-
    keyword.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -726,6 +726,11 @@ static const struct test avx10_2_all[] =
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
     INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
+    INSN(minmax,           66, 0f3a, 52,    vl,   sd, vl),
+    INSN(minmax,           66, 0f3a, 53,    el,   sd, el),
+    INSN(minmaxbf16,       f2, 0f3a, 52,    vl, bf16, vl),
+    INSN(minmaxph,           , 0f3a, 52,    vl, fp16, vl),
+    INSN(minmaxsh,           , 0f3a, 53,    el, fp16, el),
     INSN(mpsadbw,          f3, 0f3a, 42,    vl, d_nb, vl),
     INSN(pdpbssd,          f2, 0f38, 50,    vl,    d, vl),
     INSN(pdpbssds,         f2, 0f38, 51,    vl,    d, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2093,6 +2093,11 @@ static const struct evex {
     { { 0x44 }, 3, T, R, pfx_66, WIG, Ln }, /* vpclmulqdq */
     { { 0x50 }, 3, T, R, pfx_66, Wn, Ln }, /* vrangep{s,d} */
     { { 0x51 }, 3, T, R, pfx_66, Wn, LIG }, /* vranges{s,d} */
+    { { 0x52 }, 3, T, R, pfx_no, W0, Ln }, /* vminmaxph */
+    { { 0x52 }, 3, T, R, pfx_66, Wn, Ln }, /* vminmaxp{s,d} */
+    { { 0x52 }, 3, T, R, pfx_f2, W0, Ln }, /* vminmaxbf16 */
+    { { 0x53 }, 3, T, R, pfx_no, W0, LIG }, /* vminmaxsh */
+    { { 0x53 }, 3, T, R, pfx_66, Wn, LIG }, /* vminmaxs{s,d} */
     { { 0x54 }, 3, T, R, pfx_66, Wn, Ln }, /* vfixupimmp{s,d} */
     { { 0x55 }, 3, T, R, pfx_66, Wn, LIG }, /* vfixumpimms{s,d} */
     { { 0x56 }, 3, T, R, pfx_no, W0, Ln }, /* vreduceph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -500,6 +500,8 @@ static const struct ext0f3a_table {
     [0x4c] = { .simd_size = simd_packed_int, .four_op = 1 },
     [0x50] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x51] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x52] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x53] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x54] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x55] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x56] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
@@ -1468,6 +1470,7 @@ int x86emul_decode(struct x86_emulate_st
                 case 0x0a: /* vrndscalesh */
                 case 0x26: /* vfpclassph */
                 case 0x27: /* vfpclasssh */
+                case 0x53: /* vminmaxsh */
                 case 0x56: /* vgetmantph */
                 case 0x57: /* vgetmantsh */
                 case 0x66: /* vreduceph */
@@ -1476,6 +1479,11 @@ int x86emul_decode(struct x86_emulate_st
                         s->fp16 = true;
                     break;
 
+                case 0x52: /* vminmax{ph,bf16} */
+                    if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
+                        s->fp16 = true;
+                    break;
+
                 case 0xc2: /* vpcmp{p,s}h */
                     if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
                         s->fp16 = true;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7747,6 +7747,21 @@ x86_emulate(
         generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_int_imm8;
 
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x52): /* vminmaxbf16 $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        op_bytes = 16 << evex.lr;
+        fallthrough;
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x52): /* vminmaxph $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x53): /* vminmaxsh $imm,xmm/m16,xmm,xmm,xmm{k} */
+        generate_exception_if(vex.w, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x52): /* vminmaxp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x53): /* vminmaxs{s,d} $imm8,xmm/mem,xmm,xmm{k} */
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(b & 1);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x5c): /* vfmaddsubps {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
                                            /* vfmaddsubps {x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x5d): /* vfmaddsubpd {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */


