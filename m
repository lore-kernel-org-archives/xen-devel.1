Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540C606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=POgwWYm0
Received: from list by lists.xenproject.org with outflank-mailman.1484264.1687630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA5V-00064e-Kc; Wed, 11 Nov 2026 15:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484264.1687630; Wed, 11 Nov 2026 15:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA5V-00064X-Hr; Wed, 11 Nov 2026 15:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1484264;
 Wed, 11 Nov 2026 15:18:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA5U-00062b-0K
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:18:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA5T-00F2tU-69
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:18:11 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48730-2eae-0a2a0a5409dd-0a2a45039648-12
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:18:11 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48733-fae8-0a2a45030019-d155dd2bd018-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:18:11 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso2915001f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:18:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c6955c6sm236795e9.5.2026.11.11.07.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:18:10 -0800 (PST)
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
        d=suse.com; s=google; t=1794410290; x=1795015090; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r0OmIUfbEkcsIgU0y7uqnsPc3T3JqZqllvlDZYnJxH4=;
        b=POgwWYm0sdodzV++Bdhb7umFRNpH0cEESoFk+jJCx94QCxXUUKyl3bNuIE9GmL/6nE
         RSwzQdctEFVz7nKqQHTcKYRxc0HYIANOY040a5aXW5rQ+Oi7t7KTOEsuA+Kcm3xFgjHF
         2SkFC5SrkBOi8mIK+cgV4cnLguTZTQB92TnvBgFtmTU6YuqYhkuSg+XvtJkkETjIxYXk
         DWfSHYk43fj6weMnna8XfST2kTwEa6kOjAIACMdaGToHEpO0bcyah5dTHlA2faHO21zx
         yW3C6I6VU4KvfHD4adiUSVxGWMrdO5jliCC9CjkNs8vOAwFvzjcPSzHYhbNoHuxyGXZ6
         +ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410290; x=1795015090;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r0OmIUfbEkcsIgU0y7uqnsPc3T3JqZqllvlDZYnJxH4=;
        b=B0xBdMM1ry4EVxbSxAMzftz9dWFUs3nG8oB7u9hKHbxVB18gSOVJx4ORz/oHf2+cdT
         /nVNSFpoPzGYT2EY2REobTf12F6e9kxMiG0Qq64KGGT+XGMJswXKj6OAQtxJI1xf4PW4
         iB62V574Kh8UmoI9FSzUa7jajj3SFBLUZJo9GG/idtTfnSpjKNEfbzO+mV+rdwONFgMI
         xpf5QF65SXYV+dhEceWWrRo7AS3Tzi8B7ZJqCv6DqDHsqmFftvwTJXnLh8SdqLCM825R
         A7qrQjVKbcTOldubHNvokKBmXvM9r5KNhYpUjOwfw9Q/ZCBFgwdeQJkFAFxXrHSpoXC+
         ym9A==
X-Gm-Message-State: APuU4Z9Gt0W3xEx/Uu4/hRk4bPzXrr6WVSw23JegjUJF2t4ZheCZ9ETH
	Q0USezA28exZsp2TIXEpbnBGeGLlX/L4KkZJ3jX4kGHvFY+XmSAMDNWrrIA4R9+1Vz/+KpmvUx1
	bRPnkZA==
X-Gm-Gg: AYBFou0fCGgT9e7jj49vr+co19o1VkgTejGOsMtfTLN4ZPcx0qk/Sk5oKA3DrggIeFW
	KHFhZeMs+CSEDAlvNKXnYAx0cttWMhHy5OEmSK3HbyFyTPea6S7y5UKMgOlt3N6hmTOzKPKybeg
	K79l6q5PRhJXshBZp4TjN/f1kvSBA/c61YSyTFv7bCtek0cVHhUXc38Oehp2ugE97XA+mAhiWnz
	l3OWyr59FCOseIRjM8qlNluv4MVeMeHFLFIJtQWBvZJXvmGtiangOZwGkJz2Z2yBj7SF/zGrB9/
	wgB1BJT+pCAey4A82WAo4k7LAg/z78XURl2COEBKzIFhGcediG1ofihe/Nu+oLvGuls69hZMSnm
	gcL4bZ3Nrws2F67tTqgfnlw376gs6UPN8R4UAgYbTUevhxv4xly5QSYU1ACivjSnozxxXJ2MKX1
	nRm2Ut/PL5YQhcDCeM1pgX3mCYulBDzKtATPjGkVyBmeZkK7ErNMalnvoyMuUERNhvGE4H751MI
	sPy5w06xdjVrrjEmGNrPpkaocQq2bHM6q0ZHSMgnZrvXRdxZrsyn2ZhtNJWEIGfpO/J1DE2fnqX
	CBdot8x05iA8fs/87xIh7HPdaVbb5xycv2rSky7jWVK5GCMWqcp04CpkiB2FjhmyDq2yIMe/eRe
	4lvexcnDC4y2i1bwr
