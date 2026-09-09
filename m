Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1026AC79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:59:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412990.1643267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HtX-0005BA-0Y; Wed, 09 Sep 2026 12:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412990.1643267; Wed, 09 Sep 2026 12:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HtW-0005B3-Tz; Wed, 09 Sep 2026 12:59:18 +0000
Received: by outflank-mailman (input) for mailman id 1412990;
 Wed, 09 Sep 2026 12:59:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4HtV-0005At-Dx
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:59:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HtU-002MF2-Qc
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:59:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1581b-bab6-0a2a0a5309dd-0a2a4504854e-16
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:59:16 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15824-b57f-0a2a45040019-d155dd2bcd3d-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:59:16 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48441a2ba14so4887665f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 05:59:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c074asm42807935f8f.23.2026.09.09.05.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 05:59:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788958756; x=1789563556; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w7BwYGLPgsKXy885hcRpE5vhEVrFLgWJ5GO8dwiELeY=;
        b=ZIFov2F7D+xg/PTLsYfAMzErJlypSh6sXh5wgI6N2CyXZyS+19lE+aCVL3vRyDTsIF
         OyTTAWJ8hO+L9gRKpmsRCDWpQphi7+N5ybApfIElfnI8JmZ6pZgCvNoKFxf6HHWRRBKo
         iYz+HDSv0DS91ruPxPpLNqBHUm81m6VBw53MLcDV4cxsbR6H+CvHspt7UeFFJHtixmtV
         0HCH4O5GDv+KODTs3x/jWjfXH/DJvo1U82E4kMcMCXuEEmavWNjtlQJu0ztcnVgEVceM
         nAb5ORGMhcgyYKzGwMUgRFhi7S0zTnp4qY++TSo+e2x51KZNXtxbpTjOA7xOePHf1O2v
         LBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958756; x=1789563556;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w7BwYGLPgsKXy885hcRpE5vhEVrFLgWJ5GO8dwiELeY=;
        b=aHd0lMUVH/IDPq8J1gY4u0XIjzNgqSHZ6VYGTiICkEKPvxbF4mxIWHlp/7UWZbGENy
         qL9p0jq5YDi4mi3O09O+7zkFOiSyMxbO7mNBWNsNRxKge2S1FZgaFeBqATjlb0bbd+AT
         GATXa3MAMcTUQj+UBUTIKGN9HjfaeDizHWXI0gm816QK4/ZJ40OE/RFuy3iszozqfvfR
         ZHGsVWY39PA/CRcJnqEX7OcFsOnStuc+iDDS9gncoPaKU8M1ujphZWUnl4eVd4k7Mgug
         KBz4U1CpyeV4yXg6gI11JXToHDrbWKTbCZSyZobK3ThsnUr6Odna7c8J9pccMGiONESp
         5diQ==
X-Gm-Message-State: AFuF++mXce3uup0C9WyJ/aQcAlnfNjbnWdhtBbHnQTPFMpRp6IQdeWZg
	j+HJMj+9CKrqnd1Cwm4E78PGJTN1pq7OzgQl05mp4avcbrIne8GS9J+OV3rZdJ/Ah1st3ZReVzr
	0TrNtvQ==
X-Gm-Gg: AYBFou2imAfbChjSQ2ZpN441X6kt8eT0IOlWnkuQUIOlXq2bt1BpMQuV7kU0xKT7XHJ
	/bCIwLPoeFtEC4qh5gCr/6ac1navtScLFcU4ZN06GBJwPttXVioxRp1GjWeNv+uGeoi+Rrkds9g
	+PmLIORj3oRmL/MDSsbD/U5nVrt+YRVHuKMLLjAJcKnmFXmixbhI0z8679Dc+tgwND+s8PBS3DA
	82dESpjP8C2Vx7rS+s7j2GHcRtLsUxd3aDerkqVcdGuRbO7nJx4HbmxtKyTKSqzfoJp4RtYMnpP
	438MelZkHCxLJ5XO/ZjI9kkqevcvBnAeyg/arn2f63LMnoKtsu85rnltlspCbi4uG7f5s24hpGY
	nHrkNwjqwpoe6x2VjU1HEC5brZl5iay0+trNQuNCBocyVTB0u/wITKDkK7cB+BGlMKMrI7oocDM
	pifF9cIUb/WfA4nOP8M6pbxLxduQ6MW7WpDnyiyPEtMSnhGUB1kZ88SAHJXPUhzS8iUQD/1Imsu
	qEz4smBjYtBo5t8qgJH7Fm+aDdhb82LsA1Zkmjmm19UU2IcvGXfD92hQWV6PGc=
X-Received: by 2002:a5d:5e09:0:b0:485:956a:1607 with SMTP id ffacd0b85a97d-485956a162emr22560186f8f.40.1788958756180;
        Wed, 09 Sep 2026 05:59:16 -0700 (PDT)
Message-ID: <cad11ffe-43fe-4a0e-b890-2e2838170e97@suse.com>
Date: Wed, 9 Sep 2026 14:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/6] x86/PV: adjust APPEND_CALL() to comply to Misra rule 18.2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
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
In-Reply-To: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788958756-583C0B50-2BB92F9C/0/0
X-purgate-type: clean
X-purgate-size: 1268

While casting to pointer types may be more natural there, the subtraction
then ends up violating "Subtraction between pointers shall only be applied
to pointers that address elements of the same array". Use long arithmetic
instead.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Depends on "Eclair: relax long <-> function-pointer conversion deviation"
to not introduce other violations in turn.

--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -92,7 +92,8 @@ static io_emul_stub_t *io_emul_stub_setu
 #define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p += sizeof(b); })
 #define APPEND_CALL(f)                                                  \
     ({                                                                  \
-        long disp = (void *)(f) - (stub_va + (p - ctxt->io_emul_stub) + 5); \
+        long disp = (long)(f) -                                         \
+                    ((long)stub_va + (p - ctxt->io_emul_stub) + 5);     \
         BUG_ON((int32_t)disp != disp);                                  \
         *p++ = 0xe8;                                                    \
         *(int32_t *)p = disp; p += 4;                                   \


