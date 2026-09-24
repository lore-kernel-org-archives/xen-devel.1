Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D80C98314
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 13:08:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432272.1653720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9jBS-0008KS-T4; Thu, 24 Sep 2026 13:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432272.1653720; Thu, 24 Sep 2026 13:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9jBS-0008KL-PK; Thu, 24 Sep 2026 13:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1432272;
 Thu, 24 Sep 2026 13:08:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9jBR-0008KF-JG
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:08:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9jBR-005MMr-09
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:08:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab520bc-e002-0a2a0a5209dd-0a2a4504cc46-20
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 15:08:16 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab520c0-b57f-0a2a45040019-4a7de14ca0fb-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 15:08:16 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350f91so1302621f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 06:08:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488682668e7sm16723156f8f.4.2026.09.24.06.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 06:08:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790255296; x=1790860096; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTXDkeYMET/0xfBcH2qzBnboqdiJ8NYQEGyZ74erf5o=;
        b=Q/a84SO5s4aaa3WuK78jxvBtWBNkUtsK/1fUf1H8PFrsItcXIR72TpXmufYroNULxR
         yk6MSP7lfijv+e6ogpZq+eVTDFSPm3dzfS0I6gkBezymiinlgabA23Y+CjfECXMkcaZS
         AMD5Lm06nGoui4RYm0wrYyKw9WbeK6uGbegLsyMiz/Dr1QU0WoC8LYAGb0duh8QGNX2S
         kD8iw/Pr77VPZj+K0SvK1tlnfE509jfsWDC3D9lpGV5fBwb2Ub1cdi4G0gcK3Q0/WTRS
         fCin9Kuh6SRLFj9TgP0V6xjuHgd3lMyJMakwHzUcic4IKgBY289ImqyLtCaqgxhtU6m6
         nC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255296; x=1790860096;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTXDkeYMET/0xfBcH2qzBnboqdiJ8NYQEGyZ74erf5o=;
        b=CJWT0pVWbc9ZS2u3qBvt0vgEbok4ozbLYazmrF0BT7pXbIn0hygf5j/PKmMxUo8MUL
         NBu0rvxe37UBNoL9rXm+AhHPkVdn2PVjI5mB+E1iesPXeKa6jJZZFhfY/uoxaltJL2p4
         is1fnMsCdELTox9V0Tvpur67Wl5dmwu70Ym090Q97jS9l2P+O7jZDpRwyw7HxM0q8D3a
         C+WBWErFMRw+Ljf9fq886Eb84XxR0W8viN/H+AZfS1EjRMvnJLUOsrrFZPrD8hMTqDzD
         jz/KZMqsc6vhsI0fLjiSjdq4jP2PYNFk6YibHJPf24gUrUWbI89YkDd/Xp/8LsHT8Dre
         G8IA==
X-Forwarded-Encrypted: i=1; AKwUvBxfTso2dVKc0h7pAc8GyCvn7S5PFHYJ4YJxQ3fOmrAqt0bVtTSFeR4CPFMKP4cFnIxu32cYFW77WII=@lists.xenproject.org
X-Gm-Message-State: AFuF++l8VwmHwubTXpVpDNk9vUh/8nENmnaZP5RpY2abEjsuRWRIn2r9
	iVjpIbkpmappH4x6hwLqXQpHcYNrRNlOg7TtcvpKPzO2oWA1w3eUusOeC6NWzl2uzg==
X-Gm-Gg: AYBFou0ISDXjbWScuLWCaSY8bao4WEP33FImP93qBs49yZFto15vsol/wT+w1O4H3QX
	/Zr6jD12mjWvoBHDs3O0pe7DLEY7uZFunueEgOdwlmJemSuM7RAstdsErGmUpUItzr75W9T6kQ1
	LXZO0oV0dxNCnDPfAsoB+RtboVqVh7vYeK5Q3oGV7Z/nxo1A1e3vLTHMhDQjHUwQaGvgL4uqRJw
	soI0+TJ+XMMBE9SI33cy6ceu23Q36by1SBDbRv0Y76SUF4laj+9CguL8n1mLFlLLOpe+hMIR+Nu
	2BJoTmjHrhUW8Kn9200pViYqi2aF+PRWqzdlTQRb/vxX3e5c7DrWjcrjy/ygkcMQnCZd3GTZkS+
	9ILCCG7z+RHiGN0BEuvH505iHxS4RM8IcyYEfznZ/XzjaYisNcNI1p+iMj0vZrAhDqFn/Wbgdb/
	x/zGvi/M1NMjF9055TcnNZCNtM427eDlkXhHjBPWUEeIxGo5mAOB3fwWljxa+IIZOTD9n8tsbTs
	fvk472Gi99h7yrWL8fcPwlCPNQGdzn+46O5vMvOvCMbwXOwmed6YnuUGDX1Cg==
X-Received: by 2002:a5d:64e6:0:b0:487:452:dbd3 with SMTP id ffacd0b85a97d-488718773e3mr4759528f8f.47.1790255296132;
        Thu, 24 Sep 2026 06:08:16 -0700 (PDT)
Message-ID: <2f929826-3a32-405e-9bd9-0d47006e14f6@suse.com>
Date: Thu, 24 Sep 2026 15:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Clamp Viridian features to known set
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260924110342.1045230-1-ross.lagerwall@citrix.com>
 <b444508c-1684-4999-b560-c95b9be0efb4@citrix.com>
 <f6de75b7-f936-4257-9a6b-c9ba9a3fc17b@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <f6de75b7-f936-4257-9a6b-c9ba9a3fc17b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790255296-504DBB50-86B8DA5C/0/0
X-purgate-type: clean
X-purgate-size: 1051

On 24.09.2026 14:56, Ross Lagerwall wrote:
> On 9/24/26 12:20 PM, Andrew Cooper wrote:
>> On 24/09/2026 12:03 pm, Ross Lagerwall wrote:
>>> Instead of returning EINVAL on an unknown feature bit, clamp to the
>>> known feature set.
>>
>> Sorry, but no.
>>
>> This is equivalent to saying "I've got a VM using AVX512" and Xen saying
>> "ok, I'll ignore that safety check and let you run on non-AVX512 capable
>> hardware".
>>
>> Requesting a feature that Xen doesn't know about is a hard error.
>> Truncating features out like this will cause a guest using those
>> features to malfunction.
>>
>> It is a bug that this was expressed as an HVM Param in the first place.
>> It should be part of CPU Policy, and it's on a TODO list.
> 
> But isn't this the same thing the CPU Policy code does? In
> recalculate_cpuid_policy(), it silently clamps the toolstack's choices to the
> max featureset.

Which is behavior that, if I'm not mistaken, is supposed to go away. Such
requests are intended to instead fail, down the road.

Jan

