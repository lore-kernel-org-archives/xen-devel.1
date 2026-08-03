Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD30AC55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:12:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381214.1624772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmqJ-0007i6-Ew; Mon, 03 Aug 2026 07:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381214.1624772; Mon, 03 Aug 2026 07:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmqJ-0007hz-C9; Mon, 03 Aug 2026 07:12:11 +0000
Received: by outflank-mailman (input) for mailman id 1381214;
 Mon, 03 Aug 2026 07:12:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqmqH-0007ht-Q3
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:12:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmqG-001kEi-Lu
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:12:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a703f3f-e002-0a2a0a5209dd-0a2a4508a91e-20
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:12:08 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a703f47-f659-0a2a45080019-d1558033b8a7-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:12:07 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so17468615e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 00:12:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-498081a12a3sm304521125e9.8.2026.08.03.00.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 00:12:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1785741127; x=1786345927; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYttu9GmNTW+Yd8Ey/akGPCigADcH3aBDJw1ZLxxrHs=;
        b=Gkh25rRhQDVtyeaJEojMLsDL0BUz1YdhWf7qnOu+u8UJMuhAvWvXbV56DqPY7nujJG
         Z3xPu0zfS5Vt9Slc7aUO3fPzLmABcKvY4xqq8hb93Rs/TA2I90zSRgKq3BC9ExpzFqgz
         hsiGuyk6+a6catWjXHaDfRbuGKQP9HYpUyjADlvEOVSec4D/8SXc3Sj0A1oLxc4hYYW6
         sGc+qRQuQ0bCGSrhIiuwpweiWBdqrcVVA4hnv1xfAxfD8arKVVMtdt6yziTzGNyoSpbl
         0LTC8h2DWIZRDJv/zP+fSwx8bFc/FBR3n9YXuZHFY2BvTqiyTaKP6Y3Via+/2EGCRsfy
         tmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741127; x=1786345927;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYttu9GmNTW+Yd8Ey/akGPCigADcH3aBDJw1ZLxxrHs=;
        b=HGty45UN0qOIzCsgZM/fGF8s002igdS6Gao7k92H9A0vvd57ZesIcIQTgnyW1SAOrM
         CBH2c49h7ZWgNFNIspq2UosOcdfur+q75vRq5fWl2WcJ4Ev6XECKQgpgzwkAuaJExunu
         qJSv8XVRvkB5FBTLvj+R+5v913rkOp1zRWAdl/l8Xc2HfgK5sppkeU2Tr3W05f8yXD/I
         g1JODBCk9pGouAVQ4ppDMCD6ez4XwOIySpu2Whu5B4f5iucHCJqnUqimRKZhrdinKrq+
         yPa2mtsWJj5Kb0b6JocN1iA/4qq9L8a7yU+wJATNj2tBfFTWGF3VL1b5jIocYp7ESp4M
         M/gw==
X-Forwarded-Encrypted: i=1; AHgh+Rre1dCb8IiaJ72qBD/7luuJTvaogJ52eLe0ivrT+LS0s6nyerQx3BhwqSXyktg5Xe0fD4IAkJYHdxg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi0f2NaL1sv7rsZ8fAERWySrbdT3iSDXpbLlm7rei/PUjvLBco
	tlcnVL9CbV5GosAz5JZ25xAMNPkCpuwR4UWS0MpjQXHbBXS3y0DHIEXMqPKCQbLLrA==
