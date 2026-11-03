Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685F606A329
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q/fyJmL0
Received: from list by lists.xenproject.org with outflank-mailman.1469349.1678178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOB2K-0007xh-U8; Tue, 03 Nov 2026 09:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469349.1678178; Tue, 03 Nov 2026 09:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOB2K-0007xa-Py; Tue, 03 Nov 2026 09:42:36 +0000
Received: by outflank-mailman (input) for mailman id 1469349;
 Tue, 03 Nov 2026 09:42:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOB2J-0007xU-2G
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 09:42:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOB2I-0069Md-3o
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:42:34 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9ac7e-8faa-0a2a0a5109dd-0a2a450598de-40
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:42:33 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9ac89-4cb1-0a2a45050019-d155802ee181-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:42:33 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so22721385e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 01:42:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b80333sm25877953f8f.32.2026.11.03.01.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 01:42:33 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793698953; x=1794303753; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yfUbWIYMjr45mfwKdq7drkPh6fBU5g7FCa+7yoeN1V8=;
        b=Q/fyJmL0VASOb0ihrrM3hah6KBe0q7AtOXRFCdDNnz5PmTsd2AjcJ/H70AIrOUkoJ7
         IPVwNcTf3ERdAk7WAcKZl/M+T8goeX0HFL5xXuQN/278Z4zCQwjkS04cahOSuAUBd27i
         ZplNsZGbIBkZEagGKvRRA/2kwHVWnDHi0Op2U5tE34aidZtDV21iRnlZswEg7iwrieR2
         RP7DpzBIqNi1oMrS0AN6q+QoTUgKwKXLhP7B1cxNCsk3Zj1Uc6tT343dT2H+GaHBsPvH
         CbmDcvtsWVzWzNZe9Zj5G5mCuBZnPCA03c/KVVArTP1+bg2r+cSF5YjT/aj//z1amrXl
         Ovlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698953; x=1794303753;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfUbWIYMjr45mfwKdq7drkPh6fBU5g7FCa+7yoeN1V8=;
        b=Tka3q97YP6MGRhea1fvq3Hw2nIDsnNxKOxh4AfI3Kw0sS3UPABR+yLFpzbaWn4lgv0
         fSmejL5gEsmSm/w7lStfYmfu5JBVm8CIFEmpVUpRKf+phm6PMZRRwwQ2quVkgqP5AnCk
         oa7AfRLetIP4sa0xDcGbyvXvs/m6eoWfMV/gjL/cNdV4tg8HLEzQBc5qYofV+lSlbuBj
         WRUvUAr4J1DftI3+2/erykWamNsVCyL9S2C+q6TovwlBHrG++KnzL7pBqLy8L5seDRUk
         2hSCP6fDNl15uNGrFTrxCUC7rmyo4iDmOfSYpjXZdYoGCn4z7X+Gjp7ZEgH4JCg+y2Lb
         1pAA==
X-Gm-Message-State: APuU4Z/TzpjydBSt7WySaKzZi7as6Xibh0Sm7L6fGqNvGsGRd0hEx7l1
	ogIn0GjWNYSa6CAE+zekBnEWzGexkuc8YFY/Dn0K7EWQoQs0uQQI9drKK9wtq5SlcWwLmggRkJm
	RPIDdtQ==
X-Gm-Gg: AYBFou0YTuXrosJiadVGNXkp3HbCjteRH1N7rbldt3tyooby0aAztm97N9aLsCApddZ
	E9WLx2dOEg8sccWKLr08ZM2xa6QXPPktPKmXFzTEWbeZtsgq77yAgDpqXLl7x+DgkYsJ3S+JMvy
	stOFTg++Owd9a3vCfW6lgY+wlTbaPl/+fjQBQmr69iK+4Y5IknVAtZb3u896hpPWFqaRDdwoOL0
	kfgOHkAA7COvPzm566W2OYY6DNjWDD+8NpgLYxb/u8YHjsqyVfhY8PKf6mArsuk6Ye7ZKijhFi2
	WaXguZ2IMQUNmLfkJ0DBTX8hPAmJnAT/JoUM1yzkxJcNL1l1cr/yhk+EJlyXoc9CtOS5uApyptj
	IRWSlrt/nhXx58d5TYXm0WY4WJqKmRexET+tOB9p7JTSL32G252rcALKDMJC8oBVDeLU8kncaYh
	Sr9PQosnH5mkP1hROQFx3bU3eq+TZEYFvfjDQ0zgKZgL93LCBnTTM4d8IY1l3BY1k9PHfIw6MEd
	PZ28CZN+BAYZIKcmpgOoMRQDYbwLLQ1Ja6NaQjfaOP/hucWaSoW5gZ5WMEEAGKKq0MQw3luXTYI
	IEzvpG/zDvFgMBh4/EEv1wMdlBcY6sI9bjv9o2zf7ErjEtus77/rnDSSdcLhlUQ3ow/mObBR4/k
	eYZMd0/UvpsHd9kA=
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr302378285e9.9.1793698953321;
        Tue, 03 Nov 2026 01:42:33 -0800 (PST)
Message-ID: <575ae8b4-4541-4537-90af-b5bfea2ae68b@suse.com>
Date: Tue, 3 Nov 2026 10:42:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: compile out __set_fixmap_x() when not needed
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
X-purgate-ID: tlsNG-c201ff/1793698953-F64B42A1-298258B2/10/78276251493
X-purgate-type: spam
X-purgate-size: 3121
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Only HYPERV_GUEST has a need for an executable fixmap, so with that option
unset __set_fixmap_x() (and l1_fixmap_x[] in turn) is unreachable. Address
this Misra rule 2.1 violation by introduction ofa new FIXMAP_X Kconfig
setting.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Why is __set_fixmap_x() not found by Eclair as a rule 2.1 violation in the
x86_64-amd job?

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -269,6 +269,9 @@ config MCE_NONFATAL
 config GUEST
 	bool
 
+config FIXMAP_X
+	bool
+
 config XEN_GUEST
 	bool "Xen Guest"
 	select GUEST
@@ -309,6 +312,7 @@ config PV_SHIM_EXCLUSIVE
 
 config HYPERV_GUEST
 	bool "Hyper-V Guest"
+	select FIXMAP_X
 	select GUEST
 	help
 	  Support for Xen detecting when it is running under Hyper-V.
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -142,13 +142,13 @@ END(l2_directmap)
 
 /*
  * L2 mapping the Xen text/data/bss region, constructed dynamically.
- * Executable fixmap is hooked up statically.
+ * Executable fixmap, when in use, is hooked up statically.
  * Uses 1x 4k page.
  */
 DATA(l2_xenmap, PAGE_SIZE)
         idx = 0
         .rept L2_PAGETABLE_ENTRIES
-        .if idx == l2_table_offset(FIXADDR_X_TOP - 1)
+        .if IS_ENABLED(CONFIG_FIXMAP_X) && idx == l2_table_offset(FIXADDR_X_TOP - 1)
         .quad sym_offs(l1_fixmap_x) + __PAGE_HYPERVISOR
         .else
         .quad 0
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -95,6 +95,8 @@ static inline unsigned long virt_to_fix(
     return __virt_to_fix(vaddr);
 }
 
+#ifdef CONFIG_FIXMAP_X
+
 enum fixed_addresses_x {
     /* Index 0 is reserved since fix_x_to_virt(0) == FIXADDR_X_TOP. */
     FIX_X_RESERVED,
@@ -118,6 +120,12 @@ extern void __set_fixmap_x(
 #define __fix_x_to_virt(x) (FIXADDR_X_TOP - ((x) << PAGE_SHIFT))
 #define fix_x_to_virt(x)   ((void *)__fix_x_to_virt(x))
 
+#else /* !CONFIG_FIXMAP_X */
+
+#define FIXADDR_X_SIZE  0
+
+#endif /* CONFIG_FIXMAP_X */
+
 #endif /* __ASSEMBLER__ */
 
 #endif
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -147,8 +147,6 @@
 /* Mapping of the fixmap space needed early. */
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap[L1_PAGETABLE_ENTRIES];
-l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    l1_fixmap_x[L1_PAGETABLE_ENTRIES]; /* SAF-1-safe */
 
 bool __read_mostly machine_to_phys_mapping_valid;
 
@@ -6180,6 +6178,11 @@ void __set_fixmap(
     map_pages_to_xen(__fix_to_virt(idx), _mfn(mfn), 1, flags);
 }
 
+#ifdef CONFIG_FIXMAP_X
+
+l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+    l1_fixmap_x[L1_PAGETABLE_ENTRIES]; /* SAF-1-safe */
+
 void __set_fixmap_x(
     enum fixed_addresses_x idx, unsigned long mfn, unsigned long flags)
 {
@@ -6187,6 +6190,8 @@ void __set_fixmap_x(
     map_pages_to_xen(__fix_x_to_virt(idx), _mfn(mfn), 1, flags);
 }
 
+#endif /* CONFIG_FIXMAP_X */
+
 void *__init arch_vmap_virt_end(void)
 {
     return fix_to_virt(__end_of_fixed_addresses);

