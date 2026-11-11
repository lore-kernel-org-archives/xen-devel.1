Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F9606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eelUN290
Received: from list by lists.xenproject.org with outflank-mailman.1483728.1687081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Cq-0008DX-I2; Wed, 11 Nov 2026 14:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483728.1687081; Wed, 11 Nov 2026 14:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Cq-0008DM-Ep; Wed, 11 Nov 2026 14:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1483728;
 Wed, 11 Nov 2026 14:21:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Co-0008Bu-WD
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:21:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Co-00EKlr-Cy
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:21:42 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af479eb-8faa-0a2a0a5109dd-0a2a450789d0-24
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:21:42 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af479f5-b4ea-0a2a45070019-d1558036b5c8-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:21:41 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so36292025e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:21:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c2793sm11176517f8f.45.2026.11.11.06.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:21:40 -0800 (PST)
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
        d=suse.com; s=google; t=1794406901; x=1795011701; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Le6wzb3TPjRF6vIs8HCE9orrBmcKk50sP3frBR83F3Y=;
        b=eelUN290nhLeNMAFehvcgt/jzPnP5RZo7m+olWD0enWGRgsLbNZi52ku9iiVg493Mq
         H5FLx0j+1oAR3CX+5PBnigTpKgoGHLqbTM4vguqx4OeJ4uk0p3HlPDFk5Q/IqtJ31CeY
         outs3t+JhVruXLxHBuaDRa3PKiusuJVP+JSgTMdH54JEi18WoM5W62ifVFi2KzZuifIN
         6FB4S63PCFRVBWt2oOStq//3o/0xAb29ezhMN7IqKuJwh6xbFsv7oW4B2MQhNSVTrLoS
         EWmZqiu5dsBqVcED9NMp95zsPN63rro4qpiV4o7Ybrm345rOcNKh5BD1fsjrYkSqlCNh
         t1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406901; x=1795011701;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Le6wzb3TPjRF6vIs8HCE9orrBmcKk50sP3frBR83F3Y=;
        b=EJUx1qK9hKgdBf3aex8ChSs+IfzhOyGfvjkf9LxadDAz1uW1n+wtt6FoBFzsqXVoGw
         qM3VKd58ux7ZrGK0HtzYl0vhrKKNYivb6xbMx2XIBR6CZssfpGWsnDaW0tplyuAn3Flj
         KPx5wNSLM+b38R/QT252rbjDW8eAZh713k6Cvfpz/J2y3GuBouM2M7ILNLvG9E1OnG5/
         3YbLUuPEwXNIhxK/AyAnd29UdhEGsKxZCZ31PeecRcYI2CpMZ9Ydi7iGlQ+Ha2wGhfu7
         /UPNW0mSppiy3EmYuwM2gqHQ/QzZt4qAWdYX/xM92nyNQX/mlA7FcBGENSoZGddCKhht
         bw1w==
X-Gm-Message-State: APuU4Z+DgoAu5QnXKdXARoOzK1QYiV9T/jrEuS2XIzPYFTu9526Im+3u
	IvHv7yKudBB7cCDhla6BedqQ3t1MEwwuQfQc6NF/PZhcCTlawGvzioW0ulmAkjk7Webg3mUXQru
	pnY4G1w==
