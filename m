Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9C0C43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 10:55:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351640.1608744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF4U-0004Ob-SN; Thu, 02 Jul 2026 10:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351640.1608744; Thu, 02 Jul 2026 10:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF4U-0004OU-PF; Thu, 02 Jul 2026 10:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1351640;
 Thu, 02 Jul 2026 10:55:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfF4T-0004OJ-8T
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:55:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfF4S-00DX1f-LM
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:55:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46437d-5cb7-0a2a0a5109dd-0a2a45019694-16
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:55:04 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a464388-400f-0a2a45010019-d155802eb435-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:55:04 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso3068285e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 03:55:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63648d7sm38769855e9.7.2026.07.02.03.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 03:55:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782989704; x=1783594504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ilPQpTG0pa/hptnKJjw2or04R0MiCz+VtMpqPju/z7U=;
        b=MzfErFCR1KZYRbAUzlKUhQAM0yXaLQObwtOc+bf2+v83c3Ha6Ae8XM1bcJIVHBxk21
         1Q7NGb7M0rCNTncidw4TfIadmZvtbWR+utHk5uMYf8S03IxCJE/bOuiYRi938KkZ/XcV
         X7Yn7/qKwZyM/pQt86FOwuvOg26DC+NmuIBxp+6HWV9SlQb/Lf00sXOy+Ecs9NWiCccJ
         bC2Z4OS7xB04k+dYCif7gpsp41TgS2gEzDendTKFdapgz0HwkZSUK8Ei+rUmW5YR5qpN
         h2UOF1ycRg74fUbKR/BkVQ1BmgGePwv/oR+MXHX3SWQgYb9VobNRs2k2rXPRbtih/dN0
         i/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989704; x=1783594504;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilPQpTG0pa/hptnKJjw2or04R0MiCz+VtMpqPju/z7U=;
        b=R/gZai3fNVLow6ATnXWg8ysR40SFRp7CKZl2B0QW66xJr/w2NPtwo7WDFJlodUgFSF
         HEat85efDSgOoAZAmfx641trTLfKrft8n4bfeRh86FO+KzLrdp1yUFvjfnS12430jmr2
         WLBidvu3cT50vkrnc0xybvTumlVsfW8a0UFBHP16gse0beQ5+MIx9HGvKBOpsx59Nm9q
         Fj5FFVAu/CvdiG2X9ZBBgGhoih1py9bNYtPptx3F7P4lPHNXcrF8Wun10FY+8e2bHaKN
         5WADvzIOJ3QtXGV70TNalNe+H/6IJauQPle1qha1PdCrcS9kiDhlZvSz47WrNajSmIR0
         8eUQ==
X-Gm-Message-State: AOJu0Yy31TK1OfjEv4S9vYZ5rTiJom068rDXGHT27TRHPt3JbvfUKJBQ
	V/067eFpXmBeIhaDXOFR72/5ZCKeIhJtnm6I6r2kHWcaDLICkvUKER5PheKs5yyjNgSyHpBbK39
	QcOBHuA==
X-Gm-Gg: AfdE7cl49xZs/R4OBYanJILRwLBj9Mt7teveHn4OYMQrbk7sD4iGzouY1R+Fwb160R7
	OFI/q8DKLYYwbN78mCKg+YELUVynVZWvPX2aG5SHYV59ST45eTfxFLbe+6CBe7NRnHi3INKOdJJ
	RSD2MrhbB3EDzSeVlxjaUW95S4kicR7rT6uK1l3DnQyjr8Rw/TY5S7YLf0zREwGcEq1Q4iVQ5Y2
	7YWonuUVD62ZVo47TG0s79jHz64m4D6Iv7kWJynMcEClU2fFlp93ECTEsJdIe91ZSUmeL6BdC2p
	N2A/Xqh1Dbq+BmK5Y78wSjXTq1QSCUhWABSdeje02Msk0yffmpG24i75ZA5izaoOwLVadTsm+oO
	00twBSD+n0K+VL6qET0OBJH8CK/DGg8u91xrO1yowkytF05HnWHthXYrHcgvvefPlDazZyjTU70
	tP0GVpJoXEFUzCT6bBS4QnbkTlhrW0hqHLIdJkIbzl8M/D31QgBng9e8JZaovXD+aF5S3juc4st
	bVK
X-Received: by 2002:a05:600c:19cd:b0:493:bcba:3d5f with SMTP id 5b1f17b1804b1-493c63ab8e9mr26066305e9.13.1782989703898;
        Thu, 02 Jul 2026 03:55:03 -0700 (PDT)
Message-ID: <a89951cb-43c0-45bd-aba1-273cd053deae@suse.com>
Date: Thu, 2 Jul 2026 12:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/4] x86/HVM: don't (almost) open-code POP_GPRS
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
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
In-Reply-To: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782989704-D06D61E0-A81DC4AA/0/0
X-purgate-type: clean
X-purgate-size: 2268

It can be used as-is for VMX. For SVM the special treatment of %rax needs
accounting for.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is the minimum required as a prereq to the next patch (to avoid the
need for custom adjustments in the two places). We could go further and
switch to using PUSH_AND_CLEAR_GPRS at the same time.
---
v3: New.

--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -82,22 +82,8 @@ __UNLIKELY_END(nsvm_hap)
          */
         sti
 
-        pop  %r15
-        pop  %r14
-        pop  %r13
-        pop  %r12
-        pop  %rbp
         mov  VCPU_svm_vmcb_pa(%rbx),%rax
-        pop  %rbx
-        pop  %r11
-        pop  %r10
-        pop  %r9
-        pop  %r8
-        pop  %rcx /* Skip %rax: restored by VMRUN. */
-        pop  %rcx
-        pop  %rdx
-        pop  %rsi
-        pop  %rdi
+        POP_GPRS skip_rax=1 /* %rax restored by VMRUN. */
 
         SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
 
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -139,21 +139,7 @@ UNLIKELY_END(realmode)
         and  $SCF_verw, %eax
         or   %eax, %ecx
 
-        pop  %r15
-        pop  %r14
-        pop  %r13
-        pop  %r12
-        pop  %rbp
-        pop  %rbx
-        pop  %r11
-        pop  %r10
-        pop  %r9
-        pop  %r8
-        pop  %rax
-        pop  %rcx
-        pop  %rdx
-        pop  %rsi
-        pop  %rdi
+        POP_GPRS /* Preserves flags. */
 
         jpe  .L_skip_verw
         /* VERW clobbers ZF, but preserves all others, including SF. */
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -357,7 +357,7 @@ static always_inline void stac(void)
 /*
  * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
  */
-.macro POP_GPRS
+.macro POP_GPRS skip_rax=0
         pop   %r15
         pop   %r14
         pop   %r13
@@ -368,7 +368,11 @@ static always_inline void stac(void)
         pop   %r10
         pop   %r9
         pop   %r8
+ .if \skip_rax
+        pop   %rcx
+ .else
         pop   %rax
+ .endif
         pop   %rcx
         pop   %rdx
         pop   %rsi


