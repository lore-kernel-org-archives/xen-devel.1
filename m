Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7524606A335
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Zpzu+XDs
Received: from list by lists.xenproject.org with outflank-mailman.1483566.1686912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8bA-0000GS-DV; Wed, 11 Nov 2026 13:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483566.1686912; Wed, 11 Nov 2026 13:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8bA-0000GL-9o; Wed, 11 Nov 2026 13:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1483566;
 Wed, 11 Nov 2026 13:42:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8b8-0000EZ-GZ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:42:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8b7-00GDZe-Tl
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:42:45 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af470cd-2eae-0a2a0a5409dd-0a2a4509e772-22
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:42:45 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af470d5-be1a-0a2a45090019-d1558031ad00-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:42:45 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso32075255e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:42:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08e35e44sm55628415e9.1.2026.11.11.05.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:42:44 -0800 (PST)
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
        d=suse.com; s=google; t=1794404565; x=1795009365; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vvKKEbFkyUn4ouDDJeCY/8u0vuKkNtYy3R2yQRnEJS4=;
        b=Zpzu+XDsiRGaEXtStVPEnaaLo4olhEij+EQnoWJOrYhklZHa2sO/ehjN3whBXzJ8Wp
         QYGPhLEF41jnp9eHxsm4nM+kZj4a+zZmBal7qelIRTKpCrMgNp1RUotOLClKc40hmEKX
         2cLroe79d7OZvWXkk1EfdFoK0SV8RgXdJZG8mdpNX8tP6uGtF5rcqXLvFAFGqbut6LWX
         vwzFc6OKX6iJqPDIEdHJg5GYphJ8tNSRRzbq/QxjWSmggf9dixawyFxJ/gDjjBa+0Mfw
         a/Y92DxnyK5rWgUtcKbL+R9TKi1sSETGMa5s4eYyKuYBLxVn6lp4OHgm5F++BDY889fC
         UQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404565; x=1795009365;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vvKKEbFkyUn4ouDDJeCY/8u0vuKkNtYy3R2yQRnEJS4=;
        b=FWY5e9roGo1U5cPjk1AcClrwsTO4jAEzzyqja8H7A+xS29Jf/TptYst7KWquT9Vtkl
         wJmPClK/ABmzzgsYCXYmIR5DIC5pgPk9QpYF3nBEH6QN4n7VDqemNkpBLrRBWyiAVcqp
         V7Wu6zfkmGjoG1cT2AFBTNxGJS9fgbHsOfe548VxTX+q+ubGhSWp4N9lIHV3a+k/XbIK
         vo9DAPb0hHNJCkiH0UfDRvRZhfhTAzlwW0rcMrXKpq8Q2QVHIj/q1DecWicqczIsxgtt
         1nDk7QK5cT8KuHVWo8cJJiO9hY1zTPAF9yT+iESHSpeOMQhJzj4jofA2EO67jTODzpY0
         ybcQ==
X-Gm-Message-State: APuU4Z9gwNET+QXeUbbOlRK0MJ4tgd6EhhuHxuFj3XjaY2mhyYsK2T8H
	bEnbVj0SSbtuA7Z9oS8m+zgdWKOGjOXqyRzHuLcmS3Un/Ss4y2rE7mtEkSn9xrAIXAhzFesmWDr
	Up5lCbA==
X-Gm-Gg: AYBFou16BBfVV1th1ttPAaDb2t4QIgIc6oUFmaJ+KxQ92F2S/9G2B0sQobtgpbRSXAt
	ni5EX5zAGzrDjWKEgX2sOVFtrfyydH/U/Iank5+8xQ/FTxNDBibCEJYA8J3QjMxq9Z7uYoL6DM7
	bXOpw2WW26ivWmUQyZRqD3dYMPMZ0UNqtLQpLchsjB5UwuEl4z2cKohUbGcVSii8Vk8IzVMKVEP
	6TXoH3x2/AB2aSE+4m3akuwgwTUHA/jCD0vf62V5IUcLreGY/CEnVmlm/Thyujmig7X0nN3a8K5
	fahNVa+zh0Jt1Q7i0Iv1Ur9IK0PPa8VPS+lkQrA7wRFET3DnYoAGNZ9T3hs2xQRrWp8kB+vEmTZ
	/LKkmEFvskv6WMStmlgBZ/pT1bIUC71ka7yAn04VjtEq99+jFkEYAv6YJa4g3DtSaeN/2QAHeKM
	DwQnR1IgrU7DTYl+Pzh2yvegGMmqKrSO2ZDfn2bOrOF3J2LfSbUpYwYeonqHJhoWHtmBx9ndw30
	rgkqCIkIoGZKyiKvkQaHvjwYwO6wWPuL1sWYfQP/RavOG1Ph9HiNeXoHipXsxTi4qcX/bvfD9uK
	+oi8pOt1SwqXZh2WENdr6tLKQDwDdmyno0JNE2gFiqkMH0rJCcre6vXg/0kfpvgaI4PD9fZETJY
	6TeQ8XvNX5D7k6lUNEQI=
