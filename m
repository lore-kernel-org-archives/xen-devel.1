Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350AA606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MV8lzNno
Received: from list by lists.xenproject.org with outflank-mailman.1483648.1687010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8gM-0006GC-HB; Wed, 11 Nov 2026 13:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483648.1687010; Wed, 11 Nov 2026 13:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8gM-0006G4-Dk; Wed, 11 Nov 2026 13:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1483648;
 Wed, 11 Nov 2026 13:48:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8gL-0006Br-3G
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:48:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8gK-003Z1h-GH
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:48:08 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47205-2eae-0a2a0a5409dd-0a2a4509a0ca-36
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:08 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47218-be1a-0a2a45090019-d155dd2dad35-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:08 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so1941479f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:48:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cbbe5sm12323939f8f.42.2026.11.11.05.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:48:07 -0800 (PST)
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
        d=suse.com; s=google; t=1794404888; x=1795009688; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k6YNu72Sa91S1LqdNbMiAYX5ePhGQTFQs7IK7UFPfEw=;
        b=MV8lzNnos15myHn6TvjxtoEqpncYceSAFl1wKXCoOrJBFG8wSBVh6jSp7fq4dOFW4q
         P+DLeL86Mqg6Noo/4chGEHVYP1Izh2zNXbOCNu22IvUtq6P2sYrzl8Q0CaqQC6R20+v3
         +D7LCSL9xmv5oF5DDfayyHQpO5To+HIp6HuTc6KTPGi6rpv4MW6JaTsYkV2dsH4lBrVl
         H1u4hBHLbc0hdrSuSzFWaPtAk0hGsky/2wORHBW8ps34v7B4NmcArG0arRo3+RSnOMVJ
         Nu02IK/WY93sqnWqLy7Rjc7M3VhrQf8ZkJgeRxseGkhNby0NYp3xT5p7qB6FLSn9LFhr
         XU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404888; x=1795009688;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k6YNu72Sa91S1LqdNbMiAYX5ePhGQTFQs7IK7UFPfEw=;
        b=FuNeffXPAtp6LMKU7iGH6fh2Bi3nZuaun5pzJ4jtHOtkro0D1OzxedneoaO+hLKir/
         OpV0OyIEeSnivsg9Vlkc32NOBKrVqTnCo1e98UgJNA0sk0YciXDRwjFjEaBo/n/kmw2x
         dtlaQ13RrDWlzu8mrYU2+45LrQNKgdGSRb1aj/UztDLndS5ob4kPb3Z+CqiqUEdVLCb4
         MAQB+FOaURvtD2BWIHUBkLM9jL6pjpg1uiLcUE9aG3WfpcWx16o4tDk5h4H13NBAep4L
         4PwfUH8KmTo6jjY7j+b7l4PsAqxCXCnM6g7GRGVQd919Ad6P98GCPVsC72/JTuOuLmJ9
         pE6g==
X-Gm-Message-State: APuU4Z/pZu4+0HvAj9yeRmxRjCpXwXbUF7384DKYo5r7wnmLPy3iz/z+
	pBe9SLpEEXgTgsyt9em3NwyvAuuLmHQ+hQLkeCbgcwQbZGPK7CkExS7JURJC4kIVUikcvGlzBpT
	tHxU+TQ==
X-Gm-Gg: AYBFou1NtN9I1dAh4AjbZ9SNj12TIXURg6/lLYb7IhxDQsyp1KHpgmaLfhyGqSCui26
	3a9fJVhdiDA43vFu8xqrGzAns35iMZ9PUrP/YYMdWCEFP2ffjqiAPwn/V/8NqNHUnWW8KjWO1hL
	gxLrMZ77APXOyome9WyuE+3IlzPRyndYhsZhvorPbhY84j6mvf6BiFKUJpwBQoTx0rwVyRS9X2X
	rUVr9Qsn3y0SbkptiWQt+4Bf45g2Tw44A0wU9UxTa+0+yj1kAzz3IasWL91DrdTNl7/k98qiPFI
	jT3vp/Ye9CwDsFWIXJkgwbvOSuxoma72A7RFqkW6kDy4Mp28LDfHmld+8JWTlBNYSDibiXn6gDC
	gDS1jZE9d2HxjbJs937ew36gts1qU6S0fe4j92Gt8tYgXoO9wJRRBKm6dYH1WCKj+636tB6GAyF
	8VzS3SXGIlufeo0gy4zES2Zn7hUi2ockAekEeyU+7O7jAexJ2lybCTsMd9gWUs+OOuzIKHHERF4
	8LW2UQbN9mnFrWd1eO98SFu5g7+kRS6RRb4y7DwCffb4LVEegI1inkA2bsgVQj/nNu8cSwFjv6K
	i3f1zrLlzUTp8fWvB7xPfdWhODtw/JstH1n6VlPnyllwTOeCaaSQ/eJqi3cc6hzEpgj+rMSJr8L
	0Y8T5G9qdNJUD+Kej4hmBsG0gy5egwEzi+e3MOaY=
