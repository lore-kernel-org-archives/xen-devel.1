Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18228606A32D
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bWH6w/Wd
Received: from list by lists.xenproject.org with outflank-mailman.1483843.1687207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9IU-0006iz-PX; Wed, 11 Nov 2026 14:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483843.1687207; Wed, 11 Nov 2026 14:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9IU-0006iq-Mp; Wed, 11 Nov 2026 14:27:34 +0000
Received: by outflank-mailman (input) for mailman id 1483843;
 Wed, 11 Nov 2026 14:27:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9IS-0006iG-K2
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:27:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9IS-00EsbD-0S
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:27:32 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b45-bab6-0a2a0a5309dd-0a2a450bad56-42
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:27:31 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b53-b7e8-0a2a450b0019-d155802ced78-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:27:31 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso31023565e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:27:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4989a2a505asm9629131f8f.13.2026.11.11.06.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:27:31 -0800 (PST)
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
        d=suse.com; s=google; t=1794407251; x=1795012051; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iIgb0IIkPBSR5qoKbnkFvQdL0p7wF6Vl9ZhkfpdXW5o=;
        b=bWH6w/Wd8UkMtM+6m76qwFA9XE3a0ajvAdYpKKOKyM+mfp5gWE86Q83qkbPLQh3pc+
         iQ4UZtHu+9y50rCUCfcyp7U3K3q8ddJWPlISfAal99OBtw4UshazUk6my58/Smki9Ue7
         iClztp/Fjh/F7lDc7S2Fq/UnjIygbqA1vpU6FZORu3mCE847yph5KJE4BJTZFkGKlEfq
         +r+2WbVTQOZzpLES71tzTPDLy7+5ShEXpT9nl0ej6+7cTeX7v9Ttp+CLpVWZkMtgifgY
         sCTNFtDepY9dqR4DmmiKaO4k3IX1+A0NL9q0RCsFJobC8EP/mTXgYAMzyhINvVOGyfEP
         1G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407251; x=1795012051;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iIgb0IIkPBSR5qoKbnkFvQdL0p7wF6Vl9ZhkfpdXW5o=;
        b=HmFUnE9w61CKQhqYn8g5Oyf29RYqkNFkr9o4Iddl/eLaKqVwFUC/EWGS5PaRNy4k2X
         FbKeSc27g22Ksve9nejYJTphWraTGZmOSUumgN6CPwlUwHhvL4U45R9RmEmV/xBKSiT6
         4rWp5fUHk4I7gth5j29Xeowo2WiM6yW+dh9KkjAqOzaCAOlXXPFKV/Gbvrh8GTn7jMjR
         e/sVkM7WhKeVl4zm9gJnQf69jysYS77jX+R2ij5xPe9v0YS7fXSWU3gJZlkKOidNtd3R
         KfIXavkrb/WScchmfckPCc/Jceh+gtcrfz0tB8dmX9clVa0Lfs5xzcCXPI8b8lLa+1Au
         WBzg==
X-Gm-Message-State: APuU4Z8ZTTmU+um/WUDbkn6+xKoseY1AitXGF/F7UymFVcAgWr0mKoZ5
	IEySXkSFJ2s5k41A4VOMdclbxnxEgfswxMugLUbVMLx83NIHLaAIjMZYd1+knoswmEeYtwzM4dk
	7bZJUng==
