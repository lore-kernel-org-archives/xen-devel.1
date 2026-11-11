Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEE2606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aWSVXz//
Received: from list by lists.xenproject.org with outflank-mailman.1484146.1687505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9zK-0007VV-Tj; Wed, 11 Nov 2026 15:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484146.1687505; Wed, 11 Nov 2026 15:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9zK-0007VO-Qv; Wed, 11 Nov 2026 15:11:50 +0000
Received: by outflank-mailman (input) for mailman id 1484146;
 Wed, 11 Nov 2026 15:11:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9zJ-0007Uz-2L
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:11:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9zI-003pSD-FZ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:11:48 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af485a6-2eae-0a2a0a5409dd-0a2a45028a26-30
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:11:48 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af485b3-6ca4-0a2a45020019-d155802eecb4-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:11:48 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso20750385e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:11:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c4e07sm10923583f8f.49.2026.11.11.07.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:11:47 -0800 (PST)
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
        d=suse.com; s=google; t=1794409907; x=1795014707; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WVu4HFArKfSiY2YOXf3jMhVBvEKjH+oD95YUhF1s9UI=;
        b=aWSVXz//sGh4yYOllblpOFnoTX0rEdQno5XSOb8Ezz/rTJE3hcerD6pZf3pVe/Vc32
         bffHauZ4bFta9jEuTNJ39ANp8ThmenFRvGjBnYWtQaU1RROW+2ZqhjK5QCXYrsExeDah
         s537/tLtTwV6s9H84uQwLuiaLCds/vI9fWBOF9MNzzvGJhDhA9FWxwUsRizCSiT/SLBo
         45My18mvCXFOcHqcIdfWVuxGIfN0dkqo4M2Ie7htjx7RMXMOvi4PMvD7jJgA2BsjAnnb
         0/ldYYt20EZdgBEqixsIFZPO0Izi6M3oDBOZLpYMq/xeqsKuug0oDhqZpk7XmhwHM6qV
         MrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409907; x=1795014707;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVu4HFArKfSiY2YOXf3jMhVBvEKjH+oD95YUhF1s9UI=;
        b=DyLW8acnP6aJbfeqtG4VvbX3QjeBGhntjOvuNoW5EZxqrBBtbD977espBR1GeC1wF2
         yKYHY+qlOzVZs8/h2SlJuwJtVUhrB/uaksyK5fLqFSuIpZ2oz5vKzsNh6eF+4LVZ8uxS
         pew/00eoBKPV9MM6eEOXclnXv2godJUj8lRxjCI1UfP16TZDdGTe4FLiRttY7gMrv68W
         0cvidIxfnQQXBx7o/LE5qGHibkJ4qd8Wg3GdyMrhh9Gm2yQx4kXjdvUiCnpwd8gXbDHR
         MvD9Xa3NH6W6af4PIDum2XukhbfMjEmz2tS0XfT77qxkrGbU95l/2fygYZ2FWPUnK69D
         mXVQ==
X-Gm-Message-State: APuU4Z/L0dIHpxa7jG/ejmJN8fnEqZCxCF+APLzlxMYCUZYylgCZBWcG
	ML88wst6RkTTuKAkEfwCZay3vUSlUKu+eXh0ELY8xdQ1SLhTY8mi3VwvwxVQzKXv3ZLDMI0Cp9b
	Bu5rYCw==
X-Gm-Gg: AYBFou0YaKAm3BO316YG1O+nYJVeDYUoO9RNjP/WZ5b1BdKZQeJtTOlueZc3QgFR+0l
	nFuSK6xlRV8YMi2YePjg++CyLRwsrPqbXi76yc38ngjFqHu0dxb/TqHwVCoqzeEFtBLE57ArwrU
	nInR3hnfXhzyqkY4+pp7hfi4YIraP/z85aBUm2ktD5ekDcdQOFbvE5kV2lpIT1bbJW5+cn9mW4b
	0wZWoxEhY598n24mPvHy34fFF2IKbaZSyzOBdrlLsWEQjWruPqeTRrducqS1FqSONzinx/oMe2x
	/Dq3Bh3F7e3lz0oWVkH5/qNAaqkoY2pMs8RBm+wj2I9CUojKoWHakYaUQ/qJ15lPcusKOiKplmx
	2NQdmR/SjZHgXvCHKs0lDViuXxq01XZ+OskUwr7do0JY3ftkS694BeQrkP1pVoQBK+WrqD7sMjB
	kahsOy+nZYfo9YQiDef6UApHWq8oRa9A4z1tEgHLrPKqj6W4XJhcsB6ZbRSEaw+ZKG/pK/gZ4Ge
	jjDWDghy014MwXd4wz8YZURnGwkJOGdAhDeilufapvogeUMAA6OKUT4cB+u6lXZa6KympHj8C9g
	nripyd5jlMridrGk9vSSa09aJJTZHLcfDGk1XICcPJvu9yb6iKLl+WydXh8Vclo3vo6CF1T4aiH
	olxqiOxwJ4jVwBSRR
