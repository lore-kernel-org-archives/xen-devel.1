Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C56606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wa+xncJ5
Received: from list by lists.xenproject.org with outflank-mailman.1483610.1686964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8eZ-0003Cd-54; Wed, 11 Nov 2026 13:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483610.1686964; Wed, 11 Nov 2026 13:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8eZ-0003CU-2Q; Wed, 11 Nov 2026 13:46:19 +0000
Received: by outflank-mailman (input) for mailman id 1483610;
 Wed, 11 Nov 2026 13:46:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8eY-0003Aq-2h
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:46:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8eX-00EkVm-Fv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:46:17 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47192-8faa-0a2a0a5109dd-0a2a4505841c-38
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:46:17 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af471a9-4cb1-0a2a45050019-d155dd33c8a7-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:46:17 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so2131080f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:46:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cbfc6sm11819665f8f.41.2026.11.11.05.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:46:15 -0800 (PST)
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
        d=suse.com; s=google; t=1794404777; x=1795009577; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5VZpgQSu2F/mASy5QB4n/CPhRKluO/kddfFOpTF7TkY=;
        b=Wa+xncJ5w3dWEzaHG6peRQYIhr0Vs7Zukyu9dz2Rm1fpR4ytyqhN71M3fUN8mo13la
         WSUbN+E9EJpcF8tIMKmjXXgP4NpNP2YRHnTXanaUzoSGju+YlwexXnjEC4bw3llUTNtc
         /eWoA1ZIA+WHSeuSgUhgMR7CYnifw+EV7vL+tblhvHbYNili0io/9vQQigbKVUA4UBD2
         kcHf1Z7r+AUtUNhTCNI0oMx/9PHe6CE1dvSOhdMf3jPQvyCUvPla8NeK2CDXQb6WwPd+
         QYWXLuMts9rPg64E33JxouZSpoW5d2haKiUtoSA752/PRZ+Wdb9Ix5rcZkJJyRFi+hKl
         pUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404777; x=1795009577;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5VZpgQSu2F/mASy5QB4n/CPhRKluO/kddfFOpTF7TkY=;
        b=H6J92X79HSuqjRFggHhebmpDoCmkT59vixGbNOfnYNINCE/pXq0AXnybmfhelzR2GE
         NTHevPRhURvlgxnVe+qsd0UXpWGQtqoUKxtrVb5vvHopSQHCn8TDVEJHEHOVyjqh2Xgg
         Qy2dWZnIyxanfjNYOf/MN+qa6lpES+mNogdNwhMHcoaJsj6/pPFVTWqlSMYqoTAuEY1t
         1HiQRk9bGmHEULkEX8dLITjQfN2PbY6H4D4B8z3k0DX794mmb9fmkTWW1dvtEQ3jk08D
         efMC2z+2Bu22Wm2nleZuLa4WWL9xYutVVOSw1re+oF+V+8Xu+7aTLelgHdUP2EtM3zGD
         7BFQ==
X-Gm-Message-State: APuU4Z/u8Kw9h7MRW+QKiqVGyyOVWBMnP9C8hIAQer0TKefBa8HiWDEw
	vMlMU28DJPICHhDBQVrtx7Sy+7GihcVJtFzC7/TnMaBtvz/CafohjmafQ2PEW6bfnf2wIz+y34P
	CxnzgcQ==
