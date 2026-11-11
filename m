Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F149A606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EoRMndGq
Received: from list by lists.xenproject.org with outflank-mailman.1483802.1687163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9GQ-0004CL-4s; Wed, 11 Nov 2026 14:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483802.1687163; Wed, 11 Nov 2026 14:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9GQ-0004CE-28; Wed, 11 Nov 2026 14:25:26 +0000
Received: by outflank-mailman (input) for mailman id 1483802;
 Wed, 11 Nov 2026 14:25:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9GO-0004AM-Eb
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:25:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9GN-00B0dQ-Rd
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:25:23 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47ad3-bab6-0a2a0a5309dd-0a2a4509956a-0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:25:23 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47ad3-be1a-0a2a45090019-d1558035e0ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:25:23 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so34035875e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:25:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c524faesm156925e9.15.2026.11.11.06.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:25:22 -0800 (PST)
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
        d=suse.com; s=google; t=1794407123; x=1795011923; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+206HPHozIy3x30BwZ6PRDUBWjasoW1k6gEHdydinwI=;
        b=EoRMndGqi/1WM2LZUuEOyzviClbvaxR/RxKF39pnAUjOkPfTp5LqLkrxukOstqjSpC
         85Nefn6hStcswmfEnACYkI/LQbvOc7b3W3kSFsck0YrUeof51kHP6SqE3j2q8Tkn2VbN
         Fzgi7lKXRVTq/IOXZEpRkrZ/2g5WGSnVajBN4vYW3O/pcwP8m4bPlOCRrELusNR+qFgs
         L9huGrA/txu4hT+c8wa2BHWS2kYRfK3wYM73JbEQownrAqtBM3VvooPHJ8gZho3iSyYp
         7HVvo+kZ537cCjPg6KlMAgst84ByV/mhUirj4lCIjx5AZUbbrp6p9XImMKptKGSct1nm
         YiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407123; x=1795011923;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+206HPHozIy3x30BwZ6PRDUBWjasoW1k6gEHdydinwI=;
        b=ba7yVFoM7iFsywc2gbj8MAgkFg4xV+WYbCSCol/MAzdor9h0l/dxuIS7hms+4HnMmz
         L7l7FIzMQzAdpD4l9YoPN8Dao7UcPdFfLAn2NqmMJg8QPRAQPSs1dSt4a3wWbnSLDXhM
         v6MTelh7wCjfI9EzXOQbJ3D6GTCBAbi8bZS1FJmhMixSCEjeTt9Pix167uIHSyGSXRTj
         //ODmoKF+UmQvuBH3YEXJ4/3IvC7f2MyKLMa7etsp+VoMZQRND5cHMWfqDP//AjWLQV5
         Aq7ccl4YF/aANcTxCAdT733yfPzeG3rE0XIb5L7vwg6k0hl/x+AL1OdQYeCRqcD4ZntR
         2q6g==
X-Gm-Message-State: APuU4Z8t8gpKRDE9/4AfCbJU4pccSOjO0a2xAjoosYyuLF5rpIJH+hi0
	sjlwxVTXW6nKQt6PI7PKDuHAKBdXxVOJf2trj/RpFyX1gKU5yNzz/NyxWj1xvLcowSyoEQC4KvZ
	T8Gezpw==
X-Gm-Gg: AYBFou07mRPzW6HoAdIp1cT45G9ScJ0TFYWFLNMQW7DVrdvIB3pGm3/9PJQJvNZJLWq
	csz3KufiaS8CkNihI+3jSk97k+NN30WPQJpuagpLSYTzcBpBS8+9yfBkT8legKPuQRvtcQX7fad
	yH+DRZjTPcoNysKxZmzv4ss4Jcxbokeag7mc1f81+Ph093fMotBRXDPCZ/2Twxm30NVQgzCAJwJ
	fu9Kzy68538NmcJa59SfgexzAtFXYZsDn4NKFvlkTgsMn7fLR5wiFtoo8IV1JGz/2L8XDTojCZ0
	IhcvQN55cVVx6SqxJ5++a4VP27l6HJupeZ26oW0kvINgp2F9/zk9F6j2nmJhsv5A5wsm+VEFhsu
	7N9bIpIv/02foE9uhyurONq73wbTWYlts8r9ha2VwOGSAmHgg7QxcRR+8WK+y7RwK8WP1iYO0g5
	XX9qHU45OKd0MYZRLM9SuyYLHeyu8JviUt2ffSMSJQPAq6jdIrckkIRkc8I8F73bIMRA3G11jSo
	8++p24npB6WFSZEUEbquOr80FBXw/Cim67+JGsQMw42JlsyzqxEn0A8sG1EVOGKroTwS+ogJ2k9
	Pzz7ulKmsrYVaj948LfsZMwWhZxr2peozT7xSY3DVC9ARse150o5EPapkdlslTjb8xRyxFe0F1b
	/H/Ymm6XBL98oEwhq