X-Received: by 2002:a05:600c:19c6:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4ba093b1bb8mr44063735e9.35.1794404564896;
        Wed, 11 Nov 2026 05:42:44 -0800 (PST)
Message-ID: <de4d7726-696c-406f-9c1c-1274001698e8@suse.com>
Date: Wed, 11 Nov 2026 14:42:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 04/19] x86emul: support AVX10.1
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
X-purgate-ID: tlsNG-bad1c0/1794404565-BF2DC034-548DADC4/10/78276251493
X-purgate-type: spam
X-purgate-size: 46214
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This requires relaxing various pre-existing AVX512* checks, as AVX10.1
covers all AVX512* except PF, ER, 4FMAPS, 4VNNIW (support for all of
which was removed meanwhile anyway), and VP2INTERSECT. At the same time
all vector widths are always supported.

While in most cases the changes to x86_emulate() are entirely
mechanical, for opmask insns earlier unconditional AVX512F checks are
converted into "else" clauses to existing if/else-if ones.

To be certain that no uses remain, also drop respective remaining
cpu_has_avx512* (except in the test harness) and vcpu_has_avx512*().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Probably avx512_vlen_check() should have the avx512_ prefix dropped, now
that it also covers AVX10. But if so that wants to be either a prereq or
a follow-on patch.

visa_check() won't cover AVX10.2 and higher, but probably we will want
independent checking logic for that anyway.
---
v5: Re-base, in particular over the removal of host_and_vcpu_must_have().
v4: Switch to using fallthrough pseudo-keyword. Drop new _vlen_check()
    helper again. Re-base.
v3: Add ChangeLog entry.
v2: Drop use of vsz128 field. Re-base, in particular over dropping of
    Xeon Phi support.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,8 @@ The format is based on [Keep a Changelog
      afterwards.
 
 ### Added
+ - On x86:
+   - Support for AVX10.1. (Experimental)
 
 ### Removed
  - On Arm:
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -181,12 +181,10 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_pqe             boot_cpu_has(X86_FEATURE_PQE)
 #define cpu_has_fpu_sel         (!boot_cpu_has(X86_FEATURE_NO_FPU_SEL))
 #define cpu_has_mpx             boot_cpu_has(X86_FEATURE_MPX)
-#define cpu_has_avx512f         boot_cpu_has(X86_FEATURE_AVX512F)
 #define cpu_has_smap            boot_cpu_has(X86_FEATURE_SMAP)
 #define cpu_has_clflushopt      boot_cpu_has(X86_FEATURE_CLFLUSHOPT)
 #define cpu_has_clwb            boot_cpu_has(X86_FEATURE_CLWB)
 #define cpu_has_proc_trace      boot_cpu_has(X86_FEATURE_PROC_TRACE)
-#define cpu_has_avx512bw        boot_cpu_has(X86_FEATURE_AVX512BW)
 
 /* CPUID level 0x00000007:0.ecx */
 #define cpu_has_pku             boot_cpu_has(X86_FEATURE_PKU)
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -577,26 +577,15 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_invpcid()     (ctxt->cpuid->feat.invpcid)
 #define vcpu_has_rtm()         (ctxt->cpuid->feat.rtm)
 #define vcpu_has_mpx()         (ctxt->cpuid->feat.mpx)
-#define vcpu_has_avx512f()     (ctxt->cpuid->feat.avx512f)
-#define vcpu_has_avx512dq()    (ctxt->cpuid->feat.avx512dq)
 #define vcpu_has_rdseed()      (ctxt->cpuid->feat.rdseed)
 #define vcpu_has_adx()         (ctxt->cpuid->feat.adx)
 #define vcpu_has_smap()        (ctxt->cpuid->feat.smap)
-#define vcpu_has_avx512_ifma() (ctxt->cpuid->feat.avx512_ifma)
 #define vcpu_has_clflushopt()  (ctxt->cpuid->feat.clflushopt)
 #define vcpu_has_clwb()        (ctxt->cpuid->feat.clwb)
-#define vcpu_has_avx512cd()    (ctxt->cpuid->feat.avx512cd)
 #define vcpu_has_sha()         (ctxt->cpuid->feat.sha)
-#define vcpu_has_avx512bw()    (ctxt->cpuid->feat.avx512bw)
-#define vcpu_has_avx512vl()    (ctxt->cpuid->feat.avx512vl)
-#define vcpu_has_avx512_vbmi() (ctxt->cpuid->feat.avx512_vbmi)
-#define vcpu_has_avx512_vbmi2() (ctxt->cpuid->feat.avx512_vbmi2)
 #define vcpu_has_gfni()        (ctxt->cpuid->feat.gfni)
 #define vcpu_has_vaes()        (ctxt->cpuid->feat.vaes)
 #define vcpu_has_vpclmulqdq()  (ctxt->cpuid->feat.vpclmulqdq)
-#define vcpu_has_avx512_vnni() (ctxt->cpuid->feat.avx512_vnni)
-#define vcpu_has_avx512_bitalg() (ctxt->cpuid->feat.avx512_bitalg)
-#define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
 #define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
 #define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
@@ -604,12 +593,10 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
-#define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_sha512()      (ctxt->cpuid->feat.sha512)
 #define vcpu_has_sm3()         (ctxt->cpuid->feat.sm3)
 #define vcpu_has_sm4()         (ctxt->cpuid->feat.sm4)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
-#define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 #define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1202,6 +1202,10 @@ static unsigned long *decode_vex_gpr(
     return decode_gpr(regs, ~vex_reg & (mode_64bit() ? 0xf : 7));
 }
 
