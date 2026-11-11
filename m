Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3286606A331
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D6j7ExDI
Received: from list by lists.xenproject.org with outflank-mailman.1483625.1686982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8fK-0004Ew-MF; Wed, 11 Nov 2026 13:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483625.1686982; Wed, 11 Nov 2026 13:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8fK-0004Ep-Jh; Wed, 11 Nov 2026 13:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1483625;
 Wed, 11 Nov 2026 13:47:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8fI-0004D1-U5
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:47:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8fI-000bCR-Am
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:47:04 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af471d6-2eae-0a2a0a5409dd-0a2a4503cd16-14
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:47:04 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af471d7-fae8-0a2a45030019-d1558032c45f-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:47:04 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so23629595e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:47:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08de826asm44314275e9.0.2026.11.11.05.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:47:03 -0800 (PST)
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
        d=suse.com; s=google; t=1794404823; x=1795009623; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qf+rMlLXWHV9TVwGILiHXmVzq4H59Q2frJpKbR8vx9w=;
        b=D6j7ExDI+Ar5kTLT3R65SQLeh01It+ltsIrsNNrZpwljsY57vWegTeIN5gV3LH0l4V
         4GYQPuSeurrXWQCtu0BJLulWS6SlF6XhZmZbE38eigdgoAL+ZzZmlskRLZ075YzC3edF
         ptAwpZ+2GSa+AfAGcb6kn6WCWVCXjSusGX3aVQF5wJQwKnLzlxHXe1Zna/knoGRKY08m
         J/7aE0GNa8E74YjeUcmf5Et7wkneq0NmQPaB9hIT2fXeyplxA3cGw6IPEjiWCwKvo/Xm
         9Bi0fP5gd6+GFPGR79a5eYG2kIULlTv55JMZIzRIJsxixT1pbSLxBXEO6GS3DCQDHkc9
         mBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404823; x=1795009623;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qf+rMlLXWHV9TVwGILiHXmVzq4H59Q2frJpKbR8vx9w=;
        b=SB8hph4p8i2yBcRqXzR3p1pNN7IgAaVdV4D1NFhktJ7GgEbOpiboyZeJjQ0IcYuxQ6
         lSsGfForeVhGchgUwBeKCF5t+f0IK8uVBIvUU/VtYM7pk0kkxSco7Vx79pJMz8bn7VS6
         suBleekfWJvxZEuX1n7t5mHNP3uW9n17png0AOgWxR+elOF171lNgO0ABn3NCBrgQkW7
         a+SEdxnXKApgCAVsZB7G3C9rpVilbF4kjUnSBSsB7gbIBdZWZmj1KZ6BbNALpWRaBXTg
         e4poyrTEVEQTVOS+PwIK9ZI3hUwUsDneY5PegpsneOwHBvN1+1Z0Dly/FT4lSitZGHUg
         W25g==
X-Gm-Message-State: APuU4Z/P70s4eCA/yen16pxmJlApX5X7Q2psSPuBgxh1/Dg/QsBpAWhm
	DFyR/i6KCNloFGr6GBdG/DfEYbcDOc9GALiAwoRcFDE3rFFPBMw05UIoj9QZADgqS/hvqOgSq54
	/YBYduA==
X-Gm-Gg: AYBFou09T1vs+K4KnQU0mnEULspqzAkhpIkAhDobaFDvNxozm+F5TdWTsdiZjqByyKa
	rbIfjo86AFwLh7fxt2P6ZldVpV22FHTHzG2rQFye7ZKLm6EoMasCGKV09YxbmBpDwL3E8VwCPqP
	AXafBZFGuE4xXOkUAMyX15vqMTwsXJ0A3pxXHUMQ1iy6BnklstVSPPmWlS0MVhjgYXuDBcol8yH
	1xR5RNWNBX+TgVs8Us1SD30+Jo1+f/oAIlrSmIQ54pGuE5PUvqrJ+uUXqgCaP24bLj6U1wbD15M
	+NVL4O3Gnf2DWJvgVTdCqTkeIRtUY9VlgIDdcpg7nWFFkcC/+UI4XPAMNWhV3hzqLElbzdo7UUJ
	VJaajE/i3dnpS5d2nQ5n3A+Au6H9YP5tVtGSmJg4VqpYisr09soYVGT4Bblvn5grFu3BRuKM7Gj
	Xfghz26RZRGe4BASaBRTMKja/bED44ec8D7m55wyzlsB3wzi3h+/89L2y+rxbPBlaa27XRtlpO7
	P5upPYuxTab5lph4re2ciVL5+58MLBlywg4I98qK/N0b05kowO6jF9FttXqAV50muSa4i/riTne
	5S+PGiOjD4tdwwFDasLd5MmRjU+WcEOm5CavW9IWYMh8z6PkTxgiQFFlMgKpNtvELwDJG9dSQsN
	M3h5UQgEMsDi7RbILco7MZp+LUZwb4IDgZwTGhA==
X-Received: by 2002:a05:600c:1990:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4ba093771d7mr45758375e9.21.1794404823503;
        Wed, 11 Nov 2026 05:47:03 -0800 (PST)
Message-ID: <8a48acdc-fb68-4e34-a412-7387d9832996@suse.com>
Date: Wed, 11 Nov 2026 14:47:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 12/19] x86emul: support AVX10.2 media insns
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
X-purgate-ID: tlsNG-33051d/1794404824-6D8D54E9-6C309327/10/78276251493
X-purgate-type: spam
X-purgate-size: 7327
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These are all very similar to various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
In evex-disp8.c, should we separately have avx10_v1_aux_all[]? If so, all
the convert insns would also need moving/copying there.
---
v4: Series re-ordering adjustments. Update to spec version 6.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -725,6 +725,20 @@ static const struct test avx10_2_all[] =
     INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
