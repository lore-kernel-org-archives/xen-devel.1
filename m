Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A292F606A32E
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UD3wrNnF
Received: from list by lists.xenproject.org with outflank-mailman.1483744.1687099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Dg-0000mL-9x; Wed, 11 Nov 2026 14:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483744.1687099; Wed, 11 Nov 2026 14:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Dg-0000mE-6i; Wed, 11 Nov 2026 14:22:36 +0000
Received: by outflank-mailman (input) for mailman id 1483744;
 Wed, 11 Nov 2026 14:22:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Df-0000lR-9c
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:22:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9De-00EL5Y-Mr
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:22:34 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a1d-bab6-0a2a0a5309dd-0a2a4507c7a8-46
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:22:34 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a2a-b4ea-0a2a45070019-d155dd36b16f-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:22:34 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa87so2122810f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:22:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498363e0019sm11875514f8f.38.2026.11.11.06.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:22:32 -0800 (PST)
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
        d=suse.com; s=google; t=1794406954; x=1795011754; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IfLujnHHAQq7n/CJq+iWqDq2gS8o3naHckvvIycPxJY=;
        b=UD3wrNnFSRsLYtmsKdXvoKKWRtbOfg4ipF441QBhG6Cd6aoPDcdL/bUMM/RS3uHF/r
         ei1tJpT43PtkVHbw4u14Grx1PIB4mF3TpDndXjl23rEVImCRGSa80dLthLMHlejz5t2G
         XoVvaTaNrfLL7nUlm2F8/3DrrIc00lUqdynf4xEqqivc+27Devz9Mk9IVyUM2hTkO1Cs
         ulK07i0Xowdm1ALgDVCPVSPpETpsgPP8LVfSD+/n7oo5XAfQZOWPOW7Q9IiV6Vy8QIpL
         wgOFu78z3CSKNXw5h1HR22PkNBAg9D72a1d/kKBD/UAi7HmjMFgOLUPKuctX7/Uo5iiw
         6zKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406954; x=1795011754;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IfLujnHHAQq7n/CJq+iWqDq2gS8o3naHckvvIycPxJY=;
        b=OKW57jXpNjy30QSgApY27LYkuDZ2wY/vZrfddnhIwGxypNcWSSTl+C2GyLAZE/M6Zd
         G7K1mBHn6mgswL8bHOG9y1eMLfTcRwhT/dehyOpMI0C/GN5DHRcWkTMxV8femCghI566
         qcM10RJW/El1NBrlyhhC4KNCJCjB70VHJOjRrFasDArJx4k1K13Mo0pDxlR9W9uIkLFW
         xid62SLagnO569xElleFAjiHKpVP4CvmfOUVQFA4Y9IBX6x/ggH4UR+Wab/p6qLndlFR
         9WYgdTmM5/HBv84dUekzIl0liOImBbyBIAF1lyCBck4GACj+qposcBQbDMu+hWFU+FxN
         tbhg==
X-Gm-Message-State: APuU4Z/EoAypdhA1zWWlNXpvmWNjh81RhG2qv17pbqiio9tjvaPeMlca
	g4edlxOk5JWLSy6lSHQQVdL7zJq+YOEDO8ESoY63Nl9YXbrngsAxVegqKASH38L5N9VDObhaBu1
	dFpdJ8A==
X-Gm-Gg: AYBFou0877pocuk+gzqWLTpP6Mgi+7dmFzw61gBqK63iAV4DeVoMBlznfmul2CQSMBe
	6/4GeCqBqT0djXp1PKHpFPOpwGxZaBbLrqEe8A+6wlbgfbu1QE5UmzLPg6YE8cOG3i0CdV2K87b
	fVZfV3Rg+sBgKlWneDgQkuu/X4mzF1puDr1RbF5IMKg/LnOKQ1FYnLqHMoI/vWoEeHVgp/ce97H
	fas568Y91QNGAM9AjrqqJoA3DPhH3aBhcHtj4W9Y+15oLMx0lqF8DC/VYmstWRCRsJcHrfdQMSb
	PlQmXqH+dQfRi0bmXq7U7mLN8UX+q4TFyAkaJOa3xIADgPh3uHT1yTNQRc5SCVdzqFOBdFqeyZE
	yQ6qlx4RFxmXJRY4RvuxqDuG0dyOUTQUH6lxrnCh2B8W5W6IkzCECtx07fTaFcd+ZUx34TKXFhG
	js6iiv5qmZuVESGlU9HV5Y/0La4Bh+V1mZLLsNRrr88ktpGgSvzS4XJOCGhKysBJtpuNbhjbpJ4
	Ges2OLZGfzdG+CM7S5j9GQvm9in5GX9JxfgA17E0XILkdq31EvL7I4M0VwjPgwZZMw+Qdgkjgd8
	QCo2EMQhPMwkkwTgumzudykSp4Y9LZuO3VYYedDdrUjJoiei9CmtXknbkK3e1Uzs63oQixutlhd
	0fWsLlh71fOrH4K6w
