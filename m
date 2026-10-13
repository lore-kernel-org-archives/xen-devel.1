Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6C9CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:02:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446873.1662980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZLC-00033l-LT; Tue, 13 Oct 2026 10:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446873.1662980; Tue, 13 Oct 2026 10:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZLC-00033e-Ie; Tue, 13 Oct 2026 10:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1446873;
 Tue, 13 Oct 2026 10:02:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZLB-00033W-H9
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:02:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZLA-008KqQ-U1
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:02:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace01b9-8faa-0a2a0a5109dd-0a2a4502839c-20
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:02:36 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace01bc-6ca4-0a2a45020019-d1558033b12d-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:02:36 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so23835185e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 03:02:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18ca51465sm266695565e9.4.2026.10.13.03.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:02:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1791885756; x=1792490556; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnNfUjR5ts0AhBZ8/zYArDz7AA7tizmaC4J+0l6WxyM=;
        b=QpxbrygI1ID1cu3FF5zuOHt+bIAPFQmxbgse3FdahKRQlKi+iRKzfL7iCsL+8uo8W+
         5VSAyWBZbVj/tbvGA7lB48JRgrUusSrAqDPcx9fcNdxMbM5pTbml2SERvh2c8xt5kSlZ
         aUdWg4pPYoHu1T44JkdHP2jki2sSFv1iMwAGjra2w++2NMXtxtuGcw1bNIUi3r95/Tdw
         C2byR1T53BQnrd9CDK+4X3C/OadNHTGwQT1R9VLwWjRSMRYN5E+bRCMg8H8yr8ZlPLvq
         iJNXNBlDQWSO8qpx1Ul9bq1jGPjoaX1Yn9tWbKeMAv7+c2aKWV6UIy0Eqess+CSBKBpy
         EEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885756; x=1792490556;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnNfUjR5ts0AhBZ8/zYArDz7AA7tizmaC4J+0l6WxyM=;
        b=Z8rUF6UEIumMN19fLFambGWafH66jZ1jkdVOVsuMV03H9fgLK8dsC6+S4KYFpesIY7
         5TDL0+rhGh6d48U1yO7bfI5T+nvoo6KYrVHvief0bkQCBKmL2peCeD4ZHdsQdSFRSOEb
         AXtLNnS4Y2IDVDU77/KC9A/KTG4cxpQChkR1K6xJcHwk7njJLiCpGF2y3CQDLFj6NKkw
         M68JehOAKpiZfU4d2FSBAa0YvbmAW9KsFyuAK6xF+xs7820GlHtLTmOk5mvX+MqM4zeb
         vyP3HiJPlFxc98Xr6xZ5C8tpF2xfHOXqBTZzmNrKbPEpxieUSQkZdanNaZOaRq9niWk8
         oncw==
X-Forwarded-Encrypted: i=1; AKwUvByAOSZD+b0LZS0exE2FYVQ+5Md9SDzWaS+FYGBjICIHpqGWir8/FyJtzx39H7wMUUjrJsdODvxrJfI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIGn/REHjT6TTD9xSHhuetAJOyuPVIpBD0ZoAi6OGmqA0uQ4ZZl
	/KZcaI0OqQMY1hVrSQjgokE1qb+Apj9vl0dzKyCIMQSQ+MhMxRZmmnKNM9IR4PeHvQ==
X-Gm-Gg: AYBFou0gzlx3ykR85ODZ0PWqpOcMvNU7wCgOLb9Sw98j3hj6Q7VH8quTcIlF/rSwrYA
	OcGWOc2fmtS6p4IrgEuFOTWxGjqZgzTPo14x2LxeiXRWL92HiJwnfPXBMZsTwBpSQfshQuIPyVD
	ycIUpoZAtl70t2T659DQYI0JnIoJfK45owSS1FqkwxzxSQuwOg52cvQVaKr0OH7D6wZauAEtmeY
	3Tadv8W28l5wtYiw2BXV8KsPXrslYLxyG3mJlkIVJf2w5e8ynGnd/DRrgrUz2xn+BphhD+jZ2+d
	0VzxvhXwf9bPL4Hw3PDyY3gzwFEAEVYEoAW7xRoR7LgbrhCaKXKebuW2Y5tT44YzufYbPvnLZO1
	qMh4FjAw+7FOJmVCIQ1TgDSv9/WCB1yyo5HTN+aAsNEJoXjhGuv5CjA3SruNRRUPS5T1NCfRyBo
	YfcPpfEwt4nc8TIQi6ZnWX8HmuQqaxs1JGbMcG6GBEj6naPOdz3+NvZEelKvGw29a3DkepaJ+i3
	6/v+gxG974ouPRCBGbl6WwPHqCBcl00WTWd8+1gKAuQtm5oxHedHHHTq4DPUCNOUf59gzEk
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1985b87f5mr113090375e9.4.1791885755870;
        Tue, 13 Oct 2026 03:02:35 -0700 (PDT)
Message-ID: <8c0c3bbf-6365-4964-8454-ad545f76cde6@suse.com>
Date: Tue, 13 Oct 2026 12:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] x86/nestedsvm: rework nested VMRUN/VMEXIT
 handling
To: chunjie.zhu@citrix.com
Cc: ross.lagerwall@citrix.com, andrew.cooper3@citrix.com,
 roger@xenproject.org, jason.andryuk@amd.com, teddy.astie@vates.tech,
 stephen.cheng@citrix.com, lin.liu01@citrix.com,
 xen-devel@lists.xenproject.org
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
 <cover.1791625578.git.chunjie.zhu@citrix.com>
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
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1791885756-668B42AC-AD50090D/10/78276251493
X-purgate-type: spam
X-purgate-size: 930

On 10.10.2026 12:13, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> This series simplifies nested SVM execution by removing pending and
> deferred state from the VMRUN and VMEXIT paths, and includes the nested
> SVM / Viridian fixes the rework depends on.

After having spotted the 3rd questionable patch in this series now (see
below) I have to ask: What is this series aiming at? Mixing random
changes and adding confusion by improper versioning, due to inclusion
of patches which were previously submitted standalone, doesn't help.

> Stephen Cheng (1):
>   x86/svm: require VMSAVEvirt for nested virt

This patch was at v3 already. Now you're moving it back to v2.

Before I go look further, may I please ask that the state of things be
properly clarified here? And - meanwhile I have to assume almost the
entire series is affected by this - where's your own S-o-b?

Jan

