Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD2ACD98F6
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 06:19:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341699.1601962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSZL-0005rG-E7; Fri, 19 Jun 2026 06:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341699.1601962; Fri, 19 Jun 2026 06:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSZL-0005r9-BU; Fri, 19 Jun 2026 06:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1341699;
 Fri, 19 Jun 2026 06:19:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waSZJ-0005r0-TV
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 06:19:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waSZJ-00H9tQ-9K
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:19:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a34df51-2eae-0a2a0a5409dd-0a2a450cac70-42
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:19:09 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a34df5d-94a4-0a2a450c0019-d1558035ac94-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:19:09 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490bb83a3f6so11007635e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 23:19:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fcaf67asm27559815e9.0.2026.06.18.23.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 23:19:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781849949; x=1782454749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZcCv7eM3NgxQv28u8/IZASCTQPB1qjhhlhmb01KI3Q=;
        b=TiSl2BD3wUVcNYsJO7Aw0TVz0WRnrxfd13HBrU6ZFEBErmqNiqpQfTZaNHjzlqW/R4
         qepMy5JNWqdSflAW7CrVC6jTYnxU1zv3E52fKGBX5RQc4GO1iRDe4HKlFodI+V5j5smH
         WsbANcQD1cIP0yTUzRnxMzJ4TZWHOLQa+Xwyi6l4XgjW/wmJyek85OGINPlxAlGo2CUM
         kCbHxB6Ds3P0U0d208andutN19z32il9gASP7pMdPaLiSllVnTvIRc4yfxqwHQN1wS5k
         6fXcuUl5NSEUaK/3T1PDeNLaGgKYNPWFn1o6HTukEqixxT0YHt/7tTmTM+VH/pr/WG7F
         hX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781849949; x=1782454749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZcCv7eM3NgxQv28u8/IZASCTQPB1qjhhlhmb01KI3Q=;
        b=pVgMmHwAEENR35RebHj6RblB5JK0LqpP7oYMF4xdGKt2mvqWOQfL1hqaqtCOA52UlW
         o3qZMzgnw0mrB3a2hHudGr6hfi8fxvi8DluTVlsYAGSIMIo61uLOQB+EVowUGce5ISat
         F5EFEdINt6ATOGxfrjWPrhcfxrBTx+2sEv9Np+a5BP8eeLjVG+xly2m3BzOE2MPs8J4T
         Mi1DgrDPM3njkLtLaTJOXL8j1deueilVVngNVzTU19D1yvRC9V9adyJZjYzkhi09JasT
         ccejhyErMjB5GbCTGpnmrWCOWgiC/FVP9cV22TxFsMQeaT83yVpNWKjbaelQ+dq9tsNw
         48RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jKFBkMmW/AaMxjI4M5izB15FzNXHAh65ECtnKkcBS6V7XMoNCNu0qKGgh0mYnywUXPSy6j/6iiME=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywa0iK5tiY51mZvjvZMc5pU4vmund+PjAsJYQNtAVocFsQRjTJ1
	2Gsv7kyeQus6stnxxrcIekLSvzz/ZkSmncGnBJx7A0rfXWjwXv6kaUdi4kLeTZTevw==
X-Gm-Gg: AfdE7cnP6PPtGIpaaLvOyJttdTtmhsMM8TLfykl03h7KemhnGGV/Ws8ZviFEk5V/kjF
	cFz5KK43i5kIdIGwJI9AOsPauaC2bnJHXjKjvT6eM1R0mhzvmPwmyw6WTNK6mx7mAMc+ETRTt7H
	xVexBQDBqKUjwi2OZvWEWVO2M6t3yuFJ4Hsfo4ISPu+VyyZKB4rNFiGmW3I6g/fQNcLzNtDvlVu
	B5RlC8Q3Ue954WFrwf4ijzK4sPEx90Wy3ZyBDxVKNlQZSJmJpdGyNBVahtFKZeyvbsEM6pjPaGT
	z4Qj58XZ2MImfkLfebI8Q4YqIQnn+HZCWYOskn7kBMHv31bCNJnWJMzONLJFlXQlxUCL+W5QZuP
	ROp9zxDZbU05sjbSHdHac8/lDVBpkNuOlMHnfESns9+BJbq0WzlyxKNp7wlwNqVEiVe4c7rX3iQ
	eCdPz6RdVlUJOSC6PLSqP8Ya2T74yrwIEl3+/LjGPpgq5zDxkMyVrM+AwTtFHTlAyhaku2LMiVT
	j3u
X-Received: by 2002:a05:600c:4ec8:b0:490:44eb:c1e0 with SMTP id 5b1f17b1804b1-4923f57187fmr42412105e9.21.1781849948740;
        Thu, 18 Jun 2026 23:19:08 -0700 (PDT)
Message-ID: <0273d4ed-14b2-41f6-abf8-80b4cbaff924@suse.com>
Date: Fri, 19 Jun 2026 08:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794551.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@vates.tech>
 <2220e6e7-4f2e-46fa-9c13-5864797f02e7@citrix.com>
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
In-Reply-To: <2220e6e7-4f2e-46fa-9c13-5864797f02e7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781849949-DB1EEABF-A90CC5DC/0/0
X-purgate-type: clean
X-purgate-size: 796

On 18.06.2026 19:20, Andrew Cooper wrote:
> On 18/06/2026 3:50 pm, Teddy Astie wrote:
>> @@ -386,16 +381,15 @@ static int __init acpi_parse_dev_scope(
>>  
>>          case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
>>              if ( iommu_verbose )
>> -                printk(VTDPREFIX " endpoint: %pp\n",
>> -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
>> +                printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
>>  
>> -            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn) )
>> +            if ( drhd && pci_device_detect(seg, dev_sbdf.bus, dev_sbdf.dev, dev_sbdf.fn) )
> 
> I was going to suggest converting pci_device_detect(), but I see that's
> the next patch.

Nevertheless, nit: Line length wants keeping limited here.

Jan

