Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E26C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 16:03:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432628.1653801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9luf-0004Y5-46; Thu, 24 Sep 2026 16:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432628.1653801; Thu, 24 Sep 2026 16:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lue-0004Xy-Vr; Thu, 24 Sep 2026 16:03:08 +0000
Received: by outflank-mailman (input) for mailman id 1432628;
 Thu, 24 Sep 2026 16:03:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9lue-0004Xs-Ba
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 16:03:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9lud-0061dj-Oe
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 18:03:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab549bb-8faa-0a2a0a5109dd-0a2a450cecd2-2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 18:03:07 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab549bb-f479-0a2a450c0019-4a7de18d9b0d-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 18:03:07 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49d1ca5b0d6so155705e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 09:03:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a30b1dfsm87108f8f.4.2026.09.24.09.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 09:03:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1790265787; x=1790870587; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWz2yHL4cCdzhK6NSrqSIDHb7ADPce6lpaQOPtlheVQ=;
        b=KRzjf7mgwZn7d5KIF8RhNfEnc/cShy2yMWzE2IU0r+rYVwNcyF9/xDSQIgTsvqv0lF
         ANNxe6601hjkru8MtdnJAGqGl88iGfHcFE6jWpHcuawhFGjLlBN0LHvv1UDOkVM/dpFD
         BzuWitRiaFqGhVhjOzUFAchoPTi5E0vzy7/U+qHQ/1fYaS07UBem5Pqqhw6KOQwtN+F3
         rQ+yYoydGw3WK/DD2ktwj8cXxJRCYG1yqWLYmnGysqJT/ZhjI/FkbvpJvicyGrDOUMCK
         3bb0u/CJSMgT0fuFUl1WiZAf9IBya5P5svU19JeBZ19XjJNE3znb99IKRPihjtGSXW1j
         1ZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265787; x=1790870587;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWz2yHL4cCdzhK6NSrqSIDHb7ADPce6lpaQOPtlheVQ=;
        b=UauOj5n+3g90ImDIjSBVNsk+WhyzEr6rUt1ATWwckAIZtRl36q+Dr1tcmafK/pDj0j
         8HY5TUfsNx3y6Nvpx3O9MhTL7kTcf3dbURHW5+ELAGKCnobZSX8Z4V55Al6jmexAFsvG
         ex8lJoUkmdAq/UVGrxWFyOgW7LhH4QMp9npddCiuj7sSS3mhDqVZe3etjWHGop9afm5Z
         Ka+qYwZSj+cyXZ49046OI0s+M1ExAkAHPaR+Z1bjA3sm6AlyjqVd6GLsJNab0rtCCKUF
         SCsLKBjZWXrutMMiZM24Q756maWv4XEoL2AzC+OT1lxUe80UO2ntl2V5NuQuNMrjgjAy
         f1qA==
X-Forwarded-Encrypted: i=1; AKwUvBxbZqcscmIqouhxEMOwd60b2MW/i69Ui8YS0TN9jt7Jsk4eW1EJ560TYjYyzmGoAH6MFKXfI54dZ/c=@lists.xenproject.org
X-Gm-Message-State: AFuF++k4szpAXKtLWOM5xn+xcRCvO9Id+xdmqhbMv1mRA6oUfKsfapIP
	2uu4hrMMDJuSic+9gW02EtttdHU/IvceqB40jSEo2U3TQfqev6ntO2fFoK/NYsn4uA==