+#define visa_check(subfeat) \
+    generate_exception_if(!cp->feat.avx512 ## subfeat && !cp->feat.avx10, \
+                          X86_EXC_UD)
+
 #define avx512_vlen_check(lig) do { \
     switch ( evex.lr ) \
     { \
@@ -1211,7 +1215,7 @@ static unsigned long *decode_vex_gpr(
         break; \
     case 0: case 1: \
         if ( !(lig) ) \
-            vcpu_must_have(avx512vl); \
+            visa_check(vl); \
         break; \
     } \
 } while ( false )
@@ -1446,7 +1450,9 @@ x86_emulate(
         /* KMOV{W,Q} %k<n>, (%rax) */
         stb[0] = 0xc4;
         stb[1] = 0xe1;
-        stb[2] = cpu_has_avx512bw ? 0xf8 : 0x78;
+        stb[2] = cp->feat.avx512bw || cp->feat.avx10
+                 ? 0xf8 /* L0.NP.W1 - kmovq */
+                 : 0x78 /* L0.NP.W0 - kmovw */;
         stb[3] = 0x91;
         stb[4] = evex.opmsk << 3;
         insn_bytes = 5;
@@ -3473,7 +3479,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK))),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
     simd_zmm:
@@ -3529,7 +3535,7 @@ x86_emulate(
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( (d & DstMask) != DstMem )
             d &= ~TwoOp;
         op_bytes = 8;
@@ -3556,7 +3562,7 @@ x86_emulate(
         generate_exception_if((evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         avx512_vlen_check(false);
         d |= TwoOp;
         op_bytes = !(evex.pfx & VEX_PREFIX_DOUBLE_MASK) || evex.lr
@@ -3593,7 +3599,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x64): /* vpblendm{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x65): /* vblendmp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_no_sae:
-        vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_zmm;
@@ -3673,13 +3679,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F3(5, 0x2a):      /* vcvtsi2sh r/m,xmm,xmm */
     case X86EMUL_OPC_EVEX_F3(5, 0x7b):      /* vcvtusi2sh r/m,xmm,xmm */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2a): /* vcvtsi2s{s,d} r/m,xmm,xmm */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x7b): /* vcvtusi2s{s,d} r/m,xmm,xmm */
         generate_exception_if(evex.opmsk || (ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3792,7 +3798,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(5, 0x2d):      /* vcvtsh2si xmm/mem,reg */
     case X86EMUL_OPC_EVEX_F3(5, 0x78):      /* vcvttsh2usi xmm/mem,reg */
     case X86EMUL_OPC_EVEX_F3(5, 0x79):      /* vcvtsh2usi xmm/mem,reg */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2c): /* vcvtts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2d): /* vcvts{s,d}2si xmm/mem,reg */
@@ -3802,7 +3808,7 @@ x86_emulate(
                                evex.opmsk ||
                                (ea.type != OP_REG && evex.brs)),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3868,7 +3874,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
@@ -3877,7 +3883,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs) ||
                                evex.w != evex.pfx),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -4021,7 +4027,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x4a):    /* kadd{w,q} k,k,k */
         if ( !vex.w )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x41):    /* kand{w,q} k,k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x41): /* kand{b,d} k,k,k */
