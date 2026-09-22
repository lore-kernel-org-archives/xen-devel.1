Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF03C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:16:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428673.1651565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yU6-0004FD-Av; Tue, 22 Sep 2026 11:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428673.1651565; Tue, 22 Sep 2026 11:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yU6-0004F5-7n; Tue, 22 Sep 2026 11:16:26 +0000
Received: by outflank-mailman (input) for mailman id 1428673;
 Tue, 22 Sep 2026 11:16:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8yU5-0004Ev-1Z
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:16:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8yU4-007bmQ-Am
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:16:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab26375-8faa-0a2a0a5109dd-0a2a45048ee6-24
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:16:24 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab26387-b57f-0a2a45040019-4a7de14ca393-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:16:23 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485933b24c3so2171587f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 04:16:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886277def8sm4551088f8f.14.2026.09.22.04.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 04:16:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1790075783; x=1790680583; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08ygijsl2MUvkqCJFkjv3KSivHvHs/swscmHdyRMKk4=;
        b=au4kdU/6kQUCnCy4AnI2ZvMLeAGeXToBvS3D5/IIdmfZWaWnTSeTOXTNumR3Fc+OUN
         Hm3HOpe5zLEFmStpIH4G+NWtqy25XYKnxntdmg2oUNyRR9Ks3w2tJzEGQRsEMwa817ra
         NMIaaegtKu/UbAd/ZJJZs1FgBKiaEj4xmMlJOw+uCu8ffvqDMLsZRW6w8lIsmtNmrY9z
         5RvHh5FOu1nL4dq0AAjd+Kp6TVhmZpaeetWUh0EwSbkmUSZ6mWxdSu3xihfIYgwOMJWB
         G1XuxMjT8t6lfH6huve/GJkTfMIIGZhUKBm9dJUbEN7JQrqTpvvGiCt0R5z4i/oTCuiP
         c1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075783; x=1790680583;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=08ygijsl2MUvkqCJFkjv3KSivHvHs/swscmHdyRMKk4=;
        b=cyxchkAkNQsPjasU8ZyI1tdVtRNhst3MUGvmb2vmKDTYZePVX5wSi5xPPv4x2PjEKm
         iQPPKVoHFSrzLR6yWqydj/hAT5nEATvfZVkIz/tyZrxr9zPfOzHWHgdFllToT8pSR0xo
         o2uLvgSamyWUAwYUQIvgv+o4SKkjDmXRTiweewo3umEykEcSC9B8ZSbgi1EWkLSh7N0J
         TAGvughAJoU0NShN/HeGjbQnxLTRlRJC6rXd08R4GunTyHFe0Px70c0j9WyujK7hO6Tj
         c2weiWdKnW529BRn2bEEr1NJ+St1r7fHufE38YdR4WxfsfoNxu6n4000gwy4Mu2IIXoU
         167g==
X-Gm-Message-State: AFuF++mUxujeue8+hxrc9zC1oQyCT9HiVVNktnr3dKAZ0LdLuGa75KJK
	XDKasoOMGIyDHoEBmYQEnDiKrI08Q8Lki1kcR2Y0TGmr1A+yk0eRX9A6WezQHbgsGA==
X-Gm-Gg: AYBFou2oIvpL9EL6mHtc4nJ5F+dNj1FjWNzNlGj777QFGSOz1ZGyetK8GOcSNYx70f5
	8yzXoCusID1/PnIFNavjmhstZy8HUO+joALUaolD+VO98UUXuaQQfzAk0YxbGNGFkDbGGAWK2Cl
	1PskrrtO/5Mj9Np+cX+TzCneLPYL4w9h71l7MnDySejMyqrQgl0ItJlUuBuke5NOdSir6W7yufl
	VQEWD+0WL+NQFKI0+dNf6OgoNgWwXwb8fvchJkxH2JYKwcZtw9RPTFXdgYr8vadv8b9/NwtYlVy
	MDrwEat9tWoo/Ht3kad0nRdM0Csj6RPhmMEXh+zCTGMW4Fk+aWpOrp/8r7eRlWroRgRPC7CEYwS
	aq+ldnY1vxxBhO+SErjCC9AU3Pj8yGyIVNO0ftcmxA2tYHHMScSRIOjCe+yKT8z07mh8nEHklQ4
	eEv/TRHaW8/9hW7d0Znt1AwVworHWr0LMtJFMX71FtNy2ZEqYWFmX8E3BbRuFltUMWe0nb8EOAM
	H7hbxKyEZc9IOSVsqkA9lHHGCagtByG2XN2XT51W2ZsEoP11gKms2+yYxrrN4E=
X-Received: by 2002:a05:6000:610:b0:487:1681:2218 with SMTP id ffacd0b85a97d-4871e36bf5amr24472310f8f.45.1790075783452;
        Tue, 22 Sep 2026 04:16:23 -0700 (PDT)
Message-ID: <c3585a8f-df34-425c-b504-7702f638cf37@suse.com>
Date: Tue, 22 Sep 2026 13:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <f6362f01-0057-476e-ba7b-b0bd8154c86e@suse.com> <87qzim6p5i.fsf@epam.com>
 <8fd025af-f429-488e-9977-aec3fea2e78b@suse.com> <87y0ct5zan.fsf@epam.com>
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
In-Reply-To: <87y0ct5zan.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790075784-51ED6B50-38F986E8/0/0
X-purgate-type: clean
X-purgate-size: 1849

On 22.09.2026 12:57, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 22.09.2026 03:38, Volodymyr Babchuk wrote:
>>> Jan Beulich <jbeulich@suse.com> writes:
>>>> Outside of drivers/acpi/tables/ (which is excluded from Eclair reporting
>>>> for dubious reasons), arch/arm/acpi/domain_build.c is the only user of
>>>> ACPI_COMPARE_NAME(). Make the macro const correct, at the expense of
>>>> introducing a "const" variant of ACPI_CAST_PTR(), and at the expense of
>>>
>>> I think you can avoid adding ACPI_CAST_PTR() by providing a const
>>> type. Like this:
>>>
>>> +#define ACPI_COMPARE_NAME(a, b)         (*ACPI_CAST_PTR (const u32, a) == \
>>> +                                         *ACPI_CAST_PTR (const u32, b))
>>
>> I don't think so. You did notice ...
>>
>>>> --- a/xen/include/acpi/acmacros.h
>>>> +++ b/xen/include/acpi/acmacros.h
>>>> @@ -103,6 +103,7 @@
>>>>   * Pointer manipulation
>>>>   */
>>>>  #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
>>>> +#define ACPI_CAST_CPTR(t, p)            ((const t *) (const acpi_uintptr_t) (p))
>>
>> ... this, I assume. On the surface it looks odd, because one would expect
>> acpi_uintptr_t to be a scalar type, like uintptr_t is. But it isn't:
>>
>> #ifndef acpi_uintptr_t
>> #define acpi_uintptr_t                  void *
>> #endif
> 
> Well, that was unexpected. Talk about principle of least surprise...
> 
>> The only alternative I see (somewhat more risky overall) would be to
>> introduce
>>
>> #define acpi_uintptr_t                  uintptr_t
> 
> What are the risks? I'd really prefer to have fewer gotchas in the code.

It hides casting away of const-ness. Right here we would like that, yet in
the general case I think we don't. Otoh Linux switched to the above in the
5.18 dev cycle.

Jan