X-Gm-Gg: AYBFou2Zq6crWTDRfd/OtnnZIQ+IQWZYo4Nrlu2llQA+OHFx2XO94Ul722tycY2Iqgp
	B7XRqIIfRroOumIX+hGVx4ja3XOzud8svRymUugSpgg+L/IMFGDhSvT3O8hieENFYyEcNetg/y8
	qA6FeLUdhcggW8Jv8dElaXpBhS1Y6DP9DfBS5l9Wy7o8iXECG0vYlxv36KfSn6EIdjUyoav9oOk
	zsAcHoZnK15hVEivx5gIB6BgJOtM4tFRm3Gzr1FyvzwpN6JdgWcQCX+0GtqoVjJtK5/I8m2ld3h
	N5h9Lcu3NRnVOAh7us/Og974P1Mr8dFXOcg+FjWDG6Gi+KCumG2UPr7Aao/LAQyNER+iW4ZicWO
	F/6fhrKw4VkRvWY2kczDe9thLt0e9bfOK1w5i6/SBQsdl3Q9C802g4t0hS/EZOHSAjUbgoGxaM3
	eTAiC5sVu7xqGoiQRGhfWVQIyYYRB+xVx6OzYm48oPl6I+AILg2BgKYJzY8CkpEopV105yhKBfF
	Zst2ln45Pc9i5GF2bbkJiuxWxZ20V76UHF024qPu/OcOSKGUe2cyl4h8d5czg==
X-Received: by 2002:a05:600c:a010:b0:49e:79c5:ee93 with SMTP id 5b1f17b1804b1-49fe66b422emr52312045e9.8.1790265787005;
        Thu, 24 Sep 2026 09:03:07 -0700 (PDT)
Message-ID: <f916b3d6-24dd-4e48-88dd-c61f4f9e3c5d@suse.com>
Date: Thu, 24 Sep 2026 18:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org, Lin Liu <lin.liu01@citrix.com>
References: <a5702b9bc1d354dac5778deacbc397e76530408a.1790069475.git.lin.liu01@citrix.com>
 <38c41bfb-48c6-4408-8da1-2b7d730a6c9e@citrix.com>
 <711e6af5-beca-4b71-a2cb-75cb1ed93689@suse.com>
 <70bd67f8-fbe2-44e2-a050-b6065ba2de7f@citrix.com>
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
In-Reply-To: <70bd67f8-fbe2-44e2-a050-b6065ba2de7f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790265787-778D5A5B-28DAEA79/0/0
X-purgate-type: clean
X-purgate-size: 2199

On 24.09.2026 17:50, Ross Lagerwall wrote:
> On 9/24/26 4:01 PM, Jan Beulich wrote:
>> On 23.09.2026 13:16, Ross Lagerwall wrote:
>>> On 9/23/26 10:51 AM, Lin Liu wrote:
>>>> Xen leaks the host's CR4 bits to L1.
>>>>
>>>> nsvm_vmcb_prepare4vmrun() constructs the shadow VMCB's CR4 via
>>>> hvm_set_cr4(), and svm_update_guest_cr() ORs in HVM_CR4_HOST_MASK.
>>>> nsvm_vmcb_prepare4vmexit() then copies CR4 back out of the shadow VMCB
>>>> instead of the value kept in v->arch.hvm.guest_cr[4], so L1 reads back
>>>> Xen's bits - under HAP, CR4.MCE.
>>>>
>>>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>>>> Assisted-by: Claude:claude-opus-5
>>>> Signed-off-by: Lin Liu <lin.liu01@citrix.com>
>>>> ---
>>>>    xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> index a8b15d6eae..8d99b0affc 100644
>>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> @@ -1082,7 +1082,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>>        ns_vmcb->_efer = n2vmcb->_efer;
>>>>    
>>>>        /* CRn */
>>>> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
>>>> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>>>>        ns_vmcb->_cr0 = n2vmcb->_cr0;
>>>>    
>>>>        /* DRn */
>>>
>>> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>
>>> Did you consider addressing similar issues with the other state copied from
>>> n2vmcb as well? i.e. I think something similar would apply to CR0, EFER, etc.
>>
>> But (assuming the above code change is indeed correct) wouldn't we better deal
>> with CR0 then right away, rather that leaving things even visually inconsistent?
> 
> That's up to the maintainers to decide, though given the state of the Nested
> SVM code at the moment IMO it is fine to take valid improvements and make some
> forward progress even if they don't address all the related issues at once.

Yet moving code into more inconsistent shape isn't a very good step, when things
are meant to be truly improved.

Jan