X-Received: by 2002:a05:600c:6212:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4ba0938a405mr48368415e9.28.1794409907525;
        Wed, 11 Nov 2026 07:11:47 -0800 (PST)
Message-ID: <4e429d73-9bf7-46fc-94e9-3e67b5e0f75e@suse.com>
Date: Wed, 11 Nov 2026 16:11:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 11/28] x86emul: support TILEZERO
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
X-purgate-ID: tlsNG-720697/1794409908-670B02AC-EFB119F6/10/78276251493
X-purgate-type: spam
X-purgate-size: 3445
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is relatively straightforward, and hence best suited to introduce a
few other wider use pieces.

Testing of this will be added once a sensible test can be put together,
i.e. when support for at least TILELOADD (to allow loading non-zero
values in the first place) is also there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Use X86_EXC_*. Fold tiles_configured() into tile_valid(). Re-base.
v3: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1346,6 +1346,7 @@ static const struct vex {
     { { 0x49, 0x00 }, 2, F, R, pfx_no, W0, L0 }, /* ldtilecfg */
     { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
+    { { 0x49, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tilezero */
     { { 0x50 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuud */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
     { { 0x50 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsud */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -97,8 +97,37 @@ static const uint16_t _3dnow_ext_table[1
 /* Shift values between src and dst sizes of pmov{s,z}x{b,w,d}{w,d,q}. */
 static const uint8_t pmov_convert_delta[] = { 1, 2, 3, 1, 2, 1 };
 
+static void sttilecfg(struct x86_tilecfg *tilecfg)
+{
+    /* sttilecfg (%rdi) */
+    asm volatile ( ".byte 0xc4, 0xe2, 0x79, 0x49, 0x07"
+                   : "=m" (*tilecfg) : "D" (tilecfg) );
+}
+
 #define PALETTE_AMX 1
 
+#define PALETTE(pal...) TOK_OR(1U << PALETTE_, ## pal)
+
+static bool tile_valid(unsigned int tile, const struct x86_tilecfg *tilecfg,
+                       unsigned int palettes)
+{
+    switch ( tilecfg->palette )
+    {
+    case PALETTE_AMX:
+        return (palettes & PALETTE(AMX)) && tile < ARRAY_SIZE(tilecfg->colsb) &&
+               /*
+                * Considering the checking LDTILECFG does, checking either would
+                * in principle suffice.
+                */
+               tilecfg->colsb[tile] && tilecfg->rows[tile];
+
+    default:
+        break;
+    }
+
+    return false;
+}
+
 #endif /* !X86EMUL_NO_SIMD */
 
 static const uint8_t sse_prefix[] = { 0x66, 0xf3, 0xf2 };
@@ -6640,6 +6669,28 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x49):
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, X86_EXC_UD);
+        if ( ea.type == OP_REG )
+        {
+            switch ( modrm_rm & 7 )
+            {
+            case 0: /* tilezero */
+                vcpu_must_have(amx_tile);
+                get_fpu(X86EMUL_FPU_tile);
+                sttilecfg(&mmvalp->tilecfg);
+                generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg,
+                                                  PALETTE(AMX)),
+                                      X86_EXC_UD);
+                op_bytes = 1; /* fake */
+                goto simd_0f_common;
+
+            default:
+                goto unrecognized_insn;
+            }
+        }
+        goto unrecognized_insn;
+
     case X86EMUL_OPC_VEX   (0x0f38, 0x50): /* vpdpbuud [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0x50): /* vpdpbsud [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0x50): /* vpdpbssd [xy]mm/mem,[xy]mm,[xy]mm */