X-Gm-Gg: AYBFou17COg1PCar353pw/bcEdRohF11f4mQ1xtWNVcPfI+wGA1oRf9oDV99agvfKMr
	+2Sa0OtEu0j9ESCoW5xiTufnuN4QxeX8dp7+FhETyRqNgBvp7VJvoylBqTonNkoqEczTZbHdgJj
	c5pr51zBQXmjNbFSqdzW8n9KC0d1NYsalfEa01+awOQnlJKw30lyIRqAlVJERWq2huNXcSsbtrv
	FRdjNxWg3E5hpPhvFnr3rZwxvW6rzDNYdFSqdVQxlavEInkpqru0dqw4glK62r2foxc59CxitOR
	9EWvHzhWYsnQHDUtwnEytPO9ccSsdPLlqu5dGq7COzQ/vEIPREG/md7V1YjFEXxaR6XhiURPOS0
	SrAct8dE7mPd1YprGuMcLADIkPI/gnJzCn8JxcEAW7BZyUFgRsWYXDq3k6oNtrs3llHGBA5hDEk
	YMzR0UxQ6mURKtsjHbM0FshUNb0ZTmxLy4hfxjnqm/ZS2KGTKboSG3xnXBpZdN2v0GWFkOmkx9P
	OUFP/oXzsIP3RCorBuIBEtq/C9Emw9Ck4A8InJiivCurAtqiS36paG/9S56NfKOjjfXQI5G6Apc
	p7I5qv3ZDyGxu83WnBi+mOTp7+N7hfcqa6u5XmEq2CG/fmrgORQfCjNnia2shnH/A6DfVozf7Di
	vRWKM45+HAzhr6M2Ibw==
X-Received: by 2002:a05:600c:19d0:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4ba09380561mr47655755e9.23.1794407251296;
        Wed, 11 Nov 2026 06:27:31 -0800 (PST)
