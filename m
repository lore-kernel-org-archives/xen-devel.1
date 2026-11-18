Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFA606A334
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BcllQTXr
Received: from list by lists.xenproject.org with outflank-mailman.1493888.1693605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaPt-0000AN-Gg; Wed, 18 Nov 2026 07:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493888.1693605; Wed, 18 Nov 2026 07:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaPt-0000A7-E2; Wed, 18 Nov 2026 07:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1493888;
 Wed, 18 Nov 2026 07:49:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTaPs-00009y-IH
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 07:49:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTaPr-007Dah-NJ
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:49:15 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5879-bab6-0a2a0a5309dd-0a2a45068c88-8
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:49:15 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd587a-195a-0a2a45060019-d1558034e127-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:49:14 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bb64c99d2fso7561855e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:49:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7d257112sm40827355e9.2.2026.11.17.23.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 23:49:13 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794988154; x=1795592954; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfjPhw1FBCKX9gZkEZNv2FV5kQQSCgcBceQUWO1Vsgw=;
        b=BcllQTXrBT+9oIztRbtfXxb3QtKk308ujeUF9i2mtQCRW98Q1kaI5N5aNak6Lrttyz
         tZU5LSy1h+3VZ+um4OqNdZzPFm7HXwhu5Mps76fTgTvHmR1OBckTXYYvZp29WRUXQwgp
         NgDjy/zlKFSaFTvsdQU3zYK1zO7vyoezEY+YnLpOc+WVnHeHDybFh3Wv+VMcxXBJa6eB
         7yPuMmw1N0N0K6JGENVZAV/hLeL4Phy3b2MSeO3l4DGEj/SyChYGAHQHe5fwapQvn4YC
         S/nRXvOhpIqv00zcX3Jo5b4rV2sxlJ198o7ISGl2BJdFw+3Sqrq382170eb4NtqLPtME
         GUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988154; x=1795592954;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfjPhw1FBCKX9gZkEZNv2FV5kQQSCgcBceQUWO1Vsgw=;
        b=kWZVKLEb9yIVvIpjiH2UL2pmSyO+dLhCNNYsI9aaE1NfBwU9nYPNFbN/kDleYjN9ro
         fob8da7Td6CW8H3FwqKfDXnnzsSs4pZYOJt3qIDOz5t901elhkGfA8tfR9yvSVN+QnCo
         yWcETOSmEO6+lhQ87zHyd0zSw2kpygDTTUT4j0fQTmAW4+uDsJyjWm19AKH0raQrPDCW
         DAba3E/SwutrJ/eGRAUIl2trqBtbeec5vx01qM0EGPnxgzWKhOeipGlR/SIGrVbkrWE3
         siNM3J82IDJR4P6j2xmBkbyb/bbjviRrn1D4kJFuhKVkgj3SLIzfnsdO1aXX6EXzTUqI
         ON7Q==
X-Forwarded-Encrypted: i=1; AL+hErHDay2VLw4LQDgigkrBJzZ6yqoQ6qVOzstZbuPA2WpwmeGTsxB9N5d+j3hzFOOifv0wSw0Idup9mEk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9D7oBqnw0THe9Q7vi8ZViWwZPtmlwabS7BAfZKNif0VGa8KtFr
	+eBCaEaJGmVJyUoFHXP/B63lGN3Lwyzu0/tf6EsAsZzmqOMC4QsFgRSInCE99HPycA==
X-Gm-Gg: AYBFou3tloSgPcHuNI+ZdLIluLxXwVv6lE2B9ALODTW3OnVjvtx30nkAobirPM1Upq7
	zVt97yziNUu2LgMo0cxw3sVouvbIKtrhDU9b/P6ukYvSGw5p/udhQgntaLHzBNTooFzialG+j5W
	ZYDqBgo2/SWmHiVzxrzz9WKVNtYffRrIUmZ5LG9X/s3/eBNqjVO/fL/fCH8mVlgTdrPYKY/iDbv
	pa5NvZZ/AnUuW/+DC+uJMBRJDFvXuptfFvImpMzO+VSFLr+fhbEAvIhiz85mfbKH7c+/a7fqIvx
	Qxb98+zpLGyhMAmO3s8EIy2OygZaDfbh5aiJde79c1lEmzX6uwO2vrHfO8rRxEx7cmxGLSSD+W5
	N1rNP4x07Uzdqvpn5HuQ1o1PmWTUGe4GI8v3CXV15Rse38cHujePtGC+nHN8AinRCH5c267Z3vI
	iyt3Sj9ArT+sR+x7HpeLfR+QQ52K8qo5Pa6oqt4wnWPwtp5YvTr39qRINrAJ93HwxcHrbiEBDxt
	C5rQetlwiP80lEXIs6ung5NFawVx6OUXLU+I1OaXkyVkuNO+uZOIpaCD1s3FML7Nw8d0YgDAuQg
	VIQW6EM+e/BImXeJ7/QlK3XDfp0/o/5fFMneYp0hw8qlJoeCCWqDHP0jJtOItVbOCIWMMztU/FO
	P9qtYODi7X9VEcPLZ5rHLeKTaAmz/wDVh4yeA0Q==
