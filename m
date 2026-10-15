Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4CDCC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:10:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450088.1665605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHTp-0001Aa-Tu; Thu, 15 Oct 2026 09:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450088.1665605; Thu, 15 Oct 2026 09:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHTp-0001AT-RI; Thu, 15 Oct 2026 09:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1450088;
 Thu, 15 Oct 2026 09:10:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHHTp-0001AL-69
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:10:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHTo-006fO4-Iw
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:10:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad09882-2eae-0a2a0a5409dd-0a2a4502b82e-12
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:10:28 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad09884-6ca4-0a2a45020019-d155dd35cc54-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:10:28 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48df8fe8513so109819f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:10:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd7319c6sm65192075e9.0.2026.10.15.02.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 02:10:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1792055428; x=1792660228; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pajwugmxj1oAgJF5ydgGa4DsXBBn331IhkZGgrXGYHc=;
        b=FMw/Y86RfncWzut8AncSoaoBsjhtH3nS+5b3TGRqP2vncDOXW1+am1Xqx0dc1TAtLK
         vu+ALHufVPDaXGfHcRpMqbCZZJWEA90jq/vWh9XUvcZEFdRmbSz9QGBgV6iJChbPPzpm
         juBUGoIBKgwIOhP8KmnqMWQE4ZdTYraPRx+vICzqlZTi8qVgggiZ+svPYlyg1rbsmSaq
         0DR5zKfM/i4erxJMTnY38PrbocnCRv+fh7suPnuNSAIzVyac18TMZ6n/f9ZfuRL6mNBb
         WxP0rKKUfmBOpknRdBNBOSBOe9CcCOD7qizpJPliPTNdxCTy44WCVKq7WuH+H69JnGFP
         iv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055428; x=1792660228;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pajwugmxj1oAgJF5ydgGa4DsXBBn331IhkZGgrXGYHc=;
        b=nfD39YaDdKVsSF0UsEXZLZsCXgTGkWl2MwXBgWGNwapgBSyG6PbXXpp7epmhV73FV8
         rLE667eZujYxdTkbYDW9LV+NAnHRpjhbl2dSuGx3hRnPLX0HYX/Wo+myL59RCHHq6e2d
         ZdHZ5fSsjAwH9JElAvi6ED9poKrgS9rA7ld85WN3wVhN+JDdz72HYUbnThmPdhzB1jLN
         hzdkEvgo3bRojvZOFFcQ/LIx2oTqZRx2UAlNTYr/xL0mTv2QCj/+vzjikDV5qx+tdKS0
         ijRKISwRE80s6mNZ/m7MJOPJZsTvr2ouqu5Gv2EP6lJAGD3JvMsnvpxK0H9tRiM9n/gm
         jvVg==
X-Gm-Message-State: AFq9FYL9Z6tZQAkqCpzE8utD8VMMYV405zUXJ8sQ4/pEE4sxNnvGeSAZ
	WUd8Y0BXP5g2oETMXgRFvh8K0/NGmqVSAGntY+ElYiY61jlt5RhqlqPmyh28OW4j5xzesTtY7f3
	TLoP2vg==
X-Gm-Gg: AYBFou18QUk11LuRL+2WzIjCY/szpgPaqPgZ8crTE+EZZOeSM+71UdzVCaCCT2PHA3d
	qlrD5Dsdyfz2RYRk7eKmrMg301XqZ6KnW7cGOnvrNAFoATiEUMh8gNbp43lJxijJ0ce2PXIShqK
	dW5O2U8Y5TvZ9seUPBK/BetPnzAyoEwHzFK/C81DCMhGSCBHgTS1x29ZC86srnfSBFFy6JIxgpO
	fTUGEbpSsGEGISM4SVwf+oDcMTzCGmbSdO+1p9wTCjsdUqigEQP93g78WnXxTMiIidhqB9GdDxU
	pJMas5BY1WKHhVlkEHYXX2Ti+ArMvrcqofYQLheHfqBnuUs6CSVkOyQDK4Te3CwiI85NldJk7Rp
	6+I4c3CqZ5v1umu+ET0MkC+ARms49jERPxgT9KAmLOcHL9obIuIGIshkJoezPxaDc3qZtP1zr7u
	YkI5NNvz2K0ubMRsjloDSCef/QvPIrK3BW39DFTa7bvJK0+hmsJQuSN/U5dv4Wan3+sbLdET62j
	cUnOEInZxzPaYI7x2wmTCg3m9uu4XUX+U1hNvr/2zDTWOUg5Up0OAmp6E0HF0k=
X-Received: by 2002:a05:600c:a112:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4a1966379f7mr258555625e9.11.1792055425863;
        Thu, 15 Oct 2026 02:10:25 -0700 (PDT)
Message-ID: <9e48f405-4e99-4258-921e-2948f0d6754d@suse.com>
Date: Thu, 15 Oct 2026 11:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/3] x86: use __builtin_popcountl() for arch_hweightl()
 when available
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
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
In-Reply-To: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1792055428-F24B62AC-CC136329/10/78276251493
X-purgate-type: spam
X-purgate-size: 764

Use the respective compiler builtin when available; no need to play any
alternatives games in such configurations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Re-base (re-do).

--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -500,6 +500,9 @@ static always_inline unsigned int arch_f
 
 unsigned int arch_generic_hweightl(unsigned long x);
 
+#ifdef __POPCNT__
+#define arch_hweightl __builtin_popcountl
+#else /* !__POPCNT__ */
 static always_inline unsigned int arch_hweightl(unsigned long x)
 {
     unsigned int r;
@@ -525,5 +528,6 @@ static always_inline unsigned int arch_h
     return r;
 }
 #define arch_hweightl arch_hweightl
+#endif /* __POPCNT__ */
 
 #endif /* _X86_BITOPS_H */