@@ -4037,11 +4043,12 @@ x86_emulate(
         generate_exception_if(!vex.l, X86_EXC_UD);
     opmask_basic:
         if ( vex.w )
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
         else if ( vex.pfx )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
+        else
+            visa_check(f);
     opmask_common:
-        vcpu_must_have(avx512f);
         generate_exception_if(!vex.r || (mode_64bit() && !(vex.reg & 8)) ||
                               ea.type != OP_REG, X86_EXC_UD);
 
@@ -4064,13 +4071,14 @@ x86_emulate(
         generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
         goto opmask_basic;
 
-    case X86EMUL_OPC_VEX(0x0f, 0x4b):    /* kunpck{w,d}{d,q} k,k,k */
+    case X86EMUL_OPC_VEX(0x0f, 0x4b):    /* kunpck{wd,dq} k,k,k */
         generate_exception_if(!vex.l, X86_EXC_UD);
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         goto opmask_common;
 
     case X86EMUL_OPC_VEX_66(0x0f, 0x4b): /* kunpckbw k,k,k */
         generate_exception_if(!vex.l || vex.w, X86_EXC_UD);
+        visa_check(f);
         goto opmask_common;
 
 #endif /* X86EMUL_NO_SIMD */
@@ -4138,7 +4146,7 @@ x86_emulate(
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_MEM && evex.brs)),
                               X86_EXC_UD);
-        vcpu_must_have(avx512dq);
+        visa_check(dq);
         avx512_vlen_check(false);
         goto simd_zmm;
 
@@ -4177,12 +4185,12 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x7a): /* vcvtudq2ps [xyz]mm/mem,[xyz]mm{k} */
                                           /* vcvtuqq2ps [xyz]mm/mem,{x,y}mm{k} */
         if ( evex.w )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         else
         {
     case X86EMUL_OPC_EVEX(0x0f, 0x78):    /* vcvttp{s,d}2udq [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX(0x0f, 0x79):    /* vcvtp{s,d}2udq [xyz]mm/mem,[xyz]mm{k} */
-            vcpu_must_have(avx512f);
+            visa_check(f);
         }
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -4399,7 +4407,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0b): /* vpmulhrsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1c): /* vpabsb [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1d): /* vpabsw [xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (b & 1);
         goto avx512f_no_sae;
@@ -4431,7 +4439,7 @@ x86_emulate(
             generate_exception_if(b != 0x27 && evex.w != (b & 1), X86_EXC_UD);
             goto avx512f_no_sae;
         }
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (ext == ext_0f ? b & 1 : evex.w);
         avx512_vlen_check(false);
@@ -4504,7 +4512,7 @@ x86_emulate(
             dst.bytes = 2;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(5, 0x6e): /* vmovw r/m16,xmm */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6e): /* vmov{d,q} r/m,xmm */
@@ -4512,7 +4520,7 @@ x86_emulate(
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         get_fpu(X86EMUL_FPU_zmm);
 
         opc = init_evex(stub);
@@ -4570,7 +4578,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x6f): /* vmovdqu{8,16} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x7f): /* vmovdqu{8,16} [xyz]mm,[xyz]mm/mem{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         elem_bytes = 1 << evex.w;
         goto vmovdqa;
 
@@ -4663,7 +4671,7 @@ x86_emulate(
             generate_exception_if(evex.w, X86_EXC_UD);
         else
         {
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
             generate_exception_if(evex.brs, X86_EXC_UD);
         }
         d = (d & ~SrcMask) | SrcMem | TwoOp;
@@ -4909,7 +4917,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f, 0xe6):   /* vcvtdq2pd {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtqq2pd [xyz]mm/mem,[xyz]mm{k} */
         if ( evex.pfx != vex_f3 )
