Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA89CA6015
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 05:57:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444007.1661038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF3bI-0007cT-Tp; Fri, 09 Oct 2026 05:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444007.1661038; Fri, 09 Oct 2026 05:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF3bI-0007cL-Pr; Fri, 09 Oct 2026 05:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1444007;
 Fri, 09 Oct 2026 05:56:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xF3bH-0007cD-Mn
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 05:56:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF3bH-00EaxV-3i
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 07:56:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac8821d-2eae-0a2a0a5409dd-0a2a4509e1fc-26
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 07:56:59 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac8822a-be1a-0a2a45090019-d155dd2dc042-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 07:56:58 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so2981138f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 22:56:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db98c38f4sm2323024f8f.27.2026.10.08.22.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 22:56:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1791525418; x=1792130218; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+rL8v2kQ8U6lg4n2oLB7unBdmY9A+5fNdSo4wCgado=;
        b=c9Da7gqeqoY7Cajhif7xKfn5PhVSUutbkYUmO1klRpY1rKPYzqKDwz5R4ytAVOZ73t
         /IV19CTilZvleD9iNICFUz0MrpyDraJklWx91bvkpFQvwY6iCS23mGNh0FLdnBAwAYvV
         TFrwsgM9UvONZ3zhYMJb4QbUrknd8zj/U8XlY9Qgz0VNUJ6nqK+AuJLw/RxuGBUdOw6q
         8yj0OLett22JxBvPoUwvFz05nLeGBaStzLnV6CNwbb9qpn30UcHH8LqclQCge3V/K0SH
         dyAnzCBpE7sREULJMRQPmsNLdcRQyjQZqIEivMN051fYZUJf00SKVRZ6x1jJtR2frapg
         lrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525418; x=1792130218;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+rL8v2kQ8U6lg4n2oLB7unBdmY9A+5fNdSo4wCgado=;
        b=FPforxVgRUOh1L8QzPzeMIfIFjulhTjw0skAjk25XsMSfya0wrRne3CBsqR1weMZ1V
         qc00YdlLnifgXqoF4zGnGZdD1/yZZTLRQCMzKObLkSwv7+McPyVCIuVFNHqG90On9Svz
         1aTjr7o81rRk8IQBHTi0X3PmPsCRpQY7rVrOAFZ5C0VJ0TNN1aqoGCemXzPj0cj/GnhG
         yGAGaQ67PuUnhy5xkQ27oELihnnU6uZdXI4DYIEemA2ELDXyaR+1W6IhfvO9C2tOB+BC
         pe33TVqz8adOMbw2LZ1/UPcvwy684krYizHSbmvmRQ35+vU+Nuq0Od5PBMBtJgIT84ZZ
         8JGg==
X-Forwarded-Encrypted: i=1; AKwUvBzgbkVoogCLLqTXGpdjuLd+N2Q6hYBabK1RNNW3+F96UlfZ7tjGhmMw+JK6Kew0KV2sB+exQPW4i18=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKeVhsKJxlYf6yMVUzUMyyI7FAwSXZYqiXQb0J1g783saZ0zGfz
	rbBhXhcEot15i/Hsuzfk2VcmzxPn5e/bCivVTaUBfqum48Bvfuhx6W0IxrLLjxv8KQ==
X-Gm-Gg: AYBFou3+y+dQuRfxkSi+yqY5FIE3VyxvHInj1odPZC/fDwVIkbx9MxW9O4PIW5u5TNz
	DL+78GVHxkRxNsYTFylNy9C/Zf1qHNcKltVCNfLCbURmUc8hlCqKTPIyb3+s4xZQi83GGSpAfXD
	EFopHgzvzFoV05286FptrP6qF17aCFYqNxeunuyQXIMRUDjG+Yy2SbyTYuRklR+ZFzrLF6Spjn3
	0g4X3XtIyLkPm/A+ZYv3v3ELXGoVPCUESgw2F5EzSxmK5LE16F4JVX5R0f/Igh9mt58N07o9sVd
	M/HaRUnNWRK0JlewtfiX4DWtZgaIO4o4k65LqaOxeN31SFsVm0n9DEzHgQz/SASdgduKl+bkClR
	gQxqZxbKwgtlnHhUQQdRxlVXZMzi13pA0Dz7Gn4SqyjNuD42cliwaQTp6x8NyrRi785yFYVnXtN
	qaSrEf/NhE22Vqw71MW2HptwPOljCsj0QP8eeX/KsVwzPnLh3EMSwiK3cPKBEKtandm7ek/y0dQ
	IxQI0Lkyhl4/dbiqanaHVpg3KmAchoVp8YdSfGZ5e+Zzju8OJa81XZPQoevhLNR