X-Received: by 2002:a05:6000:3c6:b0:48c:7143:610c with SMTP id ffacd0b85a97d-499c69cb864mr3791562f8f.36.1794404887783;
        Wed, 11 Nov 2026 05:48:07 -0800 (PST)
Message-ID: <99b4f940-39c7-4c15-b1d4-fea0e9d371e6@suse.com>
Date: Wed, 11 Nov 2026 14:48:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 15/19] x86emul: support AVX10.2 saturating convert insns
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
X-purgate-ID: tlsNG-bad1c0/1794404888-3AEDE034-A7745563/10/78276251493
X-purgate-type: spam
X-purgate-size: 9105
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While the to-byte ones are somewhat different from what has been there
(yet then nicely regular from an operands perspective), the others are
pretty similar to various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Spec rev 002 says VCVTTNEBF162I{,U}BS, yet that's going to change to
VCVTTBF162I{,U}BS.
---
SDE: -dmr / -future
---
v4: Update to spec version 3. Switch to using fallthrough pseudo-
    keyword. Series re-ordering adjustments.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -727,6 +727,30 @@ static const struct test avx10_2_all[] =
     INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN(cvtbf162ibs,      f2, map5, 69,    vl, bf16, vl),
+    INSN(cvtbf162iubs,     f2, map5, 6b,    vl, bf16, vl),
+    INSN(cvtph2ibs,          , map5, 69,    vl, fp16, vl),
+    INSN(cvtph2iubs,         , map5, 6b,    vl, fp16, vl),
+    INSN(cvtps2ibs,        66, map5, 69,    vl,    d, vl),
+    INSN(cvtps2iubs,       66, map5, 6b,    vl,    d, vl),
+    INSN(cvttbf162ibs,     f2, map5, 68,    vl, bf16, vl),
+    INSN(cvttbf162iubs,    f2, map5, 6a,    vl, bf16, vl),
+    INSN(cvttpd2dqs,         , map5, 6d,    vl,    q, vl),
+    INSN(cvttpd2qqs,       66, map5, 6d,    vl,    q, vl),
+    INSN(cvttpd2udqs,        , map5, 6c,    vl,    q, vl),
+    INSN(cvttpd2uqqs,      66, map5, 6c,    vl,    q, vl),
+    INSN(cvttph2ibs,         , map5, 68,    vl, fp16, vl),
+    INSN(cvttph2iubs,        , map5, 6a,    vl, fp16, vl),
+    INSN(cvttps2dqs,         , map5, 6d,    vl,    d, vl),
+    INSN(cvttps2ibs,       66, map5, 68,    vl,    d, vl),
+    INSN(cvttps2iubs,      66, map5, 6a,    vl,    d, vl),
+    INSN(cvttps2qqs,       66, map5, 6d,  vl_2,    d, vl),
+    INSN(cvttps2udqs,        , map5, 6c,    vl,    d, vl),
+    INSN(cvttps2uqqs,      66, map5, 6c,  vl_2,    d, vl),
+    INSN(cvttsd2sis,       f2, map5, 6d,    el,    q, el),
+    INSN(cvttsd2usis,      f2, map5, 6c,    el,    q, el),
+    INSN(cvttss2sis,       f3, map5, 6d,    el,    d, el),
+    INSN(cvttss2usis,      f3, map5, 6c,    el,    d, el),
     INSN(divbf16,          66, map5, 5e,    vl, bf16, vl),
     INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
     INSN(fmadd132bf16,       , map6, 98,    vl, bf16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2163,6 +2163,26 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_66, W0, Ln }, /* vmaxbf16 */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