X-Received: by 2002:a05:6000:2501:b0:48f:bb68:4e83 with SMTP id ffacd0b85a97d-499c5d47d63mr4784285f8f.9.1794406953990;
        Wed, 11 Nov 2026 06:22:33 -0800 (PST)
Message-ID: <01eb736f-2b1e-43bf-ab4a-5e5bbb67d212@suse.com>
Date: Wed, 11 Nov 2026 15:22:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 05/30] x86emul: replace earlier relaxation of decode_gpr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
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
In-Reply-To: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794406954-370DDAE4-D32E4452/10/78276251493
X-purgate-type: spam
X-purgate-size: 7285
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Handle eGPR-s in a new out-of-line helper, while restoring some code to
the state before commit e8af03bf9a32 ("x86emul: prepare for AVX512F S/G
insns"). Some of the function invocations are "just in case"; to allow
these to continue to work without adding logic to tell whether for a
particular insn a particular operand is a GPR or another knd of
register, record register numbers in the new structure in all cases,
while fetching register values only when eGPR-s are actually enabled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The almost-pure C variant of the register latching would be something
like

           switch ( reg )
           {
#define CASE(regno, basereg)                                          \
           case regno:                                                \
               /* REX2 prefixes with W, R4 and possibly R3 set. */    \
               asm ( ".byte 0xd5, 0x48 | %c1; mov %%" #basereg ", %0" \
                     : "+m" (egpr->val[i])                            \
                     : "i" ((regno & 8) >> 1) )

           CASE(16, eax); break;
           CASE(17, ecx); break;
           CASE(18, edx); break;
           CASE(19, ebx); break;
           CASE(20, esp); break;
           CASE(21, ebp); break;
           CASE(22, esi); break;
           CASE(23, edi); break;
           CASE(24, eax); break;
           CASE(25, ecx); break;
           CASE(26, edx); break;
           CASE(27, ebx); break;
           CASE(28, esp); break;
           CASE(29, ebp); break;
           CASE(30, esi); break;
           CASE(31, edi); break;
#undef CASE

           default:
               ASSERT_UNREACHABLE();
               break;
           }

which, because of the way the compiler translates the switch(), ends up
larger without (imo) being that much easier to read.

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -32,7 +32,7 @@ GCOV_FLAGS := --coverage
 
 OBJS := fuzz-emul.o x86-emulate.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
-OBJS += x86_emulate/decode.o x86_emulate/fpu.o
+OBJS += x86_emulate/decode.o x86_emulate/fpu.o x86_emulate/util.o
 
 WRAPPED = $(shell sed -n 's,^ *WRAP(\([[:alnum:]_]*\));,\1,p' \
                       ../../tests/x86_emulator/x86-emulate.h)
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -143,6 +143,8 @@ static inline uint64_t xgetbv(uint32_t x
     return ((uint64_t)hi << 32) | lo;
 }
 
+#define get_xcr0() xgetbv(0)
+
 /* Intentionally checking OSXSAVE here. */
 #define cpu_has_xsave     (cpu_policy.basic.raw[1].c & (1u << 27))
 
@@ -225,6 +227,8 @@ void wrpkru(unsigned int val);
                                      xcr0_mask(0xe6))
 #define cpu_has_avx10_2_aux         (cpu_policy.avx10.avx10_v2_aux && \
                                      xcr0_mask(0xe6))
+#define cpu_has_apx_f               (cpu_policy.feat.apx_f && \
+                                     xcr0_mask(X86_XCR0_APX))
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -7,6 +7,74 @@
  */
 
 #include "private.h"
