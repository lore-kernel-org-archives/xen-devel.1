Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9946DC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:24:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383155.1626414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXrW-0006ou-90; Wed, 05 Aug 2026 09:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383155.1626414; Wed, 05 Aug 2026 09:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXrW-0006on-69; Wed, 05 Aug 2026 09:24:34 +0000
Received: by outflank-mailman (input) for mailman id 1383155;
 Wed, 05 Aug 2026 09:24:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXrV-0006oU-HA
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:24:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXrU-00HWng-U1
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:24:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730150-e002-0a2a0a5209dd-0a2a450ccecc-2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:24:32 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730150-f479-0a2a450c0019-d155dd31e523-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:24:32 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47fdd674e17so433959f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:24:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfe5d7csm7756543f8f.15.2026.08.05.02.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:24:31 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785921872; x=1786526672; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yh5sgqmpsiDgmmWKbLvnKvsyVo9fXTHQYMZ46x1tb84=;
        b=S13YAMA4Sq3UqVAGo2NUs01F4Db/yaayCQ0DugXLpk+haMa9504+qCWsIghznJgp4M
         FujhkJ3xfviyKy303eOU/AKomKe9M4dOTTwEyAhAKiNPHD2PY8vgQIEJi0HiRAZ33IHL
         UWIdhE9JGICCJ0yTzVUBHKc2lYJPPv6ZUZYc2wya/Bo/aUXhKpv6ktJWXsoyoiyoXeuh
         Ts+XHVGCYUbSLIaddn3qoQCZEe6RqRUoq/7l7qOEgNLw1p4ZYw54riv1HbTh/7FwE8eY
         fZBddbzRQKYGDXNTiridvoEmLi2oFvn0auYTlU6n3epIOdHpksZol6xWIZ6awTcPNfMh
         z2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921872; x=1786526672;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yh5sgqmpsiDgmmWKbLvnKvsyVo9fXTHQYMZ46x1tb84=;
        b=AN6kakfyv4KtavxfME1wy4dGWQfRc4GZpNr79pCPCVaMabpubb985eIKPILf1cJMgj
         f+uKW3ajxPFSy46ErJy3wGC9xxXem8Du6lQaHAQFDGOZG40b8o66er31T4pTtlJJVyEj
         VrlDrg/M0rDp2RfpoiYgdfrvFUwuEyqklGKUk6rgP6ZWzCKETkcnK9KAhv7Ds/Z5H51n
         a7GIdMt/Z4QzV18nAwe7fMWH8MIbYreKonrW8X1sIZ0p31vs30t5LLmfWBJzYpi+AfXa
         yWxJPmDvHlU55GROOvI17VuUG6rjcbDC/EIVYP8H9MihjnZ6ArMO92de0YPHgYrg1ZhG
         1vmA==
X-Gm-Message-State: AOJu0YxCbM6Rzh1lAmfyJ0K0SB73t2rHuUFD1iX0mDfXPdurrdcbwSEc
	FTRq7Um+4PUlytHEm0TmJQaGlTAWF+uvmiSEVmavNGbQP0u72efhIzHLH5D/2p2VLPaKvKjxL7r
	nmX+QIw==
X-Gm-Gg: AR+sD13XywLOfX4kjMkV5F7lUZdZWZ9n8bOZeJwpcDOkFhdhLdM5y/d3/GQJzy3Vsb2
	9yNgQE9Kx4JH901VzU/wlQWBgsHR0JT4eNomWAUciiUUk+fFdJf9vgq/3nHDhaIFNSKJFWVahTa
	naCxex2RvtdeQOUX6MVPj5nI/LYkwWaQTvse/ygwAOoYpnva7lkKxynY4gbVizUQmK101rQW/H9
	N5j6dPVTCwfJGN09erUhQgHvEhsIu+WhmhdIX4VGbBpwgRMweRTsTPGg5UK+RELRTv1DNEYEqTD
	2OnuD7tAokHrX8bsBoNK0EhLpWMOeV4v0kLZ2I3DTBQQihLMLxsqU6txwazjroCeChBY9qVYGOx
	eVFB1ETxZCD68UYas6G2QYc+NtUuhP0eXSt7h6DpxaVHGUGU8gIIW3OaAlTZAnv4yo/X5fceq5X
	/AjIw4pvpee/JnEhYl++/Td7qojwCjAndz6jJLuw3RnWk86PzWIB5XUGDBLaWlTjAPl6qzfA64H
	lRkmLByXaxST9yBUTc0FW/teIjEVqsYtntJ/RpF6+p5U8QG9uB/
X-Received: by 2002:a05:6000:29d5:b0:47f:c648:e27b with SMTP id ffacd0b85a97d-47fec4e6fbcmr6793319f8f.2.1785921872105;
        Wed, 05 Aug 2026 02:24:32 -0700 (PDT)
