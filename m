Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105D8C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:32:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383176.1626432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXyb-00018u-9H; Wed, 05 Aug 2026 09:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383176.1626432; Wed, 05 Aug 2026 09:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXyb-00018n-5z; Wed, 05 Aug 2026 09:31:53 +0000
Received: by outflank-mailman (input) for mailman id 1383176;
 Wed, 05 Aug 2026 09:31:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXyZ-00018h-NR
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:31:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXyZ-003zSv-3w
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:31:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7302fe-bab6-0a2a0a5309dd-0a2a4505ead8-36
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:31:50 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730306-4cb1-0a2a45050019-d155dd33d4c9-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:31:50 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso501931f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:31:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfda6afsm6884988f8f.3.2026.08.05.02.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:31:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1785922310; x=1786527110; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5ZVt/TEvWa5Y4pw8CpVX3kraK6kJ4ZA2MBNk4yY93o=;
        b=bsIggRdbkHqfEY7/rucbcqg/z9p3SuUyitrX2+KkbyADEAfK/mXrNgdaMhXunZ7rI6
         BgPLlGmtpRC/bSJa070F1aoIGiXRK8hUNun2c97QD1UMPV2SV+UM++6jYC+V+dSwBqZO
         UKd3Yz8JeBJgDG7H4+2+Ue4h3eUn8vrtV0f9txyfATuAYgObmatLcK/bGPIHgiwP8NFO
         KYiY/yO3eBIhNhHDWNVEbgCdMBgP7KiowmFB+qr6Bw65df209wniSGBWgq9JS/cYGV3g
         b07UruCv0sZAUhA9nr4hl0gzgDdUxxKOUucYTrB0xTOhaY6/5q7wXJSioKRDmnil1GC4
         Os0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922310; x=1786527110;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5ZVt/TEvWa5Y4pw8CpVX3kraK6kJ4ZA2MBNk4yY93o=;
        b=lyyvmcDGLIDDJ9FpWCbTLoBAFZFQbTFO3b+zgASt3rV5tnsHsGpxMcndsZut74yvsw
         IGDqDEEv0yAQgZF5yV0PqqTTSzLfqX2Gc1dTLPaVtLGYcfgtZbVjZmjdKevkXMsAmhJU
         EkV+CM9U0cpCYz6sqPZpD5l7F/Dqdg6dX3iK52ucbvuhVcEsTEjbS5rUdPY5x/gmjj53
         /dRqUspa3tCg/pK1gxinT3abLjzC/ljOx+WkboWWtc5uobglIhJ+VgXpx6YrowGGm36i
         TvsCILCk7V5aGH6attf9ShWFWY+GBRl7hg68jqUReEe/WSFWksiRLXowl90ru0Nrx/j7
         Snng==
X-Forwarded-Encrypted: i=1; AHgh+Rp86nBZTpxIiAoJxGl+9eH4PfxKnWjM5psMP4mBZ/PdZ/w90HbspgoIYheRy+UFoJin/TbTwI0KVNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMjpZh2EMCAKk5Z/XQv14cOPd/oaHdxtcs5h3CUYZbD41E8ZUp
	2kmxY88liA3D8wxgEHFQxrC+c1oBlo6SjMqtiQ8B9LQ0GmXGaIpVl4ED27+CYJvKrw==
X-Gm-Gg: AR+sD10uLH+HJodJ2qjosv4Sp25+3DZ8sNqWSyreTc0FdoYexYr6srswZPN2aEkyTW+
	wF0ZdyZ0AJHo3KjjyjF+QzoYl9VYc1yQ3FM4WmwMa1lbvixOpq/iGEkHXW9O6d5xCeJU98iXO4s
	Eb4wv4tfM49jnN2YiSX+xsTdW5Y7M0Tb+9wmz3gp4iFAkjYSk6wYgvBQNFyjkD0tRl4H9CzIH7n
	HwIO1obJTYoZSuTUwkjoYGZ8+0UpnyziidsrSWw1nhhLjbKo+MvevPePAO3TMocyrrDAa49O6t2
	PXzJBxeDzQv/U6A+zgZj+OUkwC2jjTvX2aq7cNMf4jHY2lqqGW95b+H3Y3XUDWQrBFsOsvf+oGG
	k10uUnYLN1kAP2suHparb8AajycR+C/OcWtM1+qtc3t5OjmkDVecpf5Iaeo3Qwb6yGEj8jUB14n
	d9KiZta7n5mz1gD8w4NzZXrkhoUwFcGWdOUP9gAPHE149hlCO8i/tcbheom5NusAaCcfz31/VGt
	BKgX7nUVYEpFjiU5eG9w5iFdQ51JlaGqFPoZW9M3n5WXK1ZmMwB
X-Received: by 2002:a05:6000:1842:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-47fec634b38mr8662442f8f.15.1785922310377;
        Wed, 05 Aug 2026 02:31:50 -0700 (PDT)
Message-ID: <07e4cde9-cbbe-4ca3-878b-1c72038e4530@suse.com>
Date: Wed, 5 Aug 2026 11:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] vtd: Print originating iommu on faults
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319342.8631fc262581453bbf619ec5b2062170.19fad533fa5000e099@vates.tech>
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
In-Reply-To: <1785319342.8631fc262581453bbf619ec5b2062170.19fad533fa5000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1785922310-F7EB92A1-14438234/0/0
X-purgate-type: clean
X-purgate-size: 650

On 29.07.2026 11:59, Teddy Astie wrote:
> When a fault occurs on a IOMMU, print the IOMMU the fault is coming from.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I think this doesn't go quite far enough - this internal index,
to be helpful, would need associating back to the respective firmware data.
What iommu_alloc() logs is not only limited to verbose mode, but also doesn't
include the index. I think something need doing there, and then we need to be
more consistent throughout to include the IOMMU index in log messages
pertaining to a particular IOMMU.

Jan

