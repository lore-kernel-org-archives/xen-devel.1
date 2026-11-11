Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9902606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dcfVWJfH
Received: from list by lists.xenproject.org with outflank-mailman.1484196.1687568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA1Z-0002DF-KU; Wed, 11 Nov 2026 15:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484196.1687568; Wed, 11 Nov 2026 15:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA1Z-0002D8-Hh; Wed, 11 Nov 2026 15:14:09 +0000
Received: by outflank-mailman (input) for mailman id 1484196;
 Wed, 11 Nov 2026 15:14:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA1Y-0002BP-PL
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:14:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA1Y-000tRG-63
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:14:08 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4863a-bab6-0a2a0a5309dd-0a2a4504c766-20
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:14:08 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48640-b57f-0a2a45040019-d1558033e5cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:14:08 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso22706035e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:14:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c53bb94sm2739395e9.8.2026.11.11.07.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:14:07 -0800 (PST)
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
        d=suse.com; s=google; t=1794410047; x=1795014847; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CUUqRQSpSZww2cjd6JhQCa73uM9Ng9SLE6uCqG7a0xU=;
        b=dcfVWJfH3lKEfVdw8O93bTBX9Ij2Chwf+nsppPxZ4N+QoQqbX4lZJmsUd58srAdL/w
         N6/GJZvWgRbTMf5/cVfSJPCoBm2pRirUGvAYg0clKdZKlr05AsemDF98bhpm7PHF3B7+
         SCm2ZdGBnYahkhOj54nxceRSzRgpTUDZ3ZZmzVOwr/WJcWw2EmJ9reoHF42iZy704c0O
         9dCQCLqjS/i3PZDZC4PUCBw7/W8D8zTf3YnVT7HYXkTM/ZB7QdrROa9XGyYzu6UM7s4W
         s+w8Zvj/PrnfkegaoSXpDEjpAwvwiVEfkHVQq5yyuohyKh7HDa4YaqIPTjdGYd+gYk5m
         1rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410047; x=1795014847;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CUUqRQSpSZww2cjd6JhQCa73uM9Ng9SLE6uCqG7a0xU=;
        b=ixCca5vitQ7hYpS8ApJN+XRw3zqgdA2ZQdMZSZEO/8t2FNmvKpyXsxJpJvCTP18+iS
         4ESZ1lClOcwIlrTihFSJG0yVQSYQ0WmEQQkVReiSdnW0RjZ3eYSnJGJ99QPKQuV/EDC8
         XKDS1K2kRIqbANmAtC9QADAbSF1lob8LQscKj++ucDYHkYUjtXYOR9y2vI/JaXAKv/Tx
         +fGMgBvPZnTO+EnrzaLJRplXD3vZM+D2Li5YyZtllR+5z9UzoUQ6Yyep/D/L32BRC1y5
         QwAHz7ZomWatSakK9rYEASYzst469wPZ001MAi7T+8+JJ2jLiOn7gUYZaPNLIIbwUlz0
         QhkA==
X-Gm-Message-State: APuU4Z+SxwXSEapjzwb+sWUIgxV8tsBliq6KF8f3HA/JiR8M41m8/F39
	ipj2YsM+h6BPI8nH5zln3eInljywzkFnqP4NKnU2hmiqf7u+KK2TOv3ZA+SaL0Hkp2lek9glz0I
	v6duX+g==