X-Received: by 2002:a05:600c:3b98:b0:4bb:7757:fe6d with SMTP id 5b1f17b1804b1-4bb7da229e9mr30967575e9.11.1794988153920;
        Tue, 17 Nov 2026 23:49:13 -0800 (PST)
Message-ID: <1e6283ce-bbe2-4ce9-8d17-22b15f24b3d4@suse.com>
Date: Wed, 18 Nov 2026 08:49:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for
 xfree() and vfree()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com>
 <de39dd8c-1db0-45a9-a9c9-ad2f2e0a90cb@citrix.com>
 <e4396ce2-ca0f-4c18-85e8-bf0a2afa97e9@epam.com>
 <a2224fcb-e529-4b24-9ee2-2050511cb801@citrix.com>
 <0f36dd5e-eb09-411f-9ba0-8aa29b4c1e5f@kernel.org>
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
In-Reply-To: <0f36dd5e-eb09-411f-9ba0-8aa29b4c1e5f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794988154-F560A77B-A420B21C/10/78276251493
X-purgate-type: spam
X-purgate-size: 3009
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 23:35, Stefano Stabellini wrote:
> On Tue, 17 Nov 2026, Andrew Cooper wrote:
>> On 17/11/2026 8:01 pm, Dmytro Prokopchuk wrote:
>>> On 11/4/26 13:24, Andrew Cooper wrote:
>>>> On 03/11/2026 10:29 am, Dmytro Prokopchuk1 wrote:
>>>>> Livepatch passes const-qualified pointers from struct payload to
>>>>> xfree()
>>>>> and vfree(), which take a 'void *' argument. The cast that removes the
>>>>> const qualifier is a violation of MISRA C Rule 11.8.
>>>>>
>>>>> Such casts are safe.  The deallocation functions neither read nor write
>>>>> the content of the object being freed, and the object is not accessed
>>>>> after it has been freed.
>>>>
>>>> I have a very firm objection to this.
>>>>
>>>> It is impossible for any allocation from malloc()/calloc()/etc to point
>>>> to read-only memory, which is why free() takes a mutable pointer, not a
>>>> const pointer.  The same is true of any other heap implementation.
>>>>
>>>> It is impossible to make an object in read-only memory undefined.
>>>> Objects in read-only memory by definition have a global lifetime, and it
>>>> is absurd to argue that a specific heap implementation ought to permit
>>>> making such objects undefined.
>>>>
>>>>
>>>> The bug here is livepatch storing a heap allocation in a const pointer.
>>>>
>>>> This comes from deeper problem where some contributors/reviewers want
>>>> the const keyword to mean something it doesn't.
>>>>
>>>> ~Andrew
>>>
>>> Jan, Andrew,
>>>
>>> thanks for the review.  Given the disagreement, I will drop this
>>> deviation for now.
>>>
>>> If the preferred fix is to stop storing heap allocations in
>>> const-qualified members of 'struct payload' (so the casts go away), I
>>> can prepare a follow-up patch.  Please confirm that is the direction
>>> you want for livepatch.
>>
>> Please remove the const qualification in struct payload.  The logic
>> should not have been accepted in that state to begin with.
>>
>> This is the only course of action here which does not create a class of
>> undefined behaviour, or permit said undefined behaviour to go unnoticed.
> 
> I agree with Andrew. xfree() does write into the freed block, so a
> const parameter would be misleading.

Well, this is the point: Yes, xfree() modifies the underlying memory. But
no, it does not modify the object a pointer to which was passed into it.
That object simply ceases to exist. And what C is concerned about are
objects, not the underlying memory.

I also still don't quite understand why Andrew considers such uses of
const wrong: I don't think the spec says anything in this regard, and the
C library's free() taking plain void * can easily be seen as heritage.
Using const like this properly conveys to compiler and readers that post-
allocation / -population such objects aren't supposed to be altered
again. Together with forbidding the casting away of const-ness, this
serves as an extra level of safety of the code overall.

Jan

