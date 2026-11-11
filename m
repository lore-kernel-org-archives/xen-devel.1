Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9412606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VzXDFADD
Received: from list by lists.xenproject.org with outflank-mailman.1483547.1686893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8aX-0007hm-Ur; Wed, 11 Nov 2026 13:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483547.1686893; Wed, 11 Nov 2026 13:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8aX-0007hf-RZ; Wed, 11 Nov 2026 13:42:09 +0000
Received: by outflank-mailman (input) for mailman id 1483547;
 Wed, 11 Nov 2026 13:42:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8aW-0007gy-7a
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:42:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8aV-00EjTh-KO
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:42:07 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af470ae-e002-0a2a0a5209dd-0a2a4505c062-2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:42:07 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af470ae-4cb1-0a2a45050019-d155dd30cd9f-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:42:06 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so2722269f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:42:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836b8eb11sm12066043f8f.57.2026.11.11.05.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:42:06 -0800 (PST)
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
        d=suse.com; s=google; t=1794404526; x=1795009326; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oKgg4mE+DTFSo0pcswsYCG6kVPfepghnzITxH02ELDI=;
        b=VzXDFADDvtcAG8sOPE2P190FjS6+qPV4qg4r70Mlhmpv4UWbSRuOeC2h91/iUEbWiG
         7TQRG+w740a/n2RAApZgxY8tN9ZB/UV3i67LxynfwjiKxuqAOjTNctx05YQp72TmdnCB
         7MLNHpOY07eef1JT6NI5di3c6PxMI/bzYEND0MkgfsoOr89pUmYF/QTapeoQHfHspB4S
         L5Ix39E7jiSDBJhXxGdc7JnvHfFNahqXF+RIE7Gb/fu79oWMZ+HAf4qYdZHqAHdu2oQD
         /0VaA5xXwkreUKIyyuUnGSy2INJk7q4Xw7gTUntXO3Rl+eH9LWVTtHgLd3V+Ic9qLn4T
         8uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404526; x=1795009326;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oKgg4mE+DTFSo0pcswsYCG6kVPfepghnzITxH02ELDI=;
        b=baMN5YfYlCrndlWXJJVCIexsoXs/3UKoTRjzDxVk2zDQQ60/ebNElECbPC4HOe81U9
         pAedaKEgxy+iTpDG+0NqEFKK3fXGhfJbZfaMu+VP2BPg/hDu+7F5yXPRT7Luox1lXE96
         q412HUsYN+T4uhBtKjGOG47Ox5+NVxvKMLYCejmwtxpcZuiUKbKUxQlFJV+cHAV32mTf
         mvE1q3QxJi9xLzlQd89qxHdPoRPSSbk8GOh57KBF0kiF1Np4dCM9tRPAmL7cEa/n9px7
         44gUO7/VWoWZ2fyYm/2NbmudUEY7bTl+I724fX7ccSFL7fI6Oq8sbEKAxSSonmt38y6l
         6u4A==
X-Gm-Message-State: APuU4Z+CO+mmdrCR6wDKQ8sIKLwgGP4SXHSkob6HTHF8MisPM0thGLmJ
	YP0MmD7yE3vhZt5xsR5ORiEpqrJSyqjXA2/GPC+vV6Y9e5eLPKCih6CBgEGFbgvPRZegrCUo4Wz
	EhZ7uWA==
X-Gm-Gg: AYBFou2kaoC9M+QD2Abe6QHppYDMXFbv9/v28vmd8SM5CWNp8BO6nvIniw2JUgQMsNt
	F0XIrrQtPBYge/w60hGgZLCzlBXFhpUt5URCrUELP7gxq3Qhl126TkW4w2+h5i5w5B/SCBTaKk2
	9FZcMqad9I5HcTnxYiB/XqfhbK+y/7ofr/rTnpzTo1pdyKVFObii4G5Lz0Df+q7a0uAEj7HU9gF
	Iuf8WBqfP1PRe0VRreFM4zwxUHoZhLBhT8h9TObBQ7dpM47w71tB8YhAhb3kYmRExqgr5HepkeK
	CUtNi/bsunnvBI4/R/MzgUt0SFriqW+vtIRu/wPfNxDSwsxZ0eJMtD0XtTrwlXefgw6aTjkPppq
	a4PWslFMAV/lDIXYkaSknRVEvC8IKp35haxOg3EJ3vqYTryfCsZnxXFeatm3ltM6S0dfLosuB6c
	IEL3EeGqjkfTp4CCcsd2EUbeBtEiApNi/9YLDAZtKRxsuAswAmeowMxq9Ris/CYHeehJy6DRBOO
	jB6bTNeirprtzzjMQPpA1ZAfHgZAobQHqufauHVcmzrC8JuE/Bw8A58NK6/f67R7WpAcmNZ21Wq
	CONVbhNMjFcE5muwWgYrAD/Ih0LaBenq2jpwLg09lzFNx13mtae4DpH1rPkcj+9hoH8uFE/Ozne
	EstapA2g9rwN5kFAB1GXOY+WuAM0ZWwAnctGoBg==
X-Received: by 2002:a05:6000:250b:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-499c7b1bb2amr3997615f8f.46.1794404526431;
        Wed, 11 Nov 2026 05:42:06 -0800 (PST)
Message-ID: <43d99ca6-6e06-4cec-bbb2-1110aaa1ab41@suse.com>
Date: Wed, 11 Nov 2026 14:42:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 02/19] x86emul: support SIMD MOVRS
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
X-purgate-ID: tlsNG-c201ff/1794404527-724B42A1-A110C24F/10/78276251493
X-purgate-type: spam
X-purgate-size: 4760
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As we ignore cachability aspects of insns, they're treated like simple
VMOVs.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr
---
v4: Correct main switch case labels to reference Map5. Switch to using
    fallthrough pseudo-keyword. Move ahead in series, switching feature
    dependency to plain AVX10.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -720,6 +720,13 @@ static const struct test vpclmulqdq_all[
     INSN(pclmulqdq, 66, 0f3a, 44, vl, q_nb, vl)
 };
 
+static const struct test movrs_all[] = {
+    INSN(movrsb, f2, map5, 6f, vl,    b, vl),
+    INSN(movrsd, f3, map5, 6f, vl, d_nb, vl),
+    INSN(movrsq, f3, map5, 6f, vl, q_nb, vl),
+    INSN(movrsw, f2, map5, 6f, vl,    w, vl),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1071,8 +1078,8 @@ void evex_disp8_test(void *instr, struct
     emulops.read = read;
     emulops.write = write;
 
-#define RUN(feat, vl) do { \
-    if ( cpu_has_##feat ) \
+#define run(cond, feat, vl) do { \
+    if ( cond ) \
     { \
         printf("%-40s", "Testing " #feat "/" #vl " disp8 handling..."); \
         test_group(feat ## _ ## vl, ARRAY_SIZE(feat ## _ ## vl), \
@@ -1081,6 +1088,8 @@ void evex_disp8_test(void *instr, struct
     } \
 } while ( false )
 
+#define RUN(feat, vl) run(cpu_has_ ## feat, feat, vl)
+
     RUN(avx512f, all);
     RUN(avx512f, 128);
     RUN(avx512f, no128);
@@ -1111,4 +1120,9 @@ void evex_disp8_test(void *instr, struct
         RUN(vaes, all);
         RUN(vpclmulqdq, all);
     }
+
+    if ( cpu_has_avx10 )
+    {
+        run(ctxt->addr_size == 64 && cpu_has_movrs, movrs, all);
+    }
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2124,6 +2124,8 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
+    { { 0x6f }, 2, T, R, pfx_f2, Wn, Ln }, /* vmovrs{b,w} */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2uqq */
     { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2usi */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -211,12 +211,14 @@ void wrpkru(unsigned int val);
                                      xcr0_mask(0xe6))
 #define cpu_has_cmpccxadd            cpu_policy.feat.cmpccxadd
 #define cpu_has_avx_ifma            (cpu_policy.feat.avx_ifma && xcr0_mask(6))
+#define cpu_has_movrs                cpu_policy.feat.movrs
 #define cpu_has_avx_vnni_int8       (cpu_policy.feat.avx_vnni_int8 && \
                                      xcr0_mask(6))
 #define cpu_has_avx_ne_convert      (cpu_policy.feat.avx_ne_convert && \
                                      xcr0_mask(6))
 #define cpu_has_avx_vnni_int16      (cpu_policy.feat.avx_vnni_int16 && \
                                      xcr0_mask(6))
+#define cpu_has_avx10               (cpu_policy.feat.avx10 && xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -622,6 +622,8 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
+#define vcpu_has_avx10()       (ctxt->cpuid->feat.avx10)
+
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7930,6 +7930,17 @@ x86_emulate(
         op_bytes = 8 << evex.lr;
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F2(5, 0x6f): /* vmovrs{b,w} mem,[xyz]mm{k} */
+        elem_bytes = 1 << evex.w;
+        fallthrough;
+    case X86EMUL_OPC_EVEX_F3(5, 0x6f): /* vmovrs{d,q} mem,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10);
+        vcpu_must_have(movrs);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_66(5, 0x78): /* vcvttph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */


