Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4791073C9E
	for <xen-devel@archiver.kernel.org>; Wed,  8 Apr 2026 12:20:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1275934.1561585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARta-0003hS-6G; Wed, 08 Apr 2026 12:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275934.1561585; Wed, 08 Apr 2026 12:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARta-0003hL-3N; Wed, 08 Apr 2026 12:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1275934;
 Wed, 08 Apr 2026 12:20:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARtY-0003hE-Mj
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:20:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARtY-007lJO-2f
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:20:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d64802-e002-0a2a0a5209dd-0a2a450996ca-14
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:20:31 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d6480f-bf79-0a2a45090019-d155802bc0eb-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:20:31 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso40694015e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:20:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488940e075esm522840555e9.9.2026.04.08.05.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:20:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775650831; x=1776255631; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ROGfcSkCOBNr5guYff8l0SKnfdADg27J+462m1SOZPA=;
        b=RoSwoF6lxH5h3vM66cjjP4haYx55obFo7v1XALxMqUBpQ45ubyA0UkB6+ar6bkIPXO
         PISPTArtJ8xChf8ELkMsNEYuUrKQJ+Z7vkJ+myoCsicMKFAOrqMxuR93Fi2C63fSxoWY
         ZrtivG4wqqylV1wzONcx6tFVomUA+cTXu1InApuiZU7PNK2Y63hDdLnGRCN6hML6tN39
         ODmHUkROP8l2YgyJR0DDmAT0NcwuqEU0YgoVlmxH6gxIiiHkbfiskmBmmNDrRpB3Gwuc
         4fKMwrkeIj5N+meJZljnHemBIHPOEH2YEQVLi2PvYRmobDrPQRaqNtuDzJxL1Vt5DJkT
         QsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650831; x=1776255631;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROGfcSkCOBNr5guYff8l0SKnfdADg27J+462m1SOZPA=;
        b=f9vtcyHbxDVGpb4U3BJLPrJOAIfYjPjkWJSzVXxj0sRg1yjDm6/Rayp6gmdWIEjj/j
         WnMea8GjzVzz1l4VefNpLnMC6rP+PKRou46YCsVKfyzx+hJ+KHEgdkbu1Y2UfUJm9Ga7
         FM/sZJ54l5f3ZN7olFfLnDlhc2/KmB1qphkyo8OU2AbLSGLkgwsmxs5y/rE7rMKtvcCz
         eDD7DDRqvlTELsSTpm2BhvSmm+h2wZvfMla10hZhtI26S+HNzlsYm69ae9r0pB9h7+rk
         fj3Ep4FHPG9Y5PuQtMifJECOuFba5Z8nBtc3obfUz7KF8GqzP9l7sh0/eb0G4pQ6xQNX
         VmbA==
X-Gm-Message-State: AOJu0YzI0mK8rfEXfygi3fy0MujKfq33hqL2F38bYWzaYFtSUxxKfkyj
	jB9z4H+V4fY/FLkptZFJb7rqkrAL89Zc4hpk4KnvbxU2AHPrsCpbQ6Q+aaOAEsgyOk5nfUrj/H4
	KETDoXQ==
X-Gm-Gg: AeBDieuJNiKo6B72hsiDSjBsZgCvC+kD3ls+2XN7/DzNn/sp1DVpQToZWKtHsdilZTi
	GbBBOOW/M8DaDSP86gxNcrVkgt0SSjB5d2y1JJymvYqf4Glk+YA1EzaoPyvrZkW7gs4kaj7zd/T
	Cx2LNm7jd4RdkJilVMnLJur5MiP9CNLwCAuBK34L7MagF+6Ym2QtLjiMmNf31RBz8bKzotqDw04
	AZMOiR9gc+CgtO/6JZoFeGeXLx825PmpOOcLGhlVLiiuvWJvDSNU+cFkGpjfeSDZWomJ26Lnj3c
	WkmCTgfcZdwlfSaETkI1HUAOzecbR8Z5mL2yhbcF13e7KWVqE6l9bouWOjgLeAUHIg83Bzj8D5E
	SacBPrrOhENJY0f+n2Xwyp1TkvxixRVamt9JpdhqdZ+rfxLpJ1TkPcXX8rnFVGBVGjkYzhylxPF
	YrM76rwBSBtIDIjsFN9DFLxu56KeG74JaRC8egTfWPcSNdPuQIARc3Lat2i7Rj6KzdipjFsfCCx
	3473AxkapNHBRI=
X-Received: by 2002:a05:600c:3b23:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488996ecd50mr271620495e9.10.1775650831367;
        Wed, 08 Apr 2026 05:20:31 -0700 (PDT)
Message-ID: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
Date: Wed, 8 Apr 2026 14:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86: CET-SS related adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775650831-5455B152-8FE8D687/0/0
X-purgate-type: clean
X-purgate-size: 409

One might think of this as follow-on to XSA-451, but that's not quite
the right order of events.

There are a few open aspects; see individual patches.

v2, besides addressing small issues, is mainly a re-base over FRED
work finally having gone in.

1: record SSP at non-guest entry points
2: traps: use entry_ssp in fixup_exception_return()
3: prefer shadow stack for producing call traces

Jan

