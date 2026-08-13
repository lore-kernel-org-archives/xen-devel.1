Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C179C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:51:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389695.1630344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuS5Z-00042C-6X; Thu, 13 Aug 2026 09:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389695.1630344; Thu, 13 Aug 2026 09:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuS5Z-000422-3R; Thu, 13 Aug 2026 09:51:05 +0000
Received: by outflank-mailman (input) for mailman id 1389695;
 Thu, 13 Aug 2026 09:51:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuS5X-00040I-ME
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:51:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuS5X-009n1K-2r
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:51:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d9378-8faa-0a2a0a5109dd-0a2a4501e90a-28
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:51:03 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d9386-5984-0a2a45010019-d155802cd48d-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:51:02 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso5731485e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 02:51:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998216d082sm50735065e9.13.2026.08.13.02.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 02:51:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1786614662; x=1787219462; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5OfhvD3pYYO8/RQB3SMAqSpCVkJqg0fNsO1T2bjuhk=;
        b=eIeisjF/ABKHV/XMkDkyc3o5UYndmvLeRILFG+lrWY2s91PPxjxrJuBYdUizj7TaLU
         cQvqkHV/XGn0PvllLa1NfBZbdYEcbwI9ekoYHBMf6bQjITIgZVieC2ZmDQtzv08AtTIV
         Qei48RIFAzIj7Ag84pOKXoKWIGO/0JRCmQ1Ch4/gspBmDUSYKUgS+YumD8hFAO6biceb
         SQm97RMSj99TCq5zLCnLr7KkIRzH0fLAvHOeTveThBsl+VYPJgYs+2NsuMJhN9dnRnVp
         Mm6uvjAnIWL29w50q8/po0v4QqGo3OcEFWfHHwkcbD2JDMCLkMJioR0uc6OSNQZ1b9wU
         t0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614662; x=1787219462;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5OfhvD3pYYO8/RQB3SMAqSpCVkJqg0fNsO1T2bjuhk=;
        b=dT07BGjOmHB2x1iBkQ3gOU0MjChM5bEeYyChyOgrO/wzctINKc41J9gLMhNO6AZWRD
         QkXNPVBVuSEBkW5ZaXSnkvkk1zu7DMWdaUCM+ILnGBsC3vjatud/uIw9XSQX/eZ8FQo5
         m/RqsJe4TiooOkjZAXFa+wwBu9UG58WZxAGhPKKhfHSqjJ/zw8VWg7DT5AFye8y3iRc9
         BUrjW8v0WUae0JmY4IFwRHJM7b2oA1sJKxZ7oiFih0GWMNIJw6yZ+xBCGMV0tD2EPAnx
         uhfS89XMRVgJa4uG92YywZCDvaLX6hJMNhEufLIyviXiaHGgvF+OiFtVbU3sv0dRb01p
         1FvQ==
X-Gm-Message-State: AOJu0YyHRdOhfmP5uHDJUUty0LNOSaQ7562x82XG7OOw/j9H4Z522iZX
	9Rf7af9SC24h/EPMMK6VY/wjrB9SQ8kGpsrG2/nljFV7Jy/xW0fOvtiFbd643q+OOA==
X-Gm-Gg: AR+sD13uty3reGMJ0ejCuzCWvm427HP4VLx8Wr82MlGd9WkKxqAwE6WoQIacnBxt9ly
	KNPXqoLWXNOHjsrsbUpsjSe+tLe7n6l8/2qXhKVsNXNB7w3Tc0OlONbJM9pp2Kvo2QiLRjvZZG1
	CTgsezdeR1rtc8oqNZ1atOXx/ONDRSC1WZbXkfGOMQ2o/szeDj14ghl6wB4TtLckL9EDRw2H/c2
	WvXIJvVYWqomNVnUGWW4+XQN0BRSf+ZKje+I0X/FrhGh3kblPZ3RABCuhf0CMN2MMhD/6+zdEOE
	vKeiU2tB4k333GiAGuhLyi14DIQG11pCCMMD0mmruhjD77TZdhfT/JatkR1XDA6hlWBaoyRrBY1
	AGdxWvSBwU6PLbtyfCeDrJJKoQVNavZ0LU31JJboBHA7+iE85nC7sF1ehHq4hW8cPDzNE2jyvuU
	lJOHyEFecbqhkLC2M/oY1j8OHVKU7UQzNY+3lIsVkFXL593qsjNQN5CAxlngID2jRv6ZAQfnIfo
	EpZFLzKDvshVZ/5EGe8N1B+PMKrVxYQK8v6aemAfDkTPiHfMPn5
X-Received: by 2002:a05:600c:1f8b:b0:499:81ae:1020 with SMTP id 5b1f17b1804b1-499821e7fa8mr49580415e9.11.1786614662417;
        Thu, 13 Aug 2026 02:51:02 -0700 (PDT)
Message-ID: <82011389-489e-4076-9d3a-8c393e4a8e76@suse.com>
Date: Thu, 13 Aug 2026 11:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@vates.tech>
 <9724c838-6713-4f29-89ab-54f50ec4fe8e@gmail.com>
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
In-Reply-To: <9724c838-6713-4f29-89ab-54f50ec4fe8e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786614662-BE27A757-E041E5D1/0/0
X-purgate-type: clean
X-purgate-size: 1688

On 13.08.2026 11:34, Oleksii Kurochko wrote:
> On 8/13/26 11:30 AM, Baptiste Le Duc wrote:
>>> --- a/xen/arch/riscv/imsic.c
>>> +++ b/xen/arch/riscv/imsic.c
>>> @@ -20,6 +20,7 @@
>>>   #include <xen/init.h>
>>>   #include <xen/libfdt/libfdt.h>
>>>   #include <xen/macros.h>
>>> +#include <xen/rwlock.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/smp.h>
>>>   #include <xen/spinlock.h>
>>> @@ -418,6 +419,28 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>>>       return res;
>>>   }
>>>   
>>> +void imsic_state_save(struct vcpu *v)
>>> +{
>>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>>> +    unsigned long flags;
>>> +
>>> +    /*
>>> +     * SW interrupt file always has ->vsfile_pcpu = NR_CPUS so nothing specific
>>> +     * should be done in this case.
>>> +     */
>>> +    if ( !vcpu_guest_file_id(v) )
>>> +        return;
>>
>>
>>> +
>>> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>> +    imsic_state->vsfile_pcpu = cpuid_to_hartid(v->processor);
>>
>> How will you detect a migration is needed? Don't you need to first know
>> if ->vsfile_pcpu is different to cpuid_to_hartid(v->processor)? (I
>> didn't take a look to other patchs for the moment, so the
>> explanations might be later.)
> 
> Migration (if you are speaking about migration of vCPU from one pCPU to 
> another) is completely different path. Look at sched_move_irqs().

See how terminology is important. As said elsewhere, "save state" and
"restore state" don't make clear at all in which situation they're to be
used.

Also, can both of you please adjust Roger's email address when replying?

Jan

