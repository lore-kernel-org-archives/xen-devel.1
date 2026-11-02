Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43558606E00C
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DqBCJu6e
Received: from list by lists.xenproject.org with outflank-mailman.1468490.1677574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNvJL-0002HT-OG; Mon, 02 Nov 2026 16:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468490.1677574; Mon, 02 Nov 2026 16:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNvJL-0002HM-LS; Mon, 02 Nov 2026 16:55:07 +0000
Received: by outflank-mailman (input) for mailman id 1468490;
 Mon, 02 Nov 2026 16:55:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNvJL-0002HG-2g
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 16:55:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNvJK-00AMQ2-4Q
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 17:55:06 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8c043-bab6-0a2a0a5309dd-0a2a4504e208-42
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 17:55:01 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8c065-b57f-0a2a45040019-d155dd2bb055-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 17:55:01 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso1983170f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 08:55:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b789c6sm22416249f8f.26.2026.11.02.08.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 08:55:00 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793638501; x=1794243301; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58iP3BlBCQ7MHsk4BqKN8NAWFdKfeoBJ+Ihq0OUqeLk=;
        b=DqBCJu6ea+giB5q/xggs2kWYKpBSdOEo9wVe3FaGFo4BSierTWJqY//15bpYvgylRp
         MgPzwxmbjJHKsnV8eZI+o+mZ3Jefg7/v3r74S2HBQcIZbSC/cp9ZK/llzcNPOuLewR7M
         /etYQv+a/IuYyLhfGtazrv1oe8WRBu1lgSEH0QfJunvlnU7qmPEyjKfP31Zqso+r/RFZ
         jzpS4Oq4trludB6/+STg/+PD0vlrieV47zoViNJ0x1GHVxPZ0CK12Td7SJry2baDLK0t
         7HTIBVQPV+8okyIH6kT4RSiWvMbt8QhoI3uXH+97Tki8GxcM9LMWbYCfLzPO7PWRrAVA
         wvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638501; x=1794243301;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58iP3BlBCQ7MHsk4BqKN8NAWFdKfeoBJ+Ihq0OUqeLk=;
        b=kpZV4vd8DJb3ek6IUaP8daq5rwvDfdsXlRD+qJKanv++TXlZp+KwpTYYg8hK8xbQw2
         WGXtibarL3MahyitjMFMZ1kBC7aqbkA5c58U3viKwDi8hEHOZSlRyE2qXerKNpTV0bRO
         aPy2g6jaI9nwUJ+nO9PMNwUKnDivQQrooRwMbg5SAhQlNrm0bBPXQ+IX1qFNm/nJqSOp
         NdC3rQ5FBmjq+L9E0hBOuiM+k/gFVgxn7jfn3z1NMpV3PK7iHiHdOA23hTuRIp9xxOMm
         8s22lbNrwcvseJyIefTaOiqeY9+ykXSQVUU9wRsPLy230d5boPXdwBCZ3IxCdH/F+CZr
         lA1w==
X-Forwarded-Encrypted: i=1; AKwUvBzkwiqBRz7IXoHp5K96+6qYhJRSleka482uXy0Hep7y+CIgCvqj4qHu01pC8+jNC/dDv2ARvom19Ic=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9VezwQK1PYqWEl9YCCCJLfYuEOWkZENvV8R6hQ4EtC3exoToaa
	d86YSuL0hFVlRJ1rVL/niqx4R3ymS/guiWu6SxMX35y985okVw+7o9J78z69beRr2Q==
X-Gm-Gg: AYBFou0glIuTZo7SNqCaeFlIRM2MfUY64sOydjOUMun+tf2IhC8DI3HXVPqQhVwP3yH
	1fEq1wqrdUAM4aizL6q5EBZvdB1sJTIAJzGD31cwanUTsefdY9Tc1ZruHDKoevIX3qdjfdT7NHz
	RzbZ9K9Tt8ozqGJrJMnCODSFa1DANVuntJh/KvMI36gmcK5zLjP8XWq9pQqawBmdn/bH0SZ3bN0
	1C0dXblUnRA2XojF1M9umNozcpIY2j7Yu8ZS2ET5rmNdlKKdx2TMQ++7mFTqkZCEyUdcXbP1FM1
	aNUF6A56t90GFFMYZa93cZJ4eAmZFAdFLlHIeX0jMuJxiEllJmBw+Rf63L/7fFbK+MV6Z70gPdH
	/bpTwUHBX3uF6rOOXvl9wOwXsGki1wa02iCvJs0/Z0shBF34CzEnwlFKF5iYUcYw55ZFHU63Mv0
	wy51TEkCbkOINCYhv3lhcovnC5+Kjkdj1foUCRp3hc/Fz1cxhidqZ9OL2QS8ec+Ir6EcZyF3Duh
	4PA/XwLLOBm8u8vRLSUljzolVpUtjhoTo+wlvByHexgnUBiJO9Q3LPHPN7RRcI2xIaTfB8jjteT
	tHTe5F86+VAPhBij8tYq7s3Eybw/qYXm8R0YDSRpgnUMiak3MUvZR/8PIXUVFgUsUFK3oRv2Vte
	i/xXynb3tIKs7J9Ae
X-Received: by 2002:a05:6000:402b:b0:48e:5ea1:260a with SMTP id ffacd0b85a97d-48e6e2c3532mr23163635f8f.3.1793638500848;
        Mon, 02 Nov 2026 08:55:00 -0800 (PST)
Message-ID: <2d444072-e4cb-40ff-b2f5-a6e5038e64c9@suse.com>
Date: Mon, 2 Nov 2026 17:54:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] IOMMU: record the flushes skipped under
 iommu_dont_flush_iotlb
To: Luca Di Maio <luca@edera.dev>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org,
 Teddy Astie <teddy.astie@vates.tech>
References: <20261030165031.2560020-1-luca@edera.dev>
 <20261030165031.2560020-2-luca@edera.dev>
 <1793444119.8631fc262581453bbf619ec5b2062170.1a1919984c0000403d@vates.tech>
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
In-Reply-To: <1793444119.8631fc262581453bbf619ec5b2062170.1a1919984c0000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793638501-C26CAB50-CC9F0FC5/10/78276251493
X-purgate-type: spam
X-purgate-size: 854
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31.10.2026 11:55, Teddy Astie wrote:
> Le 30/10/2026 à 17:53, Luca Di Maio a écrit :
>> --- a/xen/drivers/passthrough/iommu.c
>> +++ b/xen/drivers/passthrough/iommu.c
>> @@ -64,6 +64,11 @@ bool __read_mostly iommu_hap_pt_share = true;
>>   bool __read_mostly iommu_debug;
>>   
>>   DEFINE_PER_CPU(bool, iommu_dont_flush_iotlb);
>> +/*
>> + * A byte holds every IOMMU_FLUSHF_*, and fits in the alignment padding the
>> + * bool above leaves, instead of shifting the per-CPU data that follows.
>> + */
>> +DEFINE_PER_CPU(uint8_t, iommu_skipped_flush_flags);
> 
> flush_flags in iotlb_flush is unsigned int in iommu_iotlb_flush(), so I 
> would use it here as well instead of uint8_t.

+1

Also see ./CODING_STYLE on the matter. If not unsigned int, the next choices
would be unsigned short or unsigned char, not uint8_t.

Jan

