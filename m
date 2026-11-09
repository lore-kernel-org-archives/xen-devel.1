Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558CA606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Jm7fTvFZ
Received: from list by lists.xenproject.org with outflank-mailman.1480033.1683962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP6U-0008Sb-4Q; Mon, 09 Nov 2026 13:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480033.1683962; Mon, 09 Nov 2026 13:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP6U-0008SS-18; Mon, 09 Nov 2026 13:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1480033;
 Mon, 09 Nov 2026 13:08:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQP6T-0008SC-4G
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:08:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQP6S-003xok-H9
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:08:04 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c5a5-8faa-0a2a0a5109dd-0a2a4508a774-34
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:08:04 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c5b4-f659-0a2a45080019-d155dd2db196-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:08:04 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa87so541100f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:08:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597d0a775sm10792976f8f.55.2026.11.09.05.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:08:03 -0800 (PST)
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
        d=suse.com; s=google; t=1794229684; x=1794834484; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SecZZq9fuPHvRmh1WvuUmmfIbPjJb6Pt5XQ5H/cNAmk=;
        b=Jm7fTvFZ4Io7lDN5PpEzx90t0ttaA4JPFy0dFKNiUZDItlXOOUvfPU28BLmXTdB7H/
         m4Z08ZhSSe/xva6Fp/cgwIYR/Bb2Ya7pArnIYMfpxHU8tl7EHh+a9cy6Y083ZGx50RII
         gDo9gymRnDRMop6KtLKdNkgWJ2hXfyxhGc5RLKF3ilhAXSldYTqyZXPq7pVUQG5gikwu
         nZDfI5db7FkSYgdk0vmn50Wa3dx6R8YJUWQ5jhhN/UvKrLf49/9a3Q9aNuH7PJkSPTNA
         +4Zacr96tAyfzx8J1yKyHyBzNFfMrYyBSW3qjMhE7eqeGoTzZ8XfuyUoIERzwOIbTFwq
         rBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229684; x=1794834484;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SecZZq9fuPHvRmh1WvuUmmfIbPjJb6Pt5XQ5H/cNAmk=;
        b=E11B6I8Me8MPDlqAp44Tjv8QZLBScLp5gon3Lq/PahXwCF4swl+J9jAcRKvaW+HZNt
         /wWEiPgd4hoa1QM/ZEhOnGSHhEF7XXxbDmTy3QchqUdmfCYtzP18E5oxBm47Zegj70C/
         Wl1YAWmGmKSnoe/9Z0Vlpmj2Ix82TVRmVD3LG5tYi/OcnWu6ZSorJCGcltrN1Uq9JS+v
         5AFwIHTx6XXD01htwROLTB7X75AdoVjGGfYIxEvnrLjyn6Vt3FJZgznkBuJXo9QenKzk
         D0uRbT5Apl5wQhFWOX96R63iXPWY/2upcqyLp1yWiOnu8mUDVxTZLrzCcpDWAfYxOlWe
         RWpg==
X-Gm-Message-State: APuU4Z9sktpYHNrq6oybyfSij2t5Tw0Z+8V3/0UsFtScG6MqqUaLBIUE
	YzPk1x+aSAOCcaJp+3zP26+Qe/4nOF0ReH52741TrcOjl7OcbewNzornoQXjf5SX1MGgfl6vUP/
	i6MRXNQ==
X-Gm-Gg: AYBFou126YBvBNxQSingCfOiZy9s9x9UzhfXuY6w+OMMpILj5HmD5qajvbCWzzK3yeV
	aZCQgKx/saC+coa5G2FRpn5LTxDuO4ostze3EgBtoRoZms1wAhuSoNGjJ6VjsLtdOV1GPSt1ifZ
	b0uizO9YhmqfnLL7RLIO0l8gDSpE5dxOmYsvot0aNHKkSiWZSrLIFIC0QJYI7RB0PuQf9WeaRmq
	L9NYooPpIcsRfmqp02VvfGb4mJPAmr7+r8CFDNysE+3dk6EJzmHsNUrDo52/gdnxeWeZpjrfC5u
	+vNwVZBGqzt+EWxA8zP8LqqllCVpQWhEcIQOEnj8Wb+CxJWLwb3s/4x9XQkBQBaeTk8kOX0AOmg
	fuSaFtTEfDb3qd4+AkTw7A3Ti+QWwrzgXO++o2mII5vlcX+IvZmX1aLb+Ybj8478li8xxBenTnk
	9poefaMRJri4mXbF3rjD+zEh0Ntrq1GuaNNAHTGLcOarQFTwoYFQiwJMZieVod11IWR1raMvC+b
	0psbgp3JJ9e4awtd6DJknpi70XRekqZcDkBY2uhsdYLw3cIRYY8kYWhy8BOTICWTju+chdbx5cS
	kWXztGGJiLttu39ZhAtjtseD5w73zj1i6NG4nHvkaycsy7E91Rbm2AexuHAwFVpHb0qJNkEfU/J
	nBA==