X-Gm-Gg: AYBFou1ymimt27ierWt6jB3wmccAUJAZO1oOahZBe1B2wl8BrE/OZ6odi7R+mHbhofn
	qjL/pO8U2yFTpeXos/xl56I+9JdgGxkKSg5UzQfTXUn9A3FwQwLHZan7dN+aArvbI1shZc8Yx/z
	qA6PSLbdMmPhDSKHprs7jfUmr16a3WbZExIRLHdnpyOxdynwYjjt+mWTcCs3WVj7uz6IEF5S2jJ
	o1J7U1fc+38cdNTTqxuxnDFwm7QO/nlzzv35DpAIP94t3t06PvobaDxUvveXgIl/REpJekKhE1O
	ZfxxwJ1So5ihCanLqrwn11s9tvoeu+9U+U29/1NhMesbNiAa2iI0VMVBBVJ+L0Iu+92IP0DXHa/
	bpJg1ZWwc2LtXk/wteuvDiaVlcoY+rY41VgqLfAehM8LKMmg8B7P6vx0AzW1z+ISj3ptguf+gY3
	BRu99JKX6ZZJREBGQCBQ/GW3uVcIhGN2BHeEEouqU/8t1l/exlN1kjjTXTQJDVBPnt8SAgPjF5D
	ItYxuF5NGcCD0NRn/vaQ5bQjVlwzs6Komr68eksEzO0kNF0X++zGEKLPuVvwWq5nidPCy/PoIW9
	KmDuZkc+004vRkTbb6jKkBFikhuKdIiNwJA5j7kVrwgWvFhMnhHb3uxAJT74v+pcIU0W/CEqicb
	KC1IXad3wZ8askRVR
X-Received: by 2002:a05:600c:a318:b0:4ba:c14a:300d with SMTP id 5b1f17b1804b1-4bac14a3b41mr30200965e9.19.1794410047523;
        Wed, 11 Nov 2026 07:14:07 -0800 (PST)
Message-ID: <c8b77f58-588a-4b2f-9e74-3300aa846dc1@suse.com>
Date: Wed, 11 Nov 2026 16:14:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 17/28] x86emul: support APX forms of
 TILE{LOADD{,T1},STORED}
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
X-purgate-ID: tlsNG-ebf023/1794410048-C16D2B50-6BA73710/10/78276251493
X-purgate-type: spam
X-purgate-size: 6241
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While, like elsewhere, pre-existing code can largely be re-used, EVEX
Disp8 testing requires some special care: .

Note that the calculation of ->sib_index can be left as is, as long as
all SIBMEM insns don't use EVEX.vvvv (and hence EVEX.V4 is required to
be set).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: How to reasonably test AMX+APX isn't entirely clear yet. Simply
     re-compiling matrix.c with -mapfx is unlikely to produce good uses
     of eGPR-s. Yet fiddling with intermediate assembly isn't quite
     nice either, and even then there's no guarantee that we'd end up
     with any useful uses of eGPR-s.