+#ifdef __XEN__
+#include <asm/xstate.h>
+#endif
+
+unsigned long *decode_egpr(struct egpr *egpr, unsigned int reg)
+{
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(egpr->regno); ++i )
+    {
+       unsigned int xcr0 = 0;
+
+       if ( egpr->regno[i] == reg )
+           break;
+
+       if ( egpr->regno[i] )
+           continue;
+
+       egpr->regno[i] = reg;
+
+       /*
+        * Obtain the active XCR0 here, for not having emulation context or an
+        * ops structure available, as this is a utility function used also
+        * from outside of the emulator.
+        */
+       if ( cpu_has_apx_f )
+           xcr0 = get_xcr0();
+
+       /* Fetch the register value if accessible. */
+       if ( xcr0 & X86_XCR0_APX )
+       {
+#ifdef __x86_64__
+           asm ( "sub	$17, %[reg]\n\t"
+
+                 /* mov %r16, (%rdi) */
+                 ".byte 0xd5, 0x48; mov %%eax, (%%rdi)\n\t"
+
+                 /* cfcmovz %r17, (%rdi) */
+                 ".byte 0x62, 0xe4, 0xfc, 0x0c, 0x44, 0x0f\n\t"
+
+                 ".irp n, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30\n\t"
+
+                 "dec	%[reg]\n\t"
+
+                 /* cfcmovz %r\n, (%rdi) */
+                 ".byte 0x62, 0x64 + ((~\\n & 8) << 4), 0xfc, 0x0c\n\t"
+                 ".byte 0x44, 0x07 + ((\\n & 7) << 3)\n\t"
+
+                 ".endr\n\t"
+
+                 /* cfcmovg %r31, (%rdi) */
+                 ".byte 0x62, 0x64, 0xfc, 0x0c, 0x4f, 0x3f"
+
+                 : [reg] "+r" (reg), "=m" (egpr->val[i])
+                 : "D" (&egpr->val[i]) );
+
+           egpr->orig[i] = egpr->val[i];
+#endif
+       }
+
+       break;
+    }
+
+    ASSERT(i < ARRAY_SIZE(egpr->val));
+
+    /* Note that this also acts as array_access_nospec() stand-in. */
+    return &egpr->val[i & (ARRAY_SIZE(egpr->val) - 1)];
+}
 
 unsigned int x86_insn_length(const struct x86_emulate_state *s,
                              const struct x86_emulate_ctxt *ctxt)
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -634,27 +634,36 @@ int x86_emulate_wrapper(
 /* Map GPRs by ModRM encoding to their offset within struct cpu_user_regs. */
 extern const uint8_t cpu_user_regs_gpr_offsets[X86_NR_GPRS];
 
+/*
+ * APX insn can reference up to 4 GPRs: Either up to three register operands
+ * or up to two register operands and one memory operand, the latter using
+ * potentially both base and index register.
+ */
 struct egpr {
+	unsigned char regno[4];
+	unsigned long val[4], orig[4];
 };
 
+unsigned long *decode_egpr(struct egpr *egpr, unsigned int reg);
+
 /*
- * Given the 'reg' portion of a ModRM byte, and a register block, return a
- * pointer into the block that addresses the relevant register.
+ * Given the 'reg' portion of a ModRM byte, and a pair of register blocks,
+ * return a pointer into either block that addresses the relevant register.
  */
 static inline unsigned long *decode_gpr(struct cpu_user_regs *regs,
                                         struct egpr *egpr,
                                         unsigned int reg)
 {
+    if ( reg & 0x10 )
+        return decode_egpr(egpr, reg);
+
     /* Check that the array is a power of two. */
     BUILD_BUG_ON(ARRAY_SIZE(cpu_user_regs_gpr_offsets) &
                  (ARRAY_SIZE(cpu_user_regs_gpr_offsets) - 1));
 
-    /*
-     * Note that this also acts as array_access_nospec() stand-in.  Higher
-     * bits may legitimately come in set here, from EVEX decoding, and
-     * hence truncation is what we want (bits not ignored will get checked
-     * elsewhere).
-     */
+    ASSERT(reg < ARRAY_SIZE(cpu_user_regs_gpr_offsets));
+
+    /* Note that this also acts as array_access_nospec() stand-in. */
     reg &= ARRAY_SIZE(cpu_user_regs_gpr_offsets) - 1;
 
     return (void *)regs + cpu_user_regs_gpr_offsets[reg];


