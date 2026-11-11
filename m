Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D0606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GhG+5/JM
Received: from list by lists.xenproject.org with outflank-mailman.1483657.1687018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8gh-0006ly-QP; Wed, 11 Nov 2026 13:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483657.1687018; Wed, 11 Nov 2026 13:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8gh-0006lp-Nc; Wed, 11 Nov 2026 13:48:31 +0000
Received: by outflank-mailman (input) for mailman id 1483657;
 Wed, 11 Nov 2026 13:48:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8gg-0006lO-Qc
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:48:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8gg-00HaDi-7G
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:48:30 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4721f-8faa-0a2a0a5109dd-0a2a4507a3cc-30
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:30 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4722d-b4ea-0a2a45070019-d1558034f1cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:29 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso27797605e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:48:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba09517bc7sm41331065e9.3.2026.11.11.05.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:48:28 -0800 (PST)
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
        d=suse.com; s=google; t=1794404909; x=1795009709; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F/mvlQl0k6jSGOvpdRZ85j9xwtTkZSxgUoGQsZFhe2M=;
        b=GhG+5/JM8tvN+Ll/uayMdPBO6O97yPlkLHLGAf8iq26LuKGNJuubm6Lh5ON/tQTsRu
         qnVmQCa88VwH6GYLrYXorvEKYKYSxa0OcF/7Dotsvk/z/QKsow3x47T1NHhslVltSB+x
         pORda5S2Tqv3Nnqzgka6sRPUXCtixWz69V02+Mvo+vXCyAE9GYhNs3UsqujrzpWcMO/R
         Ksx4JAhbdnng/ZY8KNe9LPr6EvvI3vJGGG2rrcCO/XZMqsWChAry5tAZSq2kbatWZf54
         OAsiR31ra9+AjhFdE4JYnTlSmE5vcCx7G9w365MMDXv2rh62mhGNodbYh0r+KWm45m91
         GOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404909; x=1795009709;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F/mvlQl0k6jSGOvpdRZ85j9xwtTkZSxgUoGQsZFhe2M=;
        b=xhSOXwMf9lcncC4y01PxG4hCXZTfvXVEzndeuJkZukBcU3fomZzXPaZh+FhnJpvDvn
         8KvNTq3Mk0IabmIxTfDk2Jr+GEAcSQ1JrNimOBLLaDP1ujRzUe0dTTUb1amhwuYOt4Wv
         bJpZvSwJh1NmWyODtVIxkLx+8508XD62hR42nZnP6AnHxYQcfzwIFQY/rQzEYK9VIWje
         4tZzKQmuXYRBdP/ke89CNUV7JMQk3siPPXmSnYfwr71pQwhWo7jAQQtOzEOrt9V/DDgM
         Dufotil/SKBYhdPnz9HxBdvIskTkqiPXXCnjcKSg8QeCh7ykRfIMr2tGqsjkeHupuArU
         SFmQ==
X-Gm-Message-State: APuU4Z8FFBYoo0jK+2J6VNsjrscIH1TRfQYopJS7zTwli+D9EEjbilkF
	Pld+hs5LvEfif64goSedtydym9SGMMzRvpvuGB6HD9JGD38VRkmOZyzlm3u/XzziAsYUbUpWlFI
	NB99zdA==
X-Gm-Gg: AYBFou3vejYjcYGgR6TsFVWuTHnaYmS1+uBIQwssbwWC9SprVlrSluYfuRErD8BrCWQ
	6I/cXPlV3l4SMG6QL5vcPEahQQcEadAgCbpBGh+ZXlW8PAWlaB1/QfEYCqHn3NTTiypp7HDg8RZ
	afSwJH9TbJHWSju9F4BD3YkP3nPr1dtetTXuZoqgZc+ScSnB/aAjdtbMji2kyCkP6WvMLOBrBuM
	n3huN5+Fr02ZtJsOhRydp6gOaT3OYRacAsmG7h9MJEEUdiwSWU1LaHRMCi+sd+Hgu4qKTUcSYvW
	ABu+mrACyWjr4jAOTuwpYZ7bNH9uzZS23VjC98dfN/cu07c/Iwx6aNN8oTUsqRb/zi70WGuQqoN
	t6hvEXxX57mDwZ1fu6URVs3efNDvCD9nVCjDyFlsNbkik1raz3cnx316aVHL2258wQh7D/MRYcC
	P4Nq/pcjI+4I9bZpbzkoG14/XXavvD6jDudSIAQjQu2anAEyih1uQh7+RY5RBQiYWZPyxRL7JOg
	UCymGlH86cjcbj9ZKZWldygqyyZwTkwT0oaVcl1gNDcL6jm1qQFMqCWhrH7wC8wVWXgjMaAYyoL
	MpZHGmT74MqValH3DViRw2+CvUPfSXYj4kanVJWrcQjK+p/WccjLVPdYsRYhH2ukrInfT4XfXBG
	VaggLbmIhJRz2x7VbanBA5SOEExv+7daLw24KXzI=