X-Received: by 2002:a05:6000:25ea:b0:490:2d81:ccbb with SMTP id ffacd0b85a97d-49584e3dccbmr7579686f8f.52.1794229683646;
        Mon, 09 Nov 2026 05:08:03 -0800 (PST)
Message-ID: <2b348885-fb2d-420f-8f71-81e3a9c836af@suse.com>
Date: Mon, 9 Nov 2026 14:08:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/4] x86: record SSP at non-guest entry points
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
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
In-Reply-To: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794229684-CE74387B-49275601/10/78276251493
X-purgate-type: spam
X-purgate-size: 2764
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We will want to use that value for call trace generation, and likely
also to eliminate the somewhat fragile shadow stack searching done in
fixup_exception_return(). For those purposes, guest-only entry points do
not need to record that value.

To keep the saving code simple, record our own SSP that corresponds to
an exception frame, pointing to the top of the shadow stack counterpart
of what the CPU has saved on the regular stack. Consuming code can then
work its way from there.

In SAVE_ALL / RESTORE_ALL simply drop the use of UREGS_r15. We want the
full size in all cases, so what exactly the top-of-stack field is going
to be (whose UREGS_* is 0 anyway) doesn't matter this much there. This
way we don't need to distinguish between XEN_SHSTK=y and XEN_SHSTK=n.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Drop ssp parameter of PUSH_AND_CLEAR_GPRS again.
v4: Re-base.
v3: Put new field at the front of struct cpu_user_regs.
v2: Add comment ahead of SAVE_ALL. Add comma between its parameters.
    Re-base.

--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -259,12 +259,19 @@ static always_inline void stac(void)
         xor   %r14d, %r14d
         push  %r15
         xor   %r15d, %r15d
+#ifdef CONFIG_XEN_SHSTK
+        rdsspq %rcx
+        push  %rcx
+#endif
 .endm
 
 /*
  * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
  */
 .macro POP_GPRS skip_rax=0
+#ifdef CONFIG_XEN_SHSTK
+        pop   %rcx
+#endif
         pop   %r15
         pop   %r14
         pop   %r13
--- a/xen/arch/x86/include/asm/cpu-user-regs.h
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -11,6 +11,15 @@
  */
 struct cpu_user_regs
 {
+#ifdef CONFIG_XEN_SHSTK
+    /*
+     * This points _at_ the corresponding shadow stack frame; it is _not_ the
+     * outer context's SSP.  That, if the outer context has CET-SS enabled,
+     * is stored in the top slot of the pointed to shadow stack.
+     */
+    uint64_t entry_ssp;
+#endif
+
     union { uint64_t r15;    uint32_t r15d;   uint16_t r15w;  uint8_t r15b; };
     union { uint64_t r14;    uint32_t r14d;   uint16_t r14w;  uint8_t r14b; };
     union { uint64_t r13;    uint32_t r13d;   uint16_t r13w;  uint8_t r13b; };
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -57,6 +57,9 @@ void __dummy__(void)
     OFFSET(UREGS_eflags, struct cpu_user_regs, rflags);
     OFFSET(UREGS_rsp, struct cpu_user_regs, rsp);
     OFFSET(UREGS_ss, struct cpu_user_regs, ss);
+#ifdef CONFIG_XEN_SHSTK
+    OFFSET(UREGS_entry_ssp, struct cpu_user_regs, entry_ssp);
+#endif
     DEFINE(UREGS_kernel_sizeof, sizeof(struct cpu_user_regs));
     BLANK();
 


