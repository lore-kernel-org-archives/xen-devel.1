Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4125C5B567
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 06:29:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388750.1629732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu2SN-0003v2-Uk; Wed, 12 Aug 2026 06:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388750.1629732; Wed, 12 Aug 2026 06:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu2SN-0003uv-QQ; Wed, 12 Aug 2026 06:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1388750;
 Wed, 12 Aug 2026 06:28:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu2SN-0003uo-20
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 06:28:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu2SL-005txm-5b
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:28:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c129d-bab6-0a2a0a5309dd-0a2a450aea1c-14
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 08:28:52 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c12a4-f2d2-0a2a450a0019-d155802ed1b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 08:28:52 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so4851695e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:28:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997abf94c1sm44841725e9.14.2026.08.11.23.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2026 23:28:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1786516132; x=1787120932; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVg90yFmwII+LbLwDw+Exz3K4H1Lnit4dmi2Gn6xOFs=;
        b=StvGAcyxr+zINClrFGYw6VKq/YEzFdF1z7/m1GzHqmYYq11ONRIxPSOYW6vxs/aYb6
         ARoe+bVow7NP4d+HPU3r+pWn5uu4uETvFKETNCdtH14KnUDto1wwMTx9GGtRc0jyFhu8
         4lj5hXzQ59BzCk5GYSrdOAfln57LgSzuGIT/Lb8tHYDVpNTcIDuk9kQlc4C26YHjlBDN
         yp1pSJZlnJF1xR7jll6IeG2kBthUXCVnWlYIF+T/ng7Yz6tiFaCyrliEzOjvL/8/ClI4
         CKZhuuUQ/JtId7xbVZHG0+JDr4MkxvKsZ7SQhaSNh/DfLqikGQ0kgLfpqTKEVO/KREIu
         ffHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786516132; x=1787120932;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVg90yFmwII+LbLwDw+Exz3K4H1Lnit4dmi2Gn6xOFs=;
        b=IJ79q4B7KnizOZK+lsToIcjnYXbDsKpToWkOQDM52palz808hHU0/Ym3og+bkjgpsm
         yQaMQEojaxHfY8umpyIN8ZuEBRes2PhJeOUhzgQZPbMZC191Su6nCxT23op//8Zzas2c
         Pta9aAkXFqWkZA7WUALa7tJFmyzDg8PVlkvPHqSwczhCzfXnQWrqOEFa2xMKHFR+33Ht
         rVbdQNaPNr8otboNkcY3KmuxQjVrEWectr6ro12kcqJdgUlqCHfNkisXv13t4UEK3aDY
         VgoTCN1fzi2ioAyP9QBdi33G2Wd3LygQeLAenZEWrQT5aJBco+EEDR+7U6tL9JPPEnzH
         RxdA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1ESl3C//GnyTHyrah5cVaK6pfDW8bBESgkJKb/2PdjuF0iFP1JFTKVRcKv07XiroqAVup56fcmm0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/pFnR+IWYH30KZTNa2tr3xMkLoqAkO6UIL/LzJgcsmvdAAQhZ
	rOeCcCzo4LnJ+8osnDByieeAMJ4d7hv/d0osbhdnWcPLo/s8imPzz+KCENjak7Lh8A==
