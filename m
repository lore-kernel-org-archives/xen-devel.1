Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF2606A8B5
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Jo+UFrPZ
Received: from list by lists.xenproject.org with outflank-mailman.1484067.1687424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9vQ-0001PA-At; Wed, 11 Nov 2026 15:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484067.1687424; Wed, 11 Nov 2026 15:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9vQ-0001P3-7a; Wed, 11 Nov 2026 15:07:48 +0000
Received: by outflank-mailman (input) for mailman id 1484067;
 Wed, 11 Nov 2026 15:07:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9vO-0001OW-Kj
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:07:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9vO-003o9X-0z
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:07:46 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484b8-8faa-0a2a0a5109dd-0a2a4508a25c-28
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:07:45 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484c1-f659-0a2a45080019-d155dd2fac57-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:07:45 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so1774551f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:07:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836c835fcsm10997995f8f.59.2026.11.11.07.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:07:44 -0800 (PST)
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
        d=suse.com; s=google; t=1794409665; x=1795014465; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dHrH+2tmoxLW0umwH5TimkdZLAe01Uz7CCmC/aps+EA=;
        b=Jo+UFrPZKPpDwhri+z4IS+pTQQOlyjzOJdeLQcz/+VmYPbuxXoSlnDRDKaUA93ofLa
         urfSlReNZbODuRG0+GbTBveJwC/K2fR0IU+/GDNtbm1LIq2Rv4WSxkBXaZDySNY01ctY
         6o2eiDQrKu7Rjv3xd5x1myQCdo5SCVziKL/xFGeRBa+Rt/01t2STPZnRl3RrgrfuqcZO
         ovtKSYgs1uAvjm9VJpC+vhe05drOZVA8X1csFMEZ/DO/UwIo7BI7NaH8zWFAiFfSvLLk
         vjDi5+d8LYHT22vuHFmJA8vtCylyZTzjDKKKDMSj14yl5oZg/tYCCXbYTgk3jMdDFyUI
         2Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409665; x=1795014465;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dHrH+2tmoxLW0umwH5TimkdZLAe01Uz7CCmC/aps+EA=;
        b=1m4pynN3fYJ3K0msBwL0FnVZQH82tkcsPFANku6aVbTQSn8l2WlAaX71K1OPpXFckY
         ftlmphfsFaf7++zPLNeYDkrB5sRIOCQt/466dM0+DsTk2DfkIsP0hK5LgWGJwC6JUDnS
         9BM+KWsiOjGmUL15yRJhQ6sZ2csnJPBKUZ7eqmO9otY0cwhGPjzCNy8X3VkLgu3mXb6s
         0HaQRSeud6x//rJLOcKcJnXlW+UZo056/GGpWxaLHHscSp9/wq6EecHrsT0sz2POFCKt
         e6TTengebOla99TyZcR5hWGK5Kh25HIsgFVqrZaRuh+fE2k9Z6Y5o2Ezi4fWT1Y5t8jT
         cumg==
X-Gm-Message-State: APuU4Z/4MiNdjwYTaPJBskMkYXa/8NJFjQb0GRAumhfCnjwksTB6Kyqz
	HaALbJ9k3RciVTJ+8IpivexxvQLHwzIvc7Hc7xLXrRV0PGHo0W2aygG0dTaAd1FWG2nu9WyQcQ5
	VCpK1PQ==
