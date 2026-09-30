Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0435ACA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:56:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437416.1656316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvjB-0000MW-6g; Wed, 30 Sep 2026 14:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437416.1656316; Wed, 30 Sep 2026 14:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvjB-0000MP-2g; Wed, 30 Sep 2026 14:56:13 +0000
Received: by outflank-mailman (input) for mailman id 1437416;
 Wed, 30 Sep 2026 14:56:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBvj9-0000MJ-Gs
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBvj8-00A6NP-Ql
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:56:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd22fc-e002-0a2a0a5209dd-0a2a450c9bde-36
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:56:10 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd230a-f479-0a2a450c0019-4a7de18d9d58-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:56:10 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7d2bb404so8788125e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:56:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01e42ad94sm5803225e9.1.2026.09.30.07.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:56:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1790780170; x=1791384970; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBZOym+Gxz9yKCpSM26V+js9UUOdf2hbNTH5ftF6Jiw=;
        b=A2QipdND0MbIJyxPZjUWHNaS0mp47vbSkEXbhEP82Z/5HzrD/9B+GDmD6lUWgcz+p5
         3vGjAk93j7x/1Y/+/WVTFkm4F/0KzYFG80OE7Ftn30l3o4y5i64gmBMgwQNXdErHX8lH
         L2LKqrC+j+n/BWIIoaUDeS5im+7UDG9y3WpFSSnRhNW6xSJiCBZuW6OekwxLvUNI5+/G
         a0rcqAI6PDVV/o7N6tcWITCLVPkrXRiCBdeGkxiAmT7ktc39V4fR2IpRlhNsMlms/rse
         UJtXSNO3yBVKXkhBA7n9ERtLupad/PUpFtPC+ScEfxoD1ZhuCNlUIIrvwJNPCBpZ/YVQ
         k+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780170; x=1791384970;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBZOym+Gxz9yKCpSM26V+js9UUOdf2hbNTH5ftF6Jiw=;
        b=kovGWaaqEMUGyqCZj7owh9k/RxhiBZYrofSAY3riWnIMlo//B/Bn9327oC19yM4Kvt
         HvkX2BT6P4ijTtpwg580bSgq4Jk189RfRuoYDNtHC5XhdVogbfSJrbmYEHV6jElkImO4
         Zqp3aGR6Ff9xzdJ5ZlOWCjykagjQZqclw+lPnXxBBVYkMhUpAm2DtnU+agVYarQYr54Z
         L0Muxa73DsvVTUDfJvl/5GufH/vL4BOywtlLrjLVoqd83LwVeu80dPrvZ3tB13ydas2s
         h5QdyvFd+fW7P8AbG95BHdrv+h0ozeiVW7yCDSB+jOlTOqmNYaoGVTiSJph2c1lzg8dA
         T7jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHcy2fQBb923GQgtU+kjbQWajBHGtBYqYRcLb7Uj/y1k24kFJPLW67veTYhT9q4lqoEINwtK5p3eI=@lists.xenproject.org
X-Gm-Message-State: AFuF++nVbLnIxPF4/VR+XBBZMu+4mxiC4D6Zi8Vq4w27tv8mOhjjTgeM
	PCE/42EHqZLwoKpKpHEUZ92D9qDgZOL63eHSGF8lAHQiPCYGC1mQQlszvNH1uKPB5Q==
X-Gm-Gg: AYBFou1wsdp+G3OJcBAqLyb0f6qkiRnXaxkki5lRdPZedeeRh6N9pDd05kgx49/W1iz
	8d26HOuhdvL64VR0OExUj49m1KGiIO2dHKZip12C7y2gYhNvXYqE2iR26VpXq2ypQBPobqgv8/w
	mvx2g4pkgZOCHdeTdg13xkCiYac8/Kk5I20whhcUbwNFaEY9XuMe+9ISHeXf9OZbj29n75StOYh
	waT/hqHv/ynlPKl14hWyDFWBRvSH/XY71thmamduKiD2ewE1l6z7YXcZBZScZTazjAHS4aLew4O
	4cXAMzIPBvwribLpjZgHjWeAFQYwkATtpQDAugEkGVAHEHlRO+YoDVrX4eIMzmr6AKrA8T4Pha7
	k407Ym/+c8kIiXteyKuVS5RBQ0fNrQWGjvZC19FcYJoRT228ZQdr8ci5xZIk2wXjxTuQeatz/pB
	jrUKi+V2TJLBQsBtD7Yj7LDIXFuesC9IiMBZio4EtTdI5I5K8fUv01BPON0x8noX3ekYHG6ZxGM
	OZSeZQDNjDNxOyGC2D79Gcu2LLxLnqFZUB/cusxx/6aRfy4RcrsnQE5HRYaUAA=
X-Received: by 2002:a05:600c:4f8e:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a01b196740mr26816715e9.6.1790780169100;
        Wed, 30 Sep 2026 07:56:09 -0700 (PDT)