X-Received: by 2002:a05:6000:2992:10b0:488:654b:ccd8 with SMTP id ffacd0b85a97d-48dba7819famr976363f8f.6.1791525417754;
        Thu, 08 Oct 2026 22:56:57 -0700 (PDT)
Message-ID: <c2b31aba-3a05-419c-a688-4add24433260@suse.com>
Date: Fri, 9 Oct 2026 07:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/char: add timeout for XHCI console cable
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261008150528.359731-1-marmarek@invisiblethingslab.com>
 <8f61b665-17ca-4eda-b452-313eff8bff93@suse.com> <ase_8Flu9BEr5r5N@mail-itl>
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
In-Reply-To: <ase_8Flu9BEr5r5N@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791525418-BDEC6034-71982DB8/10/78276251493
X-purgate-type: spam
X-purgate-size: 2966

On 08.10.2026 18:08, Marek Marczykowski-Górecki wrote:
> On Thu, Oct 08, 2026 at 05:54:53PM +0200, Jan Beulich wrote:
>> On 08.10.2026 17:05, Marek Marczykowski-Górecki wrote:
>>> Do not wait indefinitely for XHCI to configure console connection. If
>>> the cable is not plugged in, timeout after about 1s and continue boot.
>>> If the cable is plugged in later, the console will be activated then
>>> (see final part of dbc_ensure_running()). When timeout occurs, print a
>>> warning message - it will be saved in the console ring buffer, to be
>>> later retrieved from dom0, or possibly later printed when the cable is
>>> finally connected. But, do not print the warning when waiting after
>>> controller reset, as that may have been called from from console
>>> dbc_putc() and printing here would result in (possibly infinite)
>>> recursion.
>>>
>>> Try the timeout to be about 1s, which is way above time needed for
>>> configuring already connected cable. But, since this part runs very
>>> early in the Xen startup, time is not calibrated yet, and functions like
>>> NOW() do not work yet. Use raw TSC and estimate needed time to be at
>>> least 1s on a fast CPU (5GHz), and possibly longer on a slower one. This
>>> is not very accurate method, but fortunately it doesn't need to be.
>>
>> A little fragile, but well...
>>
>>> --- a/xen/drivers/char/xhci-dbc.c
>>> +++ b/xen/drivers/char/xhci-dbc.c
>>> @@ -851,9 +851,15 @@ static void dbc_reset_debug_port(struct dbc *dbc)
>>>      }
>>>  }
>>>  
>>> -static void dbc_enable_dbc(struct dbc *dbc)
>>> +static bool dbc_enable_dbc(struct dbc *dbc)
>>>  {
>>>      struct dbc_reg *reg = dbc->dbc_reg;
>>> +    s_time_t start;
>>> +    /*
>>> +     * Too early for proper time calibration, assume a 5GHz CPU and let it wait
>>> +     * about 1s, with still reasonable timeout on a slower CPU.
>>> +     */
>>> +    unsigned long timeout_ticks = 5UL*1000*1000*1000;
>>
>> Even if right now we don't use the driver in any 32-bit env, I think we
>> better wouldn't deliberately break such a possible use. IOW unsigned
>> long isn't a suitable type to use here.
> 
> So, uint64_t?

No, as per ...

>> Also, nit (style): Blanks please around *.
>>
>>> @@ -870,8 +876,12 @@ static void dbc_enable_dbc(struct dbc *dbc)
>>>      writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
>>>      wmb();
>>>  
>>> -    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 )
>>> +    start = rdtsc_ordered();
>>> +    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 &&
>>> +            rdtsc_ordered() - start < timeout_ticks )
>>
>> Urgh - now the driver's truly becoming x86-specific. Is there a reason
>> this cannot be get_cycles()?
> 
> Sure, it can be get_cycles(). I just need it to not try to apply scaling
> that works only after calibration, but indeed get_cycles() should work.

... this it would want to be cycles_t.

Jan

