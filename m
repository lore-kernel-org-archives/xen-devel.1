Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC822C79FA0
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 06:07:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411122.1641854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3oyY-00016Y-Of; Tue, 08 Sep 2026 06:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411122.1641854; Tue, 08 Sep 2026 06:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3oyY-00016R-Lv; Tue, 08 Sep 2026 06:06:34 +0000
Received: by outflank-mailman (input) for mailman id 1411122;
 Tue, 08 Sep 2026 06:06:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3oyW-00016L-N9
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 06:06:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3oyV-000Fbl-Jh
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 08:06:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fa5d9-bab6-0a2a0a5309dd-0a2a45048688-32
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:06:31 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fa5e7-b57f-0a2a45040019-d155dd33e56f-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:06:31 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso3022747f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 23:06:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858ab73c2bsm32003538f8f.22.2026.09.07.23.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 23:06:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1788847591; x=1789452391; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fToW8Qfa/ir2WdXjPYveDRJbLRU0M7rdpYwMx0TEukg=;
        b=CTGBvRJk9x7ATEpc295VK9SB87dxR3ZImsgw24jEg9s3kEIhYsZNw0a2aIhM1Z8bTl
         sgngVLfow970oepi2544c7L+ZvArOr9BTfs9lRfZg1BbSupO1FB0+ZrqknmWgfUllmta
         7JTc1NGHJMk0V7lADdHDbuXRVLCRTqXepoG7Fg4NOM3Q0daIlZLPDUqBnCwsudu9lskt
         shLzhhjJMIAAdVSUNm+vwV4f4zzDYqRMeXANK/csBRk86uvbrR49L0rWOTzP59K6sdtJ
         5CCfwtWTexFqwthharpJ5m6l11omx/jOsBGyJ2JJEQVDoX6uODkkv68uXANLpFiiH6RW
         6RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847591; x=1789452391;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fToW8Qfa/ir2WdXjPYveDRJbLRU0M7rdpYwMx0TEukg=;
        b=FYKlBA5+kJ1qei3C5Yb5R4qBFTKf4AjdzsTvDexblqfTFcsIdYOhocgKaJzGAZLc/a
         axjRPhxOi7T/VEbM+nB2ixLXmTFH/fmaur46kbBCxKjlrDPMjfATvHJnXKp8fRMfJt2L
         2nFJiCHYudoExl8Iw7Fo+9rDjhQTbP4OOy50hzQb3POhA/AtkV3OnoAlv3Y2JGxvGAEO
         M3uEyEVF+6BzRK69nAec6LoOVbR9k0+SmU3WCp/3uKF36cen9iOJNDX8yZjExHmgOIRf
         YJzhP61iZqRuaixzebQj9oCgnE0d6Mvk+yALsaaU02+dym4YBJFKX+2eWgKnVbA8h/O7
         TSZQ==
X-Gm-Message-State: AFuF++lWnMyFJMG307N8pHt+wHlRfVWZT4e+h2uCfAXRzNxUS6zYzVP5
	2ZEKgRmCUtZ+IYROI70fjmMtkmdfPglaPIVvWi5VW7msfnmodHqx4ha7zRRmWiu4Sw==
X-Gm-Gg: AYBFou1sj+MFEybV298gj/Q0ylDZz+i2qzR+qh9SQmNqPvkQmEVtyEMa6tNe/ajoIAw
	YR5roIpNfIdmnMT7yHCMLcQmldWsZbNvlzAGspfkvNSjQDSR1jIs6V1E/7Akw7HHzkmqenPeVxF
	/ZTPFT3Xcoub8mO04WMdfpIpVyKmwrXkWvnRxi2lfTWG7YsHnOpxrGcwmIef5gRMtDH6Spf4EL7
	YXJSutnYS0lLxCLXooyMgreY+5SHgH77SOYEFed8TkpFAjvMYk5kOISkLttwBiPQESRlqajRAfE
	uxJKsJvVUwwrTWKCQ2zDMUWeJ3QhfcbiBQKp+lWlYGa9TDRXb2lQCGO0++QUt9/1STliNbkHphv
	+B60TVtTpIP1WQZezGV6LP8gg1q6DqrPn4lVgOU2fh9YXC9l28DL2JNdtYpp85CqsFaljU6sJj4
	WnvjjJPg2YCPs9xlnmthj4Pu+acuJvvrAQ3XoNqcJGxQr5YWzLhpoaboZqpjOGeMdBo3TbA+bzj
	FeeyBS9nu8hACoqTqW+EDQCOurXusZUzhANUazYsNylrnvtkX+Z
X-Received: by 2002:a05:6000:4819:b0:485:8c16:a347 with SMTP id ffacd0b85a97d-4858c16a542mr22692240f8f.31.1788847590898;
        Mon, 07 Sep 2026 23:06:30 -0700 (PDT)
Message-ID: <9123f379-6f87-4116-95d4-982e55f27053@suse.com>
Date: Tue, 8 Sep 2026 08:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/39] xen/riscv: extend exception tables with type and
 data fields
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796633.8631fc262581453bbf619ec5b2062170.1a07c968185000c4f3@vates.tech>
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
In-Reply-To: <1788796633.8631fc262581453bbf619ec5b2062170.1a07c968185000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788847591-C24CBB50-79E9ABA1/0/0
X-purgate-type: clean
X-purgate-size: 1353

On 07.09.2026 17:57, Baptiste Le Duc wrote:
>> --- a/xen/arch/riscv/include/asm/processor.h
>> +++ b/xen/arch/riscv/include/asm/processor.h
>> @@ -12,7 +12,19 @@
>>  
>>  #ifndef __ASSEMBLER__
>>  
>> -/* On stack VCPU state */
>> +/*
>> + * On stack VCPU state.
>> + *
>> + * x0..x31 must remain at the start of this structure, in architectural
>> + * register-number order: code which resolves a register number to its saved
>> + * value indexes this structure directly (instruction emulation via
>> + * REG_PTR() from asm/riscv_encoding.h, exception table fixups via
>> + * regs_get_gpr()). ->zero therefore has to stay at offset 0 and must always
>> + * read as 0, since it supplies the value of x0 when x0 is used as a source
>> + * operand. The layout is checked against GPR_LIST() at build time; see
>> + * regs_get_gpr() in extable.c. Do not reorder these fields or insert
>> + * anything between them.
>> + */
>>  {
>>      unsigned long zero;
> Comment claims ->zero "must always read as 0" as it's hard-wired to zero
> by the HW, but nothing enforces that, it's still a plain writable
> unsigned long. Maybe a write-side counterpart that special-cases num==0
> as a no-op, or with a minimum ASSERT(num != 0) / BUG_ON(num == 0) to
> anticipate any future forbidden writes.

With polarity inverted, though.

Jan

