Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F22C606A883
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TkDZ4Kg5
Received: from list by lists.xenproject.org with outflank-mailman.1484075.1687433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9vh-0001uF-N8; Wed, 11 Nov 2026 15:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484075.1687433; Wed, 11 Nov 2026 15:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9vh-0001u8-Jq; Wed, 11 Nov 2026 15:08:05 +0000
Received: by outflank-mailman (input) for mailman id 1484075;
 Wed, 11 Nov 2026 15:08:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9vg-0001tL-TZ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:08:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9vg-003oGY-AE
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:08:04 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484d4-2eae-0a2a0a5409dd-0a2a45059f8a-0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:08:04 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484d4-4cb1-0a2a45050019-d155dd2aa8ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:08:04 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4910b863b84so2104431f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:08:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835c377fdsm9600109f8f.21.2026.11.11.07.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:08:03 -0800 (PST)
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
        d=suse.com; s=google; t=1794409684; x=1795014484; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/UNxLcDs/4FjWlT1t8Fd0oVntuTwPcS6hghXURHhOIg=;
        b=TkDZ4Kg5DrjJjKUsgL7sNZbrTRLoy7bp9xbXFrdmsrQsKUAmOo5sTZmShokvhxeJZz
         wYuiSrcANafbaTd4fa0sup+vA+Mq26XVslLpLpF2XMZSrgMCAtzPodHvsCpHf7eCGTvb
         LGEJLKxscp2U2MHYOerGVleKFZTvgTqrC/MxEVQFO7fi74D47dRM5FkHjihLxCRvXoX4
         LyEkywAAkEq+5KnDCPXrabTFuPvA3DbllAxQxg4Yo7hGXRz7OP4tYZbTq5Falj8hSm46
         pnNjzoykBcVxjUjBy5iFQ+05qH74UQxg7xW1AlsH0Yr0Hk5rxeS0VB8Gasdwk46lHMe5
         B3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409684; x=1795014484;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/UNxLcDs/4FjWlT1t8Fd0oVntuTwPcS6hghXURHhOIg=;
        b=JI4WO+P5k0ES1MDjT0YK3eRkw+9Vu3LqBxvbAIUJb7Ii8h233XaI9LEM+WcMrtOl5J
         dhx7oX4MX/f9JMBTCaI76whU2uYhgwOnUmwg8jYVify0biWg3U10EtbKUru3X2OtYkmi
         jjjluK+o0wwtFWoeBcCQlP/snRL9imAtNxZVXFrTPoqBoFul4oAXbzkxN78IlHB7khAs
         PFhNfrkCmcaShaH8CRGHJSpq83k3csIVibMH8kPkUAKWvAe0hsLSiRJ63ClSI6MxmKTC
         v92Y6MyzMVZqXhzqoK4jRjTCdZ2wI532Ejb+Aasjab6uD4ZZlysaE9qoNhbInI/Babps
         QhEw==
X-Gm-Message-State: APuU4Z9AvcA3/zwU7VIvfRmtsIf48psdmiWQDr4etDNQMkge2P51ruh8
	PRiVayFz2nEIzSL9G4zbpnTEykllAA2YNrtQilr+DltK13CjLDA6OHpHspYfHg2RjtD7JY3Blht
	n2qqV/g==
X-Gm-Gg: AYBFou2k/oQjECNC4E3jb1C22Cp5nTc++bM7oL10zeHFz3QmZu5mq0DSOFE3o/V0+1d
	ga01Llf4VgB6/Z28C35W0KNKTslC0xRVCFgzCm6d+CG8uJDNG4qCjTfN0QNRQITgDtFh9X+VBYx
	spCxOOvUZj6JSRk61AROlF0/7TBV2zTadCxk7/xeWk6h3JNWiOnKuviXML6pHYNZyzvIRedY2ZQ
	ThHlLDKKZovtKiRZMuR1GKOBf00r/n/kWcXGq38XokLaZZHioqprcz5XLQzYxDV/bXkWDH8b0Jo
	lXQ4E5CQgxbKXTGlvF54DYMF2kgL4pKKLMNTdjyfnPbZY8bOnOTt50nOuoxOGhrehJu6ssnMjba
	lMpw+9XEvE9Y3qUUX5IcQ1YXAOVlpscyDc0w+0pqydVRDWKDW2SeU47Ka2RhgPZ/O7sywonGTHX
	Ub8gENUb1narUGf29Dv91EOJICB5vABnJcmjw5jmlALYTHtZSXiIxOT1dm4/WfJ/4JLF6VmR/L9
	MjjLf4vtdmDRzTL8LN0OApMxBp3sUbXUOz8N0QnUiUXARF+Fm6zekH4vu6qdlCo7Mj19iWoacDv
	V4HCHUSB4RJt1hHOY1z90kEI6Oa5R6+mrxVVQXa0wrnhziU/+izYMaskjOMh8VfmuEG7HaIrzQb
	86iUXuwtXvcXBtleu
X-Received: by 2002:a05:6000:25e9:b0:499:ffd4:f519 with SMTP id ffacd0b85a97d-499ffd4f64dmr4577282f8f.23.1794409683643;
        Wed, 11 Nov 2026 07:08:03 -0800 (PST)