X-Gm-Gg: AR+sD13n0w+osOqW03GWNQ/coTOWC72ppR80QB5jFNX2kJt+gPl4IC23320BYzIjL0G
	4nh23fjNA5LAYz7WwFNNGPDulDiA4aoSDCAFhGXgdq8oBU/EwlCZt/d6eGOjrYqjOgqA1NMYD20
	Ab8yPVQD11pF5wRfKvLLRZ9HSyymTUJEvkJFo/bstlGJNopaQ1L1Q4ZZCxA+0SevbnlOt8fkmPj
	jTV73zZWC/b4MY/0D9IzyeOYx1FYmBhCE19wQ6uluRisdBH+hbdjLNtQYt+d8Lo07d9kpo8oxtD
	dXG/CiCRvUCiPGFfANCXOJWFDNkS3MTin/nBIzXLgC56Jh0/KeQAv/8xiz2Fx7E9wC5DJTQxjAG
	Xw3nfwRKi3aOrJROwYVN7mzLHRZ0oBigRU6mHMo9ASDSMnzV+avbPJAzf6vEnsqlJfqiaeD6iyr
	4QMh2Oshr2XFyxPxOklthKOg2W8oJwlv6+rZpwx2juN5ap0K/aLXLHfrACvpm2IMspcZG93dGnB
	/g/SqN4Byr5WKCj5dGQHMROelQ4hszGgSh62OBCDfyvdpcWdWALyJeJtmDBu+c=
X-Received: by 2002:a05:600c:524c:b0:499:7219:122f with SMTP id 5b1f17b1804b1-4997c39ca1emr25119805e9.4.1786516132439;
        Tue, 11 Aug 2026 23:28:52 -0700 (PDT)
Message-ID: <a711a0d1-dbf0-44fb-a419-38abc62480ad@suse.com>
Date: Wed, 12 Aug 2026 08:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/pci: prevent cross-device accesses in
 pci_mmcfg_{read,write}()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260806152619.23881-1-roger@xenproject.org>
 <20260806152619.23881-2-roger@xenproject.org>
 <c818745e-6f61-4b32-b7f5-ee5b7ff82981@suse.com>
 <anWQ15K8vi3t1sgF@macbook.local>
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
In-Reply-To: <anWQ15K8vi3t1sgF@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1786516132-506CECFC-9F9328DC/0/0
X-purgate-type: clean
X-purgate-size: 2296

On 07.08.2026 10:01, Roger Pau Monné wrote:
> On Fri, Aug 07, 2026 at 08:22:44AM +0200, Jan Beulich wrote:
>> On 06.08.2026 17:26, Roger Pau Monne wrote:
>>> Introduce a specific check that prevents an accesses from spilling across
>>> two devices.
>>>
>>> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit with a remark:
>>
>>> --- a/xen/arch/x86/x86_64/mmconfig_64.c
>>> +++ b/xen/arch/x86/x86_64/mmconfig_64.c
>>> @@ -61,7 +61,8 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
>>>      char __iomem *addr;
>>>  
>>>      /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
>>> -    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095))) {
>>> +    if (unlikely((bus > 255) || (devfn > 255) ||
>>> +                 (reg + len > PCI_CFG_SPACE_EXP_SIZE))) {
>>>  err:        *value = -1;
>>>          return -EINVAL;
>>>      }
>>> @@ -91,7 +92,8 @@ int pci_mmcfg_write(unsigned int seg, unsigned int bus,
>>>      char __iomem *addr;
>>>  
>>>      /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
>>> -    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095)))
>>> +    if (unlikely((bus > 255) || (devfn > 255) ||
>>> +                 (reg + len > PCI_CFG_SPACE_EXP_SIZE)))
>>>          return -EINVAL;
>>>  
>>>      addr = pci_dev_base(seg, bus, devfn);
>>
>> In both cases the unlikely() uses won't have the intended effect, from all I
>> know. They would help as used here only if the compiler managed to fold all
>> three parts of the ||-expression into a single conditional branch, which I
>> don't think it would end up doing.
> 
> I don't mind dropping the unlikely() while changing the line.  I tend
> to leave those alone if present, even when I'm not sure they are
> actually helpful.

I think unlikely() is actually reasonable to have here, yet it would need to
be four of them, not just one. Unless reachable from a DomU-accessible path,
converting to BUG_ON() (or ASSERT_UNREACHABLE()) instead would also be an
option.

>  The comment ahead of the check is also not very
> useful IMO, but I've decided to leave it alone.

Indeed, that's an odd thing to survive over 20 years (I think).

Jan

