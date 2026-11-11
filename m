Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C58606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GTZIbV+b
Received: from list by lists.xenproject.org with outflank-mailman.1483864.1687225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9JG-00084O-GW; Wed, 11 Nov 2026 14:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483864.1687225; Wed, 11 Nov 2026 14:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9JG-00084H-DZ; Wed, 11 Nov 2026 14:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1483864;
 Wed, 11 Nov 2026 14:28:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9JF-00081H-65
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:28:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9JE-00074a-Iz
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:28:20 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b81-8faa-0a2a0a5109dd-0a2a4507aea6-12
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:28:20 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b84-b4ea-0a2a45070019-d1558030b531-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:28:20 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so36364645e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:28:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08e35e44sm58069015e9.1.2026.11.11.06.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:28:19 -0800 (PST)
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
        d=suse.com; s=google; t=1794407300; x=1795012100; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=afBjbDPsuNYrea4VvuixycMZMXnUKG1Iyyd1RmiFmdg=;
        b=GTZIbV+bC3YT5URroMjSjqVSzN1zG+PjpOC/ffU9Csxopu8t40DnzD7aPK4ZENwgJE
         AB1onC6L3Gx83Kz1DxgyRbNEMGJ2Q6SD3f3SgAmEueIeebk81KUQKqP2dEhe4pr4WG/r
         BEyBpb9MDAj26fnRKotBS3N8+NoiFdP+PY8TOyJ71N/iccdqfjFOF6y226gIkGOh+D8o
         WR+axU80ZD2W2HmYqReNFoqmCP2OHno3PfpM8FzWnhGp7uMrBGnRTey1Yq2n36tk78Ws
         EmrRi0nnBESvjCU1syemG2951KiijlnB9fvc+dA3vm/3+I+NUKth9fl/Fm7r/PL8fKB1
         TrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407300; x=1795012100;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=afBjbDPsuNYrea4VvuixycMZMXnUKG1Iyyd1RmiFmdg=;
        b=qLMqqYdaEKXgL88p2IYtkV05aZjv72bHjgu9bSSLYq7OBK6pLaJyCXHwJzIL9w+DIN
         Er2Tmjf5OqTRs62ijtT5+kFK0LMXNRr7kXr3atUs7gE0B6z8OJGN6cqrJTTsYDWq5k/8
         avgkDGd3nT4DuuL0M8F08PWWBWeDpjmT1dKhAuQ2J/UJBO7dcDou/j1mfwVzO/ShI5Aa
         iq+ixGugljGmvRlCUHXJZb22iolKKSgt6um0woCvRhWdFQ9ENfJmBUt6Hba+VldrXDtk
         cMZqxfZqoVGEAvrlucmAfZGG+ZI/pqBYpz1AkdhP6ri7+YZUt9UGOKN/awsKSKXdn0z0
         lJdQ==
X-Gm-Message-State: APuU4Z94n86G0+1iL2wOle4i0QeTDN7GZ31xOS/svJzIaADlSmaH5Pkc
	P8b10RUfKPwA6Du24bCoxstve8d3TmG2bwlKJ66if07cwl0R3CZWW0eWEfp8vvVrxqnLUaea0a5
	zgflBkg==
X-Gm-Gg: AYBFou3nSBgk6860suSu/h46L+5jglupgknhyTuZCc9uaJojg3kBKO1u4eqp7RmY4bO
	I3hGQpwyxvwP52RDSU1bXTUtig7wyJXIhhW3+/PlpjlM6pr6PWvccKIOr2G2eTw9x7cGyQkv3Cd
	b+1zP96LWA8Gb6RLDgQ3EGijHOXO5a1Q3HLvkMFc3gY4CGiOsujGV7d5kJdS7JM7oFNLVOZSUDs
	K3DgLSclGrJ/yDENUGtI9ufwxDC4/Ez6AthC/Rrx2fn9mLoK/etyzbNJR/s8F9Yp1E81andNWSR
	D6AlRpT4/o94tFxz3NclPstciLnG8h1bQFs/XlijUdZjXoBVMEsDyAS5dRxAyxY1FQA8Evk/zAL
	OaCeeprE0k3dv01xtP+lYrvv1b5AgAyx/dXEvCapM7UH7xGVUL4i/TUdhDYJpDRUt6TgzeXUv66
	XRaY6WU+40qFAW5TbD9Nnh2ww6I7z5up72YpouQQyNV7i5AMlsg+VTEhdwlzpNQXJyu7slfLDWl
	XjUVRuI+HHn3x2auBjbtsglthBd95TwMfKxy1cHlx+5lu7Dl4NtVd6JF/Oco++jlu0ZD4Io6A6U
	2K/fQZHNeOaEXhhaIo7UYe73/97XwiFIH5gTpFzCFlLi0hHDI/3GQy+sMBfxLkePndW5n4r050N
	KgsYsfwADkCT0DPS1OnWAYJ7HcsSwshNGZtH2mA==
