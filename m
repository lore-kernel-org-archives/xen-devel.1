Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D80606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Zfp9zNHO
Received: from list by lists.xenproject.org with outflank-mailman.1483667.1687029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8h3-0007Ir-22; Wed, 11 Nov 2026 13:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483667.1687029; Wed, 11 Nov 2026 13:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8h2-0007Ik-UZ; Wed, 11 Nov 2026 13:48:52 +0000
Received: by outflank-mailman (input) for mailman id 1483667;
 Wed, 11 Nov 2026 13:48:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8h1-0007H0-Lu
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:48:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8h1-009hPR-2a
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:48:51 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4722f-bab6-0a2a0a5309dd-0a2a450487ac-18
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:51 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47242-b57f-0a2a45040019-d1558035dcbc-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:51 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so38924205e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:48:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08ddbe68sm102118195e9.0.2026.11.11.05.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:48:50 -0800 (PST)
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
        d=suse.com; s=google; t=1794404930; x=1795009730; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5rzNCWgY8CGE4US4gfGIQCW48+lVwE62awUKswGct44=;
        b=Zfp9zNHOUqvGsHTcWfybjJg6gss2R+lKjyp6BkzOxtH02zZ3mcFGpQ5lpl+aZ6+xu2
         x/jKvfNqbS6CKDip3ws0xKCdwLEIHE19XB0/m3dG0imkop0sUjpVsEexjl/4stHuryxC
         YP8YUSVFTNla0HqkAlU6AhotB2VwDPud5wz2lGEdJR44+2KW+kz5bbGIxjG7c+3UrrnP
         8cyeJnSJmlUvT5fGTB/p2sxs0iwJoZ0mQkEOHK8VYWuX7pY5YF8Psr8nX3mB4YWkubuO
         dD5UiN/l4mLkX//NhspV/tYt0tB2VBCjq+LM8jZeCTsi1Fuvl67tg2t6EO8s+H/pVFsY
         tS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404930; x=1795009730;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5rzNCWgY8CGE4US4gfGIQCW48+lVwE62awUKswGct44=;
        b=lMpFhZjEow+WSbh5oAddZGXn2kp3TwRMNzx3ezLQxAj0zgP8x79m4rFqYdPUCbqm+N
         uNklnp3f1YRk1FcyrmC0DQbw9mZD/EjH1DojajTsq+xV8XYzLTEJ1P5GkgMDyp9vxhKa
         mtGa5DzPIKjykiNw+t87p9AXDPFuw8dCWO9x8qByC93w8U0Jy2A4gqyuaucap470AJyt
         3e+FXc1MDo652qilMClqXB4WAi3tQPEP3lPrRtBu9nA9ZqDDByii/j0qDYOaeRm8Xvj+
         dLGp59elzPbl8Cfg3lJrS78Wjurv1p0MsqZiIIMfQvdhOmv5HLVbYTvpeYPR1pirdbPi
         ZIpg==
X-Gm-Message-State: APuU4Z8sB7tueJrBbke8PQc9TH0xsIZs+/m0wFvaDC8N1L4aewPDn+Wy
	hfZX7AmxwD5twD7w8TBUj4aAfy55R1PHc8uTyHF15zwMt1BTXHDLn0zhAYgC1O50IREhE31GFLJ
	yFpuNvA==
