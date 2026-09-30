Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757D9CA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:06:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437219.1656058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBu1C-0006Rm-1m; Wed, 30 Sep 2026 13:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437219.1656058; Wed, 30 Sep 2026 13:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBu1B-0006Rd-Uh; Wed, 30 Sep 2026 13:06:41 +0000
Received: by outflank-mailman (input) for mailman id 1437219;
 Wed, 30 Sep 2026 13:06:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBu1A-0006Ee-5F
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:06:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBu19-006Uwb-3C
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:06:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd095b-8faa-0a2a0a5109dd-0a2a450cde56-18
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:06:38 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd095e-f479-0a2a450c0019-4a7de18c9302-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:06:38 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a003bd18e5so18621225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:06:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0174e161bsm83952885e9.5.2026.09.30.06.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:06:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1790773598; x=1791378398; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwrEv2DjlDw0MzNH7eiILf+kcjYXLulLHjMaOfVY3f8=;
        b=Zb5Jj4FmmH/9pGFB7ToCwhRji7X9yOBo0HOWqc3G+aKAyfLhnKYtImJesre4MEhcgt
         Zpnnxg15jPvWsPbCjuSAPC7REcQO+L9gJ7NTE+PI81tdHSfIeFrN3DlX197HMipZAmcl
         6wDjH8gS+eaP6mzKc1E7FetQJbLewp0BdtWPygFCpchHCQEU3Lc1jkpWcqTu+GP3ut0T
         2ZyQqRpTMH4Nr8266nB+0PD95fBzOMBQUV4nEPsGojm+CJJxmgX7vuo6ejDajN7Mdg3z
         vhdOSqLzjRoTy1ZFqgTydcwvK9EjeQ3MdiEIN70alTo5U5sxzUaS7Tu+uQkPCkuNdnVa
         Hv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773598; x=1791378398;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwrEv2DjlDw0MzNH7eiILf+kcjYXLulLHjMaOfVY3f8=;
        b=PE+7H8Nhe110x+QcpE8DMFn363399kIpHBvv/SLw8PRmJH5uY/mzrxzZYrHOFzJkG3
         NH6q8UciWv2+uLnXFmrcVPkKrvarxp1vIgDp6d8XvxsqKr885ybJOVzHhEoD74lN2fwL
         oe11MTpNaNGglOzMOysizVWM3xYZxjemKC/+Ebdh6liYATHT3UxjmLLJAoM0Ege4ZmvH
         ax0LQyMCC71gMOc7/YRxEWCXt+w2We1Iao8t+Y7JzK3IzAR6VRFlQlInakNWsGQocHh/
         yokEjNWzbZ5YirOBRnbe0lyf2cNiYoGJCOags0lNsMVSyO9t+7DS6VdlEJpWVucc9LiG
         LC+A==
X-Forwarded-Encrypted: i=1; AKwUvByi0OmF6a3tysvd4/zGrBmpMQn0TRnk3YgsFWzaqxWdzYSfa2I05YHI7T1O8//2yZjMTx3YhYwE/h4=@lists.xenproject.org
X-Gm-Message-State: AFuF++kt0mI4gkikRmC3Nx0hnbhZO/GunxlDEE+aFYwLhgoz/ibKjJYX
	3d+zHcARLdg7gndIiek2nuruu3nrZoQTwW2uVDGKXcLCscpjEaEqDn/9xHuYMEMGyw==
X-Gm-Gg: AYBFou3IIY1L987w41scrop4rH+GKWVPZFzZCJFxC3zp7syV2Wvj3eLgtczXTmsjsfW
	kfjxLA22nQoaUlK7eJxqPOCKJPhUgxug3baSL3xHI0KXAc7NAJI5XsHZT9YAOD6SfwMORj3KSlQ
	iIaTwh9ilTETNnAuv1VSkELDPTRRzrLfa3UFik3x3XKUzX18+aVIvUDlZ4CJHobQRMBsGbQTGE3
	zGmuyR9ig+ZoygWaGqF78BEzccgc+fYPHecT0HDmP2Jy4IciEBn4cUr0ap8/VKT8+ukrVhOHu8U
	mlLCkOUQpMPk5VWt0u7njbNbzIht74lh+7KTfk0eC3hPDKo/N34dQElXp23aNVd3Rx1yY2CK81x
	mCRt526aQgdhg15xJHc1e8UUAqKHYgplTcmyGaR3LE4cGzfADYv+zHacX9vmY+/Y5Nr+EV9Vyix
	8CIAd6Nvq6JOEuQirEIl08pRyYROZsfpCbrYQvMXCtPkbK3y4bdG5kOVfmC8eEr68Yvni1CdcR0
	D8Z7p6gQ/VLUlD3vfVNlPghlVd2pDoML4a6zeFrMwAlvanApgnh/8dH1YsKHA==
X-Received: by 2002:a05:600c:3ba3:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-4a01b017583mr28682065e9.26.1790773598015;
        Wed, 30 Sep 2026 06:06:38 -0700 (PDT)
Message-ID: <ee526731-509d-4802-8470-2dec9c5700b7@suse.com>
Date: Wed, 30 Sep 2026 15:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] vm_event: svm: Don't BUG() when enabling intercept on
 hypervisor MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
 <1abe6540-e92a-4d11-90e0-a3c13c9b0a97@suse.com>
 <1790773030.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@vates.tech>
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
In-Reply-To: <1790773030.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790773598-50520A5B-64CE7281/10/78276251493
X-purgate-type: spam
X-purgate-size: 2373

On 30.09.2026 14:57, Teddy Astie wrote:
> Le 30/09/2026 à 11:16, Jan Beulich a écrit :
>> On 24.09.2026 13:56, Teddy Astie wrote:
>>> svm_msrbits() only cover MSRs in the ranges specified in APM and returns
>>> NULL for all the other ones (i.e hypervisor range), which triggers the
>>> BUG_ON() that follows.
>>>
>>> APM specifies that MSR outside the architectural and AMD specific ranges
>>> are unconditionally intercepted, hence don't require any specific handling
>>> by SVM logic, fix this by ignoring cases when msr_bit is NULL.
>>>
>>> This is only reachable with CONFIG_VM_EVENT using XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR
>>> to configure a MSR intercept in the hypervisor range (0x40000000–0x40001fff).
>>
>> Hence imo it is wrong to drop the sanity check altogether. See below.
>>
>> Also, nit: Description lines want limiting to 75 chars.
>>
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -237,7 +237,9 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
>>>       const struct domain *d = v->domain;
>>>   
>>>       msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
>>> -    BUG_ON(msr_bit == NULL);
>>> +    if ( msr_bit == NULL )
>>> +        return;
>>
>> Imo the function wants to return an error here, which all callers
>> except the one you mention check. I.e. the BUG_ON() would be moved
>> out to most callers (alternatively the one caller could range-check
>> the MSR itself). Right now for introspection intercepts can only be
>> enabled, hence why for that use "all other MSRs are intercepted
>> anyway" is fine. Suppose the inverse operation would be possible as
>> well: Then indicating "success" back to the caller when accesses to
>> the requested MSR are still intercepted would be wrong.
>>
> 
> IIUC, you're suggesting to report to the caller that the hardware 
> doesn't cover it, such as we can detect cases where we accidentally pass 
> a bogus MSR index that is outside of hardware ranges.
> 
> In the VM introspection case, we could ignore it since we're only 
> interested on intercepts, where outside hardware ranges would always be 
> intercepted.
> 
> Did I got the idea correctly ?

Yes. Just that the more I think about it, the more I prefer the alternative
that I also mentioned. Not the least because it's less churn.

Jan

