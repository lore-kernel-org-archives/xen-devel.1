Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13BEC5DF81
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 07:41:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398707.1634852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyPJB-0007uv-40; Mon, 24 Aug 2026 07:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398707.1634852; Mon, 24 Aug 2026 07:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyPJB-0007uo-1N; Mon, 24 Aug 2026 07:41:29 +0000
Received: by outflank-mailman (input) for mailman id 1398707;
 Mon, 24 Aug 2026 07:41:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wyPJA-0007ui-2W
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 07:41:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyPJ8-005XZj-Ox
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 09:41:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8bf592-e002-0a2a0a5209dd-0a2a4504afb0-38
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 09:41:26 +0200
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8bf5a6-b57f-0a2a45040019-d155d032c45a-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 09:41:26 +0200
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6a18840e2abso5436018a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 00:41:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59dd550bcsm7944233a12.0.2026.08.24.00.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 00:41:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787557286; x=1788162086; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6FjKIhLvuDC2eEldBE9utv0h1r0RkC7q9zuRaTDtrKA=;
        b=NuY+TVbKpa9t11DlzV2khy6j8ZO9QGmS9vnia8+X7VJQzXOaiDlschqoK1/IEzdZNh
         /2KfUwtF7szoTRQ0b7S+QHPX1P1wFkKyRLvuD2UnFA8DmM5XOSP3n4JwAOW4dYMxrCke
         ZHYI6fbquyCJTFWy7vm5CFGihpOBrvU6RiiwcaFRALuCtKF7oW+ESnmQF5G5Z++9H1Ef
         sipEBMWceXZfrvdrka5/Ca1M5Ex/TFxRvRy15kUC9jnUMIOrJWh6V0122YafYWc4OIxU
         OwSCTI3U5r34j6RI3513I8qpo2EbiGtJAVIkaWiCHwNnWhPAOajkvDuiOvpSkXRLbCg0
         QyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557286; x=1788162086;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FjKIhLvuDC2eEldBE9utv0h1r0RkC7q9zuRaTDtrKA=;
        b=Yr7Y6A8TBKypbcfmWpyypGbIYZybKOt9h5JOg1raqbvujk1aB7/aapR5Yzov3DlcCY
         FvAVPnNsaqDFV/XNtBL0kXywE2oRn3BVdzUd5/4QE4y0lKvNxfgqADeEHbgPRWsRyDFg
         O25WjZ5R0AVy6yrhWsW3nsA5bQ5b9jVfm8H2NEXi8C7N3RXA1q52nr74wSXFzt3fAlcA
         MJ0A7Ksibr2ZuAD5eypsWUTj1WsolVpkcjKnqPjsUf5YMTz1RCxoCYtoXs8bDOjhWzJ2
         iAeCI9cBttokRxs0pETHCwwSts1HnOHeoxMjuodREsslUwoCTNYM7bRkq8ahFHCrtiBR
         mUYg==
X-Gm-Message-State: AFuF++mwlJj6qFOFDM7cUxWofGwjlAnwhIcO3kYQtPK/ABoRE8uBsyI2
	Rl3JYJ4qsvzfImdvHgFPQ0fbOu0quLOSYfqZo2hQV4lOnT0iXsDTVklzJD+OPEAoUs9MzTEZd+F
	UCfiBdA==
X-Gm-Gg: AR+sD13TGCDg8X5FQp82jooOjTCWMlYRleAy/aR/n++zjao0yWXmL4B24mtjjTSMBix
	28HdnokgK265wkTFxDyxrjzMBAgzwNIHDKpeFeg6VnlEMQu4CR+QsQ2YPcG8DyzVQvTfSoMHaoc
	qekRn091RYR0Aye7w9XMBZbMLH8/p+pF2He+ET7WcRf8sQb0WKkro6AwSiaooGpPAU3jyflU4ox
	eiPYmqW2ZHGd8lkGSXzz6zaJ4F9eUi1EWjVHeMwMM+gffrLFpIGfRo34Gqw7rpndiqKJQ237CPs
	ifPGigwAYFwExPV+O4uNC8+8HIk9wvYfpehQz+YLZDod4tdrzkygJsrTeKNiAho1boMJr5FKCuJ
	UyaxzkJQmY9OZ0ajbsjtscEoUxQ1gNlqzPAQ0yPO5OHk2tyUhXuhfrqYHjFGZaHRpBO5sEOZb9I
	IOB7d+TcqRJFS9CaWmhGEBJCG1gVTf6xz7NBzRgtZAatDcfN52HtLpKcP5CBxI1EW+R+sZuKfaZ
	ak6dtMawP4kW6+gfX01c2vqyCxwsstd+XTOEaceSEQ8hz4zmKuk
X-Received: by 2002:a05:6402:4342:b0:6a3:f8ab:19f7 with SMTP id 4fb4d7f45d1cf-6a582b7d8b0mr19827503a12.11.1787557286102;
        Mon, 24 Aug 2026 00:41:26 -0700 (PDT)
Message-ID: <d3d188c2-32c5-45ee-9b10-1f4ee1b85c6e@suse.com>
Date: Mon, 24 Aug 2026 09:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Andrew Mbugua <andrewprecious388@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/fuzz: sanitize CR4 values
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787557286-C30CDB50-8A834B66/0/0
X-purgate-type: clean
X-purgate-size: 5663

While the CPU policy is obtained from hardware, the CRn values to start
with are taken from fuzzed input. Since most CR4 bits can only be set when
the respective feature is indicated as available by CPUID, the emulator
often only checks the CR4 bit. Without sanitization, assertions like the
one in emul_test_read_xcr() (checking XSAVE support) could therefore
trigger.

Omit most paging-only bits from sanitization, as the core emulator doesn't
itself walk page tables. LA57 wants checking for the bit being used by
CANONICALIZE_MAYBE().

