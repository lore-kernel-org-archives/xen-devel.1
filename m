Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CBACC6B19
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 06:17:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448456.1664478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGsI9-0001S7-Ue; Wed, 14 Oct 2026 06:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448456.1664478; Wed, 14 Oct 2026 06:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGsI9-0001S0-Rh; Wed, 14 Oct 2026 06:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1448456;
 Wed, 14 Oct 2026 06:16:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGsI8-0001Ru-6v
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 06:16:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGsI7-00FUfQ-5q
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 08:16:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf1e33-2eae-0a2a0a5409dd-0a2a4508d438-36
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:16:43 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf1e4a-f659-0a2a45080019-d1558032c476-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:16:43 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so30410105e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 23:16:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a190344032sm431262495e9.15.2026.10.13.23.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 23:16:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1791958602; x=1792563402; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0c8IdlqqkdayqULr8G37+0RkkILvk5tcc5RQ6p3d6mA=;
        b=Nn3lAwizGUmVlStPOASh60yYkkE+7rs5mNoNPo0dlfe5G2YDhoyhgdCzeKHSHAxa8C
         x9O6ybkgJnQkmT8ITznwXGBVx+Kg1TsUhq7yZcTtVucqvz6ckzXl92hLRMngKGtvwrAg
         AnIxfAR3BPOF3qO3LDodRM6wq4HXkNLYTLNTu5T0r5xK0HyC6rCk1Wc47ai4P/vGSOia
         YUpoRpSqtD++OlL2Ohhv4luiCLRhkBgy4Md5mE09hfu4RbeHp1Dq05easXI8yQXMQZx+
         aBNoKQX7y600cmN8BqU6W1jPLoM6s4gQwve/Z4YIkIBDdgGOOFBiZ2Tx2IbSdM7IA3gc
         9KgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958602; x=1792563402;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0c8IdlqqkdayqULr8G37+0RkkILvk5tcc5RQ6p3d6mA=;
        b=SrOcr4ekoGhkv+hoYmpfmf+xCP6iyuTwu5y6bAg4UtuRH0eC3BTqgibDNZtvMEE5UI
         iUqx9n3BXon5Gc8iji5D66n0/uC8nuOzbOIu91kHMlnhNtf34e+yOFjk/iIffWK/oLBU
         T6DllQFqLoleKoUeuJLycQgkP51Dgkb1kPC2TKlNsHk+EtrrdPq+TcLdX5L+0gSKHmN3
         Ktl+KZT5zbs1zVY/KpdW+UJBeBZpzg4XAqYbmYWo7pJlW0yaSvKxMFrspPxINdQ0kP53
         60fpS20ta9xNaqKWhq+NGh445Vxn7LPVnxnohSW8BKPwRpNwfJxY11AF9yeoOXteDSRE
         /0vA==
X-Gm-Message-State: AFq9FYJT99SgCI4GSTGu6EpY2jEiY546vYl29kDOh8wbECvSGXOYpp0q
	15E+7klHpU5dmZg7dnjXQ+T0p1EGp8/a4VO96dKZqkKIwvwOZ8jqZZdioHFKBsASYA==
X-Gm-Gg: AYBFou0Z3DRV8tNIIcLAojK3UTaBKAgfAF3p3r9/kbQDKhtyyqUFS/U4+J41KP6hytH
	yWZc/nsqmRpuUZCG8YJ+u+5kOgPjPT5Kjq8/PBIhod7oQ88Pjs5FSTEcLlbzV8Iw449uSlBHAsz
	by1G/BQExycOXyfAc0YisLjdfJfnfOMBovhUlDb9KGdZCO+KSCWcZ5VaBql77G+nQmIoFJd1bFN
	wRSoam7QznnY8psybDBi6S3MxDdWG2XPJqUrYlym1X0ex3Tq7zXTcU3gCQPJ7DPwpeOy6DLj6Ks
	SymlQjNRwlGtBs+TfuUS/c1LVI4aTe7tuF6w3EBTeJhGZn5xJTIbxsyqwWKcOIm1e/vOF1GYofs
	7Ksb/PLTX+lQg4rbvQFjhMgs3yyUnS29HpNnBR6WYYXRuCvIwquOyKxKzc2bw3ISKIxSUBsXWyB
	9s/7px6EAhIiLBSA2ddVVm2ow3HDP1NieN2ILrIYk4Witmvou1/zIjeUK6NxjQ68gp39Y6NFvI6
	dosL+AEu1L8G3E7kP3bLK7NVhEX6QZmgCFfDG1p8+hLXeWp7GPfoUp3eBheIP1yd1jOVREoBg==
X-Received: by 2002:a05:600c:8218:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a18e49d9f5mr281627095e9.9.1791958602413;
        Tue, 13 Oct 2026 23:16:42 -0700 (PDT)
Message-ID: <6428c5da-0289-41ee-835c-ae5def434c52@suse.com>
Date: Wed, 14 Oct 2026 08:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/39] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bd546cae116c93c88706b49e7c24a125b4e5237c.1790779209.git.oleksii.kurochko@gmail.com>
 <1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e58370003f66@vates.tech>
 <c645f0b5-62f7-465c-9518-226cbd124bac@gmail.com>
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
In-Reply-To: <c645f0b5-62f7-465c-9518-226cbd124bac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1791958603-D4D7087B-8C2D511D/10/78276251493
X-purgate-type: spam
X-purgate-size: 1726

On 13.10.2026 18:06, Oleksii Kurochko wrote:
> On 10/5/26 4:53 PM, Baptiste Le Duc wrote:
>>> Guests running under Xen program interrupt routing by writing to APLIC
>>> MMIO registers. Xen must intercept these accesses to enforce interrupt
>>> isolation between domains and to translate guest routing intent into the
>>> underlying physical MSI topology.
>>>
>>> Register the vAPLIC range with the MMIO dispatch and emulate the accesses:
>>>   - reads and writes are masked with the domain's authorised interrupt
>>>     bitmap, so that a guest can neither observe nor affect interrupts it
>>>     does not own;
>>>   - target registers are shadowed per source, so that a guest reads back
>>>     what it wrote. The h/w register instead gets the hart index and guest
>>>     interrupt file of the pCPU the target vCPU's interrupt file lives on,
>>>     as the APLIC uses these fields directly to compute the MSI address. As
>>>     long as the target vCPU has no h/w guest interrupt file, only the
>>>     shadow copy is updated;
>>>   - only MSI delivery mode is emulated: target writes made while the
>>>     guest's domaincfg.DM is clear are ignored.
>>>
>>> Delegation (APLIC_SOURCECFG_D) is not yet supported.
>>>
>>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Co-developed-by: needs a matching Signed-off-by: from Romain right after
>> it.
> 
> I will contact Romain and ask for his Signed-off-by.

Just to mention: Co-developed-by: can mean many things. We haven't been
insisting on matching S-o-b before. Plus if there was an S-o-b, why
would there want/need to be Co-developed-by: as well?

Jan

