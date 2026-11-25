Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68230606A327
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EiyY8hNH
Received: from list by lists.xenproject.org with outflank-mailman.1502469.1698523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWE6k-00056v-KI; Wed, 25 Nov 2026 14:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502469.1698523; Wed, 25 Nov 2026 14:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWE6k-00056o-HE; Wed, 25 Nov 2026 14:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1502469;
 Wed, 25 Nov 2026 14:36:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWE6i-00053a-Vt
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 14:36:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWE6i-00CWuK-C7
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 15:36:24 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06f262-8faa-0a2a0a5109dd-0a2a450198ea-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:36:24 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06f268-5bcc-0a2a45010019-d155dd33b111-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:36:24 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4a357b1c649so3417406f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 06:36:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2e6dsm34064463f8f.6.2026.11.25.06.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 06:36:23 -0800 (PST)
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
        d=suse.com; s=google; t=1795617384; x=1796222184; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TSbTl/XCkzGYjPmom2lV4kH1Pi41NdhGJl0vOCzwdgs=;
        b=EiyY8hNHvTK+avh8SvAOpeNf/KDEQkr98VBH+m12MSJizk0gjNf8m4yH4sGKoVeV/v
         xyw2Subv6z6DEosvfor+qihMM42CyvPZeb2LL/yIZryFf75inXXl131RIZ6lSKb++yNW
         2W4mXkTdF0Bl3nam2EZi35HbZ+1DcLn1iltY1AGHmArd+kMnL2olMLx3NPBoCmZwKXwM
         HwVSvFfLNuM9P647PrwiL7fQspT+3tsAq4sE7nJxLPr3kichpeQSU92xoMK1hkm6SU3H
         He6lMKQ/Zm8k2y470043k1pcI4svsSQRXiIZBJzB/NwxLTSOyYoLjeY9di0lB/KFJAT+
         cOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617384; x=1796222184;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TSbTl/XCkzGYjPmom2lV4kH1Pi41NdhGJl0vOCzwdgs=;
        b=1e9UaR0K/syGR1hS4Bn6exG/f2wGrmECs+c+TVbnTBO5mCOSz/Vezz7YDTY3aM716h
         02BH8AklZrAUfxwHslGmHE5KTb/5eGtlrGqYGfsAZK7zhyMyk6BwsNtgWI3psirOscx0
         zoSz5He9+mu0kE6gM8bVb89E2Bd+l1tvo17JZMnU8sjwd1klLrOw8z1BSu6Ff7LmCcCE
         qRCb/un7odH6POk0tOBpIn4uyVOUM7v6vgC0796pR2GbBf4Qg7mPd0xRcFMR/s2SIx5r
         UGttrWSa9Dg/KI5/Kb3m2+3uJ0d9qF9Rc7QPqhAJ4b4Df9wFdRtUafMp/MF3kUBn2mNU
         XPrA==
X-Gm-Message-State: APuU4Z/jfDxQJu304OM2Ksq0HPt2kiDmmIjM2CTBP2KDElWQ1BX9HtRS
	6mzpUFejZm7EUOHcuuZiu0/oUhVs5A9dwPvlhtZ9xqA0xRkGnx7umassht/7LayaGT6SU3NDGCH
	cSWWiuQ==
X-Gm-Gg: AZFdTZc1iVPMNz5Gj2nAFOC7atDOnCtbB04b7Fz40HvVaxSnkkTjM/vPM/tmAT/CMJ4
	pd/sXoOAzUXnKQ5cgP89cg1VvP6IviBdpqo2mwy9DDnURjfhSfl8H2EHV2KoFITI+I4p3msHzxA
	/q5/UOZyhs0JcCKtoutytNx0ROOsN+FMAM0bGuaomfWQ0j7qt+3lRxoyJRSPc7l+1/gglkEF3SF
	/MmIuUJmm9Qgk/J95XdKyt+DAj9aN6YGUo4MoUnoZw5DSO+VOkXN0GDUYaB/L35zn060G9pqHj6
	Y8KtvCjhJevrnFaD2StKzgM7ZUbZf1oACD7KU5NB+rlOgz0o+DujujET2zvIkCOPnDma4PVl+0W
	1arq6gA6R2OzYvewA5XwBWX4B2zTZgmC+rr2Yn9UPFPCeJXLQqrXc+u+ZY62jUH+M5jUc9lq+fI
	+4OjgGhU9OQv6bfx9CQ6Kx0YRGBFeP5dcglsNvQIlJjD4C4dDeMlw3MppTE5sHtMKBUXt9K70Sg
	NBa/gZK9/eXDIfGpGndHiC5cuaudduvs2sF8w1ejtv/n6oBmblbIX3o4HArn3fFOaA+4w5T67Fo
	eMJ40jBXFvCG0//4hvzX0BWxNxOs3Wv+Fd1Hx1Db8TZFw1l2ELL+9TXLOTW5YHNVtOi4e2j1h6N
	Xwg5R8O1R8wY6KvBA
X-Received: by 2002:a5d:5887:0:b0:4ac:84c:70df with SMTP id ffacd0b85a97d-4ac085bb48dmr34516765f8f.45.1795617383845;
        Wed, 25 Nov 2026 06:36:23 -0800 (PST)
Message-ID: <0862b74c-181f-444c-889c-164547819baf@suse.com>
Date: Wed, 25 Nov 2026 15:36:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/3] common: introduce brk_end
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
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
In-Reply-To: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1795617384-BE2D45FD-B9843EAD/10/78276251493
X-purgate-type: spam
X-purgate-size: 1744
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

It is anticipated that all architectures meaning to use the BRK allocator
will have a need for this variable. With this there's then also no need
for brk_cease() to have a return value; it simply sets the variable.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Looks like "finished" could then be dropped.
---
v5: New.

--- a/xen/common/brk.c
+++ b/xen/common/brk.c
@@ -18,6 +18,8 @@ static inline unsigned long brk_adjust_s
 extern char __brk_start[];
 extern const char __bss_end[];
 
+unsigned long __ro_after_init brk_end;
+
 static unsigned long __initdata allocated;
 static bool __initdata finished;
 
@@ -52,20 +54,22 @@ void *__init brk_alloc(size_t size)
     return ptr;
 }
 
-unsigned long __init brk_cease(void)
+void __init brk_cease(void)
 {
     finished = true;
 
     allocated = ROUNDUP(allocated, PAGE_SIZE);
 
-    return (unsigned long)__brk_start + allocated;
+    brk_end = (unsigned long)__brk_start + allocated;
 }
 
 void __init brk_free_unused(void)
 {
-    unsigned long start = brk_cease(), end = (unsigned long)__bss_end;
+    unsigned long start, end = (unsigned long)__bss_end;
+
+    brk_cease();
 
-    start = brk_adjust_start(start);
+    start = brk_adjust_start(brk_end);
 
     if ( start >= end )
         return;
--- a/xen/include/xen/brk.h
+++ b/xen/include/xen/brk.h
@@ -24,8 +24,10 @@
     static char __section(".bss..brk.page_aligned") __aligned(PAGE_SIZE) \
         __used var ## _brk_[size]
 
+extern unsigned long brk_end;
+
 void *brk_alloc(size_t size);
-unsigned long brk_cease(void);
+void brk_cease(void);
 void brk_free_unused(void);
 
 #endif /* XEN_BRK_H */