X-Gm-Gg: AYBFou2FDJJ/M5biCUEpt3UvbXQsamVy9ENxLljYdIEq/9a0aomFwIe8HX3hXZzyGH+
	6v8bz8VokIVtbUm6FTQZ9jVWPzP/y6mrePfMwznTxsCMxpDLanRbWugkL8iVGyulJB3X+4+b0pE
	ReTfTZp5+rGM0RDiSVq2BC/6qHzanIAMmhVY+CfI/COGWSeksnlQGYCiAw7xHYAFmPfXcG24etD
	e/o63l78CG5CC58fC79t78GObsUA9kd5DYsFpMJ4zr7LsPn2E2iQwNskkBR6cRP+kCmS+muD3nE
	yJjlwzfv6u/JPOWKnJX6IxRmp6beV66V2XUCU2pFq1iqOzGIJjY1wsmpedWqYYlNoS6erkteExg
	5WGgsWGouXdjRiaGtbVZezpCTqJGfZzCz8HUEUI4Gr+9qqKRtIcGRfWbab8vexXLImlp7InLpfh
	Er5Y6QyIH7iI7vM9io8LOLk8m2HlNeGKG5/hKuJIKRGvoWm0e9Ee1PkorTtljQBwjCqhjT8mfSN
	SfxJ/3f7/j17w6JOhN43fo8Gf2iLnR3woN4Q4ragTL3P4acVe04UtUr4X2b8RbMAGE43zJCiwZZ
	RJjGw49+Wxf3y/C59Nkl/H9Lj7gUxoOACg4Rviy3hEIPTK7iYHyAV1nHBzXhIfYq9fTbhD4JLgI
	mql1iT10qNtgJU/8C9Q==
X-Received: by 2002:a05:600c:a00c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ba0931d8a3mr47410995e9.4.1794404930419;
        Wed, 11 Nov 2026 05:48:50 -0800 (PST)
Message-ID: <f029f34b-df9e-4600-aeeb-e1117e27c477@suse.com>
Date: Wed, 11 Nov 2026 14:48:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 17/19] x86emul: support AVX10.2-aux misc insns
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
X-purgate-ID: tlsNG-ebf023/1794404931-C36C2B50-2B293874/10/78276251493
X-purgate-type: spam
X-purgate-size: 6552
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VPMOVSSDB is a counterpart to VPMOVSDB, so handle it the same.

VUNPACKB otoh is regular (without fault suppression or broadcast) as to
its memory operand, and hence straightforward to handle.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v5: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -821,6 +821,11 @@ static const struct test avx10_2_128[] =
     INSN(movw, f3, map5, 7e, el, fp16, el),
 };
 