Reported-by: Andrew Mbugua <andrewprecious388@gmail.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For this to have the overall intended effect, the previously submitted
https://lists.xen.org/archives/html/xen-devel/2026-08/msg01018.html
also need including.

UINTR is omitted, as the feature reportedly is about to be deprecated by
Intel, and hence we may never add support for it to the emulator. (We also
don't have X86_CR4_UINTR in x86-defns.h.)

Checks like the one for VMXE, SMXE, CET, and FRED are forward-looking, as
the emulator is yet to gain support for those.

--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -825,6 +825,58 @@ static void sanitize_input(struct x86_em
     regs->entry_vector = 0;
 
     /*
+     * Most CR4 bits can only be set when corresponding CPUID bits are set.
+     * (In such cases the emulator may only check the CR4 bit.)
+     */
+    if ( !cpu_policy.basic.vme )
+        c->cr[4] &= ~(X86_CR4_VME | X86_CR4_PVI);
+
+    if ( !cpu_policy.basic.tsc )
+        c->cr[4] &= ~X86_CR4_TSD;
+
+    if ( !cpu_policy.basic.de )
+        c->cr[4] &= ~X86_CR4_DE;
+
+    if ( !cpu_policy.basic.fxsr )
+        c->cr[4] &= ~X86_CR4_OSFXSR;
+
+    if ( !cpu_policy.basic.sse )
+        c->cr[4] &= ~X86_CR4_OSXMMEXCPT;
+
+    if ( !cpu_policy.feat.umip )
+        c->cr[4] &= ~X86_CR4_UMIP;
+
+    if ( !cpu_policy.feat.la57 )
+        c->cr[4] &= ~X86_CR4_LA57;
+
+    if ( !cpu_policy.basic.vmx )
+        c->cr[4] &= ~X86_CR4_VMXE;
+
+    if ( !cpu_policy.basic.smx )
+        c->cr[4] &= ~X86_CR4_SMXE;
+
+    if ( !cpu_policy.feat.fsgsbase )
+        c->cr[4] &= ~X86_CR4_FSGSBASE;
+
+    if ( !cpu_policy.basic.pcid )
+        c->cr[4] &= ~X86_CR4_PCIDE;
+
+    if ( !cpu_policy.basic.xsave || !cpu_has_xsave )
+        c->cr[4] &= ~X86_CR4_OSXSAVE;
+
+    if ( !cpu_policy.feat.pku )
+        c->cr[4] &= ~X86_CR4_PKE;
+
+    if ( !cpu_policy.feat.cet_ss && !cpu_policy.feat.cet_ibt )
+        c->cr[4] &= ~X86_CR4_CET;
+
+    if ( !cpu_policy.feat.pks )
+        c->cr[4] &= ~X86_CR4_PKS;
+
+    if ( !cpu_policy.feat.fred )
+        c->cr[4] &= ~X86_CR4_FRED;
+
+    /*
      * For both RIP and RSP make sure we test with canonical values in at
      * least a fair number of cases. As all other registers aren't tied to
      * special addressing purposes, leave everything else alone.
@@ -839,10 +891,14 @@ static void sanitize_input(struct x86_em
     if ( c->cr[0] & X86_CR0_PG )
         c->cr[0] |= X86_CR0_PE;
 
-    /* EFLAGS.VM not available in long mode */
+    /* EFLAGS.VM not available in long mode, but CR4.PAE is required. */
     if ( long_mode_active(ctxt) )
+    {
         regs->rflags &= ~X86_EFLAGS_VM;
 
+        c->cr[4] |= X86_CR4_PAE;
+    }
+
     /* EFLAGS.VM implies 16-bit mode */
     if ( regs->rflags & X86_EFLAGS_VM )
     {
@@ -862,12 +918,63 @@ static bool check_state(struct x86_emula
     const struct fuzz_corpus *c = s->corpus;
     const struct cpu_user_regs *regs = &c->regs;
 
-    if ( long_mode_active(ctxt) && !(c->cr[0] & X86_CR0_PG) )
+    if ( long_mode_active(ctxt) &&
+         (!(c->cr[0] & X86_CR0_PG) || !(c->cr[4] & X86_CR4_PAE)) )
         return false;
 
     if ( (c->cr[0] & X86_CR0_PG) && !(c->cr[0] & X86_CR0_PE) )
         return false;
 
+    if ( (c->cr[4] & (X86_CR4_VME | X86_CR4_PVI)) && !cpu_policy.basic.vme )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_TSD) && !cpu_policy.basic.tsc )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_DE) && !cpu_policy.basic.de )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_OSFXSR) && !cpu_policy.basic.fxsr )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_OSXMMEXCPT) && !cpu_policy.basic.sse )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_UMIP) && !cpu_policy.feat.umip )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_LA57) && !cpu_policy.feat.la57 )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_VMXE) && !cpu_policy.basic.vmx )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_SMXE) && !cpu_policy.basic.smx )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_FSGSBASE) && !cpu_policy.feat.fsgsbase )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_PCIDE) && !cpu_policy.basic.pcid )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_OSXSAVE) &&
+         (!cpu_policy.basic.xsave || !cpu_has_xsave) )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_PKE) && !cpu_policy.feat.pku )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_CET) &&
+         !cpu_policy.feat.cet_ss && !cpu_policy.feat.cet_ibt )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_PKS) && !cpu_policy.feat.pks )
+        return false;
+
+    if ( (c->cr[4] & X86_CR4_FRED) && !cpu_policy.feat.fred )
+        return false;
+
     if ( (regs->rflags & X86_EFLAGS_VM) &&
          (c->segments[x86_seg_cs].db || c->segments[x86_seg_ss].db) )
         return false;

