Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6F8C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:59:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412996.1643275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Hu0-0005e8-CW; Wed, 09 Sep 2026 12:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412996.1643275; Wed, 09 Sep 2026 12:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Hu0-0005e1-9l; Wed, 09 Sep 2026 12:59:48 +0000
Received: by outflank-mailman (input) for mailman id 1412996;
 Wed, 09 Sep 2026 12:59:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4Htz-0005cc-IQ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:59:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Hty-00Gv9n-VD
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:59:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1583f-8faa-0a2a0a5109dd-0a2a4503c250-14
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:59:46 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15842-fae8-0a2a45030019-4a7de14caabc-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:59:46 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-48583cc7ab1so106229f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 05:59:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883be709sm43699951f8f.21.2026.09.09.05.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 05:59:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1788958786; x=1789563586; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uiDbqnQFDxQWBEQL3jORPSdEhXKfJVufeVtoG8lnjEg=;
        b=Lw09bTqe/xiZX42hL+FofneeuaMNodhqY0csMH3ksA51qkGa+unXfcski+Se/MdECN
         4RyMbIUouqQ5FZGpxR0Z+fTjCgq/8tJ4dYTN18+jWAecAM+LbZPbRgE/kJLqhQKtO4pD
         ZRc2qzhZpFYBuv5+C/aojnMalQzCG6qefdftbO+NFoGFaMlJ9cZn+EOUTV0T/W9aAbPo
         l9uwC+V2TyTzXceSfJ47ODpKQqssBFrIpl0+Be8orGA1qGfCbscnFo7nb4/9q7fjkXw+
         xNuc5e8kIsrZk3x+bhBqZbYQcdWPRuqWR7TAFMxdNxzAkizizHiZbygS0Uc9zDyuKc2U
         lSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958786; x=1789563586;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uiDbqnQFDxQWBEQL3jORPSdEhXKfJVufeVtoG8lnjEg=;
        b=SQOBMkCg+l0Nl+a71a99Jc8zBRLBp3eItrEaeUQf1wk9aup3ZGAr0SDlxfpbptSppR
         TKBcet4oQEt7g28OQgJcO8+Knx9ShimYmqdt7RPSSMOYEvEON0WBds/D5Q++vqLOIvSX
         1qCSbCu3QMAN/a/0VCkstRE0NtFPq+4t9RQvcIDQBQK9vYRmIbIXWO6i18eiO9u/7Rou
         FxUip0WDgnk7uCrC3s2HYK+eVo+kA0/GlaHD/t4pWK5UOjXYXO4o2c1ydLaLOD/3DtrD
         bUJ0wTPm7mO/oqclV9y2Ex3HKLdg6+v7Fopblq2bxmDGHlWsJj6crSatjaZYp6P6X5/A
         GdmQ==
X-Gm-Message-State: AFuF++myn5cpsYvXUGSAy2t+DFwPkg9YSzR3MJfgECEwv2KoW0AsReQB
	6dj7PCHqa8TL3jEDN8gO2DUvswL1k1TkGzCYPj7PUv2An8MToa9viM0cp7lG0rpnzD95kCvIBGw
	+Rk9apg==
X-Gm-Gg: AYBFou130pG8//s1bD7/ixiLYFBYt2tsbr/lKgLGio539Deabafz+ehK5MjG/4pZNcm
	YfXddFBD3jQZ46OlGSJ9c4gGEXPcA888jZ2CEWCZCu7nz4SupINag08y6xGvJh1OdX/129mreEg
	p6b1DeLw/fBON2lvHbMdKIEGa5if4VAqf6/8YZgyV/60Q+gIpKiurIQwAKWEDQl20CPjN67y3he
	DpQnANCXl5bOYW86l5+HDcgZU1yJcy/58JyohobP4+aBJ7pmM03GwKFZ6grLZbkfKiO+fwjdhOR
	d3gJKKLVeztz7f8O/FmHmiSLOYCc+lIQ9IdUaiwKg2UTtMoJ1o+dEySyiqPv9MZFOvXgyrAgSHt
	BCOWzILS/RV+r2gkxluRRqF8T8Swii/6FQDrhZGnGFgwfkitdfRD0/KK36Ia2gCbsvlXG2EUURF
	TeL9Xd7MP70JUhRmRDuOCCcORCUnMzfXfABpq3SQSnYGpIJmJKjuNfPs5ij8sxlgqJeD8qwWYEy
	g2J9MGA59GFkWwwkAxNryaZ+jm/cNGuyA0X7GRAQdrDdMI5L2bAgMHPA6dTxfo=
X-Received: by 2002:a05:6000:400f:b0:485:8a47:5b91 with SMTP id ffacd0b85a97d-485c24042e3mr1415613f8f.46.1788958786307;
        Wed, 09 Sep 2026 05:59:46 -0700 (PDT)
Message-ID: <6e503818-3446-4bdc-8b65-d61169667b7a@suse.com>
Date: Wed, 9 Sep 2026 14:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/6] x86/alternatives: adjust _apply_alternatives() to comply
 to Misra rule 18.2
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
X-purgate-ID: tlsNG-33051d/1788958786-756834E9-296AE92E/0/0
X-purgate-type: clean
X-purgate-size: 1138

While avoiding casts would be preferable here, the subtraction ends up
violating "Subtraction between pointers shall only be applied to pointers
that address elements of the same array". Use long arithmetic instead.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -342,13 +342,13 @@ static int init_or_livepatch _apply_alte
 
         /* 0xe8/0xe9 are relative branches; fix the offset. */
         if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
-            *(int32_t *)(buf + 1) += repl - orig;
+            *(int32_t *)(buf + 1) += (long)repl - (long)orig;
         else if ( IS_ENABLED(CONFIG_RETURN_THUNK) &&
                   a->repl_len > 5 && buf[a->repl_len - 5] == 0xe9 &&
                   ((long)repl + a->repl_len +
                    *(int32_t *)(buf + a->repl_len - 4) ==
                    (long)__x86_return_thunk) )
-            *(int32_t *)(buf + a->repl_len - 4) += repl - orig;
+            *(int32_t *)(buf + a->repl_len - 4) += (long)repl - (long)orig;
 
         a->priv = 1;
 


