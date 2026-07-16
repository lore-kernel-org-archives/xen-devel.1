Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609BEC4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 10:43:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363758.1615288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJYe-00007p-UH; Thu, 16 Jul 2026 10:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363758.1615288; Thu, 16 Jul 2026 10:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJYe-00007i-RJ; Thu, 16 Jul 2026 10:43:12 +0000
Received: by outflank-mailman (input) for mailman id 1363758;
 Thu, 16 Jul 2026 10:43:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkJYd-00007c-97
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 10:43:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkJYc-00DnqM-6b
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:43:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58b5ad-e002-0a2a0a5209dd-0a2a4507a3f0-30
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 12:43:10 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58b5bd-b4ea-0a2a45070019-d155dd33d4a3-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 12:43:09 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47df6a5202bso4224819f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 03:43:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f462e0cb2sm23977655f8f.0.2026.07.16.03.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 03:43:08 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784198589; x=1784803389; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s6FoX6cxGuER9i3UrmTeQDBzSToQeEvydlKKUILriu4=;
        b=ZTFEa/nhUQR0mVFNB9YMJFHrUCJn5f4PYlM1JY0lxjTRMc1M570V3B+YOExKV3Roml
         3FHnfXTDr+N/uzP0RxSTHXh433y/ewkqI3CNn1JlHNf5UiZp3U635BE1rdymcjIzAkTn
         MLRV1/J0hbukdpx7laSQ9NI6JB/Hz9R9enGUsYcdYo/sviXsYigv5ZIAqh93TIX91dVY
         Apcwh6xo6T3fxXTFzYkYq+YLvv3Fcrxk/rqfXjFigktfuHSVT2S+VNzerak3u4QeeK03
         qXFEZLAZdBtfY7Kmt2C7uawDMp21EsSk1uJIKO0mEORIz6bmngkcD9D9odu17q9uUcTm
         R3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198589; x=1784803389;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6FoX6cxGuER9i3UrmTeQDBzSToQeEvydlKKUILriu4=;
        b=EmJ8oYflFfzn0g0oiGmc1vjI+7/vTBFukjl1fysDoiFNN6E4WkQTFkkVi3IO9AKzn0
         +fujuC8Ifh6nLmMeeNBAAECUShIYCFQbDE6f7hFWFIznwLhj0m8ThEMr0Eubu3D8HcTh
         dQm/zjlS3HRp7DqhtDD3naNCK0qqjHevUP2Lo7vEmfpe0HfW0+nUXWRmh+kJMPE5QXZj
         mmoVhKqofSu5/jErDcFp198KB+sFZWhgjbUmQbPC7mDE39epW+kXh7yfPjYxgWXk9jKo
         MYU5CkEXUoI7Y+sPfI1UDPYA8wpmoR1OwrLLDR4Icaq33d8gRDOprIfvejQrb9DyetZm
         KUSw==
X-Gm-Message-State: AOJu0Yz4BUhsME3xHd6b58p1StKTIcZOHmRgY8N+WLx/5LEAIN1aHg7i
	42PAgK0TjcHgTXgCyfiSuyyw82TwWC2id0p1vYtKMv26F9QZjqvBnFCdW9eFehMf7bFenojSFL4
	w8cnxlA==
X-Gm-Gg: AfdE7cl1yls6ttlVCeU+E66e94BQ9AUHHiViCkMMSpr/ijM95hnJrWKIapvahW7rYTq
	whFGrsDTlzQC8qNuK2l3+saPyGakvVP5sS85ZAppIPsNqsBp8tkrMuLo+g+SWh9Yct772neMho6
	r2dgaPaBvoPd3Qx1iSJ8wadHN2YARxqogVRClhp1it9KT3lq6JzTH3Xu+4evniD5G5BLpAWb2BE
	u9c+E1nst8YtVJ0UqALxwFgdyfl0RqEu5t648cTxg/4pnPIWIkR/gsFHOTvrUPZogcYByrL6wXb
	PmYF2iklKf+HkHomDOVNF4MXtholp70RwwqoOvTlINvrXR7meuLmfYr6Z4udfKEIi1NocwPHrnH
	IQ2I2Wav1tuz22JBW1H892YulNTCP2Z8KDRLQd88xOSYYvIuupJa7JLZyeoAHhxwySD0YlUIJPG
	KX5EVdLWw5sPs43cO8Ecdzcl66tRPirJmMSHeJ+12wQsTBQVw/FnqxNhvDzWhQBaZScw==
X-Received: by 2002:a05:600c:8b6b:b0:493:f6f7:299e with SMTP id 5b1f17b1804b1-4953c273d48mr69755865e9.20.1784198589358;
        Thu, 16 Jul 2026 03:43:09 -0700 (PDT)
Message-ID: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
Date: Thu, 16 Jul 2026 12:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: V{,P}{COMPRESS,EXPAND}* can (wrongly) trigger
 assertion
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1784198589-A76D2AE4-F97E0DA6/0/0
X-purgate-type: clean
X-purgate-size: 1827

AFL has pointed out that the op_bytes-is-not-0 assertion in common SIMD
handling can trigger for these insns. Indeed when the (relevant part of)
the controlling mask register is 0, no memory is accessed at all. Leave
op_bytes unaltered in this case, to engage the short-circuiting in common
SIMD handling when fault_suppression is true and op_bytes is 0.

While there also correct a related typo in the test harness.

Fixes: 65f82d4ce1ea ("x86emul: support AVX512{F,_VBMI2} compress/expand insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In a release build, due to op_mask being 0 when n is 0, the short-circuit
mentioned will prevent any damage.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1946,7 +1946,7 @@ static const struct evex {
     { { 0x83 }, 2, T, R, pfx_66, W1, Ln }, /* vpmultishiftqb */
     { { 0x88 }, 2, T, R, pfx_66, Wn, Ln }, /* vpexpandp{s,d} */
     { { 0x89 }, 2, T, R, pfx_66, Wn, Ln }, /* vpexpand{d,q} */
-    { { 0x8a }, 2, T, W, pfx_66, Wn, Ln }, /* vpcompressp{s,d} */
+    { { 0x8a }, 2, T, W, pfx_66, Wn, Ln }, /* vcompressp{s,d} */
     { { 0x8b }, 2, T, W, pfx_66, Wn, Ln }, /* vpcompress{d,q} */
     { { 0x8d }, 2, F, R, pfx_66, Wn, Ln }, /* vperm{b,w} */
     { { 0x8f }, 2, F, R, pfx_66, W0, Ln }, /* vpshufbitqmb */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6236,9 +6236,11 @@ x86_emulate(
             ASSERT(op_bytes == n * elem_bytes);
             op_mask &= ~0ULL >> (64 - n);
             n = hweight64(op_mask);
-            op_bytes = n * elem_bytes;
             if ( n )
+            {
+                op_bytes = n * elem_bytes;
                 op_mask = ~0ULL >> (64 - n);
+            }
         }
         goto simd_zmm;
 