X-Gm-Gg: AYBFou2KJNgWWYZsaDZ/dB8II6dMcxHIK5Hm+7vhfP7CgCy9yfA3YHspzNKv2hUBN6h
	i0E0UJmfs78ivRskhhTVTLCrvWfmYE9qvXyz7r0J6J/j1L7rg//uL8UTbkrQX+UmjJFFVM+/rCB
	wMBjjURYXoMCbUbT4Rro/3ddSyROOhOVduvdJU6Le+0+hqDBNZ7WhDcQHM0vQ5WGYJqfjfSrHFB
	IQCMiqnJMT2Sk44/0nxFb9lnFy+vPNBTkbQQ43v8o2o5bjruJRNHaf96r42R7vsCoLEusOcwmMx
	wyo8oCGxZKntmtLHyqsNTO65HQPjZMMBnI+V2Zfq65YOjz+1OzMA4hLmZyGNyIcf1YsIxMD3X2j
	6DZJbiFdF2ZGxMbhjygRF9EFEM+siIkkUVEpj4fumlex0/HiutgExraIitXNo56d6TywH+Fxy8y
	XR/aIyswYnbWASDPgim6pmtq1k5EHoecx4Vvbb1Lr0QPqgQJpxractgvoWL99x4ZEpCZUXTgQeN
	JGvwoALY/MiBcC011PyOCJ1VVQkxdC3wkVNeqdq9Y2vdaXh/2BtmztyaOc/0zNcMjTJ9TDj4nq+
	G2q39DftvIIzZrNzjL3PQi7tJhfh1yu6iyTgsJWXy94isoH2vzPKIc+u6T0VaQnGmV6aNEVe5ZH
	b1hjLn233q0vqNTGeNzyKRMZrrVaNGpWSysSbOg==
X-Received: by 2002:a05:6000:40dd:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-499c5d46af4mr4809811f8f.12.1794404776513;
        Wed, 11 Nov 2026 05:46:16 -0800 (PST)
Message-ID: <fe1a55bd-a996-4b77-9fc4-7d9a07a7ef12@suse.com>
Date: Wed, 11 Nov 2026 14:46:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 10/19] x86emul: support AVX10.2 scalar compare insns
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
X-purgate-ID: tlsNG-c201ff/1794404777-720AA2A1-2D16991A/10/78276251493
X-purgate-type: spam
X-purgate-size: 7453
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Simply clone code from their V{,U}COMIS{S,D,H} counterparts.

While there drop a redundant EVEX.W check from V{,U}COMISH handling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Update encodings to latest spec version. Series re-ordering
    adjustments.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -81,6 +81,7 @@ enum esz {
     ESZ_w,
     ESZ_bw,
     ESZ_fp16,
+#define ESZ_bf16 ESZ_fp16
 };
 
 #ifndef __i386__
@@ -720,6 +721,14 @@ static const struct test vpclmulqdq_all[
     INSN(pclmulqdq, 66, 0f3a, 44, vl, q_nb, vl)
 };
 