X-Gm-Gg: AYBFou2rYLf32tyPoXEbrKYDbxZzc6gfhAdfY466UKqj8TfumoCiHLmM+Ph49zjOKOt
	0ryeJI2ZbtmqEg1pv3eFheiVIAUmoMttfWic0cSxZPUocZe23ywoy7CLomF18tEY6OYGJKrX6/s
	cXHw0b+miXwWM4q7YYhKJhY4YzWugVrF9LjxGqMMcmgFlfbVeO1tN9GeSnGokAsrjIESSIgnlZG
	S+mz55YPnMa6Gbhr0QdjaLvGye3Fvge4vOjxvsSzkJmfWZNFMtbjiN3WHSCp1czHTfzYmJKTbUL
	FYAK/WBsuaxre/yAYT3SWKdoAoQMUpyR+WzCJ0O3iXcevaPEvfcGPFCOSvhXTxds4BwdXJYKFUa
	bDhzqQBpneQyvhK3ZZL8zad6T0aaJCHdB6OVegbgCf2rVarL3RJSHwZPN7FljYT2j8vhuCnnSND
	Omc3beNPwz7kkdReJ74A91uatp1O202mvuJ3l3UgcCopZYi+/Z6WTM/aB+TY5QhRT9qBAS4OwNB
	bkCY86eUwOCtsQqyZxTMsNquwvgZOu50i0zObOgdGBQVsHXPkJvtuzBJ+29Ecxuvhn9fUUbSjGi
	vpDtkKZU8bHqFZ26Bhir0bL8aeltZA2mTVOyo/Q5I2fGjxvSqh4ZDOLK1jR5ThzeQAnMHGWvOs0
	ZGhClEEDLT0Cc2ypD
X-Received: by 2002:a5d:6f11:0:b0:491:286f:8e63 with SMTP id ffacd0b85a97d-499c5f31037mr4641702f8f.14.1794409665106;
        Wed, 11 Nov 2026 07:07:45 -0800 (PST)
Message-ID: <b5044d36-9bd3-42ec-8928-78aa27102fb5@suse.com>
Date: Wed, 11 Nov 2026 16:07:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 02/28] x86/xstate: drop xstate_offsets[] and xstate_sizes[]
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
X-purgate-ID: tlsNG-c1860d/1794409665-CCD7087B-D7503974/10/78276251493
X-purgate-type: spam
X-purgate-size: 5312
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

They're redundant with respective fields from the raw CPUID policy; no
need to keep two copies of the same data.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Re-base.

--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -45,8 +45,9 @@ extern uint32_t mxcsr_mask;
 
 extern u64 xfeature_mask;
 extern u64 xstate_align;
-extern unsigned int *xstate_offsets;
-extern unsigned int *xstate_sizes;
+
+#define xstate_offset(n) (raw_cpu_policy.xstate.comp[n].offset)
+#define xstate_size(n)   (raw_cpu_policy.xstate.comp[n].size)
 
 /* extended state save area */
 struct __attribute__((aligned (64))) xsave_struct
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -28,8 +28,6 @@ static u32 __read_mostly xsave_cntxt_siz
 /* A 64-bit bitmask of the XSAVE/XRSTOR features supported by processor. */
 u64 __read_mostly xfeature_mask;
 
-unsigned int *__read_mostly xstate_offsets;
-unsigned int *__read_mostly xstate_sizes;
 u64 __read_mostly xstate_align;
 static unsigned int __read_mostly xstate_features;
 
@@ -103,34 +101,18 @@ static int setup_xstate_features(bool bs
     unsigned int leaf, eax, ebx, ecx, edx;
 
     if ( bsp )
-    {
         xstate_features = flsl(xfeature_mask);
-        xstate_offsets = xzalloc_array(unsigned int, xstate_features);
-        if ( !xstate_offsets )
-            return -ENOMEM;
-
-        xstate_sizes = xzalloc_array(unsigned int, xstate_features);
-        if ( !xstate_sizes )
-            return -ENOMEM;
-    }
 
     for ( leaf = 2; leaf < xstate_features; leaf++ )
     {
-        if ( bsp )
-        {
-            cpuid_count(XSTATE_CPUID, leaf, &xstate_sizes[leaf],
-                        &xstate_offsets[leaf], &ecx, &edx);
-            if ( ecx & XSTATE_ALIGN64 )
-                __set_bit(leaf, &xstate_align);
-        }
+        cpuid_count(0xd, leaf, &eax, &ebx, &ecx, &edx);
+        BUG_ON(eax != xstate_size(leaf));
+        BUG_ON(ebx != xstate_offset(leaf));
+
+        if ( bsp && (ecx & XSTATE_ALIGN64) )
+            __set_bit(leaf, &xstate_align);
         else
-        {
-            cpuid_count(XSTATE_CPUID, leaf, &eax,
-                        &ebx, &ecx, &edx);
-            BUG_ON(eax != xstate_sizes[leaf]);
-            BUG_ON(ebx != xstate_offsets[leaf]);
             BUG_ON(!(ecx & XSTATE_ALIGN64) != !test_bit(leaf, &xstate_align));
-        }
     }
 
     return 0;
@@ -160,7 +142,7 @@ static void setup_xstate_comp(uint16_t *
             if ( test_bit(i, &xstate_align) )
                 offset = ROUNDUP(offset, 64);
             comp_offsets[i] = offset;
-            offset += xstate_sizes[i];
+            offset += xstate_size(i);
         }
     }
     ASSERT(offset <= xsave_cntxt_size);