X-Received: by 2002:a05:600c:3b93:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ba093c512fmr52543745e9.26.1794410290535;
        Wed, 11 Nov 2026 07:18:10 -0800 (PST)
Message-ID: <b337f3d3-206f-481c-8ea2-7d02dcde69b8@suse.com>
Date: Wed, 11 Nov 2026 16:18:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 24/28] x86/CPUID: enable ACE
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
X-purgate-ID: tlsNG-33051d/1794410291-6D8D54E9-C2D2DB23/10/78276251493
X-purgate-type: spam
X-purgate-size: 8723
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

..., keeping it unavailable to guests of course.

Also include the little bit of XCR0 handling adjustment which is needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -623,6 +623,19 @@ static void test_cpuid_out_of_range_clea
             },
         },
         {
+            .name = "tile palette 2",
+            .nr_markers = 1,
+            .p = {
+                /* First and third subleaves valid as a pair.  Others cleared. */
+                .basic.max_leaf = 0x1d,
+                .feat.ace = 1,
+                .xstate.xcr0_low = XSTATE_FP_SSE | X86_XCR0_TILE_CFG |
+                                   X86_XCR0_TILE_DATA | X86_XCR0_BSR,
+                .tile.raw[0].a = 2,
+                .tile.raw[2].b = 0xc2,
+            },
+        },
+        {
             .name = "extd",
             .nr_markers = 1,
             .p = {
@@ -726,6 +739,15 @@ static void test_cpuid_maximum_leaf_shri
             },
         },
         {
+            .name = "ace v1",
+            .p = {
+                /* Subleaf 2 only with some valid value. */
+                .basic.max_leaf = 0x1d,
+                .tile.raw[0].a = 2,
+                .tile.raw[2].a = 1,
+            },
+        },
+        {
             .name = "tmul",
             .p = {
                 /* Subleaf 0 only with some valid values. */
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -217,7 +217,9 @@ static void recalculate_xstate(struct cp
     if ( p->feat.pku )
         xstates |= X86_XCR0_PKRU;
 
-    if ( p->feat.amx_tile )
+    if ( p->feat.ace )
+        xstates |= X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA | X86_XCR0_BSR;
+    else if ( p->feat.amx_tile )
         xstates |= X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA;
 
     if ( p->feat.apx_f )
@@ -262,9 +264,11 @@ static void recalculate_xstate(struct cp
 static void recalculate_tile(struct cpu_policy *p)
 {
     if ( !p->feat.amx_tile )
+        memset(&p->tmul, 0, sizeof(p->tmul));
+
+    if ( !p->feat.amx_tile && !p->feat.ace )
     {
         memset(&p->tile, 0, sizeof(p->tile));
-        memset(&p->tmul, 0, sizeof(p->tmul));
         return;
     }
 
@@ -278,6 +282,14 @@ static void recalculate_tile(struct cpu_
         p->tile.raw[1].d = 0;
     }
 
+    if ( p->tile.max_palette >= 2 )
+    {
+        p->tile.raw[1].a &= 0x000000ff;
+        p->tile.raw[1].b = 0;
+        p->tile.raw[1].c = 0;
+        p->tile.raw[1].d = 0;
+    }
+
     p->tmul.raw[0].a = 0;
     p->tmul.raw[0].b &= 0x00ffffff;
     p->tmul.raw[0].c = 0,
@@ -1245,11 +1257,10 @@ void __init init_dom0_cpuid_policy(struc
          * Default-off features with their own leaves need those leaves
          * re-populated from the max policy.
          */
-        if ( p->feat.amx_tile )
-        {
+        if ( p->feat.amx_tile || p->feat.ace )
             p->tile = max->tile;
+        if ( p->feat.amx_tile )
             p->tmul = max->tmul;
-        }
         if ( p->feat.avx10 )
             p->avx10 = max->avx10;
         if ( p->feat.apx_f )
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -110,13 +110,14 @@
 #define X86_XCR0_TILE_CFG         (_AC(1, ULL) << 17)
 #define X86_XCR0_TILE_DATA        (_AC(1, ULL) << 18)
 #define X86_XCR0_APX              (_AC(1, ULL) << 19)
+#define X86_XCR0_BSR              (_AC(1, ULL) << 20)
 #define X86_XCR0_LWP              (_AC(1, ULL) << 62)
 
 #define X86_XCR0_STATES                                                 \
     (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | X86_XCR0_BNDREGS |    \
      X86_XCR0_BNDCSR | X86_XCR0_OPMASK | X86_XCR0_ZMM |                 \
      X86_XCR0_HI_ZMM | X86_XCR0_PKRU | X86_XCR0_TILE_CFG |              \
-     X86_XCR0_TILE_DATA | X86_XCR0_APX |                                \
+     X86_XCR0_TILE_DATA | X86_XCR0_APX | X86_XCR0_BSR |                 \
      X86_XCR0_LWP)
 
 #define X86_XSS_STATES                                                  \
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -409,7 +409,7 @@ void x86_cpu_policy_shrink_max_leaves(st
         p->tile.max_palette = i;
     else
     {
-        ASSERT(!p->feat.amx_tile);
+        ASSERT(!p->feat.amx_tile && !p->feat.ace);
         zero_leaves(p->tile.raw, 0, 0);
     }
     p->basic.raw[0x1d] = p->tile.raw[0];
--- a/xen/arch/x86/lib/cpu-policy/policy.c
+++ b/xen/arch/x86/lib/cpu-policy/policy.c
@@ -25,6 +25,7 @@ int x86_cpu_policies_are_compatible(cons
         FAIL_CPUID(7, 0);
 
     if ( (guest->feat.amx_tile && !guest->tile.max_palette) ||
+         (guest->feat.ace && guest->tile.max_palette < 2) ||
          guest->tile.max_palette > host->tile.max_palette )
         FAIL_CPUID(0x1d, 0);
 
@@ -41,6 +42,10 @@ int x86_cpu_policies_are_compatible(cons
             FAIL_CPUID(0x1d, 1);
     }
 
+    if ( guest->tile.max_palette >= 2 &&
+         guest->tile.ace.version > host->tile.ace.version )
+        FAIL_CPUID(0x1d, 2);
+
     if ( guest->tmul.max_subleaf > host->tmul.max_subleaf ||
          ((guest->feat.amx_int8 || guest->feat.amx_bf16 ||
            guest->feat.amx_fp16 || guest->feat.amx_complex ||
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1603,7 +1603,8 @@ int x86emul_decode(struct x86_emulate_st
          * environments.
          */
         if ( !mode_64bit() )
-            s->xcr0 &= ~(X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA | X86_XCR0_APX);
+            s->xcr0 &= ~(X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA | X86_XCR0_APX |
+                         X86_XCR0_BSR);
     }
 
     /* Prefix bytes. */
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -642,6 +642,10 @@ static bool valid_xcr0(uint64_t xcr0)
     if ( !(xcr0 & X86_XCR0_TILE_CFG) != !(xcr0 & X86_XCR0_TILE_DATA) )
         return false;
 
+    /* BSR requires TILE{CFG,DATA} to also be set. */
+    if ( (xcr0 & X86_XCR0_BSR) && !(xcr0 & X86_XCR0_TILE_CFG) )
+        return false;
+
     return true;
 }
 
@@ -877,7 +881,10 @@ static void __init noinline xstate_check
     if ( cpu_has_xsaves && boot_cpu_has(X86_FEATURE_ARCH_LBR) )
         check_new_xstate(&s, X86_XSS_LBR);
 
-    if ( boot_cpu_has(X86_FEATURE_AMX_TILE) )
+    if ( boot_cpu_has(X86_FEATURE_ACE) )
+        check_new_xstate(&s,
+                         X86_XCR0_TILE_DATA | X86_XCR0_TILE_CFG | X86_XCR0_BSR);
+    else if ( boot_cpu_has(X86_FEATURE_AMX_TILE) )
         check_new_xstate(&s, X86_XCR0_TILE_DATA | X86_XCR0_TILE_CFG);
 
     if ( cpu_has_apx_f )
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -355,6 +355,7 @@ XEN_CPUFEATURE(UC_LOCK_DIS,        13*32
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
 XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*s  RDMSR/WRMSRNS with immediate operand */
+XEN_CPUFEATURE(ACE,                14*32+11) /*   AI Compute Extensions */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -67,7 +67,7 @@ const char *x86_cpuid_vendor_to_str(unsi
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
-#define CPUID_GUEST_NR_PALETTE    (1u + 1)
+#define CPUID_GUEST_NR_PALETTE    (2u + 1)
 #define CPUID_GUEST_NR_TMUL       (1u + 1)
 #define CPUID_GUEST_NR_AVX10      (1u + 1)
 #define CPUID_GUEST_NR_APX        (0u + 1)
@@ -286,6 +286,14 @@ struct cpu_policy
                 uint16_t max_rows, :16;
                 uint32_t /* d */:32;
             } palette1;
+
+            /* Palette (subleaf) 2 (ACE). */
+            struct {
+                uint32_t version:8, :24;
+                uint32_t /* b */:32;
+                uint32_t /* c */:32;
+                uint32_t /* d */:32;
+            } ace;
         };
     } tile;
 
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -314,6 +314,8 @@ def crunch_numbers(state):
         # AVX10 discrete features.
         AVX10: [AVX10_BMM, AVX10_V1_AUX, AVX10_V2_AUX],
 
+        AVX10_V2_AUX: [ACE],
+
         # Extensions with VEX/EVEX encodings keyed to a separate feature
         # flag are made dependents of their respective legacy feature.
         PCLMULQDQ: [VPCLMULQDQ],