Message-ID: <818b1fd4-ade7-4702-9dc6-f75fb0cfc575@suse.com>
Date: Wed, 5 Aug 2026 11:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v10 5/6] x86emul: support MSR-IMM instructions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
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
In-Reply-To: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785921872-022C0A5B-BC100AB1/0/0
X-purgate-type: clean
X-purgate-size: 6509

Encoding-wise these are very similar to URDMSR/UWRMSR, so existing logic
is easy to extend.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v10: Drop vex.opcx part of #UD check (wrongly copied from USER-MSR code).
     Re-base.
v8: Don't mark the feature 's' just yet. Re-base.
v7: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1522,6 +1522,8 @@ static const struct vex {
     { { 0xdf }, 3, T, R, pfx_66, WIG, Ln }, /* vaeskeygenassist */
     { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
 }, vex_map7[] = {
+    { { 0xf6, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* wrmsrns */
+    { { 0xf6, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* rdmsr */
     { { 0xf8, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* uwrmsr */
     { { 0xf8, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* urdmsr */
 };
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1571,6 +1571,30 @@ int main(int argc, char **argv)
     if ( (rc != X86EMUL_EXCEPTION) ||
          (regs.rip != (unsigned long)&instr[0]) )
         goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing rdmsr $MSR_GS_BASE,%rdx...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7b; instr[3] = 0xf6; instr[4] = 0xc2;
+    *(uint32_t *)&instr[5] = MSR_GS_BASE;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rdx = ~gs_base;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (regs.rdx != gs_base) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing wrmsrns %rsi,$MSR_SHADOW_GS_BASE...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7a; instr[3] = 0xf6; instr[4] = 0xc6;
+    *(uint32_t *)&instr[5] = MSR_SHADOW_GS_BASE;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0x665544332211UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (gs_base_shadow != 0x665544332211UL) )
+        goto fail;
 
     emulops.write_msr     = NULL;
 #endif
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -67,6 +67,7 @@ bool emul_test_init(void)
     cpu_policy.feat.lkgs = true;
     cpu_policy.feat.wrmsrns = true;
     cpu_policy.feat.msrlist = true;
+    cpu_policy.feat.msr_imm = true;
     cpu_policy.feat.user_msr = true;
     cpu_policy.extd.clzero = true;
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1271,8 +1271,9 @@ int x86emul_decode(struct x86_emulate_st
                     case vex_map7:
                         opcode |= MASK_INSR(7, X86EMUL_OPC_EXT_MASK);
                         /*
-                         * No table lookup here for now, as there's only a single
-                         * opcode point (0xf8) populated in map 7.
+                         * No table lookup here for now, as there are only two
+                         * (very similar) opcode points (0xf6, 0xf8) populated
+                         * in map 7.
                          */
                         d = DstMem | SrcImm | ModRM | Mov;
                         s->op_bytes = 8;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -616,6 +616,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
 #define vcpu_has_movrs()       (ctxt->cpuid->feat.movrs)
+#define vcpu_has_msr_imm()     (ctxt->cpuid->feat.msr_imm)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7086,6 +7086,35 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
+    case X86EMUL_OPC_VEX_F3(7, 0xf6): /* wrmsrns r64,imm32 */
+    case X86EMUL_OPC_VEX_F2(7, 0xf6): /* rdmsr imm32,r64 */
+        generate_exception_if((!mode_64bit() || ea.type != OP_REG ||
+                               (modrm_reg & 7) ||
+                               vex.l || vex.w || vex.reg != 0xf),
+                              X86_EXC_UD);
+        vcpu_must_have(msr_imm);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        if ( vex.pfx == vex_f2 )
+        {
+            /* urdmsr */
+            fail_if(!ops->read_msr);
+            if ( (rc = ops->read_msr(imm1, &msr_val, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.val = msr_val;
+            ASSERT(dst.type == OP_REG);
+            dst.bytes = 8;
+        }
+        else
+        {
+            /* wrmsrns */
+            fail_if(!ops->write_msr);
+            if ( (rc = ops->write_msr(imm1, dst.val, ctxt,
+                                      true)) != X86EMUL_OKAY )
+                goto done;
+            dst.type = OP_NONE;
+        }
+        break;
+
     case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 / uwrmsr r64,r32 */
     case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 / urdmsr r32,r64 */
         if ( ea.type == OP_MEM )
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -354,6 +354,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 XEN_CPUFEATURE(UC_LOCK_DIS,        13*32+ 6) /*   UC-lock disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
+XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*   RDMSR/WRMSRNS with immediate operand */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -283,7 +283,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
-             LKGS, MOVRS, MSRLIST, USER_MSR],
+             LKGS, MOVRS, MSRLIST, USER_MSR, MSR_IMM],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


