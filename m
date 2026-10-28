Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD9606A31F
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=en6VxawG
Received: from list by lists.xenproject.org with outflank-mailman.1462950.1673932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLzUq-0007mw-6t; Wed, 28 Oct 2026 08:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462950.1673932; Wed, 28 Oct 2026 08:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLzUq-0007mp-3z; Wed, 28 Oct 2026 08:59:00 +0000
Received: by outflank-mailman (input) for mailman id 1462950;
 Wed, 28 Oct 2026 08:58:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLzUo-0007mj-R5
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:58:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLzUo-00CzsF-7v
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:58:58 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1b950-2eae-0a2a0a5409dd-0a2a4504cedc-12
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 09:58:58 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1b951-b57f-0a2a45040019-d155dd32e996-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 09:58:58 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so324556f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 01:58:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd8dcfsm26989822f8f.50.2026.10.28.01.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 01:58:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1793177937; x=1793782737; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsn6W+xGHU1NREbN8EiTgjzU96Ug5ZpjuHZgSoxPCxI=;
        b=en6VxawGYaoq1x2xsMCyqGRuzHoBj39tqCDhsELoZh2450v5aOjdFLO+cyQx5eqGh6
         yRuLlSQWZX7cbWHBFn2luzZioF/6v60jnsTY5B24Iz7Q80dYkW0MZpG8SC62pmx/aAsg
         yi4gJIFi5NsmyRA76o+YyDAwXvjDcXNM36RP5ISVDUBtx3Jk2Pyl+U6fk1EBCbDUSU7T
         aAk30263EPUA8L4a29mcJIHXsHYr7/SetbHQZHFlzjPXdrIm6Iknow+MLVeLiuTN5RRG
         OoBy9BnUZ0BafQQKK6nRFu4gESZsoNlKK9YkMz9dVgp4MjO5Gw/9rwdByCCuyBGpkmKq
         zIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177937; x=1793782737;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsn6W+xGHU1NREbN8EiTgjzU96Ug5ZpjuHZgSoxPCxI=;
        b=tISAq8A2nGcNOuQNrU51aRd2aStCMgM7Cs2OZpeC6tTJ+dXD5UsWYmEnP13aj//Hqd
         +ZTU0pXTJq0NcxIKg/FGAh+kKZrQu9OhJdi5Qer70ShWlw34DdIvmXqKdYHHw7ljemWQ
         QWPTGdNAClxufHf/c0Cq2N7PzOT56fvGTQ5yE/qjLEz08JN6h+STY+m9jqCPlKZsqCbl
         +gzyvCfHfbAJzcd1NFCR+LHL2q5WHPWKSFg4lRVhwn0IsVCJlWPDgOfWQRmKAurB10zM
         KSVUHX+6zDV21EM19RhC6JM5HD85OC9fdn1WI9AoC1Hj0avtppDrV+FSOTlVkkz0zBmM
         CSuw==
X-Forwarded-Encrypted: i=1; AKwUvByrXNr6FAMi5KB/Q3hMKcuCFI29QldXQJ+YCRQCNvoxvuA0jkrJwiVHyiVLKlwA2fB5LFxPTJWchEE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK8sXZDK2tvhY/Rlctc4iHJM/QYC63c/flpCp3fJR35fpEm4VHn
	xomcyRfNUi217fDcbEHx5QhwzXykrHMJ93X7yzgnvCyjTrcUg2jhHX3LgNFMOuaAQA==
X-Gm-Gg: AYBFou2kIx1oKHj6zrbM9hisUus8QCqpuKqjqcRaqh/m8zdLdZMxJ9/Aoq7Lqd4O1qf
	lJe4/GbnFL/JcYMvouQLftYGv1LJsUq8k0lAD2d6h2+73NBIEOv6/fKhahkQaMKQWYYQwCAiEJB
	vJGeP2pp/w83VIKDwk8Q4jOOBSaFiikIjgN8Cx2raIC22Zl4w1IIetVIILyjhDlt1Olv4cY4Mei
	bHz1b84sib25OU2ElloBA57Oq6LSTCQCWqGc1vM5FupInlb/opG0Rp6gJKD2bpodEyk6Yx1wy0l
	TCqwbijx52pZm4kFKUh2UbqBsopeKMWoABYLIkX802mMHU/QOlQuwhVjTpXRs0i88OGCv7Dbp6p
	U0DQc9QLE0r0QK8290YwlRi3LuTtf9Negiw0XmUxFVp8gs/w0vaSBPOxAKTv0DydbVjuL1fN/OD
	xyvX1euPZ0XPK8Y5OtZq7mO7YNep8YeHj/yd/9gfHs/QSHkr+IyWgMnXI+IAsUPBPZCaV9ocThP
	tdv1k5/PFLOVnvIKsH+pFjojnfBjdkzptITAzj9KKElcm67OxQsiBPh37jYr/4Rfe52JtAl9mqm
	XcrO9qnrPAKQOJBXSKMDwUHHi3xPi2IanFcwY9V+Q/5wf2ScefByhibBtIHMlLxkkgO5G8lJCTu
	GNxmWNTWkv2kIVW4+
X-Received: by 2002:a05:6000:606:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48e5d5c41c9mr3717447f8f.34.1793177937552;
        Wed, 28 Oct 2026 01:58:57 -0700 (PDT)
Message-ID: <96fdb610-65a7-451a-8d3b-600dfcd7ca8a@suse.com>
Date: Wed, 28 Oct 2026 09:58:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
 <8b2fa10a-17ac-4807-b9d2-874f84a85efc@suse.com>
 <ad545e6e-a8fe-458a-a88c-0a290b093359@epam.com>
 <97a123f8-92e8-4ff8-bb3b-a48ad2fe1392@suse.com>
 <a07250ac-263f-46d7-8037-7db2ee17f11f@epam.com>
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
In-Reply-To: <a07250ac-263f-46d7-8037-7db2ee17f11f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793177938-50EDEB50-8519360F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1569
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 09:43, Mykyta Poturai wrote:
> On 10/27/26 12:21 PM, Jan Beulich wrote:
>> On 27.10.2026 10:39, Mykyta Poturai wrote:
>>> On 10/26/26 2:34 PM, Jan Beulich wrote:
>>>> On 26.10.2026 13:27, Mykyta Poturai wrote:
>>>>> This is preparatory work to make vPCI MSI-X functional on Arm. Split the
>>>>> vPCI MSI-X code so that intercepting the MSI-X table and PBA stays x86
>>>>> only,
>>>>
>>>> This likely is related to peculiarities of Arm's interrupt handling, yet
>>>> on the surface I can't see why not intercepting MSI-X table accesses
>>>> would be safe. Would it be possible to extend background here a little?
>>>
>>> On Arm most of the work is done by the ITS, so the only thing the device
>>> needs to write to the doorbell register is the EventID. Interrupt
>>> translation is fully configured in the ITS; it will reject invalid
>>> EventIDs and also has a sideband DeviceID, so misconfigured devices
>>> cannot trigger each other's interrupts. Memory-wise everything is gated
>>> by the IOMMU, so a wrong doorbell address would not pose any risk either.
>>
>> And a guest fiddling with the mask bits behind Xen's back isn't a problem
>> either?
> 
> No. Masking/unmasking an interrupt the guest has already mapped is just 
> the guest doing its own configuration. Unmasking an unmapped interrupt 
> will result in it being discarded by the ITS. So I don't see a problem 
> here either.

IOW unlike on x86, on Arm Xen never has a need to (transiently) mask an
interrupt that the guest wants / considers unmasked?

Jan

