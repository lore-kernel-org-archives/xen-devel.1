Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C771C5AD5A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 09:16:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388929.1629893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu54W-00022U-D9; Wed, 12 Aug 2026 09:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388929.1629893; Wed, 12 Aug 2026 09:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu54W-00022M-9V; Wed, 12 Aug 2026 09:16:28 +0000
Received: by outflank-mailman (input) for mailman id 1388929;
 Wed, 12 Aug 2026 09:16:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu54U-00022G-SJ
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 09:16:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu54T-00EcGs-Gu
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 11:16:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c39e5-8faa-0a2a0a5109dd-0a2a4504bade-8
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 11:16:25 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c39e9-b57f-0a2a45040019-d155dd32b445-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 11:16:25 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47ffaa8ebbdso577865f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 02:16:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815231c308sm5088833f8f.11.2026.08.12.02.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 02:16:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1786526185; x=1787130985; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHjaQpQzkOp5xRhsMS4c1VoBQI2rizbhVyY6r7Ed/rE=;
        b=YlZlIr1ww8PFiFNuj14zPD86om3nO7Ym7UPg8G1Oq1pI5VnKKSIVEK8wFyf3b0Fho1
         fsdpdhHzTJpNZ3eYEc0XpCly0vMx26GqQ1umwQIOMWBHWkJzFfhJNI2uSWr2uvDUUpzY
         PoDO8HA4A/QFm4Azc959Ap6Swb6x35s1pXWe00IhMouC/SP19xejLOB/V5dnoxBEAOGd
         7EY4Ly5O7gZ4HPOUKIUZ5S+g2YvMrB7sGgjnzpRx0iN/Nd1ux5D7NJLks6ImhTdCGGBy
         SbDgcfRmEz+iBxeq88ZpIDoe81bFuMb9TUEdZrYR00KMgNvPfJY5Xvre75QXTqPvhIvC
         EnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786526185; x=1787130985;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHjaQpQzkOp5xRhsMS4c1VoBQI2rizbhVyY6r7Ed/rE=;
        b=INq/q5dNrn+lSPiTvk0zszVWrcrT2cHPwl1bLeAz7HjufmtCfpSIQ1i67ZiHs1/EJ5
         qGWtpQfquWVwWKG3/74Sny3xVNHD15TAK+3pYWVnl4qCsO/TTG0gzoyEaKYqkGsfeWdw
         4o8R/lI3TmZv9QGLp7ZbfHxsod+H2kYgNoRgnW+A9N0sIIvFri68uBJj8e4zIgnIezyU
         oRUIH7F3/GxHob1tWM7RIVoX1Jxaj7VjjkZWFkVmBlKALBA/5pvPw6mWr7p/b7ecTBUE
         ASG+uYKPG5p4iQEq1TQr2awUg/C5CV8TGikVRS4bex+DuU1pCJcjmoAh2PP9b0hSpMyv
         nrgw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/8cS57LezjAcHSHRuZz3zgjUI3uRVpf4GbLJftKjikiu+Kme2LJSlNBIcYAgFUcn1qvDihUnOyXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yydvvripi46RXjKSr0Ko9CMd1TBWz9RoyX2zWExUgwvcXBL7m6T
	uSvjiqDLHWmExOdNgou5kVZutZBGp64waSgqMvQQXHSzMjxzfvPy6hm/oWc5xkvVtw==
X-Gm-Gg: AR+sD11rjJhKTBhnycdXGVINQLcAlFqNy78bxPGcDkfThxNshLyuvPBhDbh3crZRJCT
	xnXre1uJwSNbm8Q13IbDur1A0J73R1Ny7mf7nk+Y4l5PxRnLbuVRBYKyMCs12t6f6iCdJBIKfmD
	55HGO3ArVkmqATc8tMObms276S4cqU7j2q9C5tPc+ELU4Z+bC1MFcJamJ7UC3L8twKF6+0t5vAX
	GbEt3bPJgc28EhRfdfSS21yp9bkSco3qTQbyGgA3j/uicKY6a3pD3N25Fs4JC4FUmin7e+QpMsj
	cti0i2bKSlOCTDBUeZpXgRQrhOfx+HnoCqYs40+s+E/fhxgoxzcQtDSzEsOIoEk1bCQMPEaJx14
	2SetlAUjeRf4P27FIaskWYr+obKSqsIFUPLE5Y5eNKV4DElYIyTDuFD4peifhXHDsMaIyBamybn
	hpUruS2jCF8s0lYm0rAaF7D9fsgeNc6JleLjd2LnXS3Bk++KLBHt6NkbZ0BUOel534WS6yzTPUj
	6LclkmZm7cb9tbN5SxK2obobw+niKUA3WhC/YNnsuGfhJeH7jI3zK8xNDciAeg=
X-Received: by 2002:a05:6000:1868:b0:47f:6f89:7dae with SMTP id ffacd0b85a97d-481528abe33mr4530880f8f.6.1786526184791;
        Wed, 12 Aug 2026 02:16:24 -0700 (PDT)
Message-ID: <134445c8-b62c-4db4-881a-fdec9545f780@suse.com>
Date: Wed, 12 Aug 2026 11:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/17] xen/riscv: map IMSIC interrupt file for vCPUs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <254f470ae2e2b2a4affa7c405be8c07a7d8b300e.1784560663.git.oleksii.kurochko@gmail.com>
 <dda2f05b-2965-4fff-92d9-326619be313b@suse.com>
 <2071e8f2-4994-4b8f-affb-999376250e35@gmail.com>
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
In-Reply-To: <2071e8f2-4994-4b8f-affb-999376250e35@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1786526185-50CDFB50-6A3A7B10/0/0
X-purgate-type: clean
X-purgate-size: 1567

On 10.08.2026 10:50, Oleksii Kurochko wrote:
> On 8/6/26 4:48 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> +#ifdef IMSIC_DEBUG
>>> +    printk("%s: %pv: ga(%#lx) -> pa(%#lx), cpu(%#x), guest_file_id(%d) "
>>> +           "base_addr(%#lx) offset(%#lx)\n", __func__, v, gaddr, paddr, cpu,
>>> +           vsfile_id, imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
>>> +#endif
>>> +
>>> +    res = map_regions_p2mt(d, gaddr_to_gfn(gaddr),
>>> +                           PFN_DOWN(IMSIC_MMIO_PAGE_SZ), maddr_to_mfn(paddr),
>>> +                           arch_dt_passthrough_p2m_type());
>>> +    if ( res )
>>> +        printk("%s: Failed to map %#lx to the guest at %#lx\n",
>>> +               __func__, paddr, gaddr);
>>
>> I think you mean to use PRIpaddr with paddr_t (oddly enough there's no
>> PRIgaddr).
> 
> I’m wondering if it wouldn’t be better to use paddr_t for gaddr as well, 
> since technically it is a guest *physical address*. In that case, 
> PRIpaddr could be used to print both paddr and gaddr variables.
> 
> Also, could this be the reason why PRIgaddr doesn’t exist? Basically, a 
> GPA could be considered a physical address, while for a GVA there is 
> already PRIvaddr.

Well. There's nothing wrong with guest {physical,virtual} addresses to be
a different width compared to the host's. They could be both smaller and
(in principle) larger. As long as higher-bitness guests can't be run on a
smaller-bitness hypervisor, using paddr_t for gaddr-s is okay(ish).

Jan