Message-ID: <ef19d535-683e-447e-b961-bcc358370de3@suse.com>
Date: Wed, 11 Nov 2026 15:27:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 17/30] x86emul: support APX SCC insns
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
X-purgate-ID: tlsNG-42698a/1794407251-1AEDE9EA-AF02DD87/10/78276251493
X-purgate-type: spam
X-purgate-size: 15307
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Note that memory forms of these insns access memory even if the
condition evaluates to false, simplifying the handling for us.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1068,11 +1068,28 @@ static const struct test apx_f[] = {
     COND( o,  0), COND( p, 10), COND( s,  8), COND( z,  4)
 
 static const struct test apx_nci[] = {
+    INSN(ccmps,       , map4, 39,    el,   dq, no),
+    INSN(ccmps,       , map4, 3b,    el,   dq, no),
+    INSNX(ccmps,      , map4, 81, 7, el,   dq, no),
+    INSNX(ccmps,      , map4, 83, 7, el,   dq, no),
+    INSN(ccmpsb,      , map4, 38,    el,    b, no),
+    INSN(ccmpsb,      , map4, 3a,    el,    b, no),
+    INSNX(ccmpsb,     , map4, 80, 7, el,    b, no),
+    INSN(ccmpsw,    66, map4, 39,    el,    w, no),
+    INSN(ccmpsw,    66, map4, 3b,    el,    w, no),
+    INSNX(ccmpsw,   66, map4, 81, 7, el,    w, no),
+    INSNX(ccmpsw,   66, map4, 83, 7, el,    w, no),
 #define COND(c, n) \
     INSN(cfcmov##c,   , map4, 40 | (n), el, dq, no), \
     INSN(cfcmov##c, 66, map4, 40 | (n), el,  w, no)
     CONDS(),
 #undef COND
+    INSN(ctests,      , map4, 85,    el,   dq, no),
+    INSNX(ctests,     , map4, f7, 0, el,   dq, no),
+    INSN(ctestsb,     , map4, 84,    el,    b, no),
+    INSNX(ctestsb,    , map4, f6, 0, el,    b, no),
+    INSN(ctestsw,   66, map4, 85,    el,    w, no),
+    INSNX(ctestsw,  66, map4, f7, 0, el,    w, no),
 #define COND(c, n) \
     INSN(set##c,    f2, map4, 40 | (n), el, b, no)
     CONDS(),
@@ -1350,6 +1367,16 @@ static void test_one(const struct test *
              * provides as divisor.  Just set the entire %rax to zero.
              */
             ctxt->regs->eax = 0;
+            /* fall through */
+        case 0xf7:
+            if ( test->ext <= 1 )
+            {
+                /*
+                 * Unlike other insns in this group CTESTscc also has an
+                 * immediate operand.
+                 */
+                imm = test->opc & 1 ? test->pfx != PFX_66 ? 4 : 2 : 1;
+            }
             break;
         }
     }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1642,6 +1642,7 @@ static const struct evex {
     uint8_t l:3;
     bool mask:1;
     bool nd:1;
+    bool scc:1;
 #define L2 4
 #define Ln (L0 | L1 | L2)
 } evex_0f[] = {
@@ -2130,6 +2131,7 @@ static const struct evex {
 }, evex_map4[] = {
 #ifdef __x86_64__
 #define ND .nd = true
+#define SCC .scc = true
     { { 0x00 }, 2, T, W, pfx_no, WIG, L0, ND }, /* add */
     { { 0x01 }, 2, T, W, pfx_no, Wn, L0, ND }, /* add */
     { { 0x01 }, 2, T, W, pfx_66, Wn, L0, ND }, /* add */
@@ -2176,6 +2178,12 @@ static const struct evex {
     { { 0x32 }, 2, T, R, pfx_no, WIG, L0, ND }, /* xor */
     { { 0x33 }, 2, T, R, pfx_no, Wn, L0, ND }, /* xor */
     { { 0x33 }, 2, T, R, pfx_66, Wn, L0, ND }, /* xor */
+    { { 0x38 }, 2, T, R, pfx_no, WIG, L0, SCC }, /* ccmp<scc> */
+    { { 0x39 }, 2, T, R, pfx_no, Wn, L0, SCC }, /* ccmp<scc> */
+    { { 0x39 }, 2, T, R, pfx_66, Wn, L0, SCC }, /* ccmp<scc> */
+    { { 0x3a }, 2, T, R, pfx_no, WIG, L0, SCC }, /* ccmp<scc> */
+    { { 0x3b }, 2, T, R, pfx_no, Wn, L0, SCC }, /* ccmp<scc> */
+    { { 0x3b }, 2, T, R, pfx_66, Wn, L0, SCC }, /* ccmp<scc> */
     CND(0x40,   2, T, R, pfx_no, Wn, L0, ND ), /* {,cf}cmov<cc> */ \
     CND(0x40,   2, T, R, pfx_66, Wn, L0, ND ), /* {,cf}cmov<cc> */ \
     CND(0x40,   2, T, W, pfx_f2, WIG, L0 ), /* set<cc> */
@@ -2191,6 +2199,7 @@ static const struct evex {
     { { 0x80, 0x20 }, 3, T, W, pfx_no, WIG, L0, ND }, /* and */
     { { 0x80, 0x28 }, 3, T, W, pfx_no, WIG, L0, ND }, /* sub */
     { { 0x80, 0x30 }, 3, T, W, pfx_no, WIG, L0, ND }, /* xor */
+    { { 0x80, 0x38 }, 3, T, R, pfx_no, WIG, L0, SCC }, /* ccmp<scc> */
     { { 0x81, 0x00 }, 6, T, W, pfx_no, Wn, L0, ND }, /* add */
     { { 0x81, 0x00 }, 4, T, W, pfx_66, W0, L0, ND }, /* add */
     { { 0x81, 0x00 }, 6, T, W, pfx_66, W1, L0, ND }, /* add */
@@ -2212,6 +2221,9 @@ static const struct evex {
     { { 0x81, 0x30 }, 6, T, W, pfx_no, Wn, L0, ND }, /* xor */
     { { 0x81, 0x30 }, 4, T, W, pfx_66, W0, L0, ND }, /* xor */
     { { 0x81, 0x30 }, 6, T, W, pfx_66, W1, L0, ND }, /* xor */
+    { { 0x81, 0x38 }, 6, T, R, pfx_no, Wn, L0, SCC }, /* ccmp<scc> */
+    { { 0x81, 0x38 }, 4, T, R, pfx_66, W0, L0, SCC }, /* ccmp<scc> */
+    { { 0x81, 0x38 }, 6, T, R, pfx_66, W1, L0, SCC }, /* ccmp<scc> */
     { { 0x83, 0x00 }, 3, T, W, pfx_no, Wn, L0, ND }, /* add */
     { { 0x83, 0x00 }, 3, T, W, pfx_66, Wn, L0, ND }, /* add */
     { { 0x83, 0x08 }, 3, T, W, pfx_no, Wn, L0, ND }, /* or */
@@ -2226,6 +2238,11 @@ static const struct evex {
     { { 0x83, 0x28 }, 3, T, W, pfx_66, Wn, L0, ND }, /* sub */
     { { 0x83, 0x30 }, 3, T, W, pfx_no, Wn, L0, ND }, /* xor */
     { { 0x83, 0x30 }, 3, T, W, pfx_66, Wn, L0, ND }, /* xor */
+    { { 0x83, 0x38 }, 3, T, R, pfx_no, Wn, L0, SCC }, /* ccmp<scc> */
+    { { 0x83, 0x38 }, 3, T, R, pfx_66, Wn, L0, SCC }, /* ccmp<scc> */
+    { { 0x84 }, 2, T, R, pfx_no, WIG, L0, SCC }, /* ctest<scc> */
+    { { 0x85 }, 2, T, R, pfx_no, Wn, L0, SCC }, /* ctest<scc> */
+    { { 0x85 }, 2, T, R, pfx_66, Wn, L0, SCC }, /* ctest<scc> */
     { { 0x8f, 0xc0 }, 2, F, R, pfx_no, Wn, L0, ND }, /* pop2 */
     { { 0xa5 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shld */
     { { 0xa5 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shld */
@@ -2308,12 +2325,16 @@ static const struct evex {
     { { 0xf0 }, 2, T, R, pfx_no, Wn, L0 }, /* crc32 */
     { { 0xf1 }, 2, T, R, pfx_no, Wn, L0 }, /* crc32 */
     { { 0xf1 }, 2, T, R, pfx_66, Wn, L0 }, /* crc32 */
+    { { 0xf6, 0x00 }, 3, T, R, pfx_no, WIG, L0, SCC }, /* ctest<scc> */
     { { 0xf6, 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* not */
     { { 0xf6, 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* neg */
     { { 0xf6, 0x20 }, 2, T, R, pfx_no, WIG, L0 }, /* mul */
     { { 0xf6, 0x28 }, 2, T, R, pfx_no, WIG, L0 }, /* imul */
     { { 0xf6, 0x30 }, 2, T, R, pfx_no, WIG, L0 }, /* div */
     { { 0xf6, 0x38 }, 2, T, R, pfx_no, WIG, L0 }, /* idiv */
+    { { 0xf7, 0x00 }, 6, T, R, pfx_no, Wn, L0, SCC }, /* ctest<scc> */
+    { { 0xf7, 0x00 }, 4, T, R, pfx_66, W0, L0, SCC }, /* ctest<scc> */
+    { { 0xf7, 0x00 }, 6, T, R, pfx_66, W1, L0, SCC }, /* ctest<scc> */
     { { 0xf7, 0x10 }, 2, T, W, pfx_no, Wn, L0, ND }, /* not */
     { { 0xf7, 0x10 }, 2, T, W, pfx_66, Wn, L0, ND }, /* not */
     { { 0xf7, 0x18 }, 2, T, W, pfx_no, Wn, L0, ND }, /* neg */
@@ -2333,6 +2354,7 @@ static const struct evex {
     { { 0xff, 0x08 }, 2, T, W, pfx_no, Wn, L0, ND }, /* dec */
     { { 0xff, 0x08 }, 2, T, W, pfx_66, Wn, L0, ND }, /* dec */
     { { 0xff, 0xf0 }, 2, F, W, pfx_no, Wn, L0, ND }, /* push2 */
+#undef SCC
 #undef ND
 #endif /* __x86_64__ */
 }, evex_map5[] = {
@@ -2851,10 +2873,13 @@ void predicates_test(void *instr, struct
 
         for ( x = 0; x < ARRAY_SIZE(evex); ++x )
         {
+            unsigned int scc;
+
             if ( evex[x].tbl == evex_map4 && !m )
                 continue;
 
-            for ( t = 0; t < evex[x].num; ++t )
+            for ( t = 0, scc = 0; t < evex[x].num;
+                  t += (!evex[x].tbl[t].scc || ++scc == 0x10) )
             {
                 uint8_t *ptr = instr;
                 unsigned int l;
@@ -2864,7 +2889,8 @@ void predicates_test(void *instr, struct
                 *ptr++ = 0x62;
                 *ptr++ = 0xf1 + x;
                 *ptr++ = 0x7c | evex[x].tbl[t].pfx;
-                *ptr++ = 0x08 | evex[x].tbl[t].mask;
+                *ptr++ = evex[x].tbl[t].scc ? (scc &= 0xf)
+                                            : 0x08 | evex[x].tbl[t].mask;
 
                 for ( l = 3; l--; )
                 {
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2296,6 +2296,56 @@ int main(int argc, char **argv)
         cpu_policy.feat.movrs = movrs;
     }
 
+    printf("%-40s", "Testing ccmpfl {dfv=cf} $1,(%r21)...");
+    if ( cpu_has_apx_nci_ndd_nf )
+    {
+        instr[0] = 0x62; instr[1] = 0xfc; instr[2] = 0x0c; instr[3] = 0x0b;
+        instr[4] = 0x83; instr[5] = 0x7d; instr[6] = 0x00; instr[7] = 0x01;
+        regs.rip = (unsigned long)&instr[0];
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(AF, SF);
+        load_egpr(21, (unsigned long)res);
+        res[0] = 1;
+        bytes_read  = 0;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[8]) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (EFLAGS_ALWAYS_SET | X86_EFLAGS(CF, PF))) ||
+             bytes_read != 4 )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing ctestzl {dfv=} %r21d,%esi...");
+    if ( cpu_has_apx_nci_ndd_nf )
+    {
+        instr[0] = 0x62; instr[1] = 0xe4; instr[2] = 0x04; instr[3] = 0x04;
+        instr[4] = 0x85; instr[5] = 0xee;
+        regs.rip = (unsigned long)&instr[0];
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(ZF, PF);
+        regs.esi = 0x87654321U;
+        load_egpr(21, 0x88776655U);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[6]) ||
+             ((regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS_AF)) !=
+              (EFLAGS_ALWAYS_SET | X86_EFLAGS_SF)) ||
+             (regs.esi != 0x87654321) )
+            goto fail;
+        /* And again, now with ZF clear. */
+        regs.rip = (unsigned long)&instr[0];
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[6]) ||
+             ((regs.eflags & EFLAGS_MASK) != EFLAGS_ALWAYS_SET) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing jmpabs $0x123456789abc...");
     if ( cpu_has_apx_f )
     {
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -671,6 +671,20 @@ static const struct map4_table {
         [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
         [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
     },
+    [0x38] = { /* CCMP<scc> (byte) */
+        [vex_np] = { .byte = true },
+    },
+    [0x39] = { /* CCMP<scc> ({,d,q}word) */
+        [vex_np] = { },
+        [vex_66] = { },
+    },
+    [0x3a] = { /* CCMP<scc> (byte) */
+        [vex_np] = { .byte = true },
+    },
+    [0x3b] = { /* CCMP<scc> ({,d,q}word) */
+        [vex_np] = { },
+        [vex_66] = { },
+    },
     [0x40 ... 0x4f] = { /* {,CF}CMOVcc, SETcc */
         [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
         [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
@@ -705,6 +719,13 @@ static const struct map4_table {
         [vex_66] = { .to_mem = true, .imm8 = true, .nd = true,
                      .nci_ndd_nf = true },
     },
+    [0x84] = { /* CTEST<scc> (byte) */
+        [vex_np] = { .byte = true },
+    },
+    [0x85] = { /* CTEST<scc> ({,d,q}word) */
+        [vex_np] = { },
+        [vex_66] = { },
+    },
     [0x8f] = { /* Grp1a */
         [vex_np] = { .nd = true },
     },
@@ -1297,6 +1318,11 @@ decode_map4(struct x86_emulate_state *s,
 
     switch ( ctxt->opcode & 0xff )
     {
+    case 0x38 ... 0x3b: /* ccmp<scc> */
+    case 0x84 ... 0x85: /* ctest<scc> */
+        scc = true;
+        break;
+
     case 0x40 ... 0x4f:
         if ( s->evex.pfx <= vex_66 ) /* {,cf}cmov<cc> */
         {
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -756,6 +756,40 @@ test_cc(
     return (!!rc ^ (condition & 1));
 }
 
+/*
+ * Besides testing EVEX.SCC against the incoming EFLAGS this function also
+ * takes care of setting EFLAGS to what EVEX.{OF,SF,ZF,CF} holds in case the
+ * condition evaluates to false.
+ */
+static bool
+test_scc(
+    const struct x86_emulate_state *state,
+    unsigned int *eflags)
+{
+    unsigned int scc = (state->evex.RX << 3) | state->evex.opmsk;
+
+    /* SCC == 0b1010 is special (true). */
+    if ( scc == 0xa )
+        return true;
+
+    /* SCC == 0b1011 is special (false). */
+    if ( scc != 0xb && test_cc(scc, *eflags) )
+        return true;
+
+    /* Set EFLAGS from the respective default bits in EVEX. */
+    *eflags &= ~EFLAGS_MASK;
+    if ( state->evex.reg & 8 )
+        *eflags |= X86_EFLAGS_OF;
+    if ( state->evex.reg & 4 )
+        *eflags |= X86_EFLAGS_SF;
+    if ( state->evex.reg & 2 )
+        *eflags |= X86_EFLAGS_ZF;
+    if ( state->evex.reg & 1 )
+        *eflags |= X86_EFLAGS(PF, CF);
+
+    return false;
+}
+
 int x86emul_get_cpl(struct x86_emulate_ctxt *ctxt,
                     const struct x86_emulate_ops *ops)
 {
@@ -1743,11 +1777,30 @@ x86_emulate(
         }
         break;
 
+    case X86EMUL_OPC_EVEX   (4, 0x38): /* ccmp<scc> r8,r/m */
+    case X86EMUL_OPC_EVEX   (4, 0x39): /* ccmp<scc> reg,r/m */
+    case X86EMUL_OPC_EVEX_66(4, 0x39): /* ccmp<scc> r16,r/m */
+    ccmp:
+        if ( !test_scc(state, &_regs.eflags) )
+        {
+            dst.type = OP_NONE;
+            break;
+        }
+        fallthrough;
     case 0x38: case 0x39: cmp: /* cmp reg,mem */
         emulate_2op_SrcV("cmp", dst, src, _regs.eflags);
         dst.type = OP_NONE;
         break;
 
+    case X86EMUL_OPC_EVEX   (4, 0x3a): /* ccmp<scc> r/m,r8 */
+    case X86EMUL_OPC_EVEX   (4, 0x3b): /* ccmp<scc> r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0x3b): /* ccmp<scc> r/m,r16 */
+        if ( !test_scc(state, &_regs.eflags) )
+        {
+            dst.type = OP_NONE;
+            break;
+        }
+        fallthrough;
     case 0x3a ... 0x3d: /* cmp */
         emulate_2op_SrcV("cmp", src, dst, _regs.eflags);
         dst.type = OP_NONE;
@@ -2078,11 +2131,21 @@ x86_emulate(
         case 7:
             dst.val = imm1;
             if ( evex_encoded() )
-                goto unimplemented_insn;
+                goto ccmp;
             goto cmp;
         }
         break;
 
+    case X86EMUL_OPC_EVEX   (4, 0x84): /* ctest<scc> r/m,r8 */
+    case X86EMUL_OPC_EVEX   (4, 0x85): /* ctest<scc> r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0x85): /* ctest<scc> r/m,r16 */
+    ctest:
+        if ( !test_scc(state, &_regs.eflags) )
+        {
+            dst.type = OP_NONE;
+            break;
+        }
+        fallthrough;
     case 0xa8 ... 0xa9: /* test imm,%%eax */
     case 0x84 ... 0x85: test: /* test */
         emulate_2op_SrcV("test", src, dst, _regs.eflags);
@@ -2772,7 +2835,7 @@ x86_emulate(
             dst.val = imm1;
             dst.bytes = src.bytes;
             if ( evex_encoded() )
-                goto unimplemented_insn;
+                goto ctest;
             goto test;
         case 2: /* not */
             if ( ops->rmw && dst.type == OP_MEM &&


