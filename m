Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA03606A332
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FbarL08w
Received: from list by lists.xenproject.org with outflank-mailman.1484101.1687460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9wp-0003tq-GF; Wed, 11 Nov 2026 15:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484101.1687460; Wed, 11 Nov 2026 15:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9wp-0003tg-Cb; Wed, 11 Nov 2026 15:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1484101;
 Wed, 11 Nov 2026 15:09:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9wo-0003tJ-5Y
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:09:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9wn-00GVF0-IY
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:09:13 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4850d-bab6-0a2a0a5309dd-0a2a450c86ae-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:09:13 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48518-f479-0a2a450c0019-d155dd2de80a-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:09:12 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so1912530f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:09:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836c83432sm10600394f8f.58.2026.11.11.07.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:09:11 -0800 (PST)
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
        d=suse.com; s=google; t=1794409752; x=1795014552; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z8MgELEc9aTyqsjv3fCF2C2ELfZEbfQ7S/mxrrvD4Cg=;
        b=FbarL08wPwSNQW/0J7oD8I6gju8Besx+VPyI2PUC+CqsihJZIqboAbHmnzwZ4i2Fjr
         Huv1KMhMgRfOIC+7eXLnF5PTOmsaFNgOudlwurT+zDCiIb4k3N20/ySJWQuu+0j/c1PQ
         hXudAhMLtywXRO5moqx2FOvrlJCV3rbTZT39QGud/BQz3d6wGtDISNa8VGFe9bDikUwt
         AU3vDL2a+fjJki20s+dqBbrLkz+E5kT/VAII7faEpzj1qMxvmG8qRd2JfozVoP5TI4Eq
         VqKu5KMa5hrDyf1TZKTXVuWIQNqO8gUCitCZizr5GBRuyEEt/RZ6Xz6Fw2qBMk5VqJh+
         wLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409752; x=1795014552;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z8MgELEc9aTyqsjv3fCF2C2ELfZEbfQ7S/mxrrvD4Cg=;
        b=sgnR7yiF00r0rYsXBeSoP0ZQkUbt29+m2je9MGP+kcPcImOq3QJS6R+VSjfBj05hKj
         DDr8qNzWOdBNFKb5tOAMOOZ6aicndnzzuf7Of+0rqK4VHIQRnsIorZl4DL3T/6j6Im9U
         MTolarLgkLCy5Or2lcPhosv//ELwhnzcxYJaB2v3LMVoJ70V5ZG10Uo9++P5wlLTUbKY
         UgssalP4SZrbg29zgYvIJDfuZVj2Zuz0fntqcEf8fTT+MfqnQBS9IX68g4sUkmcnnBij
         nETGbVtUMOe/nkbWcPljUjyzE9GUt2kKEbJVNaE0ybxn16ekBcNPQjmBzEBxc9szhQE6
         pUCg==
X-Gm-Message-State: APuU4Z8HybBC8F0xDRBsMrnKCZ66NikYUIz8ZKBIUNIq0xhsYm+e5tY+
	NHYVKmY8G2vJF6E7N7PsKC1OCwHvhP7BuDBQWImtdO5DirO/XlWkkMwXRXGDaNuUCXeLZFR2Pj5
	cJL2ExQ==
