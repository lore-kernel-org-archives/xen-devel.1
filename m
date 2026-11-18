Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C91D606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 15:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SE7610oH
Received: from list by lists.xenproject.org with outflank-mailman.1494746.1694082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThOi-0003pG-89; Wed, 18 Nov 2026 15:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494746.1694082; Wed, 18 Nov 2026 15:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThOi-0003p9-4g; Wed, 18 Nov 2026 15:16:32 +0000
Received: by outflank-mailman (input) for mailman id 1494746;
 Wed, 18 Nov 2026 15:16:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xThOh-0003p0-9O
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:16:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xThOg-001ltD-HG
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 16:16:30 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc14a-e002-0a2a0a5209dd-0a2a45079650-2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:16:30 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc14e-b4ea-0a2a45070019-d155dd33c5b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:16:30 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4a2f4ca0dcfso566570f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 07:16:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a6570dcdddsm5018737f8f.54.2026.11.18.07.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 07:16:29 -0800 (PST)
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
        d=suse.com; s=google; t=1795014990; x=1795619790; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m88+1T7ytnDBOe/iILRz/jejiJqKho27zq/rEoxpb4=;
        b=SE7610oH8gN7iPCC7LSKT6uI498uFiMCBNnw9bj8EypbUQ3wpLE6noiy+n998R2uWE
         QyIeeHwmBLvZRyIrEqef6zoIuXEpU04JZ3/XSW4crIXxO8gLXqKJctKryq9rPZUnI1GR
         ove1MABJ3F85b/F0fVLCvgQn8WvBMBGrrttHO9SKXJdIb9+yeud66fl1zdVwyTF70YX4
         niw2dXNpqxl8+rANw1ZieuKy7kNmSRh99wAoebP7TsDxcqqiPOCpElThsc01s2M37jjy
         iJNbRV7Gv80Q61KSn8vHqINFlKKpNWQurVUpr0PPgVxjjZFKAC0BIVDWviJUGF1kgtMm
         LvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014990; x=1795619790;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m88+1T7ytnDBOe/iILRz/jejiJqKho27zq/rEoxpb4=;
        b=kRwNlN7HzAjSdKfQvJG10KtCVqj108EcSRJjApFyP4vnujZvWJSN+22zQOwwnThk8E
         aTjoQWUsdNQXmGiMuV7IIviDxG26C3dIdEcFlVlPMHuaXcZITse9SThHo43aCMz+7V3Y
         /Ux8JiDsN6fSVdDyuDqYqSXF2T2yZeS+q+oDmvkm3BU9kbkroBkMddexdpIVc6Vi7KH3
         SDUcDdFiMPnykBLStECtX+5H+nMKdNq45lkUEzPlYlzGbY81IEXSrcUSPP3PzHShC+br
         XQyFA9LIQIV9fl7md79N2G7p/4bmxSChbHV+FF9sLbEnhyWiWqTRwJoz+7VodCDe2g3A
         r1rQ==
X-Forwarded-Encrypted: i=1; AL+hErGodhRRHlO8QcHVW2wZhYOLaajpbjAC+r+EPEKWB3YUz7m7UP5iSFH7Vawg2+LrQsGij0GJ1CRxPQk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/Uv8BLHQEUEJvw7Bb4tD8y2sPu17ZHYY2aPf0iGX1bT271VKBr
	Etqw+NZfcih9d/SvvCDm4Jbq5ptm6YZ+SSzCkohmJh17jiWy9SEAa9GBkc7aQrX33w==
X-Gm-Gg: AZFdTZf8R6+Brx6BufVOvY/n1PYy4AgNVfu47DNHBKiL7+OEhUhtOgj6d56fnl1Sw1i
	UL5djjTxwoUFiB3jXAlicBxd8GqJXKN1Q+s3+bUvMWJ1gszL6pFMpk+/rMK/LbLpwbYlf3ovg1u
	N0wAHls8/7hsnMC1cEoTxNmbT/46uGB/dBY+lc9cPltluIg9+ukPg8NquO45MdELz8Vug2b+AjA
	oO/TE125KjFUcWR4zUjkuScsZMF1rDfQx1H/IiRZL+lOYIC9UGxe41GV2fP19OGb/FQmZ3VvDvW
	BQ7rbe4ni558zbEkc0nlky4QT7ice6kMAZ9saJZaVF0ZKch9vJZ+XqBT+rAnbJT2NiwBk/Gu0ma
	RkZi5mzavXFfjf47wNl5FIq35/L0NF8SerIEqDzIzDL4rSISPXsBBtQTbs7Oe2OFNDQrmtBPD+6
	qADaIRIo9PFZdaN3TWo9Y4c8utt6z4IGPKFwwM4cj6FajJx74esdeR44FuIX67DonF9haC+Tf/j
	mEuoSD3VMFDaSN+Gn8E+naT5uyy95E1jlo/7JH1kj76hfYwCOM/sFknzmDSF+1lDtpOae3zhkGi
	7U8hOVnLJVWqBO84ap7uyaTI9wsGHK07QL1G9geoKZkQDtixsbb+CyfsPdfZPJ/zvLfzgh66Sf9
	tPfzn/s0MDGRfiZbF
X-Received: by 2002:a05:6000:1a8d:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4a636582533mr6727136f8f.3.1795014989808;
        Wed, 18 Nov 2026 07:16:29 -0800 (PST)
Message-ID: <a9757b5a-affe-4114-aa6c-a8308ec063ae@suse.com>
Date: Wed, 18 Nov 2026 16:16:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/28] x86/hvm: avic: add domain state initialization
To: Teddy Astie <teddy.astie@vates.tech>, dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-5-dmukhin@ford.com>
 <1793972488.8631fc262581453bbf619ec5b2062170.1a1b117c821000403d@vates.tech>
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
In-Reply-To: <1793972488.8631fc262581453bbf619ec5b2062170.1a1b117c821000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1795014990-A72DCAE4-4850EB04/10/78276251493
X-purgate-type: spam
X-purgate-size: 1045
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06.11.2026 14:41, Teddy Astie wrote:
> Le 05/11/2026 à 02:37, dmukhin@ford.com a écrit :
>> --- /dev/null
>> +++ b/xen/arch/x86/hvm/svm/avic.c
>> @@ -0,0 +1,136 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * AMD Advanced Virtual Interrupt Controller (AVIC)
>> + */
>> +
>> +#include <asm/hvm/emulate.h>
>> +#include <asm/msr.h>
>> +#include <asm/p2m.h>
>> +#include <xen/param.h>
>> +
>> +#include "avic.h"
>> +
>> +bool __read_mostly svm_avic_enable;
>> +
> 
> We probably want it to be __ro_after_init, I don't think anything good 
> can happen if it's toggled dynamically.
> 
>> +static const char __section(".bss.page_aligned.const") __aligned(PAGE_SIZE)
>> +    avic_apic_access_page[PAGE_SIZE];
>> +
> 
> I'm a bit dubious in making this const.
> 
> I also think guests can find a way to read/write to it (as it's mapped 
> as MMIO direct in p2m), which could be a problem regardless of const-ness.

Or else the safety / security of this wants discussing in the description.

Jan

