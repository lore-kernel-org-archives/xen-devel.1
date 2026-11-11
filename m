Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE74606A88B
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S9EXaNVS
Received: from list by lists.xenproject.org with outflank-mailman.1484296.1687666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA7A-0008S2-RP; Wed, 11 Nov 2026 15:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484296.1687666; Wed, 11 Nov 2026 15:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA7A-0008Rv-Ol; Wed, 11 Nov 2026 15:19:56 +0000
Received: by outflank-mailman (input) for mailman id 1484296;
 Wed, 11 Nov 2026 15:19:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA79-0008Rd-4s
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:19:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA78-00BBQZ-Hz
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:19:54 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48798-bab6-0a2a0a5309dd-0a2a45018a3c-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:19:54 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4879a-5984-0a2a45010019-d155802fb874-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:19:54 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so27900765e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:19:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c544a1esm3525435e9.11.2026.11.11.07.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:19:53 -0800 (PST)
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
        d=suse.com; s=google; t=1794410394; x=1795015194; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BtbwQlpFzACnt/eTMk7cPY1PivQ9OAjoPy95XMqGFN0=;
        b=S9EXaNVS66GV72lnpjvtRfLM8kKfoDcLgE0owLRpUHyz6pIkt0+M2MqU5TkHF3NIXI
         8sZ504z23xRJpulV+AJWYvXx3fX46yhQFi32bFkE8dr1cKpDPJfM6w2TUjlt5Wlvgtft
         gHV2lYsH9NV5EDJDruXM9srtkN4eeH35KI/nqYcAMO3efSCETSjkSZi01BqGPqooy3H7
         WdFPFYMn1jX9MyPnIZbRayYRLNiPFggJFDpyR8tW/jPTW3zOsNv2yUEy7EZJKTLDnULH
         r77cYddGaWh8+hpk0kWkeHtgwQEo9BYRRfr0piLWq08HeA3P5BGB5HljTj4L9tEc6A6+
         y6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410394; x=1795015194;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BtbwQlpFzACnt/eTMk7cPY1PivQ9OAjoPy95XMqGFN0=;
        b=N8nIRXs0cgphotfSXwblBgIv/dpWNVamVPjduOBsJHA1cyFzc2jiKzewkowYcNCSHq
         1ZSepCv0E0AITaMLB9EDN/o1XUCQLallZqe5jinTPZQ0iwt3k9k4DbnSxT08DQ3XNoCW
         21bOYVxYNLDM/ng0Vgo8Y2ie/uCzJhSt0cb62N6wonzPEDQOZBjhkqpOdXuGwAbvJ3/8
         KH8ULqkLuaaWvcttic3tsT3nOPS7EudtW896Hd8YEiicwwz3rqzAMu3A234GREgJsSFz
         TzerZoBjBDXAfMZxsxqmWLpDUHyhzZwPV9Q9Y8kF4Ns9ZjXZlznBR/CnQFvFiSGFGdi0
         gHTw==
X-Gm-Message-State: APuU4Z9DNJkeAmZintEAskkRnXr9l5dS0BD54rtVP5gF3EPzGC2rXipo
	L6A2Gr+ys2oTrDk4wn8p5oslnRBdmj1h2daf1i0TUSH07tOLemdmEUJivtHrkLoaUtBAzZ8M3Oh
	Xzsw/dA==
