Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A3B606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZPXxFg7K
Received: from list by lists.xenproject.org with outflank-mailman.1483589.1686938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8ct-0001oz-AU; Wed, 11 Nov 2026 13:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483589.1686938; Wed, 11 Nov 2026 13:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8ct-0001os-7A; Wed, 11 Nov 2026 13:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1483589;
 Wed, 11 Nov 2026 13:44:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8cs-0001nN-9U
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:44:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8cr-003YNx-MF
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:44:33 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47137-2eae-0a2a0a5409dd-0a2a4505c610-42
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:44:33 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47141-4cb1-0a2a45050019-d155802db543-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:44:33 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so35872535e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:44:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01fef675sm138241985e9.14.2026.11.11.05.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:44:32 -0800 (PST)
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
        d=suse.com; s=google; t=1794404673; x=1795009473; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jzzNA5ppZMSQxgpcATHSJpWr6Dt5TEc31ngB5FhIODc=;
        b=ZPXxFg7KjKPu/yUlxKub36ydyJOLQtUEQqUPS/2+OQVxV4AXC2oeGqQQc11mQFKIW2
         TwbZUuLs/iWesd2lOLOYYEnTw4eR58vsV7LSN0cVpA8lGuo0bylQwi4sH9Rph0U5nLbL
         HFkhlAtY6TT9ck+6myv9Stux87tj4+os1m7yL8ZyXuxhogLXdr4ozSXtj3WUKnkuKrqD
         UGgKPa02ZTeockdav02mOY+RF+qbapAyK6ra+Vk0eaeo/2bC4uFwIcM+WD0n6Zptc5zs
         K7kA5Xp2TKKf9vIc9NEPCZpi6P5jQRnWrQZX44fqhanKvTdbzt0k2PahzhQKmtJ6hv6X
         9YjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404673; x=1795009473;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jzzNA5ppZMSQxgpcATHSJpWr6Dt5TEc31ngB5FhIODc=;
        b=kl6JacivVTaHgsVaQUAfi3HWNK/nIL+vslgOc1LSwnsevF8foezlv2p/p9KC4I+0qE
         1S7JQL5HefJZb7iu+J2zq2fxwKEq0miWTUx4hjpLo6HWhPHUVh8QlRN2PEKA77upWgEf
         BXz7yoMCDyL4QlfaarZLrNZxVEr2eDwQO7/13ocEdsZMaJWWEHmIW6EmOxog6DFpIEW7
         zx4/9PL0T7HDyoXLlfRAcyTV2KhI0AmdMUerY1ieoHVO2QRnGM9pQhm97qklWsarB3xn
         pcGtlBRHfQGNOZYAgMdiXSn0P5SPbH6JGs11MXYjnjGsJVFf3ki5FzFp5/3N8PZKLAUA
         nrBg==
X-Gm-Message-State: APuU4Z8dNweoMXG0vzUQBX9rhC7mnWCqhWnWn1049IuI93pnYF486aaP
	4AmC6/eTSJvXzOP+7vnlHRjrIBw3Xig3/YqaOdm0ebeLaG5EDiUr1tKQXzBHf/+YAEONagXRtNm
	SQTiKIQ==
X-Gm-Gg: AYBFou2zNvAgfvWHRldvmpyxuUPPwes0uYzo1VaK2hZqZY5q9eM07tl8VgTFFfoALRD
	iFrt7BHNg5PnXOM4w63Fg2iZehG9vJpbsY1dLTCTrKAvADUwgRt4HON+aBJP031wq2k8nvMEdbb
	ATS6vTet40NT/EoOPKx3fEEegtq1Yf5DxDffqzLMcPiHF0C7mJee4HMbZSUVPLU1TIJNWdIR5SS
	38VGQtq7hTOqf66XLiD4cf093VO02dkcP4Tb8qKcwfo1s0XufEzCmqGS3wuuYu7w/EtcDvwzV3T
	ZVUhnHyzlXUJrTuICC0LwhYBqQ1+rYTDcvBlaj4+2eemDce3jSa/4rmu26ztLQqm+R6QuvtzwWD
	N2J4t/KI1/A93uWBlwR7F2jJCgO1ers66qm9V9UW7VdCaj6Ddk1MpAkZJnnZSDjxZrPbM04DIai
	WG/A/hF/cXkocjuXpo3r6c4ol++Uks08KNJ0zmI0u9L63gXU8GzmfkCU/fRQxNiu0mVZY+fGC/6
	XZHMIj73mcntDYHmNJe7Yd7QP8F0RV6WoXFMYdMDRDUREi+sjLtGMdNe35fVXJfcvLgN9cqprqy
	fKpugqAqUHXzIJo3dsxM/K64ifFDY23Si0RGV9tOYnduZOi0f4QbTsLoKUekYtVOHqcFrkz/rKQ
	2DrwRpkNr2XnamB/pHA==
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr42775375e9.34.1794404672793;
        Wed, 11 Nov 2026 05:44:32 -0800 (PST)
Message-ID: <a9d79832-383f-47ee-aebe-a2ce651191e9@suse.com>
Date: Wed, 11 Nov 2026 14:44:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 07/19] x86emul: AVX10.1 testing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1be43887-4494-4ff5-a801-0c6bab90c80d@suse.com>
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
In-Reply-To: <1be43887-4494-4ff5-a801-0c6bab90c80d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794404673-72EB12A1-8545FF1A/10/78276251493
X-purgate-type: spam
X-purgate-size: 11718
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Re-use respective AVX512 tests, by suitably adjusting the predicate
functions. This leaves test names ("Testing ... NN-bit code sequence")
somewhat misleading, but I think we can live with that.

Note that the AVX512{BW,DQ} opmask tests cannot be run as-is for the
AVX10/256 case, as they include 512-bit vector <-> opmask insn tests.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -gnr
---
TBD: The testcase.mk change was for AVX10.1/256. It may, however, be
     worthwhile to keep it.

TBD: May want to have separate AVX10 test blobs built, utilizing all of
     the implied AVX512 sub-features.

The AVX512{BW,DQ} opmask tests could of course be cloned (i.e. rebuilt
another time with -mavx512vl passed) accordingly, but the coverage gain
would be pretty marginal.
---
v4: Drop use of vsz<N> fields. Series re-ordering adjustments. Drop stale
    Phi leftovers. Re-base.
v2: Drop SDE 9.27.0 workaround. Re-base over dropping of Xeon Phi
    support.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1026,7 +1026,7 @@ static void test_group(const struct test
         for ( j = 0; j < nr_vl; ++j )
         {
             if ( vl[0] == VL_512 && vl[j] != VL_512 &&
-                 !cpu_policy.feat.avx512vl )
+                 !cpu_policy.feat.avx512vl && !cpu_policy.feat.avx10 )
                 continue;
 
             switch ( tests[i].esz )
@@ -1077,6 +1077,24 @@ static void test_group(const struct test
     }
 }
 
+/* AVX512 (sub)features implied by AVX10. */
+#define avx10_has_avx512f             cpu_has_avx10
+#define avx10_has_avx512bw            cpu_has_avx10
+#define avx10_has_avx512cd            cpu_has_avx10
+#define avx10_has_avx512dq            cpu_has_avx10
+#define avx10_has_avx512_bf16         cpu_has_avx10
+#define avx10_has_avx512_bitalg       cpu_has_avx10
+#define avx10_has_avx512_fp16         cpu_has_avx10
+#define avx10_has_avx512_ifma         cpu_has_avx10
+#define avx10_has_avx512_vbmi         cpu_has_avx10
+#define avx10_has_avx512_vbmi2        cpu_has_avx10
+#define avx10_has_avx512_vnni         cpu_has_avx10
+#define avx10_has_avx512_vpopcntdq    cpu_has_avx10
+
+/* AVX512 sub-feature(s) /not/ implied by AVX10. */
+#define avx10_has_avx512_vp2intersect false
+#define avx10_has_avx512_bmm          false
+
 void evex_disp8_test(void *instr, struct x86_emulate_ctxt *ctxt,
                      const struct x86_emulate_ops *ops)
 {
@@ -1094,7 +1112,7 @@ void evex_disp8_test(void *instr, struct
     } \
 } while ( false )
 
-#define RUN(feat, vl) run(cpu_has_ ## feat, feat, vl)
+#define RUN(feat, vl) run(cpu_has_ ## feat || avx10_has_ ## feat, feat, vl)
 
     RUN(avx512f, all);
     RUN(avx512f, 128);
@@ -1120,11 +1138,15 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512_bmm, all);
     RUN(avx512_bmm, no128);
 
-    if ( cpu_has_avx512f )
+#undef RUN
+
+    if ( cpu_has_avx512f || cpu_has_avx10 )
     {
+#define RUN(feat, vl) run(cpu_has_ ## feat, feat, vl)
         RUN(gfni, all);
         RUN(vaes, all);
         RUN(vpclmulqdq, all);
+#undef RUN
     }
 
     if ( cpu_has_avx10 )
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -7,6 +7,22 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDD
 CFLAGS += -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include
 CFLAGS += -fno-stack-protector -g0 $($(TESTCASE)-cflags)
 
+ifneq ($(filter -mavx512%,$($(TESTCASE)-cflags)),)
+
+cflags-vsz64 :=
+cflags-vsz32 := -mprefer-vector-width=256
+cflags-vsz16 := -mprefer-vector-width=128
+# Scalar tests don't set VEC_SIZE (and VEC_MAX is used by S/G ones only)
+cflags-vsz   := -mprefer-vector-width=128
+
+ifneq ($(filter -DVEC_SIZE=%,$($(TESTCASE)-cflags)),)
+CFLAGS += $(cflags-vsz$(patsubst -DVEC_SIZE=%,%,$(filter -DVEC_SIZE=%,$($(TESTCASE)-cflags))))
+else
+CFLAGS += $(cflags-vsz$(patsubst -DVEC_MAX=%,%,$(filter -DVEC_MAX=%,$($(TESTCASE)-cflags))))
+endif
+
+endif
+
 LDFLAGS_DIRECT += $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2>&1 && echo --no-warn-rwx-segments)
 
 .PHONY: all
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -124,52 +124,56 @@ static bool simd_check_avx_pclmul(void)
 
 static bool simd_check_avx512f(void)
 {
-    return cpu_has_avx512f;
+    return cpu_has_avx512f || cpu_has_avx10;
 }
 #define simd_check_avx512f_opmask simd_check_avx512f
 #define simd_check_avx512f_sg simd_check_avx512f
 
 static bool simd_check_avx512f_vl(void)
 {
-    return cpu_has_avx512f && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512f && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 #define simd_check_avx512vl_sg simd_check_avx512f_vl
 
 static bool simd_check_avx512dq(void)
 {
-    return cpu_has_avx512dq;
+    return cpu_has_avx512dq || cpu_has_avx10;
 }
 #define simd_check_avx512dq_opmask simd_check_avx512dq
 
 static bool simd_check_avx512dq_vl(void)
 {
-    return cpu_has_avx512dq && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512dq && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 
 static bool simd_check_avx512bw(void)
 {
-    return cpu_has_avx512bw;
+    return cpu_has_avx512bw || cpu_has_avx10;
 }
 #define simd_check_avx512bw_opmask simd_check_avx512bw
 
 static bool simd_check_avx512bw_vl(void)
 {
-    return cpu_has_avx512bw && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512bw && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 
 static bool simd_check_avx512vbmi(void)
 {
-    return cpu_has_avx512_vbmi;
+    return cpu_has_avx512_vbmi || cpu_has_avx10;
 }
 
 static bool simd_check_avx512vbmi_vl(void)
 {
-    return cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 
 static bool simd_check_avx512vbmi2(void)
 {
-    return cpu_has_avx512_vbmi2;
+    return cpu_has_avx512_vbmi2 || cpu_has_avx10;
 }
 
 static bool simd_check_sse4_sha(void)
@@ -250,17 +254,18 @@ static bool simd_check_avx512bw_gf_vl(vo
 
 static bool simd_check_avx512vnni(void)
 {
-    return cpu_has_avx512_vnni;
+    return cpu_has_avx512_vnni || cpu_has_avx10;
 }
 
 static bool simd_check_avx512fp16(void)
 {
-    return cpu_has_avx512_fp16;
+    return cpu_has_avx512_fp16 || cpu_has_avx10;
 }
 
 static bool simd_check_avx512fp16_vl(void)
 {
-    return cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 
 static void simd_set_regs(struct cpu_user_regs *regs)
@@ -3238,11 +3243,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(evex_vmovq_from_mem) )
             goto fail;
-        asm ( "vmovq %1, %%xmm1\n\t"
-              "vpcmpeqq %%zmm0, %%zmm1, %%k0\n"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovq %1, %%xmm1\n\t"
+                  "vpcmpeqq %%zmm0, %%zmm1, %%k0\n"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x00ff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovq %1, %%xmm1\n\t"
+                  "vpcmpeqq %%xmm0, %%xmm1, %%k0\n"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x03 )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -3820,11 +3836,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(evex_vmovd_from_mem) )
             goto fail;
-        asm ( "vmovd %1, %%xmm0\n\t"
-              "vpcmpeqd %%zmm4, %%zmm0, %%k0\n\t"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%zmm4, %%zmm0, %%k0\n\t"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%xmm4, %%xmm0, %%k0\n\t"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x0f )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -4037,11 +4064,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || !check_eip(evex_vmovd_from_reg) )
             goto fail;
-        asm ( "vmovd %1, %%xmm0\n\t"
-              "vpcmpeqd %%zmm1, %%zmm0, %%k0\n\t"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%zmm1, %%zmm0, %%k0\n\t"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%xmm1, %%xmm0, %%k0\n\t"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x0f )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -5524,14 +5562,28 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || !check_eip(vmovsh_from_mem) )
             goto fail;
-        asm volatile ( "kmovw     %2, %%k1\n\t"
-                       "vmovdqu16 %1, %%zmm4%{%%k1%}%{z%}\n\t"
-                       "vpcmpeqw  %%zmm4, %%zmm5, %%k0\n\t"
-                       "kmovw     %%k0, %0"
-                       : "=g" (rc)
-                       : "m" (res[2]), "r" (1) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512fp16() )
+        {
+            asm volatile ( "kmovw     %2, %%k1\n\t"
+                           "vmovdqu16 %1, %%zmm4%{%%k1%}%{z%}\n\t"
+                           "vpcmpeqw  %%zmm4, %%zmm5, %%k0\n\t"
+                           "kmovw     %%k0, %0"
+                           : "=g" (rc)
+                           : "m" (res[2]), "r" (1) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm volatile ( "kmovb     %2, %%k1\n\t"
+                           "vmovdqu16 %1, %%xmm4%{%%k1%}%{z%}\n\t"
+                           "vpcmpeqw  %%xmm4, %%xmm5, %%k0\n\t"
+                           "kmovb     %%k0, %0"
+                           : "=g" (rc)
+                           : "m" (res[2]), "r" (1) );
+            if ( rc != 0xff )
+                goto fail;
+        }
         printf("okay\n");
 
         printf("%-40s", "Testing vmovsh %xmm4,2(%eax){%k3}...");
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -223,7 +223,7 @@ int emul_test_get_fpu(
             break;
     case X86EMUL_FPU_opmask:
     case X86EMUL_FPU_zmm:
-        if ( cpu_has_avx512f )
+        if ( cpu_has_avx512f || cpu_has_avx10 )
             break;
     default:
         return X86EMUL_UNHANDLEABLE;


