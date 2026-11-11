Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC5606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B1L6IU93
Received: from list by lists.xenproject.org with outflank-mailman.1484253.1687623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA4v-0005LX-As; Wed, 11 Nov 2026 15:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484253.1687623; Wed, 11 Nov 2026 15:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA4v-0005LQ-7H; Wed, 11 Nov 2026 15:17:37 +0000
Received: by outflank-mailman (input) for mailman id 1484253;
 Wed, 11 Nov 2026 15:17:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA4t-0005Jr-O8
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:17:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA4t-000uNH-11
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:17:35 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af486fe-bab6-0a2a0a5309dd-0a2a4502a954-42
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:17:34 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4870e-6ca4-0a2a45020019-d155dd30c4de-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:17:34 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4919a880834so1987106f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:17:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498367ba82csm11606058f8f.50.2026.11.11.07.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:17:34 -0800 (PST)
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
        d=suse.com; s=google; t=1794410254; x=1795015054; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vUGXXYof0+bSaoGzHlpQdgloqcCqlFRXSTk6PIxXNL4=;
        b=B1L6IU93xOUHhHT77uF1KlmFn2jrMJcBNSChNntozl7MnNTK59OF6T9sSpsa8uuGC2
         PAVkIuH+YPlMXicYX00cG49Ba1lxoksnI8P1b3VJYvMx3e5/tyaYHRogoWcnZVNKTRvL
         fz6Ztz6Iatz/1NZmwPWGAv9RaTqA6VTqgFDgmGAAM+yGFctN/8Qp1gY5gZh6nBGjOL+o
         zQtghAk6JC2g0SrdqGnmmGfs3icG0zgO934oW8mJ/VMJgYhWR6KOsa54VgTv6Po3kV9d
         FNk4hn8nNs3+5DPnzCiIObJcvMqxRTpG9HoaQ8tYIWao71gau73pK4q5KoTWHvq3/Rxv
         k+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410254; x=1795015054;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vUGXXYof0+bSaoGzHlpQdgloqcCqlFRXSTk6PIxXNL4=;
        b=d6CBEialJM6CAcC8ueGO7daY1rCcErWvlqPHSFxPFlk0+tts5tJpR0ZolnuJtQjvjF
         kaCtJm74xXGYc/xGygtbrFHeUYNaUk7vak4fwi7K3dL8V35OYRpDMjGxguz+qha2Tu91
         BZIo0is5MpoJ/kcuuYLWhrdNeG4yIcm6rrRPI1nrwc4Yn0loNCeZ7pPt9F5WqtGBsA/K
         NnYcj5lY68r4mlHpTFqXSyxegnQHDpGcL7sIG+w4PLns26aRLs+lohZIHhH4p8q6BWin
         jIn6QRMrG+rmt0eFiwtxJThCIL4CzCVdjXhk0qqTpZWAkYXmlOdxcop5pFdaqr9wqR1t
         5l6g==
X-Gm-Message-State: APuU4Z+gWNvGc/rTi6uNVxA4SEdDzlm6OX5AerHUMH7I3N9rleR+nv9c
	U0S8S1H0LfnjMHPxlwJM5GMp5A6hAh0xp3Kq31pf1TlJ66qd2noFguOHsCNDug2HrGqmFoxSfCp
	NSR184w==
X-Gm-Gg: AYBFou3t9HolD2szLgvaty09jwVTvN7PoUgAoQz1uA3UUwIqQrgr29fSn7FzmVra+By
	ZzxhvSJ5zp67V6pfenxdTxUcYuHBsSZpaZk+J0WtMmsdEOS8tt51ZNzlVSCtLqNmZ/7fwkpVt7z
	0QHdNJf8R4Y4Fg7ENXMxJYPez/TSmzis1rAKatTt++mRCBPD3c2u+obdqX63jVLM6yolQHMBuUJ
	zW9CX3rqe3LlFM/ah35coE54+Xku7GODlaPacSWFnvCoPggwHtikncsLZa0D+oVYZTDdCgAlZLJ
	I5Yu8CoVOlfgQTH4mZHSiPVjnF7A+Z92MXt19ycnhgtY7v+O8yRHRQ6ie0grPVR9Rw9wm9qShTm
	A8iOYlQCFGQB+On5vX++pkv3J9g8gqr7ZO80Rvn0ogaR4IO33PDlo52kDrN6Ac+1VvqOHJ5N5Nx
	I+g7JJMuc57TjibmA9SeMhS8gKIYXMIB2MpbO0QVxrFjMFSRLHtS6+Ll8aE1SBjtU/TEIFDf91f
	E9DUkLENdv7vtAL1oNIjfVeDnAMQn2Ru6viYvZNM7HeyqTG/NjiKd4Glqn8K/JGB+znx6T60mUw
	Ur8SdXJL1hlTU80RhmOoqeN5cubGdDGklmwpUtDd3HRX56UeO4igZc/uhJ6GhcgwD1QiJJYpmNa
	CRFq7Qa9nHicLulER