-            vcpu_must_have(avx512f);
+            visa_check(f);
         else if ( evex.w )
         {
     case X86EMUL_OPC_EVEX_66(0x0f, 0x78):   /* vcvttps2uqq {x,y}mm/mem,[xyz]mm{k} */
@@ -4920,11 +4928,11 @@ x86_emulate(
                                             /* vcvttpd2qq [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7b):   /* vcvtps2qq {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtpd2qq [xyz]mm/mem,[xyz]mm{k} */
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         }
         else
         {
-            vcpu_must_have(avx512f);
+            visa_check(f);
             /*
              * While SDM version 085 has explicit wording towards embedded
              * rounding being ignored, it's still not entirely unambiguous with
@@ -4971,7 +4979,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
         generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         d |= TwoOp;
         op_bytes = 8;
         goto simd_zmm;
@@ -4997,19 +5005,21 @@ x86_emulate(
     case X86EMUL_OPC_VEX(0x0f, 0x90):    /* kmov{w,q} k/mem,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x90): /* kmov{b,d} k/mem,k */
         generate_exception_if(vex.l || !vex.r, X86_EXC_UD);
-        vcpu_must_have(avx512f);
         if ( vex.w )
         {
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
             op_bytes = 4 << !vex.pfx;
         }
         else if ( vex.pfx )
         {
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
             op_bytes = 1;
         }
         else
+        {
+            visa_check(f);
             op_bytes = 2;
+        }
 
         get_fpu(X86EMUL_FPU_opmask);
 
@@ -5031,14 +5041,15 @@ x86_emulate(
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
 
-        vcpu_must_have(avx512f);
         if ( vex.pfx == vex_f2 )
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
         else
         {
             generate_exception_if(vex.w, X86_EXC_UD);
             if ( vex.pfx )
-                vcpu_must_have(avx512dq);
+                visa_check(dq);
+            else
+                visa_check(f);
         }
 
         get_fpu(X86EMUL_FPU_opmask);
@@ -5070,10 +5081,9 @@ x86_emulate(
         dst = ea;
         dst.reg = decode_gpr(&_regs, modrm_reg);
 
-        vcpu_must_have(avx512f);
         if ( vex.pfx == vex_f2 )
         {
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
             dst.bytes = 4 << (mode_64bit() && vex.w);
         }
         else
@@ -5081,7 +5091,9 @@ x86_emulate(
             generate_exception_if(vex.w, X86_EXC_UD);
             dst.bytes = 4;
             if ( vex.pfx )
-                vcpu_must_have(avx512dq);
+                visa_check(dq);
+            else
+                visa_check(f);
         }
 
         get_fpu(X86EMUL_FPU_opmask);
@@ -5103,20 +5115,18 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
-    case X86EMUL_OPC_VEX(0x0f, 0x99):    /* ktest{w,q} k,k */
-        if ( !vex.w )
-            vcpu_must_have(avx512dq);
-        /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x98):    /* kortest{w,q} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x98): /* kortest{b,d} k,k */
+    case X86EMUL_OPC_VEX(0x0f, 0x99):    /* ktest{w,q} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x99): /* ktest{b,d} k,k */
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
-        vcpu_must_have(avx512f);
         if ( vex.w )
-            vcpu_must_have(avx512bw);
-        else if ( vex.pfx )
-            vcpu_must_have(avx512dq);
+            visa_check(bw);
+        else if ( vex.pfx || (b & 1) )
+            visa_check(dq);
+        else
+            visa_check(f);
 
         get_fpu(X86EMUL_FPU_opmask);
 
@@ -5403,7 +5413,7 @@ x86_emulate(
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK)) ||
                                !evex.r || !evex.R || evex.z),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
     simd_imm8_zmm:
@@ -5447,9 +5457,9 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
         generate_exception_if(evex.lr || evex.opmsk || evex.brs, X86_EXC_UD);
         if ( b & 2 )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         else
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
         if ( !mode_64bit() )
             evex.w = 0;
         memcpy(mmvalp, &src.val, src.bytes);
@@ -5486,7 +5496,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x25): /* vpternlog{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_imm8_no_sae:
-        vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
@@ -5585,7 +5595,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe4): /* vpmulhuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xea): /* vpminsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xee): /* vpmaxsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 0x10 ? 1 : 2;
         goto avx512f_no_sae;
@@ -5810,7 +5820,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x10): /* vpsrlvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x11): /* vpsravw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x12): /* vpsllvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(!evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 2;
         goto avx512f_no_sae;
@@ -5820,7 +5830,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20): /* vpmovswb [xyz]mm,{x,y}mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x30): /* vpmovzxbw {x,y}mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30): /* vpmovwb [xyz]mm,{x,y}mm/mem{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         if ( evex.pfx != vex_f3 )
         {
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x21): /* vpmovsxbd xmm/mem,[xyz]mm{k} */
@@ -5868,7 +5878,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x13): /* vcvtph2ps {x,y}mm/mem,[xyz]mm{k} */
         generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs), X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(false);
         op_bytes = 8 << evex.lr;