X-Gm-Gg: AYBFou2s8Mkg6BQPq5eCsMlvO63w2bNZoNT9TVBy4IxxhubCPLRGr+GDMSyK1helttQ
	yfozPYNx5CGTT222pMA9T82bgleR/2NX+V2y7Y5dYq+uBfyXUEZQLjiQfDuoFGdcuT5f1Xz2zHj
	Na8nc6r/UsRfhcVHEIZR1s3afz5j9wmmGHy2SCdVY9tpzHnrKsgog4iNacbV2wVdC+RAu5cImAy
	B3pnvrOFbnwGwXQ4SE8/1XkH95pSADgwh0eAEhXQx7Ag3SJUIY7kMcqSY3vmriwLP6OwYQk46FA
	3EBE3VvR/0suqBNrue0/PksI6WM1tqocqIYnnfY02JBh/j4kCr2rkMMVYwYQjaWKf4k6AUtEz/V
	5VAE72FbGayfkPED6GPbyGk3n1+8f9fLcqrwNTcEHmhkXdxzAT3toPLaQ8EpoacB+R6tuFk9pod
	gvy9/s62IPSHK3oIxzgHZBjXp2IRo4qZfsB+dJ2HuEk7ZMSkVM5B5fvMJA3V1n1f3TAQJ6PhcfB
	E9NqByAhpGL4r4gOwFBdTyzwYwqCuQb0IW/S3Vh/XvmwMqySeilESgSwdO6H4poPe7UChscbG0f
	fyPM98ytSz4P7CqegYz1qIsJYyXkYIFGyhh0BaaDjNbgqsC068nEob4pZwli9rzxo7x9N5+A6LG
	ydaOYGGZ3rK/HnXNusA==
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ba0937a886mr46619975e9.17.1794406901407;
        Wed, 11 Nov 2026 06:21:41 -0800 (PST)
Message-ID: <7a1b1dd4-6b07-4b9a-970f-15bffd8b9020@suse.com>
Date: Wed, 11 Nov 2026 15:21:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 03/30] x86/xstate: enable APX_F
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
X-purgate-ID: tlsNG-ef75cf/1794406901-378D1AE4-0B8E2518/10/78276251493
X-purgate-type: spam
X-purgate-size: 3063
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add / adjust basic definitions. Adjust recalculate_xstate() and
xstate_check_sizes() accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -220,6 +220,9 @@ static void recalculate_xstate(struct cp
     if ( p->feat.amx_tile )
         xstates |= X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA;
 
+    if ( p->feat.apx_f )
+        xstates |= X86_XCR0_APX;
+
     /* Subleaf 0 */
     p->xstate.max_size =
         xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -220,6 +220,9 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_verw_clear      boot_cpu_has(X86_FEATURE_VERW_CLEAR)
 #define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
 
+/* CPUID level 0x00000007:1.edx */
+#define cpu_has_apx_f           boot_cpu_has(X86_FEATURE_APX_F)
+
 /* MSR_ARCH_CAPS */
 #define cpu_has_rdcl_no         boot_cpu_has(X86_FEATURE_RDCL_NO)
 #define cpu_has_eibrs           boot_cpu_has(X86_FEATURE_EIBRS)
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -109,13 +109,14 @@
 #define X86_XSS_HWP               (_AC(1, ULL) << 16)
 #define X86_XCR0_TILE_CFG         (_AC(1, ULL) << 17)
 #define X86_XCR0_TILE_DATA        (_AC(1, ULL) << 18)
+#define X86_XCR0_APX              (_AC(1, ULL) << 19)
 #define X86_XCR0_LWP              (_AC(1, ULL) << 62)
 
 #define X86_XCR0_STATES                                                 \
     (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | X86_XCR0_BNDREGS |    \
      X86_XCR0_BNDCSR | X86_XCR0_OPMASK | X86_XCR0_ZMM |                 \
      X86_XCR0_HI_ZMM | X86_XCR0_PKRU | X86_XCR0_TILE_CFG |              \
-     X86_XCR0_TILE_DATA |                                               \
+     X86_XCR0_TILE_DATA | X86_XCR0_APX |                                \
      X86_XCR0_LWP)
 
 #define X86_XSS_STATES                                                  \
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -34,7 +34,7 @@ extern uint32_t mxcsr_mask;
 #define XCNTXT_MASK    (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | \
                         X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
                         X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
-                        X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)
+                        X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA | X86_XCR0_APX)
 
 #define XSTATE_ALL     (~(1ULL << 63))
 #define XSTATE_XSAVES_ONLY         0
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -847,6 +847,9 @@ static void __init noinline xstate_check
     if ( boot_cpu_has(X86_FEATURE_AMX_TILE) )
         check_new_xstate(&s, X86_XCR0_TILE_DATA | X86_XCR0_TILE_CFG);
 
+    if ( cpu_has_apx_f )
+        check_new_xstate(&s, X86_XCR0_APX);
+
     if ( boot_cpu_has(X86_FEATURE_LWP) )
         check_new_xstate(&s, X86_XCR0_LWP);
 