X-Received: by 2002:a05:6000:490b:b0:490:71a7:6f51 with SMTP id ffacd0b85a97d-499c6f8c3b5mr4295159f8f.45.1794410254340;
        Wed, 11 Nov 2026 07:17:34 -0800 (PST)
Message-ID: <4bdceb06-d0ce-471d-845d-bf5258cdbc01@suse.com>
Date: Wed, 11 Nov 2026 16:17:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 23/28] x86emul: support AMX-AVX512 insns with immediate
 operand
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
X-purgate-ID: tlsNG-720697/1794410254-674BE2AC-F7C0C4DA/10/78276251493
X-purgate-type: spam
X-purgate-size: 5759
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Due to their similarity with the GPR forms the code used there can
simply re-use most of the code there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2107,6 +2107,10 @@ static const struct evex {
     { { 0x03 }, 3, T, R, pfx_66, Wn, Ln }, /* valign{d,q} */
     { { 0x04 }, 3, T, R, pfx_66, W0, Ln }, /* vpermilps */
     { { 0x05 }, 3, T, R, pfx_66, W1, Ln }, /* vpermilpd */
+    { { 0x07, 0xc0 }, 3, F, N, pfx_no, W0, L2 }, /* tcvtrowps2phh */
+    { { 0x07, 0xc0 }, 3, F, N, pfx_66, W0, L2 }, /* tilemovrow */
+    { { 0x07, 0xc0 }, 3, F, N, pfx_f3, W0, L2 }, /* tcvtrowd2ps */
+    { { 0x07, 0xc0 }, 3, F, N, pfx_f2, W0, L2 }, /* tcvtrowps2bf16h */
     { { 0x08 }, 3, T, R, pfx_no, W0, Ln }, /* vrndscaleph */
     { { 0x08 }, 3, T, R, pfx_66, W0, Ln }, /* vrndscaleps */
     { { 0x08 }, 3, T, R, pfx_f2, W0, Ln }, /* vrndscalebf16 */
@@ -2170,6 +2174,8 @@ static const struct evex {
     { { 0x71 }, 3, T, R, pfx_66, Wn, Ln }, /* vshld{d,q} */
     { { 0x72 }, 3, T, R, pfx_66, W1, Ln }, /* vshrdw */
     { { 0x73 }, 3, T, R, pfx_66, Wn, Ln }, /* vshrd{d,q} */
+    { { 0x77, 0xc0 }, 3, F, N, pfx_f3, W0, L2 }, /* tcvtrowps2bf16l */
+    { { 0x77, 0xc0 }, 3, F, N, pfx_f2, W0, L2 }, /* tcvtrowps2phl */
     { { 0xc2 }, 3, T, R, pfx_no, W0, Ln }, /* vcmpph */
     { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpsh */
     { { 0xc2 }, 3, T, R, pfx_f2, W0, Ln }, /* vcmpbf16 */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -470,6 +470,7 @@ static const struct ext0f3a_table {
     [0x03] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x04 ... 0x05] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0x06] = { .simd_size = simd_packed_fp },
+    [0x07] = { .simd_size = simd_other, .two_op = 1 },
     [0x08 ... 0x09] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0x0a ... 0x0b] = { .simd_size = simd_scalar_opc, .d8s = d8s_dq },
     [0x0c ... 0x0d] = { .simd_size = simd_packed_fp },
@@ -523,6 +524,7 @@ static const struct ext0f3a_table {
     [0x6c ... 0x6d] = { .simd_size = simd_packed_fp, .four_op = 1 },
     [0x6e ... 0x6f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
     [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x77] = { .simd_size = simd_other, .two_op = 1 },
     [0x78 ... 0x79] = { .simd_size = simd_packed_fp, .four_op = 1 },
     [0x7a ... 0x7b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
     [0x7c ... 0x7d] = { .simd_size = simd_packed_fp, .four_op = 1 },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6977,6 +6977,7 @@ x86_emulate(
                                (!evex.RX && !(state->xcr0 & X86_XCR0_APX))),
                               X86_EXC_UD);
 
+    tilemov:
         get_fpu(X86EMUL_FPU_zmm_tile);
         sttilecfg(&mmvalp->tilecfg);
 
@@ -6986,6 +6987,10 @@ x86_emulate(
         generate_exception_if(mmvalp->tilecfg.colsb[modrm_rm] & 3,
                               X86_EXC_UD);
 
+        /*
+         * Note: For the immediate forms this decodes %rax, but the value isn't
+         * going to be used by the insn below anyway.
+         */
         ea.reg = decode_evex_gpr(evex.reg | (evex.RX << 4), &_regs,
                                  &state->egpr, ctxt);
 
@@ -6995,8 +7000,10 @@ x86_emulate(
         evex.reg = 0xf;
         evex.RX = 1;
         opc[1] = modrm;
-        insn_bytes = EVEX_PFX_BYTES + 2;
-        place_ret(&opc[2]);
+        opc[2] = imm1;
+        i = ((ctxt->opcode & X86EMUL_OPC_EXT_MASK) == X86EMUL_OPC(0x0f3a, 0));
+        insn_bytes = EVEX_PFX_BYTES + 2 + i;
+        place_ret(&opc[2 + i]);
 
         copy_EVEX(opc, evex);
         invoke_stub("", "", "=g" (dummy) : "a" (*ea.reg));
@@ -8288,6 +8295,20 @@ x86_emulate(
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
+    case X86EMUL_OPC_EVEX   (0x0f3a, 0x07): /* tcvtrowps2phh $imm8,tmm,zmm */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x07): /* tilemovrow $imm8,tmm,zmm */
+    case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x07): /* tcvtrowd2ps $imm8,tmm,zmm */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x07): /* tcvtrowps2bf16h $imm8,tmm,zmm */
+    case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x77): /* tcvtrowps2bf16l $imm8,tmm,zmm */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x77): /* tcvtrowps2phl $imm8,tmm,zmm */
+        if ( ea.type != OP_REG )
+            goto unrecognized_insn;
+        vcpu_must_have(amx_avx512);
+        generate_exception_if((evex.w || evex.brs || evex.opmsk ||
+                               evex.lr != 2 || evex.reg != 0xf || !evex.RX),
+                              X86_EXC_UD);
+        goto tilemov;
+
     case X86EMUL_OPC_66(0x0f3a, 0x08): /* roundps $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_66(0x0f3a, 0x09): /* roundpd $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_66(0x0f3a, 0x0a): /* roundss $imm8,xmm/m128,xmm */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -425,7 +425,7 @@ XEN_CPUFEATURE(AMX__BF16,          21*32
 XEN_CPUFEATURE(AMX__COMPLEX,       21*32+ 2) /*a  AMX-COMPLEX Instructions */
 XEN_CPUFEATURE(AMX__FP16,          21*32+ 3) /*a  AMX-FP16 Instructions */
 XEN_CPUFEATURE(AMX_FP8,            21*32+ 4) /*a  AMX-FP8 Instructions */
-XEN_CPUFEATURE(AMX_AVX512,         21*32+ 7) /*   AMX-AVX512 Instructions */
+XEN_CPUFEATURE(AMX_AVX512,         21*32+ 7) /*a  AMX-AVX512 Instructions */
 XEN_CPUFEATURE(AMX_MOVRS,          21*32+ 8) /*a  AMX-MOVRS Instructions */
 
 #endif /* XEN_CPUFEATURE */