Message-ID: <fde528e4-a3d3-404e-8c4e-a05a3c998bd1@suse.com>
Date: Wed, 30 Sep 2026 16:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] vm_event: svm: Don't BUG() when enabling intercept on
 hypervisor MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
 <1abe6540-e92a-4d11-90e0-a3c13c9b0a97@suse.com>
 <1790773030.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@vates.tech>
 <ee526731-509d-4802-8470-2dec9c5700b7@suse.com>
 <1790775549.8631fc262581453bbf619ec5b2062170.1a0f28a5dec0003f66@vates.tech>
 <232f5f5f-a87d-4407-8175-ed164c9e1a74@suse.com>
 <1790778656.8631fc262581453bbf619ec5b2062170.1a0f2b9c8270003f66@vates.tech>
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
In-Reply-To: <1790778656.8631fc262581453bbf619ec5b2062170.1a0f2b9c8270003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790780170-76ADCA5B-FB969877/10/78276251493
X-purgate-type: spam
X-purgate-size: 4044

On 30.09.2026 16:30, Teddy Astie wrote:
> Le 30/09/2026 à 16:04, Jan Beulich a écrit :
>> On 30.09.2026 15:39, Teddy Astie wrote:
>>> Le 30/09/2026 à 15:08, Jan Beulich a écrit :
>>>> On 30.09.2026 14:57, Teddy Astie wrote:
>>>>> Le 30/09/2026 à 11:16, Jan Beulich a écrit :
>>>>>> On 24.09.2026 13:56, Teddy Astie wrote:
>>>>>>> svm_msrbits() only cover MSRs in the ranges specified in APM and returns
>>>>>>> NULL for all the other ones (i.e hypervisor range), which triggers the
>>>>>>> BUG_ON() that follows.
>>>>>>>
>>>>>>> APM specifies that MSR outside the architectural and AMD specific ranges
>>>>>>> are unconditionally intercepted, hence don't require any specific handling
>>>>>>> by SVM logic, fix this by ignoring cases when msr_bit is NULL.
>>>>>>>
>>>>>>> This is only reachable with CONFIG_VM_EVENT using XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR
>>>>>>> to configure a MSR intercept in the hypervisor range (0x40000000–0x40001fff).
>>>>>>
>>>>>> Hence imo it is wrong to drop the sanity check altogether. See below.
>>>>>>
>>>>>> Also, nit: Description lines want limiting to 75 chars.
>>>>>>
>>>>>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>>>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>>>>>> @@ -237,7 +237,9 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
>>>>>>>         const struct domain *d = v->domain;
>>>>>>>     
>>>>>>>         msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
>>>>>>> -    BUG_ON(msr_bit == NULL);
>>>>>>> +    if ( msr_bit == NULL )
>>>>>>> +        return;
>>>>>>
>>>>>> Imo the function wants to return an error here, which all callers
>>>>>> except the one you mention check. I.e. the BUG_ON() would be moved
>>>>>> out to most callers (alternatively the one caller could range-check
>>>>>> the MSR itself). Right now for introspection intercepts can only be
>>>>>> enabled, hence why for that use "all other MSRs are intercepted
>>>>>> anyway" is fine. Suppose the inverse operation would be possible as
>>>>>> well: Then indicating "success" back to the caller when accesses to
>>>>>> the requested MSR are still intercepted would be wrong.
>>>>>>
>>>>>
>>>>> IIUC, you're suggesting to report to the caller that the hardware
>>>>> doesn't cover it, such as we can detect cases where we accidentally pass
>>>>> a bogus MSR index that is outside of hardware ranges.
>>>>>
>>>>> In the VM introspection case, we could ignore it since we're only
>>>>> interested on intercepts, where outside hardware ranges would always be
>>>>> intercepted.
>>>>>
>>>>> Did I got the idea correctly ?
>>>>
>>>> Yes. Just that the more I think about it, the more I prefer the alternative
>>>> that I also mentioned. Not the least because it's less churn.
>>>>
>>>
>>> One of the idea would be to check monitored_msr() (somewhat like what
>>> you proposed for VMX) so that the VM event case is covered, but we
>>> ASSERT (or BUG_ON ?) in the other cases if we pass a unexpected MSR to
>>> this function.
>>>
>>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>>> index 71e48351f2..be866b9055 100644
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -236,7 +236,12 @@ void svm_intercept_msr(struct vcpu *v, uint32_t
>>> msr, int flags)
>>>        const struct domain *d = v->domain;
>>>
>>>        msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
>>> -    BUG_ON(msr_bit == NULL);
>>> +    if ( !msr_bit )
>>> +    {
>>> +        ASSERT(monitored_msr(d, msr));
>>> +        return;
>>> +    }
>>
>> Just that ASSERT() only covers debug builds and BUG_ON() is too heavy on
>> release ones: There's no reason to kill an entire host because of this.
> 
> So we should do WARN_ON() then ?

Not sure, as would still hide an anomaly from the caller (which ultimately
is responsible; the log entry is only indicating the problem to the admin,
and only if they care to actually look). You didn't Cc Tamas on this
series, yet his input would be valuable here.

Jan