---
v4: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1196,6 +1196,10 @@ static const struct test amx_tile[] = {
     /* Element size is set arbitrarily here. See test_one(). */
     INSN(ldtilecfg,     , 0f38, 49, el, b, no),
     INSN(sttilecfg,   66, 0f38, 49, el, b, no),
+    /* Element size assumes a 1x1 matrix here. See test_one(). */
+    INSN(tileloadd,   f2, 0f38, 4b, el, d, no),
+    INSN(tileloaddt1, 66, 0f38, 4b, el, d, no),
+    INSN(tilestored,  f3, 0f38, 4b, el, d, no),
 };
 
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
@@ -1316,6 +1320,7 @@ static void test_one(const struct test *
     int rc;
     bool sg = strstr(test->mnemonic, "gather") ||
               strstr(test->mnemonic, "scatter");
+    bool tile = false;
     unsigned int imm = test->spc == SPC_0f3a ||
                        (test->spc == SPC_0f &&
                         (imm0f[test->opc >> 4] & (1 << (test->opc & 0xf))));
@@ -1437,8 +1442,8 @@ static void test_one(const struct test *
     }
 
     /*
-     * Note: SIB addressing is used here, such that S/G insns can be handled
-     * without extra conditionals.
+     * Note: SIB addressing is used here, such that S/G and SIBMEM insns can
+     * be handled without extra conditionals.
      */
     instr[0] = 0x62;
  again:
@@ -1465,6 +1470,24 @@ static void test_one(const struct test *
          */
         if ( test->spc == SPC_0f38 && test->opc == 0x49 )
             vsz = 64;
+
+        /*
+         * Tile loads/stores require a valid tile configuration. Set up a 1x1
+         * tile for %tmm0.
+         */
+        if ( test->spc == SPC_0f38 && test->opc == 0x4b )
+        {
+            static const struct x86_tilecfg tilecfg = {
+                .palette = 1,
+                .colsb[0] = 4,
+                .rows[0] = 1,
+            };
+
+            /* ldtilecfg (%rax) */
+            asm volatile ( ".byte 0xc4, 0xe2, 0x78, 0x49, 0x00"
+                           :: "a" (&tilecfg), "m" (tilecfg) );
+            tile = true;
+        }
     }
     else
     {
@@ -1554,7 +1577,12 @@ static void test_one(const struct test *
          */
         if ( test->spc != SPC_map4 || (test->opc | 0xf) != 0x4f ||
              test->pfx > PFX_66 || (evex.bcst && evex.opmsk) )
+        {
+            /* Issue TILERELEASE if we fiddled with tiles. */
+            if ( tile )
+                asm volatile ( ".byte 0xc4, 0xe2, 0x78, 0x49, 0xc0" );
             return;
+        }
 
         evex.bcst = !evex.bcst;
         if ( !evex.bcst )
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1939,6 +1939,9 @@ static const struct evex {
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
     { { 0x49, 0x00 }, 2, F, R, pfx_no, W0, L0 }, /* ldtilecfg */
     { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
+    { { 0x4b, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddt1 */
+    { { 0x4b, VSIB(0) }, 3, F, W, pfx_f3, W0, L0 }, /* tilestored */
+    { { 0x4b, VSIB(0) }, 3, F, R, pfx_f2, W0, L0 }, /* tileloadd */
     { { 0x4c }, 2, T, R, pfx_66, Wn, Ln }, /* vrcp14p{s,d} */
     { { 0x4d }, 2, T, R, pfx_66, Wn, LIG }, /* vrcp14s{s,d} */
     { { 0x4e }, 2, T, R, pfx_66, Wn, Ln }, /* vrsqrt14p{s,d} */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1272,6 +1272,7 @@ decode_0f38(struct x86_emulate_state *s,
         break;
 
     case X86EMUL_OPC_EVEX_66(0, 0x49): /* sttilecfg */
+    case X86EMUL_OPC_EVEX_F3(0, 0x4b): /* tilestored */
         s->promoted_evex = true;
         fallthrough;
     case X86EMUL_OPC_VEX_66(0, 0x49): /* sttilecfg */
@@ -1312,6 +1313,8 @@ decode_0f38(struct x86_emulate_state *s,
         break;
 
     case X86EMUL_OPC_EVEX(0, 0x49):    /* ldtilecfg */
+    case X86EMUL_OPC_EVEX_66(0, 0x4b): /* tileloaddt1 */
+    case X86EMUL_OPC_EVEX_F2(0, 0x4b): /* tileloadd */
     case X86EMUL_OPC_EVEX_66(0, 0xe0) ...
          X86EMUL_OPC_EVEX_66(0, 0xef): /* cmp<cc>xadd */
     case X86EMUL_OPC_EVEX(0, 0xf2):    /* andn */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6771,6 +6771,12 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0x4b): /* tileloaddt1 mem,tmm */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x4b): /* tilestored tmm,mem */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x4b): /* tileloadd mem,tmm */
+        generate_exception_if(evex.lr || evex.brs || evex.opmsk || !evex.RX,
+                              X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX_66(0x0f38, 0x4b): /* tileloaddt1 mem,tmm */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0x4b): /* tilestored tmm,mem */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0x4b): /* tileloadd mem,tmm */
@@ -6795,7 +6801,7 @@ x86_emulate(
 
         /* Calculate stride. */
         if ( state->sib_index != 4 )
-            ea.val = truncate_ea(*decode_gpr(ctxt->regs, NULL,
+            ea.val = truncate_ea(*decode_gpr(ctxt->regs, &state->egpr,
                                              state->sib_index) <<
                                  state->sib_scale);
 
@@ -6847,7 +6853,7 @@ x86_emulate(
         opc[1] = modrm & 0x3f;
         opc[2] = 0x20;
         place_ret(&opc[3]);
-        copy_VEX(opc, vex, false);
+        copy_VEX(opc, vex, state->promoted_evex);
 
         do {
             if ( row >= n )