X-Received: by 2002:a05:600c:c167:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4ba093acf6dmr43136745e9.33.1794407123193;
        Wed, 11 Nov 2026 06:25:23 -0800 (PST)
Message-ID: <080b311d-1882-4cef-8a56-7bd819fd7840@suse.com>
Date: Wed, 11 Nov 2026 15:25:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 12/30] x86emul: switch to EVEX.B{3,4} nomenclature
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
X-purgate-ID: tlsNG-bad1c0/1794407123-BEEDE034-53B37E1E/10/78276251493
X-purgate-type: spam
X-purgate-size: 11699
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The APX spec renames the B field and adds a new one for the 5th base
address register bit; it can be expected for the SDM to follow once APX
stuff is folded in. The new naming is also better to reflect in our
structure field identifiers.

Like we represent VEX.B and EVEX.B3 in rex_prefix, also represent
EVEX.B4 in rex2_prefix, allowing to leave various decode_reg()
invocations untouched.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Raising of #UD on an unduly set EVEX.B4 follows what the spec says: It's
ignored. While that matches EVEX.B3 (and VEX.B) treatment, what the spec
says is apparently wrong for EVEX.R{3,4}, which aren't ignored as per
what the SDM specifies. Hence the overall situation isn't really clear.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -938,9 +938,9 @@ static void test_one(const struct test *
         uint8_t raw[3];
         struct {
             uint8_t opcx:3;
-            uint8_t mbz:1;
+            uint8_t b4:1;
             uint8_t r4:1;
-            uint8_t b:1;
+            uint8_t b3:1;
             uint8_t x:1;
             uint8_t r3:1;
             uint8_t pfx:2;
@@ -955,7 +955,7 @@ static void test_one(const struct test *
         };
     } evex = {
         .opcx = test->spc, .pfx = test->pfx, .lr = vl,
-        .r4 = 1, .b = 1, .x = 1, .r3 = 1, .mbs = 1,
+        .r4 = 1, .b3 = 1, .x = 1, .r3 = 1, .mbs = 1,
         .reg = 0xf, .RX = 1, .opmsk = sg,
     };
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1276,15 +1276,23 @@ int x86emul_decode(struct x86_emulate_st
                         s->evex.raw[1] = s->vex.raw[1];
                         s->evex.raw[2] = insn_fetch_type(uint8_t);
 
-                        generate_exception_if(!s->evex.mbs || s->evex.mbz, X86_EXC_UD);
+                        generate_exception_if(!s->evex.mbs, X86_EXC_UD);
+                        generate_exception_if((!(s->xcr0 & X86_XCR0_APX) &&
+                                               s->evex.b4),
+                                              X86_EXC_UD);
                         generate_exception_if(!s->evex.opmsk && s->evex.z, X86_EXC_UD);
 
                         if ( !mode_64bit() )
+                        {
                             s->evex.r4 = 1;
+                            s->evex.b4 = 0;
+                        }
                         else if ( s->xcr0 & X86_XCR0_APX )
                         {
                             if ( !s->evex.r4 )
                                 s->rex2_prefix |= REX_R;
+                            if ( s->evex.b4 )
+                                s->rex2_prefix |= REX_B;
                         }
 
                         s->vex.opcx = s->evex.opcx;
@@ -1320,6 +1328,16 @@ int x86emul_decode(struct x86_emulate_st
                         d = twobyte_table[0x3a].desc;
                         break;
 
+                    case evex_map4:
+                        if ( !mode_64bit() || !evex_encoded() )
+                        {
+                            rc = X86EMUL_UNRECOGNIZED;
+                            goto done;
+                        }
+
+                        s->promoted_evex = true;
+                        break;
+
                     case evex_map5:
                         if ( !evex_encoded() )
                         {
@@ -1832,10 +1850,56 @@ int x86emul_decode(struct x86_emulate_st
 
         if ( s->modrm_mod == 3 )
         {
+            bool rm_is_gpr = s->promoted_evex;
+
+            /* Originally VEX- (now EVEX-)encoded GPR insns. */
+            if ( (s->evex.opcx == vex_0f38 || s->evex.opcx == vex_0f3a ||
+                  s->evex.opcx == vex_map7) &&
+                 b >= 0xf0 )
+                rm_is_gpr = true;
+
+            /* A few other insns also encode a GPR in ModR/M.rm. */
+            switch ( opcode )
+            {
+            case X86EMUL_OPC_EVEX(0x0f, 0x92):      /* kmovw r,k */
+            case X86EMUL_OPC_EVEX_66(0x0f, 0x92):   /* kmovb r,k */
+            case X86EMUL_OPC_EVEX_F2(0x0f, 0x92):   /* kmov{d,q} r,k */
+
+            case X86EMUL_OPC_EVEX_F3(0x0f, 0x2a):   /* vcvtsi2ss */
+            case X86EMUL_OPC_EVEX_F2(0x0f, 0x2a):   /* vcvtsi2sd */
+            case X86EMUL_OPC_EVEX_F3(5, 0x2a):      /* vcvtsi2sh */
+
+            case X86EMUL_OPC_EVEX_F3(0x0f, 0x7b):   /* vcvtusi2ss */
+            case X86EMUL_OPC_EVEX_F2(0x0f, 0x7b):   /* vcvtusi2sd */
+            case X86EMUL_OPC_EVEX_F3(5, 0x7b):      /* vcvtusi2sh */
+
+            case X86EMUL_OPC_EVEX_66(0x0f, 0x6e):   /* vmov{d,q} r/m,xmm */
+            case X86EMUL_OPC_EVEX_66(5, 0x6e):      /* vmovw r/m16,xmm */
+
+            case X86EMUL_OPC_EVEX_66(0x0f, 0x7e):   /* vmov{d,q} xmm,r/m */
+            case X86EMUL_OPC_EVEX_66(5, 0x7e):      /* vmovw xmm,r/m16 */
+
+            case X86EMUL_OPC_EVEX_66(0x0f38, 0x7a): /* vpbroadcastb */
+            case X86EMUL_OPC_EVEX_66(0x0f38, 0x7b): /* vpbroadcastw */
+            case X86EMUL_OPC_EVEX_66(0x0f38, 0x7c): /* vpbroadcast{d,q} */
+
+            case X86EMUL_OPC_EVEX_66(0x0f3a, 0x14): /* vpextrb */
+            case X86EMUL_OPC_EVEX_66(0x0f3a, 0x15): /* vpextrw */
+            case X86EMUL_OPC_EVEX_66(0x0f3a, 0x16): /* vpextr{d,q} */
+            case X86EMUL_OPC_EVEX_66(0x0f3a, 0x17): /* vextractps */
+
+            case X86EMUL_OPC_EVEX_66(0x0f, 0xc4):   /* vpinsrw */
+            case X86EMUL_OPC_EVEX_66(0x0f3a, 0x20): /* vpinsrb */
+            case X86EMUL_OPC_EVEX_66(0x0f3a, 0x22): /* vpinsr{d,q} */
+                rm_is_gpr = true;
+                break;
+            }
+
             generate_exception_if(d & vSIB, X86_EXC_UD);
             s->modrm_rm |= ((s->rex_prefix & 1) << 3) |
-                           ((evex_encoded() ? !s->evex.x
-                                            : !!(s->rex2_prefix & REX_B)) << 4);
+                           ((evex_encoded() && !rm_is_gpr
+                             ? !s->evex.x
+                             : !!(s->rex2_prefix & REX_B)) << 4);
             s->ea.type = OP_REG;
         }
         else if ( ad_bytes == 2 )
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -202,7 +202,8 @@ enum vex_opcx {
     vex_0f,
     vex_0f38,
     vex_0f3a,
-    evex_map5 = 5,
+    evex_map4,
+    evex_map5,
     evex_map6,
     vex_map7,
 };
@@ -235,9 +236,9 @@ union evex {
     uint8_t raw[3];
     struct {             /* SDM names */
         uint8_t opcx:3;  /* mmm */
-        uint8_t mbz:1;
+        uint8_t b4:1;    /* B4 */
         uint8_t r4:1;    /* R4 (aka R') */
-        uint8_t b:1;     /* B */
+        uint8_t b3:1;    /* B3 (aka B) */
         uint8_t x:1;     /* X */
         uint8_t r3:1;    /* R3 (aka R) */
         uint8_t pfx:2;   /* pp */
@@ -260,6 +261,7 @@ struct x86_emulate_state {
         ext_0f   = vex_0f,
         ext_0f38 = vex_0f38,
         ext_0f3a = vex_0f3a,
+        ext_map4 = evex_map4,
         ext_map5 = evex_map5,
         ext_map6 = evex_map6,
         ext_map7 = vex_map7,
@@ -322,6 +324,7 @@ struct x86_emulate_state {
     bool not_64bit; /* Instruction not available in 64bit. */
     bool fpu_ctrl;  /* Instruction is an FPU control one. */
     bool fp16;      /* Instruction has half-precision FP or BF16 source. */
+    bool promoted_evex; /* From legacy/VEX, i.e. ND / NF / SCC capable. */
     opcode_desc_t desc;
     union vex vex;
     union evex evex;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3511,7 +3511,8 @@ x86_emulate(
         if ( ea.type == OP_MEM )
         {
             /* convert memory operand to (%rAX) */
-            evex.b = 1;
+            evex.b3 = 1;
+            evex.b4 = 0;
             opc[1] &= 0x38;
         }
         insn_bytes = EVEX_PFX_BYTES + 2;
@@ -3724,7 +3725,8 @@ x86_emulate(
         opc = init_evex(stub);
         opc[0] = b;
         /* Convert memory/GPR source to %rAX. */
-        evex.b = 1;
+        evex.b3 = 1;
+        evex.b4 = 0;
         if ( !mode_64bit() )
             evex.w = 0;
         /*
@@ -3780,7 +3782,8 @@ x86_emulate(
         {
             rex_prefix &= ~REX_B;
             vex.b = 1;
-            evex.b = 1;
+            evex.b3 = 1;
+            evex.b4 = 0;
             opc[1] = 0x01;
 
             rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp,
@@ -3869,7 +3872,8 @@ x86_emulate(
             /* Convert memory operand to (%rAX). */
             rex_prefix &= ~REX_B;
             vex.b = 1;
-            evex.b = 1;
+            evex.b3 = 1;
+            evex.b4 = 0;
             opc[1] &= 0x38;
         }
         if ( evex_encoded() )
@@ -4560,7 +4564,8 @@ x86_emulate(
         opc = init_evex(stub);
         opc[0] = b;
         /* Convert memory/GPR operand to (%rAX). */
-        evex.b = 1;
+        evex.b3 = 1;
+        evex.b4 = 0;
         if ( !mode_64bit() )
             evex.w = 0;
         opc[1] = modrm & 0x38;
@@ -5464,7 +5469,8 @@ x86_emulate(
         if ( ea.type == OP_MEM )
         {
             /* convert memory operand to (%rAX) */
-            evex.b = 1;
+            evex.b3 = 1;
+            evex.b4 = 0;
             opc[1] &= 0x38;
         }
         opc[2] = imm1;
@@ -6410,7 +6416,8 @@ x86_emulate(
         opc = init_evex(stub);
         opc[0] = b;
         /* Convert GPR source to %rAX. */
-        evex.b = 1;
+        evex.b3 = 1;
+        evex.b4 = 0;
         if ( !mode_64bit() )
             evex.w = 0;
         opc[1] = modrm & 0xf8;
@@ -6647,7 +6654,8 @@ x86_emulate(
          */
         pevex->opmsk = 0;
         /* Use (%rax) as destination and modrm_reg as source. */
-        pevex->b = 1;
+        pevex->b3 = 1;
+        pevex->b4 = 0;
         opc[1] = (modrm_reg & 7) << 3;
         pevex->RX = 1;
         place_ret(&opc[2]);
@@ -6712,7 +6720,8 @@ x86_emulate(
         opc[0] = 0x6f; /* vmovdqa{32,64} */
         pevex->opmsk = 0;
         /* Use modrm_reg as destination and (%rax) as source. */
-        pevex->b = 1;
+        pevex->b3 = 1;
+        pevex->b4 = 0;
         opc[1] = (modrm_reg & 7) << 3;
         pevex->RX = 1;
         place_ret(&opc[2]);
@@ -6802,7 +6811,8 @@ x86_emulate(
         pevex->opcx = vex_0f;
         opc[0] = 0x7f; /* vmovdqa{32,64} */
         /* Use (%rax) as destination and modrm_reg as source. */
-        pevex->b = 1;
+        pevex->b3 = 1;
+        pevex->b4 = 0;
         opc[1] = (modrm_reg & 7) << 3;
         pevex->RX = 1;
         place_ret(&opc[2]);
@@ -7468,7 +7478,9 @@ x86_emulate(
         opc[0] = b;
         /* Convert memory/GPR operand to (%rAX). */
         rex_prefix &= ~REX_B;
-        evex.b = vex.b = 1;
+        vex.b = 1;
+        evex.b3 = 1;
+        evex.b4 = 0;
         if ( !mode_64bit() )
             evex.w = vex.w = 0;
         opc[1] = modrm & 0x38;
@@ -7516,7 +7528,7 @@ x86_emulate(
         evex.opcx = ext_0f3a;
         b = 0x15;
         modrm <<= 3;
-        evex.r3 = evex.b;
+        evex.r3 = evex.b3;
         evex.r4 = evex.x;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x14): /* vpextrb $imm8,xmm,r/m */
@@ -7600,7 +7612,8 @@ x86_emulate(
         {
             /* Convert memory operand to (%rAX). */
             vex.b = 1;
-            evex.b = 1;
+            evex.b3 = 1;
+            evex.b4 = 0;
             opc[1] &= 0x38;
         }
         opc[2] = imm1;