+static const struct test avx10_2_aux_all[] = {
+    INSN(pmovssdb,       f3, 0f38, 41, vl_4,    b, vl),
+    INSN(unpackb,          , 0f3a, 3d,   vl,    b, vl),
+};
+
 static const struct test movrs_all[] = {
     INSN(movrsb, f2, map5, 6f, vl,    b, vl),
     INSN(movrsd, f3, map5, 6f, vl, d_nb, vl),
@@ -1258,4 +1263,6 @@ void evex_disp8_test(void *instr, struct
 
     run(cpu_has_avx10_2, avx10_2, all);
     run(cpu_has_avx10_2, avx10_2, 128);
+
+    run(cpu_has_avx10_2_aux, avx10_2_aux, all);
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1917,6 +1917,7 @@ static const struct evex {
     { { 0x3e }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxuw */
     { { 0x3f }, 2, T, R, pfx_66, Wn, Ln }, /* vpmaxu{d,q} */
     { { 0x40 }, 2, T, R, pfx_66, Wn, Ln }, /* vpmull{d,q} */
+    { { 0x41 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovssdb */
     { { 0x42 }, 2, T, R, pfx_66, Wn, Ln }, /* vgetexpp{s,d} */
     { { 0x43 }, 2, T, R, pfx_66, Wn, LIG }, /* vgetexps{s,d} */
     { { 0x44 }, 2, T, R, pfx_66, Wn, Ln }, /* vlzcnt{d,q} */
@@ -2091,6 +2092,7 @@ static const struct evex {
     { { 0x39 }, 3, T, W, pfx_66, Wn, L1|L2 }, /* vextracti{32x4,64x2} */
     { { 0x3a }, 3, T, R, pfx_66, Wn, L2 }, /* vinserti{32x8,64x4} */
     { { 0x3b }, 3, T, W, pfx_66, Wn, L2 }, /* vextracti{32x8,64x4} */
+    { { 0x3d }, 3, T, R, pfx_no, W0, Ln }, /* vunpackb */
     { { 0x3e }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmpu{b,w} */
     { { 0x3f }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmp{b,w} */
     { { 0x42 }, 3, T, R, pfx_66, W0, Ln }, /* vdbpsadbw */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -219,6 +219,8 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx10               (cpu_policy.feat.avx10 && xcr0_mask(0xe6))
 #define cpu_has_avx10_2             (cpu_policy.avx10.version >= 2 && \
                                      xcr0_mask(0xe6))
+#define cpu_has_avx10_2_aux         (cpu_policy.avx10.avx10_v2_aux && \
+                                     xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -492,6 +492,7 @@ static const struct ext0f3a_table {
     [0x3a] = { .simd_size = simd_256, .d8s = d8s_vl_by_2 },
     [0x39] = { .simd_size = simd_128, .to_mem = 1, .two_op = 1, .d8s = 4 },
     [0x3b] = { .simd_size = simd_256, .to_mem = 1, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x3d] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
     [0x3e ... 0x3f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x40 ... 0x41] = { .simd_size = simd_packed_fp },
     [0x42 ... 0x43] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
@@ -1456,14 +1457,20 @@ int x86emul_decode(struct x86_emulate_st
                  * insns with the same base opcodes. Rather than adding new
                  * columns to the table, handle this here for now.
                  */
-                if ( s->evex.pfx != vex_f3 || (b & 0xf8) != 0x10 )
-                    disp8scale = decode_disp8scale(ext0f38_table[b].d8s, s);
-                else
+                if ( s->evex.pfx == vex_f3 && (b & 0xf8) == 0x10 )
                 {
                     disp8scale = decode_disp8scale(ext0f38_table[b ^ 0x30].d8s,
                                                    s);
                     s->simd_size = simd_other;
                 }
+                /* Same for VPMOVSSDB vs VPMOVSDB. */
+                else if ( s->evex.pfx == vex_f3 && b == 0x41 )
+                {
+                    disp8scale = decode_disp8scale(ext0f38_table[0x21].d8s, s);
+                    s->simd_size = simd_other;
+                }
+                else
+                    disp8scale = decode_disp8scale(ext0f38_table[b].d8s, s);
             }
             break;
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -610,6 +610,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
 #define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
+#define vcpu_has_avx10_2_aux() (ctxt->cpuid->avx10.avx10_v2_aux)
 
 #define vcpu_must_have(feat, ...) \
     generate_exception_if(!vcpu_has_##feat(__VA_ARGS__), X86_EXC_UD)
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -150,6 +150,7 @@ bool cf_check x86_insn_is_mem_write(cons
              X86EMUL_OPC_EVEX_F3(0x0f38, 0x25): /* VPMOVS* */
         case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30) ...
              X86EMUL_OPC_EVEX_F3(0x0f38, 0x35): /* VPMOV{D,Q,W}* */
+        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x41): /* VPMOVSSDB */
             return s->modrm_mod != 3;
         }
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5840,6 +5840,9 @@ x86_emulate(
         elem_bytes = 2;
         goto avx512f_no_sae;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x41): /* vpmovssdb [xyz]mm,xmm/mem{k} */
+        vcpu_must_have(avx10_2_aux);
+        fallthrough;
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x10): /* vpmovuswb [xyz]mm,{x,y}mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x20): /* vpmovsxbw {x,y}mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20): /* vpmovswb [xyz]mm,{x,y}mm/mem{k} */
@@ -7747,6 +7750,13 @@ x86_emulate(
         visa_check(bw);
         goto opmask_shift_imm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x3d): /* vunpackb $imm8,[xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10_2_aux);
+        avx512_vlen_check(false);
+        fault_suppression = false;
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x42): /* vmpsadbw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         vcpu_must_have(avx10, 2);