X-Gm-Gg: AYBFou0sbN8nmu4OXK7KYeviNrTWUF5U8WkjcTvDRz9AIJTUwBsTEM1bLFBN9KGprbv
	iEyXHoSuL6eOTTxg+JKod5xoXao1roZDu30SBdWTk4f+bWmFLWAf2kVjSCcNdF4ClA35QPuMCS0
	Kac6erkBX6twU2Dxrm7K9W6ysMrszBC4zDMJhj4NorhIc0wkhiJ1C1YxhGBApQnP0a83YwNZ+z9
	sYLwG2RDkVnHzr7tSQd2PGyWCL3qu3Vdug54MnACLFEiddV6oo5D4ev5+aezSaAI4AQxYfASZLm
	pcdeT8QPDIJwcU6h1YBJFmllQEmlJzyweKYoOr2diSIxrC4zvGukzCPNm5ernG0wWeqoy8TjMgb
	zAnQnjSon0qJAnpuRWjZPuXKoObm8je0FBqTN+/kcTrwJRvuxVcApJ8bAPmCyaguFlexghFtRWg
	AeYGjrKhsf/eZxY2dZQEgbMYzVSvbCUgxFYhzFQprajgPh24xmujqtSFa6rSLH5FTQlgP8qyHpT
	v1gjLcH/xlJkIbRl/ZD3QaE7jf0P4LraUxj/lsNpUZTOzdtlpWJg6QJdC6K52qBLTievDvkFUy0
	zJXsFVNwdH5pwxtY8TP2IkWK/RKR6Ub0dLL/lu+4pb+rsR7ebL/cnOBqkcsN46fSA/eSTcZ92kb
	RTdAboO03H88uHg9S
X-Received: by 2002:a05:600c:64c6:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ba0937fedcmr51240555e9.22.1794410393935;
        Wed, 11 Nov 2026 07:19:53 -0800 (PST)
Message-ID: <a2a06936-3b1b-4158-8191-7d41e87eac34@suse.com>
Date: Wed, 11 Nov 2026 16:19:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 28/28] x86emul: enable outer product insns for ACE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
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
X-purgate-ID: tlsNG-d62444/1794410394-BC558757-9814B153/10/78276251493
X-purgate-type: spam
X-purgate-size: 6350
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While they're different from TMUL ones in terms of operands used, they
similarly don't access memory. Hence there's little difference for our
purposes, and the logic ends up being pretty similar.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v4: New.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,7 @@ The format is based on [Keep a Changelog
    - Support for AVX10-V2-AUX. (Experimental)
    - Support for APX. (Experimental)
    - Support for AMX and XFD. (Experimental)
+   - Support for ACE. (Experimental)
 
 ### Removed
  - On Arm:
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1979,6 +1979,11 @@ static const struct evex {
     { { 0x59 }, 2, T, R, pfx_66, Wn, Ln }, /* vbroadcast32x2 / vpbroadcastq */
     { { 0x5a }, 2, F, R, pfx_66, Wn, L1|L2 }, /* vbroadcasti{32x4,64x2} */
     { { 0x5b }, 2, F, R, pfx_66, Wn, L2 }, /* vbroadcasti{32x8,64x4} */
+    { { 0x5c, 0xc0 }, 2, F, N, pfx_f3, W0, L2 }, /* top2bf16ps */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_no, W0, L2 }, /* top4buud */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_66, W0, L2 }, /* top4busd */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_f3, W0, L2 }, /* top4bsud */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_f2, W0, L2 }, /* top4bssd */
     { { 0x62 }, 2, T, R, pfx_66, Wn, Ln }, /* vpexpand{b,w} */
     { { 0x63 }, 2, T, W, pfx_66, Wn, Ln }, /* vpcompress{b,w} */
     { { 0x64 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{d,q} */
@@ -2179,6 +2184,11 @@ static const struct evex {
     { { 0x73 }, 3, T, R, pfx_66, Wn, Ln }, /* vshrd{d,q} */
     { { 0x77, 0xc0 }, 3, F, N, pfx_f3, W0, L2 }, /* tcvtrowps2bf16l */
     { { 0x77, 0xc0 }, 3, F, N, pfx_f2, W0, L2 }, /* tcvtrowps2phl */
+    { { 0x8d, 0xc0 }, 3, F, N, pfx_no, W0, L2 }, /* top4mxbf8ps */
+    { { 0x8d, 0xc0 }, 3, F, N, pfx_66, W0, L2 }, /* top4mxhf8ps */
+    { { 0x8d, 0xc0 }, 3, F, N, pfx_f3, W0, L2 }, /* top4mxhbf8ps */
+    { { 0x8d, 0xc0 }, 3, F, N, pfx_f2, W0, L2 }, /* top4mxbhf8ps */
+    { { 0x8f, 0xc0 }, 3, F, N, pfx_f2, W0, L2 }, /* top4mxbssps */
     { { 0xc2 }, 3, T, R, pfx_no, W0, Ln }, /* vcmpph */
     { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpsh */
     { { 0xc2 }, 3, T, R, pfx_f2, W0, Ln }, /* vcmpbf16 */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -531,6 +531,8 @@ static const struct ext0f3a_table {
     [0x7a ... 0x7b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
     [0x7c ... 0x7d] = { .simd_size = simd_packed_fp, .four_op = 1 },
     [0x7e ... 0x7f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
+    [0x8d] = { .simd_size = simd_other },
+    [0x8f] = { .simd_size = simd_other },
     [0xc2] = { .simd_size = simd_any_fp, .d8s = d8s_vl },
     [0xcc] = { .simd_size = simd_other },
     [0xce ... 0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7206,6 +7206,27 @@ x86_emulate(
         goto simd_0f_common;
     }
 
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x5c): /* top2bf16ps zmm,zmm,tmm */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x5e): /* top4buud zmm,zmm,tmm */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0x5e): /* top4busd zmm,zmm,tmm */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x5e): /* top4bsud zmm,zmm,tmm */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x5e): /* top4bssd zmm,zmm,tmm */
+        if ( ea.type != OP_REG )
+            goto unrecognized_insn;
+        generate_exception_if((!mode_64bit() || evex.lr != 2 || evex.opmsk ||
+                               evex.brs || evex.w),
+                              X86_EXC_UD);
+        vcpu_must_have(ace);
+
+        get_fpu(X86EMUL_FPU_zmm_ace);
+        sttilecfg(&mmvalp->tilecfg);
+        generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg,
+                                          PALETTE(ACE)),
+                              X86_EXC_UD);
+
+        op_bytes = 1; /* fake */
+        goto simd_0f_common;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x62): /* vpexpand{b,w} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x63): /* vpcompress{b,w} [xyz]mm,[xyz]mm/mem{k} */
         visa_check(_vbmi2);
@@ -9010,6 +9031,32 @@ x86_emulate(
         visa_check(_vbmi2);
         goto avx512f_imm8_no_sae;
 
+    case X86EMUL_OPC_EVEX   (0x0f3a, 0x8d): /* top4mxbf8ps $imm8,zmm,zmm,tmm */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x8d): /* top4mxhf8ps $imm8,zmm,zmm,tmm */
+    case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x8d): /* top4mxhbf8ps $imm8,zmm,zmm,tmm */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x8d): /* top4mxbhf8ps $imm8,zmm,zmm,tmm */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x8f): /* top4mxbssps $imm8,zmm,zmm,tmm */
+        if ( ea.type != OP_REG )
+            goto unrecognized_insn;
+        generate_exception_if((!mode_64bit() || evex.lr != 2 || evex.opmsk ||
+                               evex.brs || evex.w),
+                              X86_EXC_UD);
+        vcpu_must_have(ace);
+
+        get_fpu(X86EMUL_FPU_zmm_ace);
+        sttilecfg(&mmvalp->tilecfg);
+        generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg,
+                                          PALETTE(ACE)),
+                              X86_EXC_UD);
+
+        opc = init_evex(stub);
+        opc[0] = b;
+        opc[1] = modrm;
+        opc[2] = imm1;
+        insn_bytes = EVEX_PFX_BYTES + 3;
+        op_bytes = 1; /* fake */
+        break;
+
     case X86EMUL_OPC_EVEX_F3(0x0f3a, 0xc2): /* vcmpsh $imm8,xmm/mem,xmm,k{k} */
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -355,7 +355,7 @@ XEN_CPUFEATURE(UC_LOCK_DIS,        13*32
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
 XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*s  RDMSR/WRMSRNS with immediate operand */
-XEN_CPUFEATURE(ACE,                14*32+11) /*   AI Compute Extensions */
+XEN_CPUFEATURE(ACE,                14*32+11) /*a  AI Compute Extensions */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */


