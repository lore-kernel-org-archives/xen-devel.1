Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D338C61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 06:54:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404467.1638140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1INm-0004mj-OO; Tue, 01 Sep 2026 06:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404467.1638140; Tue, 01 Sep 2026 06:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1INm-0004mc-Ko; Tue, 01 Sep 2026 06:54:10 +0000
Received: by outflank-mailman (input) for mailman id 1404467;
 Tue, 01 Sep 2026 06:54:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1INl-0004mW-8A
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 06:54:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1INk-002fBP-1B
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:54:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967679-2eae-0a2a0a5409dd-0a2a450cb1ba-42
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:54:04 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96768c-f479-0a2a450c0019-d155802aa545-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:54:04 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-495437bb891so5760955e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 23:54:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce1e1ebsm45971695e9.14.2026.08.31.23.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 23:54:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1788245644; x=1788850444; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+EFq50Z4a1yAY4mxB84MNiXhZdCa+N60q2EwJ3mS84=;
        b=BrTN6WtN90VChy+NFtNhiY1Eba9Pck12jrQIzOxEuwoZaCr3MvbkAd/Tb/902t3Y9I
         qdJ5V9wPZFQ0XSt1EXq2qJqXhmzpi4i/+o/tGRdi8wi/9g7uJFIX0BhIfhpGjoBmJEJE
         KE9oF7GlgADUedE4zaLUM0ZJJmDyUKzmsyN+Sy3hXAybo5X2e71GY6ntQC2Hepuq+VNN
         lTV6pt9Scsh5hfFDdL0YJqULG7APWFnGejuEvIcVQ1+jMTPKgFIEGkUEminw8ExmB15h
         z6RwH7H0xT5TdvAHMxJJJIPGLDTfk/Q4Wlf0oiJUQBGrLibLU4bC1tsGYYY/MkeXItDL
         flow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245644; x=1788850444;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+EFq50Z4a1yAY4mxB84MNiXhZdCa+N60q2EwJ3mS84=;
        b=WTGytvs96yrIdgHiNlbvP3/aZRZ9/XmdylP3qE//HhyhIldmGO4BR6/wUPMkPut2B1
         8Kc4ZjB95djVlChTA1LryTpIYtWtmyM2mAXNjFoT7jne6buNf5zWRPowocqW59aAEi3L
         gpizgCn3TUYEp1iYFupXJ6ox00rqGFxuImrmd71Euq5hrDtADyqFc3KgrCINav/I6HnU
         77RxEq8TVbXJhVO8ksysIjg620UM0n1VJXNef8rm7U51Ra+qq6KN691iWDzmCLR0ZQNj
         sO6q3wKb6MYr7yxsa5P9SUKfHxubYBnctHA8MI0BclNBKXiso8tKt2Nu9JnBEoZE2gED
         KClg==
X-Forwarded-Encrypted: i=1; AHgh+RrxKIWKnSp0AF6fnhZ9fA4+DeX8e7mEroSixjNFC5+OfzLF7xUtLESMzRjTFLifX1VpcU2/5Bp8bCg=@lists.xenproject.org
X-Gm-Message-State: AFuF++l9Ig2D2Nq+uWjsfKRMp+VC2FvNmpRxPz6lJRu/f5xzrpuQe3ZU
	Uruw2SHrwZhBrPuvX8I01u6R2MhY/y0DPMDkuUNnYmiqusiIowoI9u0HAYlhFycq4w==
X-Gm-Gg: AR+sD13MkczPm6uFoHq4ZKvlMylAQY6mucOvyTJt72CLbBn0GUiYD36xqANDfxauAcm
	bSB2S/0nfBvW+4yqVHetzdmcz+dyuI8JurZCl2QU1T2DLHNobszRKyVoT3zFSn2pFKHMu3gt7Y1
	VuOHJ8BUgJIaSU2H13ipMOkMkgTwY79+rAc3v+U9rWSQ6zybxqCMvp3khnl8j6nbKpHRp26ziW8
	ud34PipRSYaMgJRCEpjXl5C1cZUGe6u6tCjIsSeXA3gRYibHrnii/98G6OPbJIHUvE1UmXb99/Q
	37LaLF3pGf8qEbzZLMvqJODM4HaQUx7iinmjzLG9oDwIfST+29gjJxna2kHWMzeKsWACyCtOwGN
	+oJQ8LLRD73GqSzhHRMpYG3VhvNwSRbxH9JCwK/VYeApirmgNVWq0LEVFUvU9IHFaTgxvu1K6dP
	VqJNClZVKQCYl/b3/UwwL7nmWs6rU9NvaCS4p6pc5uyAYHxRvnMywFSFiKXPJIRlaOS92n3CctL
	265BjsRiubMLvJmzMAGJ6imrnFUGa+4SD1pAZNuKHOJZqUeZMoE
X-Received: by 2002:a05:600c:468d:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cdd418c7cmr39620025e9.5.1788245643640;
        Mon, 31 Aug 2026 23:54:03 -0700 (PDT)
Message-ID: <885cb732-1814-4971-b554-9041c35c4347@suse.com>
Date: Tue, 1 Sep 2026 08:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] xen/dom0less: turn max_init_domid into a common
 variable
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <5a74a964b763e8444579a3c0d455e23160be8893.1787836900.git.oleksii.kurochko@gmail.com>
 <b65fcc50-b249-4505-a212-b2f60c55f86d@amd.com>
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
In-Reply-To: <b65fcc50-b249-4505-a212-b2f60c55f86d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788245644-016C6A5B-1E3B4B3A/0/0
X-purgate-type: clean
X-purgate-size: 690

On 31.08.2026 17:48, Orzel, Michal wrote:
> On 27-Aug-26 17:18, Oleksii Kurochko wrote:
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -31,6 +31,7 @@
>>  #include <xen/warning.h>
>>  #include <xen/pv_console.h>
>>  #include <asm/setup.h>
> NIT: This can be dropped - I don't see anything relying on it in this file.

Did you mean to ask for asm/setup.h to be dropped here, when that's entirely
unrelated? If not, the other change you are asking for could surely be done
while committing (and I assume the patch here is independent of patch 1).

Jan

> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 


