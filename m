Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F47606A33E
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fh7cPn6G
Received: from list by lists.xenproject.org with outflank-mailman.1484133.1687496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9yK-0006p0-H5; Wed, 11 Nov 2026 15:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484133.1687496; Wed, 11 Nov 2026 15:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9yK-0006oq-E7; Wed, 11 Nov 2026 15:10:48 +0000
Received: by outflank-mailman (input) for mailman id 1484133;
 Wed, 11 Nov 2026 15:10:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9yJ-0006m1-2L
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:10:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9yI-000GAZ-FM
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:10:46 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48569-8faa-0a2a0a5109dd-0a2a4502a582-22
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:10:46 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48576-6ca4-0a2a45020019-d155802ad903-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:10:46 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so25942415e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:10:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284cce7sm11993149f8f.8.2026.11.11.07.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:10:45 -0800 (PST)
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
        d=suse.com; s=google; t=1794409846; x=1795014646; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dzJPbADYogFb3w8XxJ+lFAn7MrFvbMP/Lu1io/B7vkw=;
        b=Fh7cPn6GqlWj95jxDMJZQyRXYIhsl4jFK+mlmToB/s5z9eMMfEUeBFdXojk38OEREl
         zPGvTj8jzF/2u9XArgMKSHtsjLOGObcqheezmIK0BduXirI2p2Th5cB9++ZsVGmjVRer
         AVx1x7KgA6L8StLbwDpsnZFpmDJxnbKc8HCZrZZx4/qlp8BprFlJl1krOmYRcf6uymzO
         y0djhW28rZBfpZWp1iDEh3yPa6A66A/wQN9fxjUXO8ffhlWKXreVg9JVaxRt4f0DR6Pr
         QewKypp+f2zxF8Oqk/aZmkFcg0AXdJlOaP4r0PABBW6kGmYYvSvrsgFMWArQ8IBMlUxs
         TC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409846; x=1795014646;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dzJPbADYogFb3w8XxJ+lFAn7MrFvbMP/Lu1io/B7vkw=;
        b=ECZOi+FARepE5EgVngMwQiM9sEDd0s0NwDufJVyf+PRHpO4vTjR4im1Vfp4Cl/cXmf
         PFYNFeSzHLSbX9gEKhFMAU9RcXLtA3vI6tBWVDpfJ1qco8OigfP50cGMWBHUNCR0ypym
         2dQNzNZqze5Ab0Kvp/sWZvuWCdGoEBvTTqQQbSObrhCml8rtfAwwD7d63K6cDMWCplXP
         pN+ey2Rw7HZEGVFMAHJIJruzq2BNqgXORm/PTuszztqKmKga4h2ZEfJ+panOZThiVmPR
         W9waHc57k/vziX/6/yLvEkPJgq5iH/txldncgHo1YUH3c7vIfDQ7l8AM8ezbCDwn8+aJ
         cDQQ==
X-Gm-Message-State: APuU4Z+qgfI+CmOLraw4T2MidtWJYyugIMdx0hx510n2Z4odh5tD9+gS
	tAH4gzX536BwqAnwzRbI5t1y9zZgu4julihrgrcCWqduP7yyeCz9fhVHHw09gQzx3MG6o6+kIk9
	rWhkulw==
X-Gm-Gg: AYBFou2KZjR+FCHc3CI8R9RSnsguoWbFiPB+zg3nXETi4yyuojUM0LakokXZZuC80SD
	5dfMXqf8VJDvMvmBx86GN7lzYhpxntnNAQJhD0NhoH4Nr0a4lXCy8q2VplqIBuKemEYod6wbJaC
	rmveOD4dEw0+gKDzOzra/ej0tvkLHFfF4d3KmoppFbceadd0N7vGFCw4vcHwfM860yksYrXiE0h
	+voCg7LrBzkba5nF2EJ7MyIsw115JdcYF0z7vVYqid9CBQQCYsbJFbPT1D4VqcQ5E+WQe0YsK5t
	ZHJZeFd5gcqqUBqPncWomFzbMpqa6LilQ6qKb9sMzr0jKyDwW4vO+ZSNHXrW1hEec5b5a3Lun2E
	rWMGjdLdx6IAjTVoH8hTJ26AosTIjn86hjqexVsgzwLUg5esNXEHzzucDozqczyXMk+wEngF8ZW
	HVd3cMPMbv22oKcFdrDs8TU4psRKXazA40Bmz6320XAuUvjgKeEUxVZx2CuoZKC/XiNGXhi5Mc+
	Q/evAeQFliRNfVsSv8LMEOsH1Wk8Nadxxg1wlxHXmxxmSVyCoaDcl/5Ucg5LYKJnIbpBvnO7HC0
	U+9LnbQdpK8of04St5Gxa6vqo8su1k2MPH6GM8GOkelLed0sQ9Utj+9MIU2h555Ilh6LXy9ldbF
	SNKNW2GVM2S63mFpB
X-Received: by 2002:a05:600c:19d0:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4ba093805dfmr46783115e9.9.1794409845783;
        Wed, 11 Nov 2026 07:10:45 -0800 (PST)