X-Gm-Gg: AR+sD11M9TdU+HI72Fx0q48/cpebJ8C0IgiNZyTBoTpxnGSt1VQPG+4C4cJ2LYuL0Go
	JcgPLpfDpindFTm7r7K8i9mJdiwL6t2yz3jvmf+iIhBFXIifpPjUk7TYmDKoMIZZlMPd1hznG2W
	iVB5rS5QRM0Iff+og1wIlTzfLGJz7+oq+Fo/zExcKzb5bBZLNqUUq9S0PeMItQz6HIsiCAFOQJC
	M2Y14iLxWDzwpXAyHNSRakA/WhxOS/UpumPMGa9YbJ4hbkGLJULA3TRgSO4Yaof+3W0j7IFVMV8
	Kn+lyQC8UbjVqsDExJyg9gwnBvmndlanpe2/o6bJ5aEbp8nM1Dp+vJBPwKPznbXX2sT6tqdht1G
	ffi9iAtMcR/1mF9M3qMG/LDp/RwZKlYCMw+j0rnWMr3G7npOzJNI6yjpraoejxmIlkQtpx3uJUn
	eddbiRFuylGq9iixxguRXjwfZeS9Etl7bKF0W408L6HB7f9Whc1smC18hnWX0wxANspI7ncxuDD
	zUsD8IPJHkeUxlEzrr+K+5DxadVAQT27JEF6U2qvgA8JK3MiadG
X-Received: by 2002:a05:600c:8711:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4980c652515mr233174835e9.11.1785741127248;
        Mon, 03 Aug 2026 00:12:07 -0700 (PDT)
Message-ID: <c99c9645-4ffe-43e3-a56e-1a0c6efc006e@suse.com>
Date: Mon, 3 Aug 2026 09:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, jason.andryuk@amd.com,
 xen-devel@lists.xenproject.org, teddy.astie@vates.tech
References: <1785247466.8631fc262581453bbf619ec5b2062170.19fa90a823a000e099@vates.tech>
 <20260731142700.2207713-1-abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <20260731142700.2207713-1-abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785741127-CC37587B-7C1ABA6A/0/0
X-purgate-type: clean
X-purgate-size: 2052

On 31.07.2026 16:26, Abdelkareem Abdelsaamad wrote:
> On 28.07.2026 14:04, Teddy Astie wrote:
>> On 16.07.2026 17:41, Abdelkareem Abdelsaamad wrote:
>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>> @@ -320,6 +320,31 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>>       svm_dump_sel("  TR", &vmcb->tr);
>>>   }
>>>   
>>> +static bool is_valid_svm_vmcb_injected_exception_vector(
>>> +    const struct vmcb_struct *vmcb, uint8_t vmcb_injected_vector)
>>> +{
>>> +    return ( (vmcb_injected_vector == X86_EXC_DE) ||
>>> +             (vmcb_injected_vector == X86_EXC_DB) ||
>>> +             (vmcb_injected_vector == X86_EXC_BP) ||
>>> +             (vmcb_injected_vector == X86_EXC_OF) ||
>>> +             (vmcb_injected_vector == X86_EXC_BR) ||
>>
>> This particular exception is special. AMD APM states that this event is 
>> "impossible" if the guest is in 64-bit mode and will cause 
>> VMEXIT_INVALID in such case.
>>
>>> If the VMM attempts to inject an event that is impossible for the 
>> guest mode (e.g., a #BR exception when the guest is in 64-bit mode), the 
>> event injection will fail and no guest state instructions will be 
>> executed; VMRUN will immediately exit with an error code of VMEXIT_INVALID.
>>
>> So this one likely want a additional check for hvm_guest_x86_mode() != 
>> X86_MODE_64BIT.
>>
>> It looks like #OF has the same quirk (invalid in 64-bits mode).
>>
> I agree your point is valid. I will address in V3.
>> Though I don't know if any other exception has a similar behavior though.
> I have double-checked the APM vOL3(24594—Rev. 3.37—jULY 2025) regarding the
> other exception vectors and instructions. Vector 4 (#OF) and vector 5 (#BR) are
> unique because their triggering instructions BOUND and INTO are invalid and
> disabled in 64-bit mode, making them structurally invalid. Other vectors remain
> legal across the other modes.

#BR is also used by MPX insns, which are usable from 64-bit mode.

Jan

