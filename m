Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55B5C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 05:55:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412547.1642951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4BHa-0005KD-BK; Wed, 09 Sep 2026 05:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412547.1642951; Wed, 09 Sep 2026 05:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4BHa-0005K6-8h; Wed, 09 Sep 2026 05:55:42 +0000
Received: by outflank-mailman (input) for mailman id 1412547;
 Wed, 09 Sep 2026 05:55:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4BHZ-0005Jy-85
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 05:55:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4BHY-006PQi-7e
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 07:55:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa0f4d7-bab6-0a2a0a5309dd-0a2a450b8f7c-20
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:55:40 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa0f4db-b7e8-0a2a450b0019-4a7de14c8207-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:55:40 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843c2790ccso369548f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 22:55:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d057f4778sm344362225e9.8.2026.09.08.22.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 22:55:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1788933339; x=1789538139; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRUw5q3QNtblCskUdHcTvX5dr0LJ7DxVsCZho4EFS3Y=;
        b=OE/dJYFo2U/Pg34c9s4sDiZl9b8T3z3QSIkqqq6s3EytwuJ6uNX9SdA/ghWc1Z8ffp
         KBUaUnG3jA6qdl+26Go6R2n8iUEShYQoOb0ezaHdCC1DJu4KKPTDUOHSZAlbj2qwkU8C
         sD4Nn/QZU+mC74cY38OGgSsNY00QrxnlswrVsvIr6xKmRtKnH8f9vjhCk6fwYyG7hDiF
         VU4MzjAdMuOqu6uQgJ4uDvVKa3LLms21LjKbVVnm2VlxjTvgHxiRRytCcoNQ4Sge3LMA
         5KQrpLTABnRNhcBKJ/YObkuPz8jWWgtdTEJGevIGU8vqFPmOlTIC8sDEXwE488lTgB/u
         IfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933339; x=1789538139;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRUw5q3QNtblCskUdHcTvX5dr0LJ7DxVsCZho4EFS3Y=;
        b=UNiYmne5yrEC1RzsVqBCdAVLGWqh00IVhXNtCzFUPH6ebB5Z1ETnV+gnffQHpn2yDu
         r+3kWqoCZT829K04ViiNbSAsazj0BswTfj6mOrD7zSD0cNN5FW1BO7dX7DchIPDSoQ8F
         J8rxMaRUlZ//yQyh/tlKQn5iTEKHfqSU3rbtSJUzTWImP5gCvxF+idikcd6i6W60MCTq
         aP28ujAp4Jn+gI6ogZTp29ioPwUZkGHAhKUE49p2wWBJmXIaIc7fvy2JKuXCIWuSA05e
         bG8tKy9MFjaiNWjZjCo6VbVyxPAslaAvXOGZ54xSJwd/g+6T+vHiRUAbuX+vmzuWDVpR
         VR7A==
X-Forwarded-Encrypted: i=1; AKwUvBwMxiJVH80XeaFQo/cxevZM71/uRE7oMlwbuyTs23KPt48VJycxhrrU3JyNvO8eIct3ASsb3U6rpdY=@lists.xenproject.org
X-Gm-Message-State: AFuF++mrM4k+fky3TiYl3Py9dryuJSz9Rc5mv9wTL9/GVklMwga/AaoC
	1D9CbDWLXo0sTJ3jezEO1hvsJE45mFiKGak2LdG2sNH/Vl4ACCS62M9Q5U55wFiLpQ==
X-Gm-Gg: AYBFou0BeJysX4Zw4hbB6kKPgfg4g/Taod7AVMZ1enIaOVAi2Gfq7aFIPxzSuNzKBzj
	fXCzZXcXdeaR8rGeAW+wE1YjKbzfMAijaGm1TbLBEGukaagStvvwDjKSZsB9DS/AQ+e4JtDSPE+
	G1tmDLCRgFWiPvY1NTI2MljyBrxHJqlDTk8SnlG87O5Ja1tPCfOOLX7Vb8W83pges+ST3jaOdJV
	i2VbG0Xadfqe5MIFOtQ9mzv47ywOFwiqY7ZOBkhm3+H2c5Q95caSr9oXSuZZ/VNcKajL4BAdQ+x
	KwXT4vASlawe6SroEkZ4wmuE2DlJ/e5yxR/7WWZcugb5d0K3Abnf+JWvYcoq90ksCVkW4/affCt
	3zG5qAoA6hD5Oh9SNJe/R9t3oJg64l5EklifatSjc3NnfFe0/3Z8dRQqWwDQkn0z4o+Z6O1mO8U
	SWVJCc77am45jhAwJ/sxEjto9gr3G5jjoHsZsh5w1hZRZQA6EsBMDCSI+MxSHQkyQ07sW6oHQgz
	w42prV3NixZZidvO72rlUf34MOmSCMmhT4R9cO+J+YSwBXiIaTerS/VPLGf/nI=