@@ -5922,7 +5932,7 @@ x86_emulate(
             op_bytes = 8;
         generate_exception_if(evex.brs, X86_EXC_UD);
         if ( !evex.w )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         goto avx512_broadcast;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1a): /* vbroadcastf32x4 m128,{y,z}mm{k} */
@@ -5932,7 +5942,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_MEM || !evex.lr || evex.brs,
                               X86_EXC_UD);
         if ( evex.w )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         goto avx512_broadcast;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x20): /* vpmovsxbw xmm/mem,{x,y}mm */
@@ -5957,9 +5967,9 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x28): /* vpmovm2{b,w} k,[xyz]mm */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x38): /* vpmovm2{d,q} k,[xyz]mm */
         if ( b & 0x10 )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         else
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
         generate_exception_if(evex.opmsk || ea.type != OP_REG, X86_EXC_UD);
         d |= TwoOp;
         op_bytes = 16 << evex.lr;
@@ -6002,7 +6012,7 @@ x86_emulate(
         fault_suppression = false;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x44): /* vplzcnt{d,q} [xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512cd);
+        visa_check(cd);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x2c): /* vmaskmovps mem,{x,y}mm,{x,y}mm */
@@ -6078,7 +6088,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xba): /* vfmsub231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbc): /* vfnmadd231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbe): /* vfnmsub231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         goto simd_zmm;
@@ -6097,7 +6107,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbb): /* vfmsub231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbd): /* vfnmadd231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm{k} */
-        vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -6111,14 +6121,14 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3a): /* vpminuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3c): /* vpmaxsb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3e): /* vpmaxuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 2 ?: 1;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x40): /* vpmull{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         if ( evex.w )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_66(0x0f38, 0xdb):     /* aesimc xmm/m128,xmm */
@@ -6158,7 +6168,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x51): /* vpdpbusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x52): /* vpdpwssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x53): /* vpdpwssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512_vnni);
+        visa_check(_vnni);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -6170,7 +6180,7 @@ x86_emulate(
             d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x52): /* vdpbf16ps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512_bf16);
+        visa_check(_bf16);
         generate_exception_if(evex.w, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -6187,7 +6197,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4d): /* vrcp14s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4f): /* vrsqrt14s{s,d} xmm/mem,xmm,xmm{k} */
-        vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
@@ -6196,16 +6206,16 @@ x86_emulate(
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x54): /* vpopcnt{b,w} [xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512_bitalg);
+        visa_check(_bitalg);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x66): /* vpblendm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x55): /* vpopcnt{d,q} [xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512_vpopcntdq);
+        visa_check(_vpopcntdq);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x5a): /* vbroadcasti128 m128,ymm */
@@ -6214,14 +6224,14 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x62): /* vpexpand{b,w} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x63): /* vpcompress{b,w} [xyz]mm,[xyz]mm/mem{k} */
-        vcpu_must_have(avx512_vbmi2);
+        visa_check(_vbmi2);
         elem_bytes = 1 << evex.w;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x88): /* vexpandp{s,d} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x89): /* vpexpand{d,q} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8a): /* vcompressp{s,d} [xyz]mm,[xyz]mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8b): /* vpcompress{d,q} [xyz]mm,[xyz]mm/mem{k} */
-        vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         /*
@@ -6257,7 +6267,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x71): /* vpshldv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x73): /* vpshrdv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512_vbmi2);
+        visa_check(_vbmi2);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX   (0x0f38, 0xb0): /* vcvtneoph2ps mem,[xy]mm */
@@ -6277,16 +6287,16 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7d): /* vpermt2{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8d): /* vperm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         if ( !evex.w )
-            vcpu_must_have(avx512_vbmi);
+            visa_check(_vbmi);
         else
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x78): /* vpbroadcastb xmm/m8,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x79): /* vpbroadcastw xmm/m16,[xyz]mm{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         op_bytes = elem_bytes = 1 << (b & 1);
         /* See the comment at the avx512_broadcast label. */