X-Gm-Gg: AYBFou3Sk9u/bSLN1XMM7CuGSwZwA0md/C2oFWakGGYd+BTOzwe0GMdYHPwymz7MZIN
	d4hO/Qdu1DNZIcxWZr98V9Qi5waGM5JtCOYuHPVIh8G51ja1FShVPv6ohfO+pvotr9fURI53c5s
	oV/x0fKA/jKE8efGs79WFg9+xhECSGnNQxe6LaVKHXRSIy7iG6Y7retEDeZ4gdnlCp9OkF8t+7n
	IiLK8Up0hMmytTX83ML9cMBUdHuxAzPLWV4R9UtrTE3I2V/jql4FYCySeNAKXmZIBWXcugOT4SM
	cbPPIesnoDGGID7q3smqOkxYGohDrNvsI70vO3Bq567LhzkHQU1obzpGePyo475LC0ENVSabiBp
	pMffG8EmU6ko25U0GvRcU3iRN7v4Jb1DWhBoFcEWNzeg4wn1fzrirWSkOYPCgoXAL782fZU0t/V
	tzVYvwAqM0kGf5H4CD1he/M/zURO28ywj1GX1ZnTl7aygoT6AhLS5xzetmwNkKD+jt17AyTT2U/
	kh7PVqcPOy9U3nNQDKZRiwkWYU69WokgkPA0bf1zEUy2J3owaPR7BJBLxN/qRxHRNyMXD+t4MDv
	fUA69v44yKJhOYvtk8whDIrDjBTuN7Ds4ZlcarwE0HZTsHECE6O9q0eJcMtkQCr8huLS6q0+rBi
	mDSQ+fDuDMQmNePE1
X-Received: by 2002:a05:6000:2611:b0:490:d197:bde8 with SMTP id ffacd0b85a97d-499c150ed5bmr4335557f8f.0.1794409751917;
        Wed, 11 Nov 2026 07:09:11 -0800 (PST)
Message-ID: <29775774-e0b4-490a-9e88-476b0bdb3c9b@suse.com>
Date: Wed, 11 Nov 2026 16:09:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 06/28] x86/CPUID: enable AMX leaves
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
X-purgate-ID: tlsNG-d25034/1794409752-5093EA5B-3EEEE31D/10/78276251493
X-purgate-type: spam
X-purgate-size: 22246
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This requires bumping the number of basic leaves we support. Apart from
this the logic is modeled as closely as possible after that of leaf 7
handling.

The checks in x86_cpu_policies_are_compatible() may be more strict than
they ultimately need to be, but I'd rather start being on the safe side.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The explicit amx_int8 etc feature checks in two places aren't really
nice, as they would need amending with each new feature. Using just
amx_tile there, otoh, doesn't look to be enough to qualify the tmul
leaf.

It's not clear to me in how far libxl_cpuid.c would want extending: It
doesn't look to offer a way to override the maximum subleaf of leaf 7.
In fact I can't seem to be able to spot a max extended leaf override
mechanism either.

How a toolstack side equivalent (if any) of the init_dom0_cpuid_policy()
change would look like is entirely unclear to me. How much should we
take from the max policy, and how much should we require the user to
specify (and how would the latter look like)? We did discuss default-
enabling sub-features (i.e. AMX-* here when AMX-TILE is enabled), but
besides there still not being logic for this that also doesn't easily
extend to entire feature-dependent leaves.
---
v4: Add missing checks in x86_cpu_policy_fill_native() and
    recalculate_cpuid_policy(). Add logic to init_dom0_cpuid_policy().
    Add AMX-FP16 and AMX-COMPLEX. Also check tmul leaf in
    build_assertions(). Only cover palette 1 in struct cpu_policy. Address
    Misra concerns. Re-base.
v2: New.

--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -200,6 +200,40 @@ static void test_cpuid_serialise_success
             },
             .nr_leaves = 4 + 0xd + 1 + 1,
         },
+
+        /* Leaf 0x1d serialisation stops at max_palette. */
+        {
+            .name = "empty leaf 0x1d",
+            .p = {
+                .basic.max_leaf = 0x1d,
+            },
+            .nr_leaves = 4 + 0x1d + 1,
+        },
+        {
+            .name = "partial leaf 0x1d",
+            .p = {
+                .basic.max_leaf = 0x1d,
+                .tile.max_palette = 1,
+            },
+            .nr_leaves = 4 + 0x1d + 1 + 1,
+        },
+
+        /* Leaf 0x1e serialisation stops at 0. */
+        {
+            .name = "empty leaf 0x1e",
+            .p = {
+                .basic.max_leaf = 0x1e,
+            },
+            .nr_leaves = 4 + 0x1e + 1,
+        },
+        {
+            .name = "partial leaf 0x1e",
+            .p = {
+                .basic.max_leaf = 0x1e,
+                .tmul.maxk = 16,
+            },
+            .nr_leaves = 4 + 0x1e + 1,
+        },
     };
 
     printf("Testing CPUID serialise success:\n");