X-Received: by 2002:a05:600c:4504:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ba09375b67mr45822565e9.14.1794404908997;
        Wed, 11 Nov 2026 05:48:28 -0800 (PST)
Message-ID: <effe5540-97c6-4263-8818-ab156221062c@suse.com>
Date: Wed, 11 Nov 2026 14:48:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 16/19] x86emul: support other AVX10.2 convert insns
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
X-purgate-ID: tlsNG-ef75cf/1794404909-A4AC8AE4-33B0C136/10/78276251493
X-purgate-type: spam
X-purgate-size: 10675
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Despite most of them being about conversion to BF8/HF8, they are still
somewhat similar to various existing convert insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
SDE: -dmr / -future
---
v4: Update to spec version 3. Switch to using fallthrough pseudo-keyword.
    Series re-ordering adjustments. Update to spec version 6. Add ChangeLog entry.
v3: New.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -17,7 +17,7 @@ The format is based on [Keep a Changelog
 
 ### Added
  - On x86:
-   - Support for AVX10.1. (Experimental)
+   - Support for AVX10.2. (Experimental)
 
 ### Removed
  - On Arm:
--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -727,8 +727,22 @@ static const struct test avx10_2_all[] =
     INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN(cvt2ph2bf8,       f2, 0f38, 74,    vl, fp16, vl),
+    INSN(cvt2ph2bf8s,      f2, map5, 74,    vl, fp16, vl),
+    INSN(cvt2ph2hf8,       f2, map5, 18,    vl, fp16, vl),
+    INSN(cvt2ph2hf8s,      f2, map5, 1b,    vl, fp16, vl),
+    INSN(cvt2ps2phx,       66, 0f38, 67,    vl,    d, vl),
+    INSN(cvtbiasph2bf8,      , 0f38, 74,    vl, fp16, vl),
+    INSN(cvtbiasph2bf8s,     , map5, 74,    vl, fp16, vl),
+    INSN(cvtbiasph2hf8,      , map5, 18,    vl, fp16, vl),
+    INSN(cvtbiasph2hf8s,     , map5, 1b,    vl, fp16, vl),
+    INSN(cvthf82ph,        f2, map5, 1e,  vl_2,    b, vl),
     INSN(cvtbf162ibs,      f2, map5, 69,    vl, bf16, vl),
     INSN(cvtbf162iubs,     f2, map5, 6b,    vl, bf16, vl),
+    INSN(cvtph2bf8,        f3, 0f38, 74,    vl, fp16, vl),
+    INSN(cvtph2bf8s,       f3, map5, 74,    vl, fp16, vl),
+    INSN(cvtph2hf8,        f3, map5, 18,    vl, fp16, vl),
+    INSN(cvtph2hf8s,       f3, map5, 1b,    vl, fp16, vl),
     INSN(cvtph2ibs,          , map5, 69,    vl, fp16, vl),
     INSN(cvtph2iubs,         , map5, 6b,    vl, fp16, vl),
     INSN(cvtps2ibs,        66, map5, 69,    vl,    d, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1952,6 +1952,7 @@ static const struct evex {
     { { 0x64 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{d,q} */
     { { 0x65 }, 2, T, R, pfx_66, Wn, Ln }, /* vblendmp{s,d} */
     { { 0x66 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{b,w} */
+    { { 0x67 }, 2, T, R, pfx_66, W0, Ln }, /* vcvt2ps2phx */
     { { 0x68 }, 2, T, R, pfx_f2, Wn, Ln }, /* vp2intersect{d,q} */
     { { 0x70 }, 2, T, R, pfx_66, W1, Ln }, /* vpshldvw */
     { { 0x71 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshldv{d,q} */
@@ -1959,6 +1960,9 @@ static const struct evex {
     { { 0x72 }, 2, T, R, pfx_f3, W1, Ln }, /* vcvtneps2bf16 */
     { { 0x72 }, 2, T, R, pfx_f2, W1, Ln }, /* vcvtne2ps2bf16 */
     { { 0x73 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshrdv{d,q} */
+    { { 0x74 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2bf8 */
+    { { 0x74 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtph2bf8 */
+    { { 0x74 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvt2ph2bf8 */
     { { 0x75 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2{b,w} */
     { { 0x76 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2{d,q} */
     { { 0x77 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2p{s,d} */
@@ -2124,8 +2128,15 @@ static const struct evex {
 }, evex_map5[] = {
     { { 0x10 }, 2, T, R, pfx_f3, W0, LIG }, /* vmovsh */
     { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovsh */
+    { { 0x18 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2hf8 */
+    { { 0x18 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtph2hf8 */
+    { { 0x18 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvt2ph2hf8 */
+    { { 0x1b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2hf8s */
+    { { 0x1b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtph2hf8s */
+    { { 0x1b }, 2, T, R, pfx_f2, W0, Ln }, /* vcvt2ph2hf8s */
     { { 0x1d }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2phx */
     { { 0x1d }, 2, T, R, pfx_no, W0, LIG }, /* vcvtss2sh */
+    { { 0x1e }, 2, T, R, pfx_f2, W0, Ln }, /* cvthf82ph */
     { { 0x2a }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsi2sh */
     { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2si */
     { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2si */
@@ -2187,6 +2198,9 @@ static const struct evex {
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
     { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
     { { 0x6f }, 2, T, R, pfx_f2, Wn, Ln }, /* vmovrs{b,w} */
+    { { 0x74 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2bf8s */
+    { { 0x74 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtph2bf8s */
+    { { 0x74 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvt2ph2bf8s */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2uqq */
     { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2usi */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -378,8 +378,10 @@ static const struct ext0f38_table {
     [0x62] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_bw },
     [0x63] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_bw },
     [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x67] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x68] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x74] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x75 ... 0x76] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x77] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x78] = { .simd_size = simd_other, .two_op = 1 },
@@ -1439,6 +1441,15 @@ int x86emul_decode(struct x86_emulate_st
             s->simd_size = ext0f38_table[b].simd_size;
             if ( evex_encoded() )
             {
+                switch ( b )
+                {
+                case 0x74: /* cvt{bias,ne,ne2}ph2bf8 */
+                    s->fp16 = true;
+                    if ( s->evex.pfx != vex_f2 )
+                        d |= TwoOp;
+                    break;
+                }
+
                 /*
                  * VPMOVUS* are identical to VPMOVS* Disp8-scaling-wise, but
                  * their attributes don't match those of the vex_66 encoded
@@ -1586,6 +1597,23 @@ int x86emul_decode(struct x86_emulate_st
 
             switch ( b )
             {
+            case 0x18: /* vcvt{bias,ne,ne2}ph2hf8 */
+            case 0x1b: /* vcvt{bias,ne,ne2}ph2hf8s */
+            case 0x74: /* vcvt{bias,ne,ne2}ph2bf8s */
+                s->fp16 = true;
+                d = DstReg | SrcMem;
+                if ( s->evex.pfx != vex_f2 )
+                    d |= TwoOp;
+                s->simd_size = simd_other;
+                disp8scale = s->evex.brs ? 1 : 4 + s->evex.lr;
+                break;
+
+            case 0x1e: /* vcvthf82ph */
+                d = DstReg | SrcMem | TwoOp;
+                s->simd_size = simd_other;
+                disp8scale = 3 + s->evex.lr;
+                break;
+
             case 0x78:
             case 0x79:
                 /* vcvt{,t}ph2u{d,q}q need special casing */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6293,6 +6293,30 @@ x86_emulate(
         }
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x74): /* vcvtbiasph2bf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x74): /* vcvtph2bf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x74): /* vcvt2ph2bf8 [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x18): /* vcvtbiasph2hf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x18): /* vcvtph2hf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x18): /* vcvt2ph2hf8 [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x1b): /* vcvtbiasph2hf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x1b): /* vcvtph2hf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x1b): /* vcvt2ph2hf8s [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x74): /* vcvtbiasph2bf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x74): /* vcvtph2bf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x74): /* vcvt2ph2bf8s [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        fault_suppression = false;
+        fallthrough;
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0x67): /* vcvt2ps2phx [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        if ( !cp->avx10.avx10_v1_aux )
+            vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x68): /* vp2intersect{d,q} [xyz]mm/mem,[xyz]mm,k+1 */
         vcpu_must_have(avx512_vp2intersect);
         generate_exception_if(evex.opmsk || !evex.r || !evex.R, X86_EXC_UD);
@@ -7996,6 +8020,15 @@ x86_emulate(
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_F2(5, 0x1e): /* vcvthf82ph [xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
+        if ( !cp->avx10.avx10_v1_aux )
+            vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 8 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_66(5, 0x51): /* vsqrtbf16 [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x58): /* vaddbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x59): /* vmulbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -411,7 +411,7 @@ XEN_CPUFEATURE(TSA_L1_NO,          18*32
 
 /* x86-ecosystem-defined CPU features, CPUID level 0x00000024:1.ecx, word 19 */
 XEN_CPUFEATURE(AVX10_BMM,          19*32+ 1) /*   AVX10-BMM Instructions */
-XEN_CPUFEATURE(AVX10_V1_AUX,       19*32+ 2) /*   AVX10 V1 Auxiliary Instructions */
+XEN_CPUFEATURE(AVX10_V1_AUX,       19*32+ 2) /*a  AVX10 V1 Auxiliary Instructions */
 XEN_CPUFEATURE(AVX10_V2_AUX,       19*32+ 3) /*   AVX10 V2 Auxiliary Instructions */
 
 #endif /* XEN_CPUFEATURE */