X-Received: by 2002:a05:600c:1548:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ba09383873mr49999275e9.23.1794407299958;
        Wed, 11 Nov 2026 06:28:19 -0800 (PST)
Message-ID: <9377c495-91d8-4b27-9cd8-097fb5a4638f@suse.com>
Date: Wed, 11 Nov 2026 15:28:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 19/30] x86emul: extend copy_VEX() for APX use
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
X-purgate-ID: tlsNG-ef75cf/1794407300-A72DCAE4-519D4EDD/10/78276251493
X-purgate-type: spam
X-purgate-size: 3646
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As long as we work just with non-eGPR-s internally, we can engage the
VEX counterpart encodings to carry out emulation of EVEX-from-VEX
promoted insns. VEX3 and EVEX are actually pretty similar in their 1st
and 2nd payload bytes:

VEX3	C4	R  X  B      mmmmm	W vvvv L pp
EVEX	62	R3 X3 B3 R4 B4 mmm	W vvvv U pp	z LL b V4  aaa

with the from-VEX form only altering the 3rd payload byte:

							00 L 0 V4 NF 00

Therefore by clearing B4, R4, and U we can easily transform EVEX into
VEX. (Don't transform EVEX.LL just yet - we'd have to pass in the EVEX
struct [or a pointer to it], when in reality for now all promoted APX
insns are EVEX.128 anyway.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -115,9 +115,12 @@ static const uint8_t sse_prefix[] = { 0x
     buf_ + 3; \
 })
 
-#define copy_VEX(ptr, vex) ({ \
+#define copy_VEX(ptr, vex, from_evex) ({ \
     if ( !mode_64bit() ) \
         (vex).reg |= 8; \
+    if ( from_evex ) \
+        /* Clear what was EVEX.B4 and EVEX.R4. */ \
+        (vex).opcx &= 7; \
     gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 : 0x8f; \
     (ptr)[1 - PFX_BYTES] = (vex).raw[0]; \
     (ptr)[2 - PFX_BYTES] = (vex).raw[1]; \
@@ -126,7 +129,7 @@ static const uint8_t sse_prefix[] = { 0x
 
 #define copy_REX_VEX(ptr, rex, vex) do { \
     if ( (vex).opcx != vex_none ) \
-        copy_VEX(ptr, vex); \
+        copy_VEX(ptr, vex, false); \
     else \
     { \
         if ( (vex).pfx ) \
@@ -5378,7 +5381,7 @@ x86_emulate(
         opc[1] = modrm & 0xf8;
         place_ret(&opc[2]);
 
-        copy_VEX(opc, vex);
+        copy_VEX(opc, vex, false);
         ea.reg = decode_gpr(&_regs, NULL, modrm_rm);
         invoke_stub("", "", "=m" (dummy) : "a" (*ea.reg));
 
@@ -5422,7 +5425,7 @@ x86_emulate(
         opc[1] = modrm & 0xc7;
         place_ret(&opc[2]);
 
-        copy_VEX(opc, vex);
+        copy_VEX(opc, vex, false);
         invoke_stub("", "", "=a" (dst.val) : [dummy] "i" (0));
 
         put_stub(stub);
@@ -5450,7 +5453,7 @@ x86_emulate(
         opc[1] = modrm;
         place_ret(&opc[2]);
 
-        copy_VEX(opc, vex);
+        copy_VEX(opc, vex, false);
         _regs.eflags &= ~EFLAGS_MASK;
         invoke_stub("",
                     _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
@@ -6370,7 +6373,7 @@ x86_emulate(
          * for that purpose.
          */
         opc = init_prefixes(stub);
-        pvex = copy_VEX(opc, vex);
+        pvex = copy_VEX(opc, vex, false);
         pvex->opcx = vex_0f;
         if ( elem_bytes == 4 )
             pvex->pfx = vex_np;
@@ -6806,7 +6809,7 @@ x86_emulate(
 
         /* Read destination, index, and mask registers. */
         opc = init_prefixes(stub);
-        pvex = copy_VEX(opc, vex);
+        pvex = copy_VEX(opc, vex, false);
         pvex->opcx = vex_0f;
         opc[0] = 0x7f; /* vmovdqa */
         /* Use (%rax) as destination and modrm_reg as source. */
@@ -6876,7 +6879,7 @@ x86_emulate(
 
         /* Write destination and mask registers. */
         opc = init_prefixes(stub);
-        pvex = copy_VEX(opc, vex);
+        pvex = copy_VEX(opc, vex, false);
         pvex->opcx = vex_0f;
         opc[0] = 0x6f; /* vmovdqa */
         /* Use modrm_reg as destination and (%rax) as source. */
@@ -7942,7 +7945,7 @@ x86_emulate(
         else
         {
             insn_bytes = PFX_BYTES + 3;
-            copy_VEX(opc, vex);
+            copy_VEX(opc, vex, false);
         }
         place_ret(&opc[3]);
 