X-Received: by 2002:a05:600c:4f4b:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49d1f21afcdmr65238065e9.1.1788933339519;
        Tue, 08 Sep 2026 22:55:39 -0700 (PDT)
Message-ID: <d9693f4f-f95a-4075-8d19-34f382c1f5b0@suse.com>
Date: Wed, 9 Sep 2026 07:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260907213231.3159241-1-andrew.cooper3@citrix.com>
 <a11ec239-460b-4509-beee-4f65063ef336@suse.com>
 <6a54806f-061b-4b76-b42d-6fa5b54581e4@citrix.com>
 <70dd9e38-bc54-4532-b310-cb9fb3d3f2ce@suse.com>
 <0ad272a0-8afa-40fd-a7cd-fc953e1b992f@citrix.com>
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
In-Reply-To: <0ad272a0-8afa-40fd-a7cd-fc953e1b992f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1788933340-AB6D29EA-3260CFFE/0/0
X-purgate-type: clean
X-purgate-size: 3570

On 08.09.2026 19:10, Andrew Cooper wrote:
> On 08/09/2026 11:55 am, Jan Beulich wrote:
>> On 08.09.2026 12:08, Andrew Cooper wrote:
>>> On 08/09/2026 7:26 am, Jan Beulich wrote:
>>>> On 07.09.2026 23:32, Andrew Cooper wrote:
>>>>> @@ -273,6 +274,44 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>>>>>      return false;
>>>>>  }
>>>>>  
>>>>> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
>>>>> +{
>>>>> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
>>>>> +
>>>>> +    /*
>>>>> +     * Treat pre-production as always safe - anyone using pre-production
>>>>> +     * microcode knows what they are doing, and can keep any resulting pieces.
>>>>> +     */
>>>>> +    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
>>>>> +        return true;
>>>>> +
>>>>> +    /*
>>>>> +     * GNR98 states that Granite Rapids systems hang when loading new ucode on
>>>>> +     * sufficiently old firmware.  GNR101 retroactively declares that one
>>>>> +     * ucode had incorrect min_rev fields, in light of discovering GNR98.
>>>> We still have no min_rev field, so imo a reference to it wants some
>>>> clarification.
>>> No, I don't think so.  The fact Xen has no min_rev field (yet) has no
>>> baring on the wording of GNR101.
>> The wording there is "Minimum Runtime Microcode Update Revision". As long
>> as we don't have a field of the name, how can such a comment be unambiguous?
> 
> Fine, I'll say "minimum revision field", but the whole name is (and
> always has been) silly.
> 
>>
>>>>> +     * Both are incomplete statements of the problem.
>>>>> +     *
>>>>> +     * At the time of writing (August 2026), the believed safe sequence is:
>>>>> +     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
>>>>> +     *
>>>>> +     * Disallow known-unsafe loads while permitting believed-safe loads.  For
>>>>> +     * GNR, this allows multi-hop loading to get up to the latest.
>>>>> +     */
>>>>> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
>>>>> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
>>>>> +         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||
>>>> This is odd: The lhs of && uses the lower bound of the inner permitted
>>>> range, while the rhs of the && doesn't use the upper one. If it's intended
>>>> that way, I think this also needs clarifying in the comment. Otherwise imo
>>>> lhs and rhs better would be consistent in this regard.
>>> It is intentional.  Furthermore, it is the only coherent way of
>>> expressing the sequence as given.
>>>
>>> I'm not writing a comment explaining why it's a good idea to use the
>>> same boundary numerals between the comment and the code.  It goes
>>> without saying.
>> But that's the problem - code and comment are not (obviously) in sync.
>>
>>> I'm also not interested about pureness concerns about inner vs outer
>>> bounds.  I can't see a change here that won't make it worse.
>> So why are
>>
>>          ((cpu_sig->rev <= 0x01000370 && mc->rev >= 0x01000405) ||
>>
>> and
>>
>>          ((cpu_sig->rev < 0x01000380 && mc->rev > 0x010003f3) ||
>>
>> both worse?
> 
> Because they are both buggy.  They fail to exclude some unsafe cases.
> 
> If it's not obvious, I do know more than I can say publicly.

Which I had in mind as a possible option. Problem being that with
incomplete information it's of questionable value to offer an ack
on such changes. Here you go:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