@@ -6295,14 +6305,14 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7a): /* vpbroadcastb r32,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7b): /* vpbroadcastw r32,[xyz]mm{k} */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7c): /* vpbroadcast{d,q} reg,[xyz]mm{k} */
         generate_exception_if((ea.type != OP_REG || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
                               X86_EXC_UD);
-        vcpu_must_have(avx512f);
+        visa_check(f);
         avx512_vlen_check(false);
         get_fpu(X86EMUL_FPU_zmm);
 
@@ -6371,7 +6381,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x83): /* vpmultishiftqb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, X86_EXC_UD);
-        vcpu_must_have(avx512_vbmi);
+        visa_check(_vbmi);
         fault_suppression = false;
         goto avx512f_no_sae;
 
@@ -6529,8 +6539,8 @@ x86_emulate(
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
                               X86_EXC_UD);
+        visa_check(f);
         avx512_vlen_check(false);
-        vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         /* Read destination and index registers. */
@@ -6691,8 +6701,8 @@ x86_emulate(
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
                               X86_EXC_UD);
+        visa_check(f);
         avx512_vlen_check(false);
-        vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         /* Read source and index registers. */
@@ -6808,7 +6818,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb4): /* vpmadd52luq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb5): /* vpmadd52huq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512_ifma);
+        visa_check(_ifma);
         generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -7288,7 +7298,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x08): /* vrndscaleps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x09): /* vrndscalepd $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
@@ -7297,7 +7307,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x08): /* vrndscaleph $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
@@ -7410,11 +7420,11 @@ x86_emulate(
                                evex.opmsk || evex.brs),
                               X86_EXC_UD);
         if ( !(b & 2) )
-            vcpu_must_have(avx512bw);
+            visa_check(bw);
         else if ( !(b & 1) )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         else
-            vcpu_must_have(avx512f);
+            visa_check(f);
         get_fpu(X86EMUL_FPU_zmm);
         opc = init_evex(stub);
         goto pextr;
@@ -7428,7 +7438,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x39): /* vextracti32x4 $imm8,{y,z}mm,xmm/m128{k} */
                                             /* vextracti64x2 $imm8,{y,z}mm,xmm/m128{k} */
         if ( evex.w )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x23): /* vshuff32x4 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
@@ -7448,7 +7458,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3b): /* vextracti32x8 $imm8,zmm,ymm/m256{k} */
                                             /* vextracti64x4 $imm8,zmm,ymm/m256{k} */
         if ( !evex.w )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
         generate_exception_if(evex.lr != 2 || evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
@@ -7464,7 +7474,7 @@ x86_emulate(
             generate_exception_if((evex.w || evex.reg != 0xf || !evex.RX ||
                                    (ea.type != OP_REG && evex.brs)),
                                   X86_EXC_UD);
-            vcpu_must_have(avx512f);
+            visa_check(f);
             avx512_vlen_check(false);
             opc = init_evex(stub);
         }
@@ -7556,7 +7566,7 @@ x86_emulate(
         if ( !(b & 0x20) )
             goto avx512f_imm8_no_sae;
     avx512bw_imm:
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         avx512_vlen_check(false);
@@ -7595,7 +7605,7 @@ x86_emulate(
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x21): /* vinsertps $imm8,xmm/m32,xmm,xmm */
-        vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.lr || evex.w || evex.opmsk || evex.brs,
                               X86_EXC_UD);
         op_bytes = 4;
@@ -7603,18 +7613,18 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x50): /* vrangep{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x56): /* vreducep{s,d} $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512dq);
+        visa_check(dq);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x26): /* vgetmantp{s,d} $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x54): /* vfixupimmp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x26): /* vgetmantph $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x56): /* vreduceph $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7622,11 +7632,11 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x51): /* vranges{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x57): /* vreduces{s,d} $imm8,xmm/mem,xmm,xmm{k} */
-        vcpu_must_have(avx512dq);
+        visa_check(dq);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x27): /* vgetmants{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x55): /* vfixupimms{s,d} $imm8,xmm/mem,xmm,xmm{k} */
-        vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -7634,7 +7644,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x27): /* vgetmantsh $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x57): /* vreducesh $imm8,xmm/mem,xmm,xmm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -7645,18 +7655,19 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x30): /* kshiftr{b,w} $imm8,k,k */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x32): /* kshiftl{b,w} $imm8,k,k */
         if ( !vex.w )