@@ -223,10 +205,10 @@ void expand_xsave_states(const struct vc
          * comp_offsets[] information, something is very broken.
          */
         BUG_ON(!comp_offsets[index]);
-        BUG_ON((xstate_offsets[index] + xstate_sizes[index]) > size);
+        BUG_ON((xstate_offset(index) + xstate_size(index)) > size);
 
-        memcpy(dest + xstate_offsets[index], src + comp_offsets[index],
-               xstate_sizes[index]);
+        memcpy(dest + xstate_offset(index), src + comp_offsets[index],
+               xstate_size(index));
 
         valid &= ~feature;
     }
@@ -292,10 +274,10 @@ void compress_xsave_states(struct vcpu *
          * comp_offset[] information, something is very broken.
          */
         BUG_ON(!comp_offsets[index]);
-        BUG_ON((xstate_offsets[index] + xstate_sizes[index]) > size);
+        BUG_ON((xstate_offset(index) + xstate_size(index)) > size);
 
-        memcpy(dest + comp_offsets[index], src + xstate_offsets[index],
-               xstate_sizes[index]);
+        memcpy(dest + comp_offsets[index], src + xstate_offset(index),
+               xstate_size(index));
 
         valid &= ~feature;
     }
@@ -538,8 +520,8 @@ int xstate_alloc_save_area(struct vcpu *
         unsigned int i;
 
         for ( size = 0, i = 2; i < xstate_features; ++i )
-            if ( size < xstate_sizes[i] )
-                size = xstate_sizes[i];
+            if ( size < xstate_size(i) )
+                size = xstate_size(i);
         size += XSTATE_AREA_MIN_SIZE;
     }
 
@@ -592,9 +574,9 @@ int xstate_update_save_area(struct vcpu
     for ( size = old = XSTATE_AREA_MIN_SIZE, i = 2; i < xstate_features; ++i )
     {
         if ( xcr0_max & (1ul << i) )
-            size = max(size, xstate_offsets[i] + xstate_sizes[i]);
+            size = max(size, xstate_offset(i) + xstate_size(i));
         if ( v->arch.xcr0_accum & (1ul << i) )
-            old = max(old, xstate_offsets[i] + xstate_sizes[i]);
+            old = max(old, xstate_offset(i) + xstate_size(i));
     }
 
     save_area = _xvrealloc(v->arch.xsave_area, size, __alignof(*save_area));
@@ -1082,7 +1064,7 @@ uint64_t read_bndcfgu(void)
               : "=m" (*xstate)
               : "a" (X86_XCR0_BNDCSR), "d" (0), "D" (xstate) );
 
-        bndcsr = (void *)xstate + xstate_offsets[ilog2(X86_XCR0_BNDCSR)];
+        bndcsr = (void *)xstate + xstate_offset(ilog2(X86_XCR0_BNDCSR));
     }
 
     if ( cr0 & X86_CR0_TS )