+    INSN(mpsadbw,          f3, 0f3a, 42,    vl, d_nb, vl),
+    INSN(pdpbssd,          f2, 0f38, 50,    vl,    d, vl),
+    INSN(pdpbssds,         f2, 0f38, 51,    vl,    d, vl),
+    INSN(pdpbsud,          f3, 0f38, 50,    vl,    d, vl),
+    INSN(pdpbsuds,         f3, 0f38, 51,    vl,    d, vl),
+    INSN(pdpbuud,            , 0f38, 50,    vl,    d, vl),
+    INSN(pdpbuuds,           , 0f38, 51,    vl,    d, vl),
+    INSN(pdpwsud,          f3, 0f38, d2,    vl,    d, vl),
+    INSN(pdpwsuds,         f3, 0f38, d3,    vl,    d, vl),
+    INSN(pdpwusd,          66, 0f38, d2,    vl,    d, vl),
+    INSN(pdpwusds,         66, 0f38, d3,    vl,    d, vl),
+    INSN(pdpwuud,            , 0f38, d2,    vl,    d, vl),
+    INSN(pdpwuuds,           , 0f38, d3,    vl,    d, vl),
     INSN_SFP(ucomx,              0f, 2e),
     INSN(ucomxsh,          f3, map5, 2e,    el, fp16, el),
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1927,8 +1927,15 @@ static const struct evex {
     { { 0x4d }, 2, T, R, pfx_66, Wn, LIG }, /* vrcp14s{s,d} */
     { { 0x4e }, 2, T, R, pfx_66, Wn, Ln }, /* vrsqrt14p{s,d} */
     { { 0x4f }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt14s{s,d} */
+    { { 0x50 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuud */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
+    { { 0x50 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsud */
+    { { 0x50 }, 2, T, R, pfx_f2, W0, Ln }, /* vpdpbssd */
+    { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuuds */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
+    { { 0x51 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsuds */
+    { { 0x51 }, 2, T, R, pfx_f2, W0, Ln }, /* vpdpbssds */
+    { { 0x52 }, 2, T, R, pfx_no, W0, Ln }, /* vdpphps */
     { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
     { { 0x52 }, 2, T, R, pfx_f3, W0, Ln }, /* vdpbf16ps */
     { { 0x52 }, 2, T, R, pfx_f2, W0, L2 }, /* vp4dpwssd */
@@ -2029,6 +2036,12 @@ static const struct evex {
     { { 0xcc }, 2, T, R, pfx_66, Wn, L2 }, /* vrsqrt28p{s,d} */
     { { 0xcd }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt28s{s,d} */
     { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
+    { { 0xd2 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuud */
+    { { 0xd2 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusd */
+    { { 0xd2 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsud */
+    { { 0xd3 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuuds */
+    { { 0xd3 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusds */
+    { { 0xd3 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsuds */
     { { 0xda }, 2, T, R, pfx_f3, W0, Ln }, /* vsm4key4 */
     { { 0xda }, 2, T, R, pfx_f2, W0, Ln }, /* vsm4rnds4 */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
@@ -2075,6 +2088,7 @@ static const struct evex {
     { { 0x3e }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmpu{b,w} */
     { { 0x3f }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmp{b,w} */
     { { 0x42 }, 3, T, R, pfx_66, W0, Ln }, /* vdbpsadbw */
+    { { 0x42 }, 3, T, R, pfx_f3, W0, Ln }, /* vmpsadbw */
     { { 0x43 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vshufi{32x4,64x2} */
     { { 0x44 }, 3, T, R, pfx_66, WIG, Ln }, /* vpclmulqdq */
     { { 0x50 }, 3, T, R, pfx_66, Wn, Ln }, /* vrangep{s,d} */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -434,8 +434,8 @@ static const struct ext0f38_table {
     [0xcb] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xcc ... 0xcd] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl },
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0xd2] = { .simd_size = simd_other },
-    [0xd3] = { .simd_size = simd_other },
+    [0xd2] = { .simd_size = simd_other, .d8s = d8s_vl },
+    [0xd3] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xda] = { .simd_size = simd_other, .d8s = d8s_vl },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6217,6 +6217,30 @@ x86_emulate(
         avx512_vlen_check(true);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x50): /* vpdpbuud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x50): /* vpdpbsud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x50): /* vpdpbssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x51): /* vpdpbuuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x51): /* vpdpbsuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x51): /* vpdpbssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0xd2): /* vpdpwuud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0xd2): /* vpdpwusd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xd2): /* vpdpwsud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0xd3): /* vpdpwuuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0xd3): /* vpdpwusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xd3): /* vpdpwsuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        if ( !cp->avx10.avx10_v1_aux )
+            vcpu_must_have(avx10, 2);
+        op_bytes = 16 << evex.lr;
+        goto avx512f_no_sae;
+
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x52): /* vdpphps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        op_bytes = 16 << evex.lr;
+        goto avx512f_no_sae;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8f): /* vpshufbitqmb [xyz]mm/mem,[xyz]mm,k{k} */
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
@@ -7685,6 +7709,14 @@ x86_emulate(
         visa_check(bw);
         goto opmask_shift_imm;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x42): /* vmpsadbw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        fault_suppression = false;
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_66(0x0f3a, 0x44):     /* pclmulqdq $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x44): /* vpclmulqdq $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
         vcpu_must_have(pclmulqdq);


