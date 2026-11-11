Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C621606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ENbf3AZN
Received: from list by lists.xenproject.org with outflank-mailman.1483855.1687217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Iq-0007MO-18; Wed, 11 Nov 2026 14:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483855.1687217; Wed, 11 Nov 2026 14:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Ip-0007Lb-U7; Wed, 11 Nov 2026 14:27:55 +0000
Received: by outflank-mailman (input) for mailman id 1483855;
 Wed, 11 Nov 2026 14:27:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Ip-0007Hg-Ay
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:27:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Io-00GNlh-O4
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:27:54 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b51-e002-0a2a0a5209dd-0a2a4506c582-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:27:54 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b6a-195a-0a2a45060019-d155802ba893-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:27:54 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a5720b0a57so19286565e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:27:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c4feee1sm603645e9.4.2026.11.11.06.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:27:51 -0800 (PST)
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
        d=suse.com; s=google; t=1794407274; x=1795012074; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OmYsiybOyyYsIjPhXyBvF6MN5GFnxEZ+4UhwnIgNzOA=;
        b=ENbf3AZN9fZt3f6PeW/uo7YKfarufCSnmlffGTFCj5fcG7llvT7IEaRl0ObTiVNc4O
         nGIQrQMz6ol1/z8lSeMK3jR9PJ0mYQKh5fxsNTI0mDZhlqPKzbkBn7NLV2KtG5LIQjUY
         9BvqTloGMm8wWccEoHB+jLnwSPPcRfLaQ+CTz8fgT3xydqsv8LSHogvd25Vyc3flFZ/6
         /EjToXHjQgjERf5aH04dL3qD1s1Hf08pkBnE4kYPqH/IyKQUNVRLjo20Md87+KFac4yd
         lpDDvTBDN8UuKbCFkbBv60HaUFsKKyzEQBoYbosGTauyTdchqfP6NBa8+ah2Q7a+d38u
         NkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407274; x=1795012074;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OmYsiybOyyYsIjPhXyBvF6MN5GFnxEZ+4UhwnIgNzOA=;
        b=OMnGQEXIRh4sQMfwQcVL1EIWsNkQAiVO81ZQkXJft3KPe4vbjkZppVWyIj67/E4+5P
         +/kbtdk6r7QsMeUIrlTEFQTAjP1Fmyv2nagpDe78qiLLUGz1aUdOXMTqonvnjKOasJRf
         ZiKMIt3XycXO+Grj2Er7pj1/p5FrYhRzAGreMqtyRTkx8+lMX/1HAApZR6GFieK5wRKz
         VRnnQFxXKL87ettN8qsrcppLlGXInPjV92U/KGCEB7k+hRYg80uBc5S4goTOpq9fyqMb
         1GNMwTj3aHQ65ZPaVbOCWh+kM4UelPF8BKR3nWJBZne0W78Y7C3OhbFF7OLHEQXd4jhX
         mKfA==
X-Gm-Message-State: APuU4Z+vrNjJaSkT2I8gE/E1UkzMipVfiK24UhbImLVBWk9CnIsEMTJ9
	c1vkbyTSUgULHHjxbSKyezEU8ZOOftqLPEe5QOJSU2M3WeyiCFncgZGIcvYj2oSf9JPGLrhhBhU
	tQR0Yhg==
X-Gm-Gg: AYBFou0D4cjWxfvE6Sc0RrPo5pvCkt17DQ49faUJS8Snqxe5inWjt0BrtZIUxBY2HEv
	iAqOrcnldZNA5q7p+lWfaGKWYvAR+s/CUxUBvG1XNoicThejc3kzl+wV753Tx9k2Pf3N9Hlsmxi
	gO9DTjBfk/7380EhTmYIuOL532mM1wBO/a8f40fX9tBUzSxS0TAC/YXb6o89HWavAianDYwFe+F
	tN2xUfD+LTTmntMYNnObZzgiXyweIQOExaNNFus8bhexg24BKdlCHXiN9PcOTymZyVZEhCFHRS+
	YxZ//hyiz8KhmDwqDEDiNkp8Id6uA7YnS+bBatA4iPtN2YPPDZjqHIcujWvGz2WBgHWG/xc2iTv
	mV1ucRiqK2cX9WazkLnwBz3Q90FS2Pd5bcUKvuJDmFNRQsd0DzcTpPv46mLTYfGzV9BqKkVmCPY
	oZQXAagTv6nXZTglQQCHVpqecDi/J2yfRq66IQ1fJZOa7Wk3Z2aXN3KKzVlNf+8Z2Oh+i706T4+
	jBEai2/FJSIs2KVfqD0OZX10uzO5qaOkhHTYOMBgsi6QkA0DzxF7t09E8BATbaapgD7K26uELN1
	T8CnPP4MyOx2uRcCSi8aSlfFspzEFIXGurnIXp6fZlpJfRmZ7dzi62SzA25t5syVAOQERdVlAwS
	AXJRUbTHA3ezxbILONg==
X-Received: by 2002:a05:600c:608e:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4ba093805a8mr47067155e9.15.1794407274127;
        Wed, 11 Nov 2026 06:27:54 -0800 (PST)
Message-ID: <6912559b-eae7-4392-a10d-f14f42d900d7@suse.com>
Date: Wed, 11 Nov 2026 15:27:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 18/30] x86emul: support APX+ADX insns
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
X-purgate-ID: tlsNG-16d1c6/1794407274-FEE7677B-7AAEB84E/10/78276251493
X-purgate-type: spam
X-purgate-size: 7934
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

They're straight counterparts, just encoded differently.

While extending the test harness also replace the numeric literals by
more readable expressions involving #define-s we have available now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1098,6 +1098,11 @@ static const struct test apx_nci[] = {
 
 #undef CONDS
 
+static const struct test adx[] = {
+    INSN(adcx,      66, map4, 66,    el,   dq, no),
+    INSN(adox,      f3, map4, 66,    el,   dq, no),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1662,6 +1667,20 @@ void evex_disp8_test(void *instr, struct
                    vl_128, ARRAY_SIZE(vl_128), instr, ctxt);
         printf("okay\n");
 
+#define RUN(feat) do { \
+        if ( cpu_has_ ## feat ) \
+        { \
+            printf("%-40s", "Testing APX-F+" #feat " disp8 handling..."); \
+            test_group(feat, ARRAY_SIZE(feat), \
+                       vl_128, ARRAY_SIZE(vl_128), instr, ctxt); \
+            printf("okay\n"); \
+        } \
+    } while ( false )
+
+        RUN(adx);
+
+#undef RUN
+
         cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
         ctxt->force_writeback = wb;
     }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2187,6 +2187,8 @@ static const struct evex {
     CND(0x40,   2, T, R, pfx_no, Wn, L0, ND ), /* {,cf}cmov<cc> */ \
     CND(0x40,   2, T, R, pfx_66, Wn, L0, ND ), /* {,cf}cmov<cc> */ \
     CND(0x40,   2, T, W, pfx_f2, WIG, L0 ), /* set<cc> */
+    { { 0x66 }, 2, T, R, pfx_66, Wn, L0 }, /* adcx */
+    { { 0x66 }, 2, T, R, pfx_f3, Wn, L0 }, /* adox */
     { { 0x69 }, 6, T, R, pfx_no, Wn, L0 }, /* imul */
     { { 0x69 }, 4, T, R, pfx_66, W0, L0 }, /* imul */
     { { 0x69 }, 6, T, R, pfx_66, W1, L0 }, /* imul */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2999,7 +2999,7 @@ int main(int argc, char **argv)
                          "[dst1]" (0), "[dst2]" (0) );
 
         set_insn(adx);
-        regs.eflags = 0x2d6;
+        regs.eflags = EFLAGS_MASK & ~X86_EFLAGS(CF, OF);
         of = cf = i = 0;
         while ( (rc = x86_emulate(&ctxt, &emulops)) == X86EMUL_OKAY )
         {
@@ -3011,9 +3011,9 @@ int main(int argc, char **argv)
              */
             if ( i < ARRAY_SIZE(data) * 2 && !(i % 4) )
             {
-                if ( regs.eflags & 0x001 )
+                if ( regs.eflags & X86_EFLAGS_CF )
                    ++cf;
-                if ( regs.eflags & 0x800 )
+                if ( regs.eflags & X86_EFLAGS_OF )
                    ++of;
             }
             if ( !valid_eip(adx) )
@@ -3022,9 +3022,69 @@ int main(int argc, char **argv)
         if ( (rc != X86EMUL_OKAY) ||
              i != ARRAY_SIZE(data) * 4 + 2 || cf != 1 || of != 5 ||
              regs.eax != 0xffffffff || regs.ecx || regs.edx != 0xffffffff ||
-             !check_eip(adx) || regs.eflags != 0x2d6 )
+             !check_eip(adx) ||
+             regs.eflags != (EFLAGS_MASK & ~X86_EFLAGS(CF, OF)) )
             goto fail;
         printf("okay\n");
+
+#ifdef __x86_64__
+        if ( cpu_has_apx_nci_ndd_nf )
+        {
+            /* Same data, but using eGPR-s. */
+            decl_insn(adx_apx);
+
+            printf("%-40s", "Testing APX adcx/adox ...");
+            asm volatile ( put_insn(adx_apx,
+                                    ".Lloop%=:\n\t"
+                                    /* mov %[cnt], %r18 */
+                                    ".byte 0xd5, 0x18, 0x89, 0xca\n\t"
+                                    /* adcx (%[addr]), %r30d */
+                                    ".byte 0x62, 0x64, 0x7d, 0x08, 0x66, 0x36\n\t"
+                                    /* adox -%c[full]-%c[elem](%[addr],%r18,2*%c[elem]), %k[dst2] */
+                                    ".byte 0x62, 0xf4, 0x7a, 0x08, 0x66\n\t"
+                                    ".byte 0x54, 0xd6, -%c[full]-%c[elem]\n\t"
+                                    "lea %c[elem](%[addr]),%[addr]\n\t"
+                                    "loop .Lloop%=\n\t"
+                                    /* adcx %[cnt], %r30d, %eax */
+                                    ".byte 0x62, 0x64, 0x7d, 0x18, 0x66, 0xf1\n\t"
+                                    /* adox %[cnt], %k[dst2], %r17d */
+                                    ".byte 0x62, 0xf4, 0x76, 0x10, 0x66, 0xd1\n\t")
+                           : [addr] "=S" (regs.esi), [dst2] "=d" (regs.edx),
+                             [cnt] "=c" (regs.ecx)
+                           : [full] "i" (sizeof(data)), [elem] "i" (sizeof(*data)),
+                             "[addr]" (data), "[cnt]" (ARRAY_SIZE(data)),
+                             "[dst2]" (0) );
+
+            set_insn(adx_apx);
+            load_egpr(30, 0);
+            of = cf = i = 0;
+            while ( (rc = x86_emulate(&ctxt, &emulops)) == X86EMUL_OKAY )
+            {
+                ++i;
+                /* See comment above. */
+                if ( i < ARRAY_SIZE(data) * 2 + ARRAY_SIZE(data) / 2 &&
+                     !(i % 5) )
+                {
+                    if ( regs.eflags & X86_EFLAGS_CF )
+                       ++cf;
+                    if ( regs.eflags & X86_EFLAGS_OF )
+                       ++of;
+                }
+                if ( !valid_eip(adx_apx) )
+                    break;
+            }
+            if ( (rc != X86EMUL_OKAY) ||
+                 i != ARRAY_SIZE(data) * 5 + 2 || cf != 1 || of != 5 ||
+                 !check_eip(adx_apx) ||
+                 regs.rax != 0xffffffffU || regs.rcx ||
+                 regs.rdx != 0xffffffffU ||
+                 !check_egpr(17, 0xffffffffU) || !check_egpr(18, 1) ||
+                 !check_egpr(30, 0xffffffffU) ||
+                 regs.eflags != (EFLAGS_MASK & ~X86_EFLAGS(CF, OF)) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
 
     printf("%-40s", "Testing bextr $0x0a03,(%ecx),%ebx...");
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -180,6 +180,7 @@ void wrpkru(unsigned int val);
                                      xcr0_mask(0xe6))
 #define cpu_has_avx512dq            (cpu_policy.feat.avx512dq && \
                                      xcr0_mask(0xe6))
+#define cpu_has_adx                  cpu_policy.feat.adx
 #define cpu_has_avx512_ifma         (cpu_policy.feat.avx512_ifma && \
                                      xcr0_mask(0xe6))
 #define cpu_has_avx512cd            (cpu_policy.feat.avx512cd && \
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -691,6 +691,10 @@ static const struct map4_table {
         [vex_f2] = { .to_mem = true, .byte = true, .nd = true,
                      .nci_ndd_nf = true },
     },
+    [0x66] = {
+        [vex_66] = { .nd = true }, /* ADCX */
+        [vex_f3] = { .nd = true }, /* ADOX */
+    },
     [0x69] = { /* IMUL */
         [vex_np] = { .immW = true, .nd = true, .nf = true,
                      .nci_ndd_nf = true },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7433,6 +7433,8 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f38, 0xf6): /* adcx r/m,r */
     case X86EMUL_OPC_F3(0x0f38, 0xf6): /* adox r/m,r */
+    case X86EMUL_OPC_EVEX_66(4, 0x66): /* adcx r/m,r{,r} */
+    case X86EMUL_OPC_EVEX_F3(4, 0x66): /* adox r/m,r{,r} */
     {
         unsigned int mask = rep_prefix() ? X86_EFLAGS_OF : X86_EFLAGS_CF;
         unsigned int aux = _regs.eflags & mask ? ~0 : 0;


