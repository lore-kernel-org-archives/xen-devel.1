Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD3606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cK3PZbKP
Received: from list by lists.xenproject.org with outflank-mailman.1483553.1686902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8ap-00089g-4U; Wed, 11 Nov 2026 13:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483553.1686902; Wed, 11 Nov 2026 13:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8ap-00089Z-1c; Wed, 11 Nov 2026 13:42:27 +0000
Received: by outflank-mailman (input) for mailman id 1483553;
 Wed, 11 Nov 2026 13:42:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8ao-00088P-0m
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:42:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8an-003Xth-DS
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:42:25 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af470b1-2eae-0a2a0a5409dd-0a2a4501b096-46
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:42:25 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af470c1-5984-0a2a45010019-d155802cc546-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:42:25 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso23083075e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:42:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba09536ebfsm63223805e9.5.2026.11.11.05.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:42:24 -0800 (PST)
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
        d=suse.com; s=google; t=1794404545; x=1795009345; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4EK/0pVGq7yRzzhaJFGiyrUOwrmO8z8+xzZUg3F66PA=;
        b=cK3PZbKPao04HkPh+Otj0cLHKGPELdzhhy6gJYKsydjgt1aV4Sl3jfxyVrzOhhldGU
         X2TNGoLF1EQeeNkSsJmFadKZqAYOVM17YUopMqFh6NUzogtu5yUw68JW2KklIcE8Wb0x
         EzbLFXpHK90wxg9f+qMbl9R3/ftqVFw8Dpn0292RoHdsg/lNLFV8VTyMydWn189pLWgC
         mNPIStvy1qVnY/5bRorGP2JsoT6bE6b2cAYGRJctLtfFPhzhWDt5H5KA5aBg0APAc+OR
         fDqtLucbLCsg7kUG0bm1snu5xHLt/8fu+TkeiZKf98wpteDoUyjPMiy9ezDkKVaE7Z7w
         FVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404545; x=1795009345;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4EK/0pVGq7yRzzhaJFGiyrUOwrmO8z8+xzZUg3F66PA=;
        b=BWtwZVMWLYTfjuuMFFW/M/1IRrhb9bDLnSQpTff4TU1dOJqY4oav4RJuCJdGChOeuV
         Xqx+SZacPYIsvf9LalJkYf6CfjiNtbRa3xZaFtiMCrbfoBz9nf9Cir1AlvEZ4qpv3Z3w
         k5zT9BAdMppeSG+rqN7rMdGwSH0Ey202Slb2F0VCXs6ZLODtDj69y4BMo44jM3DtFRUB
         RnNupbChAKR+muuRTAQyrLGr/GFI3nNWjsCnzwADyGKr7rhxOv/ZOrDRbKR4Re7NuwtW
         zFoTrmia955AhHmS/OH8MgaunF4AxkcP+34jyon6TNm+FFpQaJAuDIBAmHb8Q3OhNR0z
         kvlg==
X-Gm-Message-State: APuU4Z9cLb03xnUcwtkSwgj7q9hA9F2s7+Z5aM4gRcn2G3erYDjXPyXk
	qPA+9IuXg80MwjPEEYpdXzdEhS0GNqgBGMsyoaNjnrHEs8GwdniXeyobQ2O2DvtcJWCrXi4GSkl
	3+5BL5w==
X-Gm-Gg: AYBFou0b29ZtnYodp+DtRBPVwEFJgGjFxeu7XQfIWWtdiulSbVzBdVSTt+MMedIbDbT
	ceZLwv4iHI2ZAaU9ujzPIHhCWSNaqLPZap1TR4ED3UclaiaAQAT0WbgeqzoQO/QA9iDSVC3P2MX
	cm8lCWu9KzPOK/LsEAqgI5CKYIDHvVPocA2xJ74Lfkks0VWMr+fBxJd5cO8JLgohDdPbewCypmO
	b5/FQ4PijvanYe3X8Xcv/7+ZUMd9T1IcNGeS0ulpH1ltzsPfINyKIRRwyFfK8J6/aXJ7iicr2W3
	RJcS9gKOrRyDJqnePAESasJUKVkRXubEpPBW9PqMEjrENkhR9VjcwkZhLX/AxSZI7ETtG4ocLQM
	9ATjCiVaynSH9h876unji3oD9IF+YpDFq7yTcpGyTFepju1fhnqrhCfE6IStr72UVMHxJSJ4WYF
	BbUTYYx9VgBTzx3xBLtHRAU7xNZtKzqIScb8MJ63FHkk0fgFLUfbO+2U24atsblbAGsJ7W+s7pk
	G3/afulxZADoZa416lw/pRUOZXfQs2m1MK5wnwznqvp8MaFrmkZDZAs++OdMJ4DhKR9/USYg3Pm
	MAku87LTmomaVD2KtPmI7YXcuQ6XQY4HvD4ySGsL6TsKtu+30prAYdcPZX46t7kKSaBLv+ZMbcC
	rl4+heB9pd1j5/7kUpQ==
X-Received: by 2002:a05:600c:3d8d:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4ba09380530mr45747765e9.26.1794404544650;
        Wed, 11 Nov 2026 05:42:24 -0800 (PST)
Message-ID: <ab4203bd-31df-46a7-ab6a-a6a4659dac64@suse.com>
Date: Wed, 11 Nov 2026 14:42:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 03/19] x86emul: support AVX10 forms of SM4 insns
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
X-purgate-ID: tlsNG-d62444/1794404545-BF262757-4AB09EB0/10/78276251493
X-purgate-type: spam
X-purgate-size: 3152
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Simply clone the VEX-encoded handling to cover the EVEX forms.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Address v3 TODO. Move ahead in series, switching feature dependency to
    plain AVX10. Add call to avx512_vlen_check().
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -727,6 +727,11 @@ static const struct test movrs_all[] = {
     INSN(movrsw, f2, map5, 6f, vl,    w, vl),
 };
 
+static const struct test sm4_all[] = {
+    INSN(sm4key4,  f3, 0f38, da, vl, d_nb, vl),
+    INSN(sm4rnds4, f2, 0f38, da, vl, d_nb, vl),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1124,5 +1129,6 @@ void evex_disp8_test(void *instr, struct
     if ( cpu_has_avx10 )
     {
         run(ctxt->addr_size == 64 && cpu_has_movrs, movrs, all);
+        run(cpu_has_sm4, sm4, all);
     }
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2025,6 +2025,8 @@ static const struct evex {
     { { 0xcc }, 2, T, R, pfx_66, Wn, L2 }, /* vrsqrt28p{s,d} */
     { { 0xcd }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt28s{s,d} */
     { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
+    { { 0xda }, 2, T, R, pfx_f3, W0, Ln }, /* vsm4key4 */
+    { { 0xda }, 2, T, R, pfx_f2, W0, Ln }, /* vsm4rnds4 */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -438,7 +438,7 @@ static const struct ext0f38_table {
     [0xd3] = { .simd_size = simd_other },
     [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xda] = { .simd_size = simd_other },
+    [0xda] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xe0 ... 0xef] = { .to_mem = 1 },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6869,6 +6869,15 @@ x86_emulate(
         op_bytes = 16 << vex.l;
         goto simd_0f_ymm;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xda): /* vsm4key4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0xda): /* vsm4rnds4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
+        vcpu_must_have(avx10);
+        vcpu_must_have(sm4);
+        generate_exception_if(evex.w || evex.brs || evex.opmsk, X86_EXC_UD);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdc):  /* vaesenc {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdd):  /* vaesenclast {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xde):  /* vaesdec {x,y}mm/mem,{x,y}mm,{x,y}mm */