Message-ID: <823df22d-0314-45c5-a918-3bce96813a2d@suse.com>
Date: Wed, 11 Nov 2026 16:08:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 03/28] x86/xstate: replace xsave_cntxt_size and drop
 XCNTXT_MASK
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
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
In-Reply-To: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794409684-738BE2A1-12BE3C47/10/78276251493
X-purgate-type: spam
X-purgate-size: 4309
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

XCNTXT_MASK is effectively embedded in recalculate_xstate(), and
xsave_cntxt_size is redundant with the host CPUID policy's xstate.max_size
field.

Use the host CPUID policy as input (requiring it to be calculated early
enough), thus allowing e.g. "cpuid=no-avx512f" to also result in avoiding
allocation of space for ZMM and mask register state.

Also drop a stale part of an adjacent comment.

Further where respective code is being touched anyway, also replace
XSTATE_CPUID by 0xd.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Andrew voiced objection to the use of the host policy here, yet without
indicating what else to use instead. Perhaps that concern is taken care of
by "x86/cpu-policy: set up host policy earlier"?
---
v4: Re-base.

--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -31,10 +31,6 @@ extern uint32_t mxcsr_mask;
 #define XSTATE_AREA_MIN_SIZE      (FXSAVE_SIZE + XSAVE_HDR_SIZE)
 
 #define XSTATE_FP_SSE  (X86_XCR0_X87 | X86_XCR0_SSE)
-#define XCNTXT_MASK    (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | \
-                        X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
-                        X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
-                        X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA | X86_XCR0_APX)
 
 #define XSTATE_ALL     (~(1ULL << 63))
 #define XSTATE_XSAVES_ONLY         0
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -21,9 +21,10 @@
 /*
  * Maximum size (in byte) of the XSAVE/XRSTOR save area required by all
  * the supported and enabled features on the processor, including the
- * XSAVE.HEADER. We only enable XCNTXT_MASK that we have known.
+ * XSAVE.HEADER. We only enable cpu_policy_xcr0_max(&host_cpu_policy).
+ * Note that this identifier should not be usable as an lvalue.
  */
-static u32 __read_mostly xsave_cntxt_size;
+#define xsave_cntxt_size (host_cpu_policy.xstate.max_size | 0)
 
 /* A 64-bit bitmask of the XSAVE/XRSTOR features supported by processor. */
 u64 __read_mostly xfeature_mask;
@@ -902,23 +903,31 @@ void xstate_init(struct cpuinfo_x86 *c)
     if ( !cpu_has_xsave )
         return;
 
-    if ( (bsp && !use_xsave) ||
-         boot_cpu_data.cpuid_level < XSTATE_CPUID )
+    if ( (bsp && !use_xsave) || c->cpuid_level < 0xd )
     {
         BUG_ON(!bsp);
         setup_clear_cpu_cap(X86_FEATURE_XSAVE);
         return;
     }
 
-    cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
-    feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
-    BUG_ON(!valid_xcr0(feature_mask));
-    BUG_ON(!(feature_mask & X86_XCR0_SSE));
+    if ( bsp )
+    {
+        feature_mask = cpu_policy_xcr0_max(&host_cpu_policy);
+        BUG_ON(!valid_xcr0(feature_mask));
+        BUG_ON(!(feature_mask & X86_XCR0_SSE));
 
-    /*
-     * Set CR4_OSXSAVE and run "cpuid" to get xsave_cntxt_size.
-     */
-    set_in_cr4(X86_CR4_OSXSAVE);
+        xfeature_mask = feature_mask;
+
+        /* xsave_cntxt_size is the max size required by enabled features. */
+        printk("xstate: size: %#x and states: %#"PRIx64"\n",
+               xsave_cntxt_size, feature_mask);
+
+        set_in_cr4(X86_CR4_OSXSAVE);
+    }
+
+    cpuid_count(0xd, 0, &eax, &ebx, &ecx, &edx);
+    feature_mask = (((uint64_t)edx << 32) | eax) & xfeature_mask;
+    BUG_ON(xfeature_mask != feature_mask);
 
     /*
      * Zap the cached values to make set_xcr0() and set_msr_xss() really write
@@ -933,22 +942,7 @@ void xstate_init(struct cpuinfo_x86 *c)
         set_msr_xss(0);
     }
 
-    if ( bsp )
-    {
-        xfeature_mask = feature_mask;
-        /*
-         * xsave_cntxt_size is the max size required by enabled features.
-         * We know FP/SSE and YMM about eax, and nothing about edx at present.
-         */
-        xsave_cntxt_size = cpuid_count_ebx(0xd, 0);
-        printk("xstate: size: %#x and states: %#"PRIx64"\n",
-               xsave_cntxt_size, xfeature_mask);
-    }
-    else
-    {
-        BUG_ON(xfeature_mask != feature_mask);
-        BUG_ON(xsave_cntxt_size != cpuid_count_ebx(0xd, 0));
-    }
+    BUG_ON(xsave_cntxt_size != cpuid_count_ebx(0xd, 0));
 
     if ( setup_xstate_features(bsp) && bsp )
         BUG();


