Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4730C606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Kn3Ym+aa
Received: from list by lists.xenproject.org with outflank-mailman.1463232.1674165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM36L-0002gp-JS; Wed, 28 Oct 2026 12:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463232.1674165; Wed, 28 Oct 2026 12:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM36L-0002gi-GU; Wed, 28 Oct 2026 12:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1463232;
 Wed, 28 Oct 2026 12:49:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM36K-0002gD-8s
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:49:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM36J-00B6ik-Lj
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 13:49:55 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1ef65-e002-0a2a0a5209dd-0a2a450ae90c-42
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 13:49:55 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1ef73-f2d2-0a2a450a0019-d155802bb1ee-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 13:49:55 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so6842205e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 05:49:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a9783b7e87sm42590565e9.6.2026.10.28.05.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 05:49:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1793191795; x=1793796595; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2LjrcxFV881MsZIlhbIBf+zSxIyMw0XCJCfBIWxan4=;
        b=Kn3Ym+aa57C69ZSn2GBLuPFQggSK+EjCjlMOnpBWA165Gqjo0QxWVnzo7ovYE3qMwk
         Hm9W6TEFYCOKnMmodcI8MPoc3sZF+Z6FF5AWlRU/Hl2ro8dex4yPB/mHD1kTwolFB37S
         ihhD7vtGr6jiC/Tj9PokT0b/4n9Uy8Kg52m3me1ph3HRTALluBn07vmhAmXMVegBIdAI
         TGs5Q77InRupH9D77mBgd+9TxySHvoPtzRD36J/yZlRhpU0hm1yO6OHaS2VQvxllb/GQ
         bEDqnwCfXkhT1ZvehN675vrlpLurSFvsxiZrklc6yzzhnTfT9fDMR5Ji3F7RUI9lKsq2
         CY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191795; x=1793796595;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2LjrcxFV881MsZIlhbIBf+zSxIyMw0XCJCfBIWxan4=;
        b=OOrGyaaUusPmo9AABW1Uja0ExavQee7FnBw3JozwlOMKgopS8tLdhhGLURXgyHBMFq
         MsXV6g/n++YlFlfqQ23e6+i51SS3UbS0iPC0v/OZKSy13P01onqlDl/KDuEipNWkWON5
         DGPQqQ5sTAXfRQqixIdW/QxBUr824FmROHh8PogIS8Byqnb/6iqrFC09PnF+PHN93nBo
         9PoKnbECAoyhG7aStT9mUq5CCf/x7Iwqo9FT8WU3Q45SLXFFy76bj0fU8MH6nbdgkEFG
         H5XyrPBpCye6Rwq/IjUWhotgrY0dshGFWxAat92KEfemv9+LjrXTXEcryyv8gLnJQ8cl
         osiA==
X-Forwarded-Encrypted: i=1; AKwUvBzTACo2SQwyIJa/O3H/LpJ8K/XJvsOB4tJh51+aui7KXvGRgISFxsqd9hxLq6kY8NiybavqLiqfbOI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ99MGK03ErPqWfCSvY+pq8e6+6mwo3DmpggyjjOwGVDVBoVLhE
	2fVpOS75jRQFcArnb2t1KdFQmfKCvkN9N+sBblIAMwck5W/YH5IKxCR2e0wIMNzvyw==
X-Gm-Gg: AYBFou2hHleOPx8TQwSOMbzyAVx0rbB/6NrbmyT859SFaHnDB7qJ9B/Qsu2dc7X13rI
	dECFUsMtvnLOjYwWt45OTOijAgxJKQy0DBjPLNfdXnpaLOkxSYipQkoETZY9EFWAVnjfBazePNM
	29CNwAHRs4s5UQLNRberFX2U+Id+5DYDb1QMYl1nm0B/KphESVs3/Srcoq55vO+skIDkIIBRAk8
	lFgvnO6kyZePFSs2ut1OaQRSqDFz3+YZP0RBnBimeC+L2tWxZuqeWlXELrgB/U6ecyUU286kkqk
	qonZJIE+0xvA2HiS92nCMgvwXDLnbiZ3OiLWTVJVwdq8Iw0IohyqrdVuHddct/yGKZrv7FHbyiG
	C46SGBwgEriobvSpqnMKTYr085gz2VbXfxnfPiA5LMjkg1Iqvemr7O4ybDpi5pblhlMsNOOiMnJ
	+USrHOYEn56r5wD73HIp97nQHyWAIBMXaRWfQN1zgQHBGFRmFH9AEndhFLnuJlJfAP5hTt5zSSN
	po5L+qf+WXWijN+11EGbBN77Ldx6cYVm28nEJkNGjJ9hJCeoVTA/Sf1VHFcenBXZxRhqJ3OksO9
	j5GRIq+cHQ/8ArkhNTM2jn4+4lCqleAu7CtYBaYipwL57Olha8Asg6z2trd2PmQu4xDPeQCpIKJ
	+jOkGzzAwEl+8KHK3dA==
X-Received: by 2002:a05:600c:3510:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4a966774dc4mr47605265e9.18.1793191794975;
        Wed, 28 Oct 2026 05:49:54 -0700 (PDT)
Message-ID: <63d6c5ed-ea90-4a54-8930-76767983ceb8@suse.com>
Date: Wed, 28 Oct 2026 13:49:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
To: Jason Andryuk <jason.andryuk@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
 <25df5d8d-7cd3-4344-86e1-8af883fa9a65@amd.com>
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
In-Reply-To: <25df5d8d-7cd3-4344-86e1-8af883fa9a65@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793191795-4B2D8CFC-215EDAA6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1689
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.10.2026 23:47, Jason Andryuk wrote:
> On 2026-10-15 10:08, Mykyta Poturai wrote:
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
> 
>> @@ -486,6 +487,11 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>           return data;
>>       }
>>   
>> +    /* Ahead of any lock being taken, as adding a device acquires them. */
>> +    if ( unlikely(is_hardware_domain(d) && pci_vf_setup_pending(sbdf)) &&
> 
> unlikely() here breaks the tests build.  Add
>      #define unlikely
> to tools/tests/vpci/emul.h

Or better omit unlikely() here. It's not used properly anyway: Unless it's known
that the compiler will translate an && expression to a single branch, each part
of && (or || ) wants wrapping, not the entire expression.

>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
> 
>> @@ -145,6 +145,22 @@ struct vpci {
>>           unsigned int nbars:3;
>>       } rebar;
>>   
>> +    struct vpci_sriov {
>> +        /* PF only */
>> +        struct vpci_bar vf_bars[PCI_SRIOV_NUM_BARS];
>> +        /*
>> +         * When the VFs which are enabled but not added to Xen yet are
>> +         * guaranteed to respond to config space accesses.  Zero if there are
>> +         * none.
>> +         */
>> +        s_time_t vfs_ready;
>> +        /* Routing ID offset of the first VF, and stride between VFs. */
>> +        uint16_t offset;
>> +        uint16_t stride;
>> +        uint16_t num_vfs;
>> +        unsigned int pos;
> 
> unsigned int before uint16_t packs the structure a little better.

As per ./CODING_STYLE, the use of uint16_t may not be justified here anyway.

Jan