@@ -338,6 +372,14 @@ static void test_cpuid_deserialise_failu
             .leaf = { .leaf = 0xd, .subleaf = CPUID_GUEST_NR_XSTATE },
         },
         {
+            .name = "OoB tile leaf",
+            .leaf = { .leaf = 0x1d, .subleaf = CPUID_GUEST_NR_PALETTE },
+        },
+        {
+            .name = "OoB tmul leaf",
+            .leaf = { .leaf = 0x1e, .subleaf = CPUID_GUEST_NR_TMUL },
+        },
+        {
             .name = "OoB extd leaf",
             .leaf = { .leaf = 0x80000000 | CPUID_GUEST_NR_EXTD },
         },
@@ -444,6 +486,8 @@ static void test_cpuid_out_of_range_clea
                 .topo.raw[0].a = 0xc2,
                 .xstate.raw[0].a = 0xc2,
                 .xstate.raw[1].a = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -459,6 +503,8 @@ static void test_cpuid_out_of_range_clea
                 .topo.raw[0].a = 0xc2,
                 .xstate.raw[0].a = 0xc2,
                 .xstate.raw[1].a = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -473,6 +519,8 @@ static void test_cpuid_out_of_range_clea
                 .topo.raw[0].a = 0xc2,
                 .xstate.raw[0].a = 0xc2,
                 .xstate.raw[1].a = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -486,6 +534,8 @@ static void test_cpuid_out_of_range_clea
                 .topo.raw[1].b = 0xc2,
                 .xstate.raw[0].a = 0xc2,
                 .xstate.raw[1].a = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -500,6 +550,8 @@ static void test_cpuid_out_of_range_clea
 
                 .xstate.raw[2].b = 0xc2,
                 .xstate.raw[3].b = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -542,6 +594,34 @@ static void test_cpuid_out_of_range_clea
             },
         },
         {
+            .name = "tile no palette",
+            .nr_markers = 0,
+            .p = {
+                /* First two subleaves invalid as a pair.  Others cleared. */
+                .basic.max_leaf = 0x1d,
+                .xstate.xcr0_low = XSTATE_FP_SSE,
+
+                .tile.raw[0].a = 0xc2,
+                .tile.raw[1].b = 0xc2,
+                .tmul.raw[0].a = 0xc2,
+            },
+        },
+        {
+            .name = "tile palette 1",
+            .nr_markers = 1,
+            .p = {
+                /* First two subleaves valid as a pair.  Others cleared. */
+                .basic.max_leaf = 0x1d,
+                .feat.amx_tile = 1,
+                .xstate.xcr0_low = XSTATE_FP_SSE | X86_XCR0_TILE_CFG |
+                                   X86_XCR0_TILE_DATA,
+                .tile.raw[0].a = 1,
+                .tile.raw[1].b = 0xc2,
+
+                .tmul.raw[0].a = 0xc2,
+            },
+        },
+        {
             .name = "extd",
             .nr_markers = 1,
             .p = {
@@ -636,6 +716,24 @@ static void test_cpuid_maximum_leaf_shri
             },
         },
         {
+            .name = "tile",
+            .p = {
+                /* Subleaf 1 only with some valid value. */
+                .basic.max_leaf = 0x1d,
+                .tile.raw[0].a = 1,
+                .tile.raw[1].a = 1024,
+            },
+        },
+        {
+            .name = "tmul",
+            .p = {
+                /* Subleaf 0 only with some valid values. */
+                .basic.max_leaf = 0x1e,
+                .tmul.maxk = 16,
+                .tmul.maxn = 16,
+            },
+        },
+        {
             .name = "extd",
             .p = {
                 /* Commonly available information only. */
@@ -655,6 +753,7 @@ static void test_cpuid_maximum_leaf_shri
 
         p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
         p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+        p->tile.max_palette = ARRAY_SIZE(p->tile.raw) - 1;
         p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
 
         x86_cpu_policy_shrink_max_leaves(p);
@@ -672,6 +771,10 @@ static void test_cpuid_maximum_leaf_shri
              fail("  Test %s feat fail - expected %#x, got %#x\n",
                   t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
 
+        if ( p->tile.max_palette != t->p.tile.max_palette )
+             fail("  Test %s tile fail - expected %#x, got %#x\n",
+                  t->name, t->p.tile.max_palette, p->tile.max_palette);
+
         free(p);
     }
 }
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -256,6 +256,31 @@ static void recalculate_xstate(struct cp
     }
 }
 