-            vcpu_must_have(avx512dq);
+            visa_check(dq);
+        else
+            visa_check(f);
     opmask_shift_imm:
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
-        vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_opmask);
         op_bytes = 1; /* Any non-zero value will do. */
         goto simd_0f_imm8;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x31): /* kshiftr{d,q} $imm8,k,k */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x33): /* kshiftl{d,q} $imm8,k,k */
-        vcpu_must_have(avx512bw);
+        visa_check(bw);
         goto opmask_shift_imm;
 
     case X86EMUL_OPC_66(0x0f3a, 0x44):     /* pclmulqdq $imm8,xmm/m128,xmm */
@@ -7797,7 +7808,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x66): /* vfpclassp{s,d} $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,xmm/mem,k{k} */
-        vcpu_must_have(avx512dq);
+        visa_check(dq);
         generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
@@ -7807,7 +7818,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x66): /* vfpclassph $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x67): /* vfpclasssh $imm8,xmm/mem,k{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
@@ -7822,14 +7833,14 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x71): /* vpshld{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x73): /* vpshrd{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512_vbmi2);
+        visa_check(_vbmi2);
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_EVEX_F3(0x0f3a, 0xc2): /* vcmpsh $imm8,xmm/mem,xmm,k{k} */
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0xc2): /* vcmpph $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
@@ -7905,13 +7916,13 @@ x86_emulate(
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5d): /* vmin{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5e): /* vdiv{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5f): /* vmax{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_all_fp;
 
     CASE_SIMD_ALL_FP(_EVEX, 5, 0x5a):  /* vcvtp{h,d}2p{h,d} [xyz]mm/mem,[xyz]mm{k} */
                                        /* vcvts{h,d}2s{h,d} xmm/mem,xmm,xmm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         if ( vex.pfx & VEX_PREFIX_SCALAR_MASK )
             d &= ~TwoOp;
         op_bytes = 2 << (((evex.pfx & VEX_PREFIX_SCALAR_MASK) ? 0 : 1 + evex.lr) +
@@ -7922,7 +7933,7 @@ x86_emulate(
                                        /* vcvtqq2ph [xyz]mm/mem,xmm{k} */
     case X86EMUL_OPC_EVEX_F2(5, 0x7a): /* vcvtudq2ph [xyz]mm/mem,[xy]mm{k} */
                                        /* vcvtuqq2ph [xyz]mm/mem,xmm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         op_bytes = 16 << evex.lr;
@@ -7932,7 +7943,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(5, 0x5b): /* vcvttph2dq [xy]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x78): /* vcvttph2udq [xy]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x79): /* vcvtph2udq [xy]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7954,7 +7965,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7b): /* vcvtph2qq xmm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7991,7 +8002,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xba): /* vfmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbc): /* vfnmadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbe): /* vfnmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -8013,7 +8024,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xbb): /* vfmsub231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbd): /* vfnmadd231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbf): /* vfnmsub231sh xmm/m16,xmm,xmm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
         if ( !evex.brs )
@@ -8022,13 +8033,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(6, 0x4c): /* vrcpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x4e): /* vrsqrtph [xyz]mm/mem,[xyz]mm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(6, 0x4d): /* vrcpsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x4f): /* vrsqrtsh xmm/m16,xmm,xmm{k} */
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
@@ -8046,7 +8057,7 @@ x86_emulate(
     {
         unsigned int src1 = ~evex.reg;
 
-        vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || ((b & 1) && ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
         if ( mode_64bit() )
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -814,7 +814,7 @@ static void __init noinline xstate_check
     if ( cpu_has_mpx )
         check_new_xstate(&s, X86_XCR0_BNDCSR | X86_XCR0_BNDREGS);
 
-    if ( cpu_has_avx512f )
+    if ( boot_cpu_has(X86_FEATURE_AVX512F) || boot_cpu_has(X86_FEATURE_AVX10) )
         check_new_xstate(&s, X86_XCR0_HI_ZMM | X86_XCR0_ZMM | X86_XCR0_OPMASK);
 
     /*
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -366,7 +366,7 @@ XEN_CPUFEATURE(PREFETCHI,          15*32
 XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
-XEN_CPUFEATURE(AVX10,              15*32+19) /*   AVX10 Converged Vector ISA */
+XEN_CPUFEATURE(AVX10,              15*32+19) /*a  AVX10 Converged Vector ISA */
 XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */


