Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4AB606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MrrLngMn
Received: from list by lists.xenproject.org with outflank-mailman.1483877.1687244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Jz-0000wt-WD; Wed, 11 Nov 2026 14:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483877.1687244; Wed, 11 Nov 2026 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Jz-0000wk-TH; Wed, 11 Nov 2026 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 1483877;
 Wed, 11 Nov 2026 14:29:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Jy-0000sd-4y
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:29:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Jx-003hG3-9t
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:29:05 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b9c-e002-0a2a0a5209dd-0a2a450bcb06-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:29:05 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47bb0-b7e8-0a2a450b0019-d1558032dd9d-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:29:04 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4b4571ff080so36317975e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:29:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08ddbe68sm105983125e9.0.2026.11.11.06.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:29:03 -0800 (PST)
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
        d=suse.com; s=google; t=1794407344; x=1795012144; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kxwGG1x4f3VPbG+NGTRO4U6fSz2zvB2rcandCXS1HdI=;
        b=MrrLngMnAxeCmmR+710INmi0gyURn68391QyqkBt0l+esKw/8IoBoxlhPzmJKjvN1O
         P9VVxewYXMM8q2m6ym5Ono+hs7nattNP4ZoseHRTfiOwTnxwSRo7ju5KqjVmlaOMspNS
         jBKqT/xrviMv8QrdNbfb2oHR57XJRXoz9orXLeX8o+QpAtRsVtFMz1FtIyxXyOX1lDZB
         HPNXL1U0eXVl/QZaN2UYo/s+1l6hUWt/h4qWZnmAri4sx1bXykJ6KfCJ7sWofX1f1ypJ
         PDsiD2hY2SsbXZrmRSuovHOje2O7GfzwxWlm0qjKhs/CrEk9aGyEP2329Rkla/OQnIht
         7ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407344; x=1795012144;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kxwGG1x4f3VPbG+NGTRO4U6fSz2zvB2rcandCXS1HdI=;
        b=e0z+7FDOFegnMtv8QLSpnHChVplsu51qs6gdCnmCRFXCEAS00Ae2M3PhJJQLwetda+
         0OdIPhfqOwJ7vmMQCr92WVxVVQep+8XkLR9FHDjQUUlre+OZhfi8lLFlDCY/DEwYVL38
         E0MQTPGPSALTInuRlynJTCMplrR4GRqzcnPhSVcxQUdVFjXkzIu7jBLGBsOXawm9zXba
         Wcu1lA+PUUs6qS6SedVOUadi8acQsZhL/0aT+vbaLxAYrZJi8PvQyrzklpQgmyk48MhZ
         ioXvjlkfHo4Rh9vPG99gRyY7kzah0FOnP+DQ5wNpICfL6G0IvIavMI/AmCq9ayZTQm7l
         lBEA==
X-Gm-Message-State: APuU4Z9n8mvbSOzzU3H4RXkm49DK1ZnzE/7/k4kXGwGDQMghOt3BybC/
	PizinU4YXZ/QPfvXHpUESsK3a2abiShmzgdJrieRDsCTKR0zITtcFaPU7CNEW8Tme4vjLgtFDHj
	eFuZh6g==
X-Gm-Gg: AYBFou3PMp9N3/dO7EkAzW2h/jME+qK9hyTvt+Y6UcAOSOGoGeUTCigyKPcxdqKddxQ
	XPtKh8MHLl+FZ62ndJtNeZ+jfgTd2ZtoljWy09mJI1uLsoLzb1uTn4VOtdm++D4cd0y7Y1yzFRj
	uZLl6WGRN1MEpw6mSi1QgtsbgmbRl3/8OJxHCvYm1vCyawbOv7LOkr8jhuf4B0aWoEGjJMXFLXm
	VWkY9crykwADK4m0Q5Km3+drkiFfcYowjFl0IGKRgV3OgvwryTLLhzbt08vb30PsckJ9mdm9vaT
	pFgjqTk/r3qFPF7OY+b3mauLbl1E77xnC4NI5cqmBdJPKxto84XgqzjiOYCTSmFSgtDtEK/Ry6B
	yt2Epn4en2ho0LZ9cjY2L4CybB4gSe4/+6DwrydTXQr3zdQdJ35KkVVlsPQj+8h8TJnBDdvFTSA
	4MvounrOeVv1nr4P4WFgKd2WcMH0CLzJROGUhWdvSYQpVbudDkGpjaiVWUDdF2V4dpOw+wMApWX
	KP4Uj4W+O4C3+A6HG0ZKDrgRm2Pur21rTLEI/VdjhNI5rIcukO9FA7av23vsUI5Y+VhGMUWg5hx
	lNhBpdo3YCQDOAw3ZAul4OsmLWTtR84gZdmZJwA9lUu4YqnM01jihyWPHQ8rttqoeLIwO2YaaFs
	MB02iBNFSem79Qfec
X-Received: by 2002:a05:600c:1549:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ba0938ba0amr46600255e9.23.1794407344212;
        Wed, 11 Nov 2026 06:29:04 -0800 (PST)
Message-ID: <daacdf57-8f0f-4949-89da-720aa6c1c13b@suse.com>
Date: Wed, 11 Nov 2026 15:29:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 21/30] x86emul: support APX+BMI1 insns
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
X-purgate-ID: tlsNG-42698a/1794407344-1B8D19EA-49BBE00A/10/78276251493
X-purgate-type: spam
X-purgate-size: 13473
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Promoted-from-VEX insns are again handled by transforming them to their
VEX counterparts, while the sole promoted-from-legacy insn has respective
logic re-used just like was done for other ones in the same category.
Common EVEX.NF handling takes care of the EFLAGS aspect, except for the
APX-NCI-NDD-NF checking when EVEX.nf is set: For insns in map 2 (0f38) and
subsequently map3 (0f3a), replicating the same logic in decode_0f{38,3a}()
feels undesirable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: In evex-disp8.c's ESZ_dq handling we special-case Map4 to append an
     'l' suffix rather than a 'd' one. If we wanted this to be
     cosmetically correct also for the promoted VEX encodings, further
     special casing would need to happen there. I'm simply uncertain if
     that's worth it.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1126,6 +1126,16 @@ static const struct test avx512f[] = {
 //       kmovw,       ,   0f, 93,           w
 };
 
+static const struct test bmi1[] = {
+    INSN(andn,        , 0f38, f2,    el,   dq, no),
+    INSN(bextr,       , 0f38, f7,    el,   dq, no),
+    INSNX(blsi,       , 0f38, f3, 3, el,   dq, no),
+    INSNX(blsmsk,     , 0f38, f3, 2, el,   dq, no),
+    INSNX(blsr,       , 0f38, f3, 1, el,   dq, no),
+    INSN(tzcnt,       , map4, f4,    el,   dq, no),
+    INSN(tzcntw,    66, map4, f4,    el,    w, no),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1714,6 +1724,7 @@ void evex_disp8_test(void *instr, struct
         RUN(avx512f);
         RUN(avx512dq);
         RUN(avx512bw);
+        RUN(bmi1);
 
 #undef RUN
 
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2066,6 +2066,13 @@ static const struct evex {
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
     { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
+#ifdef __x86_64__
+    { { 0xf2 }, 2, T, R, pfx_no, Wn, L0 }, /* andn */
+    { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
+    { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
+    { { 0xf3, 0x18 }, 2, T, R, pfx_no, Wn, L0 }, /* blsi */
+    { { 0xf7 }, 2, T, R, pfx_no, Wn, L0 }, /* bextr */
+#endif
 }, evex_0f3a[] = {
     { { 0x00 }, 3, T, R, pfx_66, W1, L1|L2 }, /* vpermq */
     { { 0x01 }, 3, T, R, pfx_66, W1, L1|L2 }, /* vpermpd */
@@ -2339,6 +2346,8 @@ static const struct evex {
     { { 0xf0 }, 2, T, R, pfx_no, Wn, L0 }, /* crc32 */
     { { 0xf1 }, 2, T, R, pfx_no, Wn, L0 }, /* crc32 */
     { { 0xf1 }, 2, T, R, pfx_66, Wn, L0 }, /* crc32 */
+    { { 0xf4 }, 2, T, R, pfx_no, Wn, L0 }, /* tzcnt */
+    { { 0xf4 }, 2, T, R, pfx_66, Wn, L0 }, /* tzcnt */
     { { 0xf6, 0x00 }, 3, T, R, pfx_no, WIG, L0, SCC }, /* ctest<scc> */
     { { 0xf6, 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* not */
     { { 0xf6, 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* neg */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2687,6 +2687,30 @@ int main(int argc, char **argv)
              (regs.eflags & 0xfeb) != 0x202 || !check_eip(andn) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(andn_apx);
+
+            printf("%-40s", "Testing andn (%rdx),%r17d,%r19d...");
+
+            asm volatile ( put_insn(andn_apx, "andn (%0), %%r17d, %%r19d")
+                           :: "d" (NULL) );
+            set_insn(andn_apx);
+
+            load_egpr(17, 0xcccc3333);
+            regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF, CF);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || !check_egpr(19, 0x32108888) ||
+                 !check_egpr(17, 0xcccc3333) || *res != 0xfedcba98 ||
+                 (regs.eflags & EFLAGS_MASK) != EFLAGS_ALWAYS_SET ||
+                 !check_eip(andn_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -2731,6 +2755,34 @@ int main(int argc, char **argv)
              (regs.eflags & 0xf6b) != 0x202 || !check_eip(bextr64) )
             goto fail;
         printf("okay\n");
+
+# if defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(bextr_apx);
+
+            printf("%-40s", "Testing bextr %r25,(%r26),%r27...");
+
+            asm volatile ( put_insn(bextr_apx, "bextr %r25, (%r26), %r27") );
+            set_insn(bextr_apx);
+
+            load_egpr(26, (unsigned long)res);
+            regs.r10    = 0;
+            load_egpr(25, 0x211e);
+            regs.r9     = 0;
+            regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, ZF, CF);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || !check_egpr(25, 0x211e) ||
+                 !check_egpr(27,
+                             (((unsigned long)(res[1] << 1) << 1) |
+                              (res[0] >> 30))) ||
+                 ((regs.eflags & EFLAGS_MASK & ~X86_EFLAGS(AF, PF)) !=
+                  EFLAGS_ALWAYS_SET) ||
+                 !check_eip(bextr_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+# endif
 #endif
     }
     else
@@ -2755,6 +2807,29 @@ int main(int argc, char **argv)
              !check_eip(blsi) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(blsi_apx);
+
+            printf("%-40s", "Testing blsi (%rdx),%r25d...");
+
+            asm volatile ( put_insn(blsi_apx, "blsi (%0), %%r25d")
+                           :: "d" (NULL) );
+            set_insn(blsi_apx);
+
+            regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || !check_egpr(25, 8) ||
+                 (regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(AF, PF))) !=
+                  (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF) ||
+                 !check_eip(blsi_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -2776,6 +2851,29 @@ int main(int argc, char **argv)
              !check_eip(blsmsk) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(blsmsk_apx);
+
+            printf("%-40s", "Testing blsmsk (%rdx),%r17d...");
+
+            asm volatile ( put_insn(blsmsk_apx, "blsmsk (%0), %%r17d")
+                           :: "d" (NULL) );
+            set_insn(blsmsk_apx);
+
+            regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF, CF);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || !check_egpr(17, 0xf) ||
+                 (regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(AF, PF))) !=
+                  EFLAGS_ALWAYS_SET ||
+                 !check_eip(blsmsk_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -2820,6 +2918,34 @@ int main(int argc, char **argv)
 #endif
 
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( true /* cpu_has_apx_nci_ndd_nf */ )
+        {
+            decl_insn(blsr_apx);
+
+            cpu_policy.apx.apx_nci_ndd_nf = true;
+
+            printf("%-40s", "Testing {nf}blsr (%rdx),%ecx...");
+
+            asm volatile ( put_insn(blsr_apx, "%{nf%} blsr (%0), %%ecx")
+                           :: "d" (NULL) );
+            set_insn(blsr_apx);
+
+            regs.rcx = 0;
+            regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF, CF);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || regs.rcx != 0xfedcba90 ||
+                 (regs.eflags !=
+                  (EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF, CF))) ||
+                 !check_eip(blsr_apx) )
+                goto fail;
+            printf("okay\n");
+
+            cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
+        }
+#endif
     }
     else
         printf("skipped\n");
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -788,6 +788,10 @@ static const struct map4_table {
         [vex_np] = { },
         [vex_66] = { },
     },
+    [0xf4] = { /* TZCNT ({,d,q}word) */
+        [vex_np] = { .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nf = true, .nci_ndd_nf = true },
+    },
     [0xf6] = { /* Grp3 (byte); most attributes depend on modrm_reg */
         [vex_np] = { .byte = true, .nci_ndd_nf = true },
     },
@@ -1263,6 +1267,12 @@ decode_0f38(struct x86_emulate_state *s,
     case X86EMUL_OPC_VEX_F2(0, 0xf7): /* shrx */
         break;
 
+    case X86EMUL_OPC_EVEX(0, 0xf2):    /* andn */
+    case X86EMUL_OPC_EVEX(0, 0xf3):    /* Grp 17 */
+    case X86EMUL_OPC_EVEX(0, 0xf7):    /* bextr */
+        s->promoted_evex = true;
+        break;
+
     case 0xf8:
         if ( s->modrm_mod == 3 ) /* u{rd,wr}msr */
         {
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5694,8 +5694,12 @@ x86_emulate(
             emulate_2op_SrcV_nobyte("btc", src, dst, _regs.eflags);
         break;
 
+    case X86EMUL_OPC_EVEX   (4, 0xf4): /* tzcnt r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0xf4): /* tzcnt r/m,r16 */
+        vcpu_must_have(bmi1);
+        fallthrough;
     case X86EMUL_OPC(0x0f, 0xbc): /* bsf or tzcnt */
-        if ( vex.pfx == vex_f3 )
+        if ( vex.pfx == vex_f3 || state->promoted_evex )
             emulate_2op_SrcV_srcmem("tzcnt", src, dst, _regs.eflags);
         else
         {
@@ -7386,6 +7390,12 @@ x86_emulate(
         }
         break;
 
+    case X86EMUL_OPC_EVEX(0x0f38, 0xf2):    /* andn r/m,r,r */
+    case X86EMUL_OPC_EVEX(0x0f38, 0xf7):    /* bextr r,r/m,r */
+        generate_exception_if((evex.z || evex.lr || evex.brs ||
+                               (evex.opmsk & 3)),
+                              X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX(0x0f38, 0xf2):    /* andn r/m,r,r */
     case X86EMUL_OPC_VEX(0x0f38, 0xf5):    /* bzhi r,r/m,r */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0xf5): /* pext r/m,r,r */
@@ -7411,17 +7421,30 @@ x86_emulate(
         if ( !mode_64bit() )
             pvex->w = 0;
         pvex->reg = 0xf; /* rAX */
+        if ( state->promoted_evex )
+        {
+            /* See copy_VEX(). */
+            pvex->opcx &= 7;
+            src.reg = decode_evex_gpr(evex.reg | (evex.RX << 4), &_regs,
+                                      &state->egpr, ctxt);
+        }
+        else
+            src.reg = decode_vex_gpr(vex.reg, &_regs, ctxt);
         buf[3] = b;
         buf[4] = 0x09; /* reg=rCX r/m=(%rCX) */
         place_ret(&buf[5]);
 
-        src.reg = decode_vex_gpr(vex.reg, &_regs, ctxt);
         emulate_stub([dst] "=&c" (dst.val), "[dst]" (&src.val), "a" (*src.reg));
 
         put_stub(stub);
         break;
     }
 
+    case X86EMUL_OPC_EVEX(0x0f38, 0xf3): /* Grp 17 */
+        generate_exception_if((evex.z || evex.lr || evex.brs ||
+                               (evex.opmsk & 3)),
+                              X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX(0x0f38, 0xf3): /* Grp 17 */
     {
         uint8_t *buf = get_stub(stub);
@@ -7447,11 +7470,19 @@ x86_emulate(
         if ( !mode_64bit() )
             pvex->w = 0;
         pvex->reg = 0xf; /* rAX */
+        if ( state->promoted_evex )
+        {
+            /* See copy_VEX(). */
+            pvex->opcx &= 7;
+            dst.reg = decode_evex_gpr(evex.reg | (evex.RX << 4), &_regs,
+                                      &state->egpr, ctxt);
+        }
+        else
+            dst.reg = decode_vex_gpr(vex.reg, &_regs, ctxt);
         buf[3] = b;
         buf[4] = (modrm & 0x38) | 0x01; /* r/m=(%rCX) */
         place_ret(&buf[5]);
 
-        dst.reg = decode_vex_gpr(vex.reg, &_regs, ctxt);
         emulate_stub("=&a" (dst.val), "c" (&src.val));
 
         put_stub(stub);
@@ -8976,6 +9007,14 @@ x86_emulate(
 
         if ( state->promoted_evex )
         {
+            /*
+             * This, while seemingly inapplicable to SCC insns, is simply
+             * benign there: They require the feature irrespective of the
+             * setting of what elsewhere is EVEX.nf.
+             */
+            if ( EVEX_NF(&evex) )
+                vcpu_must_have(apx_nci_ndd_nf);
+
             place_ret(&opc[insn_bytes - PFX_BYTES]);
             copy_VEX(opc, vex, true);
         }