+static void recalculate_tile(struct cpu_policy *p)
+{
+    if ( !p->feat.amx_tile )
+    {
+        memset(&p->tile, 0, sizeof(p->tile));
+        memset(&p->tmul, 0, sizeof(p->tmul));
+        return;
+    }
+
+    p->tile.raw[0].b = 0;
+    p->tile.raw[0].c = 0;
+    p->tile.raw[0].d = 0;
+
+    if ( p->tile.max_palette >= 1 )
+    {
+        p->tile.raw[1].c &= 0x0000ffff;
+        p->tile.raw[1].d = 0;
+    }
+
+    p->tmul.raw[0].a = 0;
+    p->tmul.raw[0].b &= 0x00ffffff;
+    p->tmul.raw[0].c = 0,
+    p->tmul.raw[0].d = 0;
+}
+
 /*
  * Misc adjustments to the policy.  Mostly clobbering reserved fields and
  * duplicating shared fields.  Intentionally hidden fields are annotated.
@@ -275,7 +300,8 @@ static void recalculate_misc(struct cpu_
 
     p->basic.raw[0xc] = EMPTY_LEAF;
 
-    zero_leaves(p->basic.raw, 0xe, 0x23);
+    zero_leaves(p->basic.raw, 0xe, 0x1c);
+    zero_leaves(p->basic.raw, 0x1f, 0x23);
 
     p->avx10.raw[0].b &= 0x000700ff;
     p->avx10.raw[0].c = 0;
@@ -410,6 +436,7 @@ void __init calculate_host_cpu_policy(vo
 
     x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 
     /* When vPMU is disabled, drop it from the host policy. */
     if ( vpmu_mode == XENPMU_MODE_OFF )
@@ -432,6 +459,7 @@ static void __init guest_common_max_leav
 {
     p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
     p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
+    p->tile.max_palette     = ARRAY_SIZE(p->tile.raw) - 1;
     p->avx10.max_subleaf    = ARRAY_SIZE(p->avx10.raw) - 1;
     p->apx.max_subleaf      = ARRAY_SIZE(p->apx.raw) - 1;
     p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
@@ -442,6 +470,7 @@ static void __init guest_common_default_
 {
     p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
     p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
+    p->tile.max_palette     = host_cpu_policy.tile.max_palette;
     p->avx10.max_subleaf    = host_cpu_policy.avx10.max_subleaf;
     p->apx.max_subleaf      = host_cpu_policy.apx.max_subleaf;
     p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
@@ -772,6 +801,7 @@ static void __init calculate_pv_max_poli
     sanitise_featureset(fs);
     x86_cpu_featureset_to_policy(fs, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
 }
@@ -812,6 +842,7 @@ static void __init calculate_pv_def_poli
 
     x86_cpu_featureset_to_policy(fs, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 }
 
 static void __init calculate_hvm_max_policy(void)
@@ -942,6 +973,7 @@ static void __init calculate_hvm_max_pol
     sanitise_featureset(fs);
     x86_cpu_featureset_to_policy(fs, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
@@ -994,6 +1026,7 @@ static void __init calculate_hvm_def_pol
 
     x86_cpu_featureset_to_policy(fs, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 }
 
 void __init init_guest_cpu_policies(void)
@@ -1054,6 +1087,7 @@ void recalculate_cpuid_policy(struct dom
 
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
+    p->tile.max_palette = min(p->tile.max_palette, max->tile.max_palette);
     p->avx10.max_subleaf = min(p->avx10.max_subleaf, max->avx10.max_subleaf);
     p->apx.max_subleaf  = min(p->apx.max_subleaf, max->apx.max_subleaf);
     p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
@@ -1102,6 +1136,8 @@ void recalculate_cpuid_policy(struct dom
 
     if ( p->basic.max_leaf < XSTATE_CPUID )
         __clear_bit(X86_FEATURE_XSAVE, fs);
+    if ( p->basic.max_leaf < 0x1d )
+        __clear_bit(X86_FEATURE_AMX_TILE, fs);
     if ( p->basic.max_leaf < 0x24 )
         __clear_bit(X86_FEATURE_AVX10, fs);
     if ( p->basic.max_leaf < 0x29 )
@@ -1130,6 +1166,7 @@ void recalculate_cpuid_policy(struct dom
     p->extd.maxlinaddr = p->extd.lm ? 48 : 32;
 
     recalculate_xstate(p);
+    recalculate_tile(p);
     recalculate_misc(p);
 
     for ( i = 0; i < ARRAY_SIZE(p->cache.raw); ++i )
@@ -1201,6 +1238,11 @@ void __init init_dom0_cpuid_policy(struc
          * Default-off features with their own leaves need those leaves
          * re-populated from the max policy.
          */
+        if ( p->feat.amx_tile )
+        {
+            p->tile = max->tile;
+            p->tmul = max->tmul;
+        }
         if ( p->feat.avx10 )
             p->avx10 = max->avx10;
         if ( p->feat.apx_f )
@@ -1237,6 +1279,10 @@ static void __init __maybe_unused build_
                  sizeof(raw_cpu_policy.feat.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.xstate) !=
                  sizeof(raw_cpu_policy.xstate.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.tile) !=
+                 sizeof(raw_cpu_policy.tile.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.tmul) !=
+                 sizeof(raw_cpu_policy.tmul.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.avx10) !=
                  sizeof(raw_cpu_policy.avx10.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.apx) !=
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -226,6 +226,22 @@ void guest_cpuid(const struct vcpu *v, u
             *res = array_access_nospec(p->xstate.raw, subleaf);
             break;
 
+        case 0x1d:
+            ASSERT(p->tile.max_palette < ARRAY_SIZE(p->tile.raw));
+            if ( subleaf > min_t(uint32_t, p->tile.max_palette,
+                                 ARRAY_SIZE(p->tile.raw) - 1) )
+                return;
+
+            *res = array_access_nospec(p->tile.raw, subleaf);
+            break;
+
+        case 0x1e:
+            if ( subleaf >= ARRAY_SIZE(p->tmul.raw) )
+                return;
+
+            *res = array_access_nospec(p->tmul.raw, subleaf);
+            break;
+
         case 0x24:
             ASSERT(p->avx10.max_subleaf < ARRAY_SIZE(p->avx10.raw));
             if ( subleaf > min_t(uint32_t, p->avx10.max_subleaf,
--- a/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
+++ b/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
@@ -123,6 +123,19 @@ int x86_cpuid_copy_to_buffer(const struc
             break;
         }
 
+        case 0x1d:
+            for ( subleaf = 0;
+                  subleaf <= MIN(p->tile.max_palette,
+                                 ARRAY_SIZE(p->tile.raw) - 1); ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->tile.raw[subleaf]);
+            break;
+
+        case 0x1e:
+            for ( subleaf = 0;
+                  subleaf <= ARRAY_SIZE(p->tmul.raw) - 1; ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->tmul.raw[subleaf]);
+            break;
+
         case 0x24:
             for ( subleaf = 0;
                   subleaf <= MIN(p->avx10.max_subleaf,
--- a/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
+++ b/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
@@ -108,6 +108,20 @@ int x86_cpuid_copy_from_buffer(struct cp
                 array_access_nospec(p->xstate.raw, data.subleaf) = l;
                 break;
 
+            case 0x1d:
+                if ( data.subleaf >= ARRAY_SIZE(p->tile.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->tile.raw, data.subleaf) = l;
+                break;
+
+            case 0x1e:
+                if ( data.subleaf >= ARRAY_SIZE(p->tmul.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->tmul.raw, data.subleaf) = l;
+                break;
+
             case 0x24:
                 if ( data.subleaf >= ARRAY_SIZE(p->avx10.raw) )
                     goto out_of_range;
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -129,7 +129,7 @@ void x86_cpu_policy_fill_native(struct c
         switch ( i )
         {
         case 0x4: case 0x7: case 0xb: case 0xd:
-        case 0x24: case 0x29:
+        case 0x1d: case 0x1e: case 0x24: case 0x29:
             /* Multi-invocation leaves.  Deferred. */
             continue;
         }
@@ -223,6 +223,18 @@ void x86_cpu_policy_fill_native(struct c
         }
     }
 
+    if ( p->basic.max_leaf >= 0x1d )
+    {
+        cpuid_count_leaf(0x1d, 0, &p->tile.raw[0]);
+
+        for ( i = 1; i <= MIN(p->tile.max_palette,
+                              ARRAY_SIZE(p->tile.raw) - 1); ++i )
+            cpuid_count_leaf(0x1d, i, &p->tile.raw[i]);
+    }
+
+    if ( p->basic.max_leaf >= 0x1e )
+        cpuid_count_leaf(0x1e, 0, &p->tmul.raw[0]);
+
     if ( p->basic.max_leaf >= 0x24 )
     {
         cpuid_count_leaf(0x24, 0, &p->avx10.raw[0]);
@@ -310,6 +322,20 @@ void x86_cpu_policy_clear_out_of_range_l
                     ARRAY_SIZE(p->xstate.raw) - 1);
     }
 
+    if ( p->basic.max_leaf < 0x1d ||
+         (cpu_policy_xstates(p) &
+          (X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)) !=
+         (X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA) )
+        memset(p->tile.raw, 0, sizeof(p->tile.raw));
+    else
+        zero_leaves(p->tile.raw, p->tile.max_palette + 1,
+                    ARRAY_SIZE(p->tile.raw) - 1);
+
+    if ( p->basic.max_leaf < 0x1e || !p->tile.max_palette ||
+         (!p->feat.amx_int8 && !p->feat.amx_bf16 &&
+          !p->feat.amx_fp16 && !p->feat.amx_complex) )
+        memset(p->tmul.raw, 0, sizeof(p->tmul.raw));
+
     if ( p->basic.max_leaf < 0x24 )
         memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
 
@@ -328,6 +354,8 @@ void __init x86_cpu_policy_bound_max_lea
         min_t(uint32_t, p->basic.max_leaf, ARRAY_SIZE(p->basic.raw) - 1);
     p->feat.max_subleaf =
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
+    p->tile.max_palette =
+        min_t(uint32_t, p->tile.max_palette, ARRAY_SIZE(p->tile.raw) - 1);
     p->avx10.max_subleaf =
         min_t(uint32_t, p->avx10.max_subleaf, ARRAY_SIZE(p->avx10.raw) - 1);
     p->apx.max_subleaf =
@@ -359,6 +387,21 @@ void x86_cpu_policy_shrink_max_leaves(st
      */
     p->basic.raw[0xd] = p->xstate.raw[0];
 
+    for ( i = p->tile.max_palette; i; --i )
+        if ( p->tile.raw[i].a | p->tile.raw[i].b |
+             p->tile.raw[i].c | p->tile.raw[i].d )
+            break;
+    if ( i )
+        p->tile.max_palette = i;
+    else
+    {
+        ASSERT(!p->feat.amx_tile);
+        zero_leaves(p->tile.raw, 0, 0);
+    }
+    p->basic.raw[0x1d] = p->tile.raw[0];
+
+    p->basic.raw[0x1e] = p->tmul.raw[0];
+
     p->basic.raw[0x24] = p->avx10.raw[0];
 
     p->basic.raw[0x29] = p->apx.raw[0];
--- a/xen/arch/x86/lib/cpu-policy/policy.c
+++ b/xen/arch/x86/lib/cpu-policy/policy.c
@@ -24,6 +24,30 @@ int x86_cpu_policies_are_compatible(cons
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
         FAIL_CPUID(7, 0);
 
+    if ( (guest->feat.amx_tile && !guest->tile.max_palette) ||
+         guest->tile.max_palette > host->tile.max_palette )
+        FAIL_CPUID(0x1d, 0);
+
+    if ( guest->tile.max_palette >= 1 )
+    {
+        const typeof(guest->tile.palette1) *gt = &guest->tile.palette1,
+                                           *ht = &host->tile.palette1;
+
+        if ( gt->tot_bytes != ht->tot_bytes ||
+             gt->bytes_per_tile != ht->bytes_per_tile ||
+             gt->bytes_per_row != ht->bytes_per_row ||
+             !gt->num_regs || gt->num_regs > ht->num_regs ||
+             !gt->max_rows || gt->max_rows > ht->max_rows )
+            FAIL_CPUID(0x1d, 1);
+    }
+
+    if ( ((guest->feat.amx_int8 || guest->feat.amx_bf16 ||
+           guest->feat.amx_fp16 || guest->feat.amx_complex) &&
+          (!guest->tmul.maxk || !guest->tmul.maxn)) ||
+         guest->tmul.maxk > host->tmul.maxk ||
+         guest->tmul.maxn > host->tmul.maxn )
+        FAIL_CPUID(0x1e, 0);
+
     if ( guest->avx10.version > host->avx10.version ||
          guest->avx10.max_subleaf > host->avx10.max_subleaf )
         FAIL_CPUID(0x24, 0);
--- a/xen/arch/x86/lib/cpu-policy/private.h
+++ b/xen/arch/x86/lib/cpu-policy/private.h
@@ -15,13 +15,17 @@
 
 #else
 
+#include <assert.h>
 #include <errno.h>
 #include <inttypes.h>
 #include <stdbool.h>
 #include <stddef.h>
 #include <string.h>
 
+#define ASSERT assert
+
 #include <xen/asm/msr-index.h>
+#include <xen/asm/x86-defns.h>
 #include <xen/asm/x86-vendors.h>
 
 #include <xen-tools/common-macros.h>
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -66,6 +66,8 @@ const char *x86_cpuid_vendor_to_str(unsi
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
+#define CPUID_GUEST_NR_PALETTE    (1u + 1)
+#define CPUID_GUEST_NR_TMUL       (0u + 1)
 #define CPUID_GUEST_NR_AVX10      (1u + 1)
 #define CPUID_GUEST_NR_APX        (0u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
@@ -268,6 +270,35 @@ struct cpu_policy
         } comp[CPUID_GUEST_NR_XSTATE];
     } xstate;
 
+    /* Structured tile information leaf: 0x00000001d[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_PALETTE];
+        struct {
+            /* Subleaf 0. */
+            uint32_t max_palette;
+            uint32_t /* b */:32, /* c */:32, /* d */:32;
+
+            /* Palette (subleaf) 1. */
+            struct {
+                uint16_t tot_bytes, bytes_per_tile;
+                uint16_t bytes_per_row, num_regs;
+                uint16_t max_rows, :16;
+                uint32_t /* d */:32;
+            } palette1;
+        };
+    } tile;
+
+    /* Structured tmul information leaf: 0x00000001e[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_TMUL];
+        struct {
+            /* Subleaf 0. */
+            uint32_t /* a */:32;
+            uint32_t maxk:8, maxn:16, :8;
+            uint32_t /* c */:32, /* d */:32;
+        };
+    } tmul;
+
     /* Structured AVX10 information leaf: 0x000000024[xx] */
     union {
         struct cpuid_leaf raw[CPUID_GUEST_NR_AVX10];