Message-ID: <a8ac1c5d-6de3-4012-a428-8e71bbc871fe@suse.com>
Date: Wed, 11 Nov 2026 16:10:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 10/28] x86emul: support {LD,ST}TILECFG
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
X-purgate-ID: tlsNG-720697/1794409846-F20A82AC-0F1496A9/10/78276251493
X-purgate-type: spam
X-purgate-size: 10414
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While ver 043 of the ISA extensions doc also specifies
xcr0_supports_palette() returning false as one of the #GP(0) reasons for
LDTILECFG, the earlier #UD / #GP conditions look to make this fully
dead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Prevent double read for LDTILECFG. Use X86_EXC_*. Re-base.
v3: Rebase over struct x86_tilecfg introduction.
v2: New.
---
SDE: -spr or -gnr

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1343,6 +1343,8 @@ static const struct vex {
     { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
     { { 0x46 }, 2, T, R, pfx_66, W0, Ln }, /* vpsravd */
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x49, 0x00 }, 2, F, R, pfx_no, W0, L0 }, /* ldtilecfg */
+    { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
     { { 0x50 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuud */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1139,6 +1139,11 @@ int main(int argc, char **argv)
 #ifdef __x86_64__
     unsigned int vendor_native;
     bool nci_ndd_nf;
+    static const struct x86_tilecfg tilecfg = {
+        .palette = 1,
+        .colsb = { 2, 4, 5, 3 },
+        .rows = { 2, 4, 3, 5 },
+    };
 #else
 # define nci_ndd_nf false
     unsigned int bcdres_native, bcdres_emul;
@@ -6040,6 +6045,74 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
 #ifdef __x86_64__
+    printf("%-40s", "Testing tilerelease;sttilecfg 4(%rcx)...");
+    if ( stack_exec && cpu_has_amx_tile )
+    {
+        decl_insn(tilerelease);
+
+        asm volatile ( put_insn(tilerelease,
+                                /* tilerelease */
+                                ".byte 0xC4, 0xE2, 0x78, 0x49, 0xC0;"
+                                /* sttilecfg 4(%0) */
+                                ".byte 0xC4, 0xE2, 0x79, 0x49, 0x41, 0x04")
+                                :: "c" (NULL) );
+
+        memset(res, ~0, 72);
+        set_insn(tilerelease);
+        regs.ecx = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc == X86EMUL_OKAY )
+            rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(tilerelease) ||
+             ~res[0] || ~res[17] || memchr_inv(res + 1, 0, 64) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing ldtilecfg (%rdx)...");
+    if ( stack_exec && cpu_has_amx_tile )
+    {
+        decl_insn(ldtilecfg);
+
+        asm volatile ( put_insn(ldtilecfg,
+                                /* ldtilecfg (%0) */
+                                ".byte 0xC4, 0xE2, 0x78, 0x49, 0x02")
+                                :: "d" (NULL) );
+
+        set_insn(ldtilecfg);
+        regs.edx = (unsigned long)&tilecfg;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(ldtilecfg) )
+            goto fail;
+        printf("pending\n");
+    }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing sttilecfg -4(%rcx)...");
+    if ( stack_exec && cpu_has_amx_tile )
+    {
+        decl_insn(sttilecfg);
+
+        asm volatile ( put_insn(sttilecfg,
+                                /* sttilecfg -4(%0) */
+                                ".byte 0xC4, 0xE2, 0x79, 0x49, 0x41, 0xFC")
+                                :: "c" (NULL) );
+
+        memset(res, ~0, 72);
+        set_insn(sttilecfg);
+        regs.ecx = (unsigned long)(res + 2);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(sttilecfg) ||
+             ~res[0] || ~res[17] || memcmp(res + 1, &tilecfg, 64) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing vzeroupper (compat)...");
     if ( cpu_has_avx )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -83,6 +83,17 @@
 
 #define is_canonical_address(x) (((int64_t)(x) >> 47) == ((int64_t)(x) >> 63))
 
+static inline void *memchr_inv(const void *s, int c, size_t n)
+{
+    const unsigned char *p = s;
+
+    while ( n-- )
+        if ( (unsigned char)c != *p++ )
+            return (void *)(p - 1);
+
+    return NULL;
+}
+
 static inline void *place_ret(void *ptr)
 {
     *(uint8_t *)ptr = 0xc3;
@@ -210,6 +221,9 @@ void wrpkru(unsigned int val);
 #define cpu_has_serialize            cpu_policy.feat.serialize
 #define cpu_has_avx512_fp16         (cpu_policy.feat.avx512_fp16 && \
                                      xcr0_mask(0xe6))
+#define cpu_has_amx_tile            (cpu_policy.feat.amx_tile && \
+                                     xcr0_mask(X86_XCR0_TILE_CFG | \
+                                               X86_XCR0_TILE_DATA))
 #define cpu_has_sha512              (cpu_policy.feat.sha512 && xcr0_mask(6))
 #define cpu_has_sm3                 (cpu_policy.feat.sm3 && xcr0_mask(6))
 #define cpu_has_sm4                 (cpu_policy.feat.sm4 && xcr0_mask(6))
--- a/xen/arch/x86/include/asm/x86-types.h
+++ b/xen/arch/x86/include/asm/x86-types.h
@@ -74,4 +74,14 @@ struct segment_register {
     uint64_t   base;
 };
 
+/*
+ * TILECFG register
+ */
+struct x86_tilecfg {
+    uint8_t palette, start_row;
+    uint8_t res[14];
+    uint16_t colsb[16];
+    uint8_t rows[16];
+};
+
 #endif /* X86_X86_TYPES_H */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1267,6 +1267,10 @@ decode_0f38(struct x86_emulate_state *s,
         s->simd_size = simd_packed_fp;
         break;
 
+    case X86EMUL_OPC_VEX_66(0, 0x49): /* sttilecfg */
+        s->desc = DstMem | SrcImplicit | Mov;
+        break;
+
     case X86EMUL_OPC_EVEX_66(0, 0x7a): /* vpbroadcastb */
     case X86EMUL_OPC_EVEX_66(0, 0x7b): /* vpbroadcastw */
     case X86EMUL_OPC_EVEX_66(0, 0x7c): /* vpbroadcast{d,q} */
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -18,6 +18,7 @@
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
 # include <asm/stubs.h>
+# include <asm/x86-types.h>
 # include <asm/x86-vendors.h>
 # include <asm/x86_emulate.h>
 
@@ -372,6 +373,7 @@ typedef union {
     uint64_t __attribute__ ((aligned(16))) xmm[2];
     uint64_t __attribute__ ((aligned(32))) ymm[4];
     uint64_t __attribute__ ((aligned(64))) zmm[8];
+    struct x86_tilecfg tilecfg;
     uint32_t data32[16];
 } mmval_t;
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -97,6 +97,8 @@ static const uint16_t _3dnow_ext_table[1
 /* Shift values between src and dst sizes of pmov{s,z}x{b,w,d}{w,d,q}. */
 static const uint8_t pmov_convert_delta[] = { 1, 2, 3, 1, 2, 1 };
 
+#define PALETTE_AMX 1
+
 #endif /* !X86EMUL_NO_SIMD */
 
 static const uint8_t sse_prefix[] = { 0x66, 0xf3, 0xf2 };
@@ -6564,7 +6566,79 @@ x86_emulate(
                 goto unrecognized_insn;
             }
         }
-        goto unimplemented_insn;
+
+        switch ( modrm_reg & 7 )
+        {
+        case 0: /* ldtilecfg mem */
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
+            vcpu_must_have(amx_tile);
+            get_fpu(X86EMUL_FPU_tilecfg);
+            rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 64, ctxt);
+            if ( rc != X86EMUL_OKAY )
+                goto done;
+            generate_exception_if((mmvalp->tilecfg.palette >
+                                   cp->tile.max_palette),
+                                  X86_EXC_GP, 0);
+            switch ( mmvalp->tilecfg.palette )
+            {
+            case 0: /* init */
+                break;
+
+            case PALETTE_AMX:
+            {
+                const typeof(cp->tile.palette1) *palette = &cp->tile.palette1;
+
+                generate_exception_if(memchr_inv(mmvalp->tilecfg.res, 0,
+                                                 sizeof(mmvalp->tilecfg.res)),
+                                      X86_EXC_GP, 0);
+
+                /*
+                 * Parameters for valid registers must be within bounds, or
+                 * both be zero at the same time.
+                 */
+                for ( i = 0; i < palette->num_regs; ++i )
+                    generate_exception_if(((mmvalp->tilecfg.colsb[i] >
+                                            palette->bytes_per_row) ||
+                                           (mmvalp->tilecfg.rows[i] >
+                                            palette->max_rows) ||
+                                           (!mmvalp->tilecfg.colsb[i] !=
+                                            !mmvalp->tilecfg.rows[i])),
+                                          X86_EXC_GP, 0);
+
+                /* All remaining entries must be zero. */
+                for ( ; i < 16; ++i )
+                    generate_exception_if((mmvalp->tilecfg.colsb[i] ||
+                                           mmvalp->tilecfg.rows[i]),
+                                          X86_EXC_GP, 0);
+
+                break;
+            }
+
+            default:
+                generate_exception(X86_EXC_GP, 0);
+            }
+
+            op_bytes = 64;
+            /* Fake for the common SIMD code below. */
+            d = (d & ~SrcMask) | SrcMem16;
+            goto simd_0f_common;
+        }
+        goto unrecognized_insn;
+
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x49):
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, X86_EXC_UD);
+        if ( ea.type == OP_REG )
+            goto unrecognized_insn;
+
+        switch ( modrm_reg & 7 )
+        {
+        case 0: /* sttilecfg mem */
+            vcpu_must_have(amx_tile);
+            get_fpu(X86EMUL_FPU_tilecfg);
+            op_bytes = 64;
+            goto simd_0f_common;
+        }
+        goto unrecognized_insn;
 
     case X86EMUL_OPC_VEX   (0x0f38, 0x50): /* vpdpbuud [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0x50): /* vpdpbsud [xy]mm/mem,[xy]mm,[xy]mm */


