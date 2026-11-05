Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89702606A32E
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dtnpwPAA
Received: from list by lists.xenproject.org with outflank-mailman.1474304.1681447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOtdr-0005bL-LK; Thu, 05 Nov 2026 09:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474304.1681447; Thu, 05 Nov 2026 09:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOtdr-0005bE-Ie; Thu, 05 Nov 2026 09:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1474304;
 Thu, 05 Nov 2026 09:20:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOtdq-0005b7-Kj
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:20:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOtdp-0092wW-VY
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 10:20:17 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec4a49-bab6-0a2a0a5309dd-0a2a45098c0c-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 10:20:17 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec4a51-be1a-0a2a45090019-d155dd34b16f-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 10:20:17 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so1074291f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:20:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fea180e7csm8925512f8f.5.2026.11.05.01.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 01:20:16 -0800 (PST)
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
        d=suse.com; s=google; t=1793870417; x=1794475217; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epBc+XHDpNiWFrDkfc1sLWHzGbTndhW6DrYlZ7hEs6I=;
        b=dtnpwPAANkpCFt/wJnIcgrcT2b7KUQOyCRIu2ITABT1hgBw/AcTGEuhsHJ9UFBFeQJ
         SzA2WMWyBtU6w8IqlfGSSYkZnV+HtzHo2WQM24XKrTpmdSVuKI5ZoIUAGnjINSyg3Q/t
         DdcIY3k5H4NWzVtku9bVLZ1oBUA8evoWw0i9Shj93KkLsX8a9fVRGrXGYVrbZrsBprz+
         LLLue4KW34JfpZMfP3lAwQKTDcIaNoc993T7QedpPYQ2rN2jCid9ozKDrsO9xNlZLUKK
         6UgULp8DsStnTVQaHgE1rPx89rcjF6lw3AbZXQctN3zjAAwbVkkapAX9ahvsDehk0bbc
         hXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870417; x=1794475217;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epBc+XHDpNiWFrDkfc1sLWHzGbTndhW6DrYlZ7hEs6I=;
        b=MgulUEthdd1+YPG0KtbgFMTo3MxoNNVwsnzj1cYrdwQ6SciAt9GkLMNvWRNUsfpNsh
         raV442VhZeXA1T2v1TiSoa0uhmwIAr9r4NVMHSsGdS7oIcsFJxSNaS8wkZZxpQ//OxVM
         nYuWEs8AYPD1UObr1nt3KfnIuLl1qo33q7tpw+wZhyZ4xdSZiD+0a3aVZ1vBe9sxXRDL
         MF02Dg5dwdC6scXcd1H4EokioEqXJRuiSQ32uBNGD3fdbJ+7uRq94rJ6mci15GlR2YNk
         hh7AKJwpTs5ITtMaIAfSt/4i6D9JYrvBG/e8OHdTF+bs2FPFVXvqVMXEaqdkaw8XZJ4K
         HrnA==
X-Forwarded-Encrypted: i=1; AKwUvBxBTd22DpP+an14pCT1J5xTRREobia2Q4KnZa9Ki12z936W2kvJywpaZV/LoFDcfwfTM8gsTOMOuJc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/ZItNaXRUoINjUmCZMsSzn3C3h3YdKD1dA/ex7YKCEHTYa4hGe
	WEXcLyRbSJyLS4Dz1eUJdchcmkQvR1ob6mMWGYBRVyIB6wCgg2WtBrjIZ2PApNosOw==
X-Gm-Gg: AYBFou3YJ7TkhPROr/idu0aoo7Xsb5X6ZOALVDdnJZ4hnXwc2ql7qCrstI3d2pvM4nn
	LSyKys1uJtJ/ofLoGN8Qd6FG2zzSRTz214rQCrCVuFzRmWLtN8261z4Cd8WeLxI7dwMz3w2sXzo
	7N8LyJD4hUUM3kdAHleOfESgL9Ju5ONGh/Iq9C5LFBe02/tmWvL1RWCBUlhIHiRDDpIfPlvDrlr
	5rQD8BTuGbH/yUgh+SNCwNlSYlcfP/liEWAWpBq1uO07S0O/M9pG18iKXXrgOvDXSxwT9cox7Bk
	6qOamJBehdUZJtVU+07NPJqFaD2gB4Ub4sAyOyP1olOhTn7DPZm6qZ/vTcz9XQjfyh2isGCUrp3
	5x6eI861oV6CWctKUjI1ohtWMnuFfwcHBBcJxPcfTYxTsGq9/gH9TPDJHb6bOxyzdPJ6MkEUl+W
	MMF/TX2Gu4G42cGv7fQU3GB9f5usyYbgVXbZpOPo7LjB4cKGBoTz2iL65wEYBOXovKHqsqFmTqC
	b2E1qS1T+YJtLhZM3gQMTXiZfyrJ7QKmPoHgc5pvfvL7BWfe2aMmWK2RD7DkwbGQCV4fU4Uh71A
	DPi0CFEca7UdnpFTTYgQ534/pH9s1YNzaW2J7czI53m8avT+ro1JoOJQbuFArnwzqW3VCSi3dNe
	fFBocML+84Ceba5utBDERB69RG04NWe2jU77G7z8=
X-Received: by 2002:a05:6000:2c04:b0:48d:f7af:be35 with SMTP id ffacd0b85a97d-48e6e303f44mr41683794f8f.29.1793870417031;
        Thu, 05 Nov 2026 01:20:17 -0800 (PST)
Message-ID: <56611996-4c55-491c-98ff-07c5d6608268@suse.com>
Date: Thu, 5 Nov 2026 10:20:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/build-id: Introduce is_gnu_build_id()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
 <20261104135133.2209628-2-andrew.cooper3@citrix.com>
 <9f55c251-af36-41e0-8afe-cb218d41f6cc@suse.com>
 <e63f8ee9-0537-4d3f-aea9-5fe2f356b86b@citrix.com>
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
In-Reply-To: <e63f8ee9-0537-4d3f-aea9-5fe2f356b86b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793870417-3ACDF034-76442791/10/78276251493
X-purgate-type: spam
X-purgate-size: 3043
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04.11.2026 17:25, Andrew Cooper wrote:
> On 04/11/2026 2:49 pm, Jan Beulich wrote:
>> On 04.11.2026 14:51, Andrew Cooper wrote:
>>> Broken out of the subsequent change for legibility reasons.  It will be used
>>> to replace xen_build_id_check().
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Roger Pau Monné <roger@xenproject.org>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>>  xen/common/version.c         | 33 +++++++++++++++++++++++++++++++++
>>>  xen/include/xen/elfstructs.h |  2 ++
>>>  xen/include/xen/version.h    |  2 ++
>>>  3 files changed, 37 insertions(+)
>>>
>>> diff --git a/xen/common/version.c b/xen/common/version.c
>>> index 80e7a9b981cf..7eb8a0221d82 100644
>>> --- a/xen/common/version.c
>>> +++ b/xen/common/version.c
>>> @@ -114,6 +114,37 @@ void print_version(void)
>>>  /* Defined in linker script. */
>>>  extern const Elf_Note __note_gnu_build_id_start[], __note_gnu_build_id_end[];
>>>  
>>> +/*
>>> + * Check whether @n is a GNU Build ID note.
>>> + *
>>> + * We check that:
>>> + *  - type is NT_GNU_BUILD_ID
>>> + *  - name is GNU\0
>>> + *  - desc is non-empty and exactly covering the rest of the buffer
>>> + *
>>> + * If this returns true, the contents starts at n + NT_GNU_HDR_SIZE.
>>> + */
>>> +bool is_gnu_build_id(const Elf_Note *n, unsigned int len)
>>> +{
>>> +    const char *name;
>>> +
>>> +    if ( len <= NT_GNU_HDR_SIZE )
>>> +        return false;
>>> +
>>> +    if ( n->type != NT_GNU_BUILD_ID ||
>>> +         n->namesz != 4 )
>>> +        return false;
>>> +
>>> +    name = ELFNOTE_NAME(n);
>>> +    if ( strncmp(name, "GNU", 4) != 0 )
>>> +        return false;
>>> +
>>> +    if ( len != n->descsz + NT_GNU_HDR_SIZE )
>>> +        return false;
>> Isn't this too strict a check? Build-IDs can, iirc, take different formats
>> (yes, this is under our control, but still), and I don't think there's a
>> guarantee that all current and future ones are coming without any padding.
>> IOW I think len wants comparing against the rounded up sum.
> 
> Hmm.  There should be no padding included by the __note_gnu_build_id_end
> marker, but there may be in the section size used by livepatching. 
> Still, there must not be any rounding.
> 
> is_gnu_build_id() needs to return 0 for failure, and n->descsz for
> success, and this check needs to become len > n->descsz +
> NT_GNU_HDR_SIZE in order to tolerate tail padding.

The caller holding n in its hands, it can use n->descsz without you returning
it from here, i.e. the function could remain a boolean predicate, couldn't it?

> The caller cannot subtract NT_GNU_HDR_SIZE from the input length,
> because otherwise the padding would be considered part of the buildid.

Right.

Jan

