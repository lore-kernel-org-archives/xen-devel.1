Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE17CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 07:57:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446715.1662823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXNX-0001HV-1U; Tue, 13 Oct 2026 07:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446715.1662823; Tue, 13 Oct 2026 07:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXNW-0001HO-TT; Tue, 13 Oct 2026 07:56:54 +0000
Received: by outflank-mailman (input) for mailman id 1446715;
 Tue, 13 Oct 2026 07:56:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGXNV-0001FF-Ct
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 07:56:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGXNU-006tKz-G7
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:56:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acde43d-e002-0a2a0a5209dd-0a2a4509cf18-12
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:56:52 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acde444-be1a-0a2a45090019-d155802db904-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:56:52 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso19082025e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 00:56:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac35dfsm3661870f8f.33.2026.10.13.00.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 00:56:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1791878212; x=1792483012; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQRzjvQmotIeLMOuxBn9grqTl/b/VFMsHTbZZ0dydQc=;
        b=WaWHhgiaQZJrigRdrTDkL1F3sMrPRpmdTG9ch3p/GMqvqPFoIrLfaCysn2KzeQDhyD
         yGJ3MtHwJ2wLwQxm0F8vOZhwvCmfJY9R8JjwU3Jp+lgMzA9nCx+iyIi4fC38RxPtx8Bp
         8lwpOQphmRQ20PbQz2GqWzVvq7uSBVeclvgLeS2QuQdWwFXhcRif5BIly5czLiy5G+Xm
         bi9bxj5+tw4P47FzWPpE1UTAq1oMScYIa2ALhaTHUCGmSO93n1M7gv0UP41WHp+8Fsv1
         O4hHAsaDiEE400UecFkpJuyeHEiMCJa4xTzSEnSNDveWoN6fKkEWqN565IP/SRMyb8F0
         x9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878212; x=1792483012;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQRzjvQmotIeLMOuxBn9grqTl/b/VFMsHTbZZ0dydQc=;
        b=B0e+eMPwxX8IBjdMR3HP2rCCHhI2Scc8lHm63G/fo5zafOOXrNLA+YHhPywlOtB7pj
         FJejAVw9lIJ2Qm77YFaKeYdn8coGtWcRs/plx5Uli5x0bNaxnoNoZBlro732zzUdGJSU
         In6vOIkbyqVx5ubDskw2PACwWm+S4hpDJthNIKm6hZxTAoTfKcJotEyoEfS0/rQGt63P
         E8ioe6CxNSUwlus1LbCQ6te5z1WJ+riiZqTRpD6/qfyQSm9jIAEdvbb7IWiOXtjSHx4V
         QQvz3NMCYVzqlAmjSwDdfFNS6BmstAYpTIEVNjVni7vSYMjUnH48AwZytsTbtD7FdtMz
         A9lw==
X-Forwarded-Encrypted: i=1; AKwUvBzNGbDl1c9UebAvJ0wB6Lky7Ewdi5q2TW4qs6Syy0tlGqy8MkNWjjS/Tc7AzKx7rmifK/f7ujQcVWQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJhUbFkvPjvM7mMNGv/08x2w0pcALPFuQNLXwNuu7nVYke4rBlY
	QznF/leRnCt0lV7Y9VDLxCU0SY9F8HvSPhHKtcgExzYAoRvo7isRboEoC7XUsG80OQ==
X-Gm-Gg: AYBFou1zUspf6IHLLUgH1tjNeTvtFa35Up2/c1yoxlr4IgzbkdFT0AIBWEzRyuSYRbo
	Bn1hMHZ/80F3xYfPtz8fbEmwDc1Ygb5obXWiSOFRDWHiuFW19XX7MMD9PGCiT+WTuO9L+Jq2L8s
	HV5LZGJGCZzufJ6T1+zNRnHmMHHqS+FEVp/WwpTIlGLuI9PYu6niqAgAhphPwrem5CcLomj4Mtm
	hmiTbJiK06xxH/nCickua5PvyhV38PIfpekj3o0gD+PuwF8HNlaMQ1PGHJZ1HjCJ4h1oWLk2PMw
	ko1f7F3qcYdS3DJb7QyEajtYHbm4hE/UKFXy//WEaZgqLLxn2pYoEFYAqKPapUBlrVEb/2XN9Z2
	4Fzgmj2TOGJ4PuhZ/6wJwayoNHRgvI3pLG9crvPDYJac+ihYElXlynlARQSCQoUccwRUSq9ycaz
	rf6cx/Qb+D1YdwrmY3klsqUHF/FK9W10PrnpXBFL/BSh24xB0udXdrAL3FeHpLWPJLq8KQMltQv
	B55xTiP2hB7HQ2ZFK8uHTxZiahLtLI/l46KTt77In7pqWT7iitDsd/RHy/SADBoV2Uw0dHB
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr115811215e9.6.1791878211874;
        Tue, 13 Oct 2026 00:56:51 -0700 (PDT)
Message-ID: <c34e331d-4df8-46fd-b162-14c2dfc5fce6@suse.com>
Date: Tue, 13 Oct 2026 09:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/PVH: keep a copy of Dom0's initial E820 map
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>
 <1791874666.8631fc262581453bbf619ec5b2062170.1a1340d8f0b0008d8d@vates.tech>
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
In-Reply-To: <1791874666.8631fc262581453bbf619ec5b2062170.1a1340d8f0b0008d8d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791878212-BE6DA034-A1FE00F5/10/78276251493
X-purgate-type: spam
X-purgate-size: 741

On 13.10.2026 08:57, Teddy Astie wrote:
> Le 12/10/2026 à 10:23, Jan Beulich a écrit :
>> @@ -1389,6 +1395,15 @@ int __init dom0_construct_pvh(const stru
>>   
>>       iommu_hwdom_init(d);
>>   
>> +    nr_orig_e820 = d->arch.nr_e820;
>> +    orig_e820 = xvmalloc_array(struct e820entry, nr_orig_e820);
>> +    if ( !orig_e820 )
>> +    {
>> +        printk("No memory for copy of E820 map (%u entries)\n", nr_orig_e820);
>> +        return -ENOMEM;
>> +    }
>> +    memcpy(orig_e820, d->arch.e820, nr_orig_e820 * sizeof(*orig_e820));
>> +
> 
> I don't know if that matters much, but if anything after 
> (pvh_place_kernel, pvh_place_acpi, ...) fails, we leak orig_e820.

Yes - we're about to panic() anyway.

Jan