+    { { 0x68 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2ibs */
+    { { 0x68 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttps2ibs */
+    { { 0x68 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvttbf162ibs */
+    { { 0x69 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2ibs */
+    { { 0x69 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2ibs */
+    { { 0x69 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtbf162ibs */
+    { { 0x6a }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2iubs */
+    { { 0x6a }, 2, T, R, pfx_66, W0, Ln }, /* vcvttps2iubs */
+    { { 0x6a }, 2, T, R, pfx_f2, W0, Ln }, /* vcvttbf162iubs */
+    { { 0x6b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2iubs */
+    { { 0x6b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2iubs */
+    { { 0x6b }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtbf162iubs */
+    { { 0x6c }, 2, T, R, pfx_no, Wn, Ln }, /* vcvttp{s,d}2udqs */
+    { { 0x6c }, 2, T, R, pfx_66, Wn, Ln }, /* vcvttp{s,d}2uqqs */
+    { { 0x6c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2usis */
+    { { 0x6c }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2usis */
+    { { 0x6d }, 2, T, R, pfx_no, Wn, Ln }, /* vcvttp{s,d}2dqs */
+    { { 0x6d }, 2, T, R, pfx_66, Wn, Ln }, /* vcvttp{s,d}2qqs */
+    { { 0x6d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2sis */
+    { { 0x6d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2sis */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
     { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1541,6 +1541,19 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
+            case 0x68: /* vcvtt{ph,ps,bf16}2ibs */
+            case 0x69: /* vcvt{ph,ps,nebf16}2ibs */
+            case 0x6a: /* vcvtt{ph,ps,bf16}2iubs */
+            case 0x6b: /* vcvt{ph,ps,nebf16}2iubs */
+                if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
+                    s->fp16 = true;
+                fallthrough;
+            case 0x6c: /* vcvttp{s,d}2u{d,q}qs, vcvtts{s,d}2usis */
+            case 0x6d: /* vcvttp{s,d}2{d,q}qs, vcvtts{s,d}2sis */
+                d |= TwoOp;
+                s->simd_size = simd_other;
+                break;
+
             case 0x6e: /* vmovw r/x/m16, xmm */
                 d = (d & ~SrcMask) | SrcMem16;
                 /* fall through */
@@ -1606,6 +1619,14 @@ int x86emul_decode(struct x86_emulate_st
                     --disp8scale;
                 break;
 
+            case 0x6c: /* vcvttps2uqqs and vcvts{s,d}2usi need special casing */
+            case 0x6d: /* vcvttps2qqs and vcvts{s,d}2si need special casing */
+                if ( s->evex.pfx == vex_66 && !s->evex.w && !s->evex.brs )
+                    --disp8scale;
+                else if ( s->evex.pfx & VEX_PREFIX_SCALAR_MASK )
+                    disp8scale = s->evex.pfx & VEX_PREFIX_DOUBLE_MASK ? 3 : 2;
+                break;
+
             case 0x7a: case 0x7b: /* vcvt{,t}ph2qq need special casing */
                 if ( s->evex.pfx == vex_66 && !s->evex.brs )
                     disp8scale = s->evex.brs ? 1 : 2 + s->evex.lr;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8056,6 +8056,55 @@ x86_emulate(
         op_bytes = 8 << evex.lr;
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F2(5, 0x68): /* vcvttbf162ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x69): /* vcvtbf162ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x6a): /* vcvttbf162iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x6b): /* vcvtbf162iubs [xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX   (5, 0x68): /* vcvttph2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x68): /* vcvttps2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x69): /* vcvtph2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x69): /* vcvtps2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6a): /* vcvttph2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6a): /* vcvttps2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6b): /* vcvtph2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6b): /* vcvtps2iubs [xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX   (5, 0x6c): /* vcvttps2udqs [xyz]mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2udqs [xyz]mm/mem,{x,y}mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6c): /* vcvttps2uqqs {x,y}mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2uqqs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6d): /* vcvttps2dqs [xyz]mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2dqs [xyz]mm/mem,{x,y}mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6d): /* vcvttps2qqs {x,y}mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2qqs [xyz]mm/mem,[xyz]mm{k} */
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 8 << ((evex.w || !evex.pfx) + evex.lr);
+        goto simd_zmm;
+
+    CASE_SIMD_SCALAR_FP(_EVEX, 5, 0x6c): /* vcvtts{s,d}2usis xmm/mem,reg */
+    CASE_SIMD_SCALAR_FP(_EVEX, 5, 0x6d): /* vcvtts{s,d}2sis xmm/mem,reg */
+        generate_exception_if((evex.reg != 0xf || !evex.RX || !evex.R ||
+                               evex.opmsk),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        if ( !evex.brs )
+            avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
+        get_fpu(X86EMUL_FPU_zmm);
+        opc = init_evex(stub);
+        goto cvts_2si;
+
     case X86EMUL_OPC_EVEX_F2(5, 0x6f): /* vmovrs{b,w} mem,[xyz]mm{k} */
         elem_bytes = 1 << evex.w;
         fallthrough;