+static const struct test avx10_2_all[] = {
+    INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
+    INSN_SFP(comx,               0f, 2f),
+    INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN_SFP(ucomx,              0f, 2e),
+    INSN(ucomxsh,          f3, map5, 2e,    el, fp16, el),
+};
+
 static const struct test movrs_all[] = {
     INSN(movrsb, f2, map5, 6f, vl,    b, vl),
     INSN(movrsd, f3, map5, 6f, vl, d_nb, vl),
@@ -1154,4 +1163,6 @@ void evex_disp8_test(void *instr, struct
         run(ctxt->addr_size == 64 && cpu_has_movrs, movrs, all);
         run(cpu_has_sm4, sm4, all);
     }
+
+    run(cpu_has_avx10_2, avx10_2, all);
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1682,8 +1682,12 @@ static const struct evex {
     { { 0x2d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtsd2si */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomiss */
     { { 0x2e }, 2, T, R, pfx_66, W1, LIG }, /* vucomisd */
+    { { 0x2e }, 2, T, R, pfx_f2, W1, LIG }, /* vucomxsd */
+    { { 0x2e }, 2, T, R, pfx_f3, W0, LIG }, /* vucomxss */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomiss */
     { { 0x2f }, 2, T, R, pfx_66, W1, LIG }, /* vcomisd */
+    { { 0x2f }, 2, T, R, pfx_f2, W1, LIG }, /* vcomxsd */
+    { { 0x2f }, 2, T, R, pfx_f3, W0, LIG }, /* vcomxss */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtps */
     { { 0x51 }, 2, T, R, pfx_66, W1, Ln }, /* vsqrtpd */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtss */
@@ -2102,7 +2106,10 @@ static const struct evex {
     { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2si */
     { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2si */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomish */
+    { { 0x2e }, 2, T, R, pfx_f3, W0, LIG }, /* vucomxsh */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
+    { { 0x2f }, 2, T, R, pfx_66, W0, LIG }, /* vcomisbf16 */
+    { { 0x2f }, 2, T, R, pfx_f3, W0, LIG }, /* vcomxsh */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtsh */
     { { 0x58 }, 2, T, R, pfx_no, W0, Ln }, /* vaddph */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -217,6 +217,8 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx_vnni_int16      (cpu_policy.feat.avx_vnni_int16 && \
                                      xcr0_mask(6))
 #define cpu_has_avx10               (cpu_policy.feat.avx10 && xcr0_mask(0xe6))
+#define cpu_has_avx10_2             (cpu_policy.avx10.version >= 2 && \
+                                     xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1515,9 +1515,8 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
-            case 0x2e: case 0x2f: /* v{,u}comish */
-                if ( !s->evex.pfx )
-                    s->fp16 = true;
+            case 0x2e: case 0x2f: /* v{,u}com{i,x}sh, vcomisbf16 */
+                s->fp16 = true;
                 s->simd_size = simd_none;
                 break;
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -318,7 +318,7 @@ struct x86_emulate_state {
     bool lock_prefix;
     bool not_64bit; /* Instruction not available in 64bit. */
     bool fpu_ctrl;  /* Instruction is an FPU control one. */
-    bool fp16;      /* Instruction has half-precision FP source operand. */
+    bool fp16;      /* Instruction has half-precision FP or BF16 source. */
     opcode_desc_t desc;
     union vex vex;
     union evex evex;
@@ -609,10 +609,10 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
-#define vcpu_has_avx10()       (ctxt->cpuid->feat.avx10)
+#define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
 
-#define vcpu_must_have(feat) \
-    generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
+#define vcpu_must_have(feat, ...) \
+    generate_exception_if(!vcpu_has_##feat(__VA_ARGS__), X86_EXC_UD)
 
 /*
  * Instruction emulation:
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3875,7 +3875,6 @@ x86_emulate(
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
         visa_check(_fp16);
-        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2f): /* vcomis{s,d} xmm/mem,xmm */
@@ -3884,6 +3883,7 @@ x86_emulate(
                                evex.w != evex.pfx),
                               X86_EXC_UD);
         visa_check(f);
+    vcomi_evex:
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3892,6 +3892,17 @@ x86_emulate(
         op_bytes = 2 << (!state->fp16 + evex.w);
         goto vcomi;
 
+    CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2e): /* vucomxs{s,d} xmm/mem,xmm */
+    CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2f): /* vcomxs{s,d} xmm/mem,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x2e):      /* vucomxsh xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_66(5, 0x2f):      /* vcomisbf16 xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x2f):      /* vcomxsh xmm/m16,xmm */
+        generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
+                               evex.w != (evex.pfx == vex_f2)),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        goto vcomi_evex;
+
 #endif
 
     case X86EMUL_OPC(0x0f, 0x30): /* wrmsr */
@@ -6881,7 +6892,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0xda): /* vsm4key4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0xda): /* vsm4rnds4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
-        vcpu_must_have(avx10);
+        vcpu_must_have(avx10, 1);
         vcpu_must_have(sm4);
         generate_exception_if(evex.w || evex.brs || evex.opmsk, X86_EXC_UD);
         avx512_vlen_check(false);
@@ -7955,7 +7966,7 @@ x86_emulate(
         fallthrough;
     case X86EMUL_OPC_EVEX_F3(5, 0x6f): /* vmovrs{d,q} mem,[xyz]mm{k} */
         generate_exception_if(ea.type != OP_MEM || evex.brs, X86_EXC_UD);
-        vcpu_must_have(avx10);
+        vcpu_must_have(avx10, 1);
         vcpu_must_have(movrs);
         avx512_vlen_check(false);
         op_bytes = 16 << evex.lr;


