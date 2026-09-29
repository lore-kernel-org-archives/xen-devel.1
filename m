Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FA8CA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 15:11:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436508.1655156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZUg-0000pO-L0; Tue, 29 Sep 2026 15:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436508.1655156; Tue, 29 Sep 2026 15:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZUg-0000pH-IO; Tue, 29 Sep 2026 15:11:46 +0000
Received: by outflank-mailman (input) for mailman id 1436508;
 Tue, 29 Sep 2026 15:11:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBZUf-0000ov-Gz
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 15:11:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBZUd-002Frk-4t
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 17:11:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbd528-e002-0a2a0a5209dd-0a2a4509ce58-6
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 17:11:42 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbd52c-be1a-0a2a45090019-4a7de18ca8ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 17:11:40 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so35125425e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:11:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cfec703sm79119385e9.6.2026.09.29.08.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 08:11:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1790694700; x=1791299500; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwA2KSZjyy5hsKkVHj5gA5xx08XT3DepPe2WuODi2nQ=;
        b=Mbqv8LTN85NT4d3dqj5gPGCwW7L/9LHdElCu1YaxkMv9CTLfVDOc64NC8+OU/NSGJo
         GClhNsst837h9Y8Zyr9g6nFeD1obOdl67E0yzPfHKqWJiI465erBNYDEEkQn48hAxLfr
         PNM7zKkWHtGh7tON7YQmFNx+PIoRQEZF+5lRmcQSOaToEFnvOocA2CMCKQaR1lRe8+rz
         48dBlPO8BFT/dPczxBB/LghxJviWlKr1XiYsqbpppxBf+qTRUB0UDdZveUgSBVTldZtg
         bURPWrfTi03p73l00CMLHLFagOdbbCbTTJBIeOxKdni67l7/lsjByJLh3msHH5V7J8CU
         5x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694700; x=1791299500;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwA2KSZjyy5hsKkVHj5gA5xx08XT3DepPe2WuODi2nQ=;
        b=P8LlVz9LFvG5zSrcwJ6Wom75rBuKOez84hTGBmZgTSwPieno3n1/dk/srxRyIhwX5+
         E3hrOXTV9tRpRJq0jxGE65mppzyos/MLrfT1f8V3Sf6V5Y7xfubxbi6olA4mXoBBF3nB
         NIHFzwBCXEmG/w+SEmljTTh81kP0nF2QBcb3hcWMuy6YWKumBZnuwNQwhTqaVRpRwNYg
         lWJRFRwX32lVuCJwu3zTfzhzgtzL8XyswUV85ToMgMEdsnrfUYobYSN7Hxldoc6x2VMK
         mkYU2Pmp8uiWGkKM9ORnA/vasCNaFSqkTHwTBd0ImXdtdh3uQvK0xsniDO0+Yj+guwgW
         As0w==
X-Forwarded-Encrypted: i=1; AKwUvBxx/4py8iSoBvG/bdb/3zCYSAVQwdtbKKevMsekwats2pOEdSNovjKWGfZ/w5/tHkM15PyCyaKMpwA=@lists.xenproject.org
X-Gm-Message-State: AFuF++nE9zxltH0H4gwty91n1gx06qfZZsLDvQNFDe32+ruCCT6S+M3X
	5aLvN+5H/OQ1DJaB7zW4bF+69g8BjqgaIh+D/xgjDP6LFDh7fgJaXZUqf+Hk6grvgg==
X-Gm-Gg: AYBFou3nBPO/zCK3anf+v/WTZZWIeX5gZn5A0FVaR5KnPio8L9TfHy4PLT82zIb/saE
	OMPhl3ruEl+czLWz2pAlE2AOJSAkqQ3xlHAv9KyH5NN6UyhKj5QmzLeZb1EsWNnlHZrBk3CTgOS
	stSnDNdmLsJaNJ1HVijDV0CfXbASpt7rRccLynDANNK3bahJyEz1u9NPJARfLzD7tnvhb+7V12v
	Mp6cr15CbnX79UDqapI+fgVat8FOqtgoGOIkBkd048NxWTuAXa1empjUeTlcf9RaNOyKTZwPfzb
	lebZxTf0edT/XCX3dXPb2QWsnJLlNWFvvaCMM1HHn181EttcraJzxXrJelNS6r5Fs3iTxUemhVm
	CwtTYBVT9zny0z2kpXdwjYj3dsbfJxpcEg3EwOCwB2r9iXxOCvOLfkvDeupSMsekHEoTFkxtPEj
	hbEBcECpwf8fgU3PsDoBAIF+0ZBIQxXx3tnfEQNJNv194AXDakVB/HaQxFtTWzgfeUiCwFJ3YlR
	8MbdJdBnlGeAYt5uNbhp9WRb9hNtYqgIi3RGkN4wn6npVzUSW0dFa66lfVbdns=
X-Received: by 2002:a05:600c:c494:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-49fe7bab979mr280903045e9.22.1790694699987;
        Tue, 29 Sep 2026 08:11:39 -0700 (PDT)
Message-ID: <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
Date: Tue, 29 Sep 2026 17:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
 <446354d93ae04a07b86d7293705d7e46@bugseng.com>
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
In-Reply-To: <446354d93ae04a07b86d7293705d7e46@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790694700-BE0C5034-B4C62623/10/78276251493
X-purgate-type: spam
X-purgate-size: 2177

On 29.09.2026 16:56, Nicola Vetrini wrote:
> On 2026-09-29 15:40, Jan Beulich wrote:
>> On 29.09.2026 11:03, Dmytro Prokopchuk1 wrote:
>>> bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(), strrchr() and
>>> strstr() all accept a const pointer/object but return a non-const 
>>> pointer
>>> to the matched element or byte, matching their standard C library
>>> interfaces. The const qualifier is deliberately stripped so that 
>>> callers
>>> searching a non-const object get back a mutable pointer to it. Fixing
>>> this would require changing the public API, so document these uses as
>>> deviations instead.
>>>
>>> Update docs/misra/rules.rst to note that this class of double-use
>>> library functions is deviated on a per-function basis.
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>
>> When I prepared my 11.8 series [1], I was wondering whether we need to 
>> go
>> as far as deviating these. Since we now uniformly take gcc5 as minimum
>> baseline, there is (at least in theory) the option of using _Generic to
>> cover the dual-use. One question there is whether Eclair would 
>> recognize
>> such - Nicola? After all, looking at e.g. glibc's implementation, the
>> functions themselves remain "unsafe" there; it's a macro wrapping them
>> which puts the lost qualifier back.
> 
> Could you provide a concrete example?

From glibc 2.43:

# define __glibc_const_generic(PTR, CTYPE, CALL)	\
  _Generic (0 ? (PTR) : (void *) 1,			\
	    const void *: (CTYPE) (CALL),		\
	    default: CALL)

while the declarations still are e.g.

extern void *memchr (const void *__s, int __c, size_t __n)
      __THROW __attribute_pure__ __nonnull ((1));

(and hence the implementation still - necessarily - casts away
const-ness).

> In passing, for stronger 
> guarantees w.r.t. _Generic it would be better to switch to MISRA C:2012 
> Amendment 3, which has specific support for that feature. Keeping AMD2 
> and using _Generic weakens a bit the safety argument (though one can do 
> an analysis himself, of course).

As this keeps coming up, we surely want to discuss / progress this move.

Jan

