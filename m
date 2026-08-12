Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F130CC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:20:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388880.1629849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4Bu-0000KE-Eb; Wed, 12 Aug 2026 08:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388880.1629849; Wed, 12 Aug 2026 08:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4Bu-0000Jl-9J; Wed, 12 Aug 2026 08:20:02 +0000
Received: by outflank-mailman (input) for mailman id 1388880;
 Wed, 12 Aug 2026 08:20:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu4Bs-0008U0-BU
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:20:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu4Br-009DNy-NW
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:19:59 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c2c9f-2eae-0a2a0a5409dd-0a2a4501bf86-42
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:19:59 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c2cad-5984-0a2a45010019-d155dd36bde6-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:19:57 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so311234f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:19:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150c06ab7sm4983563f8f.10.2026.08.12.01.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 01:19:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1786522797; x=1787127597; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xbkrj8eRgDwMAbqx9zPbWp+jysgWEKTdlMFuu67rOtA=;
        b=JnoZxiqj0FP5nzDA0fmtKc8wbLlbf9WXWyfGo4Pn4JJS3nsaBMIa9BLCOYwzwjLlOQ
         PHUp/AWmg3haG9X3TGFGZuy1jQ1WyPHCFMCZI5yAo39WQr404tOeJd9jFzadqQCG5iR1
         PehHNzvQBKVBPh1A0whv8BvMt198a4gc9VeI/40OqX4C5D3hrk43ifD0tPnIgkDX/u5I
         OtbpHDUr4zkvwP/+7264yG+ktnfjlVo9AKf5ItlODct49dkGkajtZS9lRplubk8tY8gQ
         MdqbkfptpkEB4MCjOMs+APG2engaLpxiJtZabqy4ZByinWeUU5Ezue51caXP42RRf7y7
         kfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786522797; x=1787127597;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbkrj8eRgDwMAbqx9zPbWp+jysgWEKTdlMFuu67rOtA=;
        b=YgvF/r84KsqqRnfziRkZRyVTyGnwPtHIVZ4QVVpr8BNznEOCxsqlRQA6XWQHpw4t66
         u5zFcdRXY33uDqbB+3dnFIB0Y4Fn9GCoTvGx5dkgWDAe0bovpFehiEwuoZ9ezr2LTGle
         8mk47aPk0Am1yXyf73NLBK63qOoXhFWNubbI1k7nENTPypsriyGYvw/LonkZ98XvA83K
         DPXHBZZWMM3wybjj+W8wnHKMFsOfYd8jUfNglDAQ2hnurqsWa+NO0gyfaA2yXclG5bBP
         gWX5J2PG8eYnJh3WQwdf4YkQZn3qVhy/op1tzC6tuQRuAqIIEa5FE5Vy6lHY1w9fmxa1
         0zTw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0QYjy1LtlcJ8KHQFfPD6ecodwID/cNA5STJIdmxHfDIlrZ9+SWD6NVKhJuhlH3UfUl5QaPajeNSc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+WpMVBsZIpC7aP9llxCrdnSMO8t63lEaKEdFMlykonvtTgjHN
	jfhL7lNGNfYX4sqUel81CDrHPKGJPUv70VJR+vfWjapZJ+iIF1e2vVM17PanOTSF5g==
X-Gm-Gg: AR+sD11TN+QGh+Jf0DOvKoaUYXGbU2hpNnbNglP1cLsOaGkmzLjxMIllHeN/mQb/Gtl
	P0nX1WW4cgZu8u20DHCW1/guUf2w9pt/9taGKxjD+5YPpCzNcVr9Bv9Mn47f+SOAMUSilw0Dn1N
	TtGIG2nfReRfFWoBhp4fQVDDm5hWOZVLOK+/vYGIWKkiJrWaAwq2E5uaY1+i7TzlHxZ+3fUgYB+
	gxZWFDq9OUk3a0032x3EpWictOpr4My0Jo/p0r0ol+XtmxX/2DlREni3QcLp5L/zuQ3DgDbHnRf
	jsb6Lx/01hIGjULVcCBJcnpJF9cY+90Am1aqx57ht9zngzR+RndPy/UO/icVlq8cR0R3f5wFq7S
	K8LfuCLEvvxIJEpLI6PvNfyksYUnCvVoM8N/oqE5uXOZjXaMD30cDDVYdS9WieGMiDGQvvee7sN
	OsWHayI7ijxfX3TH2qpIWW1CJRwwUiJXaMm0pL7svLU8cBXd4ecEgoZFv2dFLrR3lbvInsjGzDQ
	/kIizYppRHmWlBcbU24PkhMLmhzXD9anM15mC5QFF4769MXzvUe
X-Received: by 2002:a05:6000:1865:b0:47f:b51d:f0ec with SMTP id ffacd0b85a97d-481528d77bemr3615393f8f.15.1786522797232;
        Wed, 12 Aug 2026 01:19:57 -0700 (PDT)
Message-ID: <7ea460ba-e2c8-45a7-9b7c-0cddcce275e5@suse.com>
Date: Wed, 12 Aug 2026 10:19:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/common: add keyhandler to show Xen command line
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org
References: <20260810230359.671587-3-dmukhin@ford.com>
 <anrXvTfBls4flBqK@macbook.local> <anuMfq/lDjxbR8Om@kraken>
 <ba78a8a1-6862-41b0-a6a5-cae7eada3627@suse.com>
 <anwo2QtEh9tObNDD@macbook.local>
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
In-Reply-To: <anwo2QtEh9tObNDD@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1786522797-BC95A757-017B7826/0/0
X-purgate-type: clean
X-purgate-size: 2199

On 12.08.2026 10:03, Roger Pau Monné wrote:
> On Wed, Aug 12, 2026 at 09:28:46AM +0200, Jan Beulich wrote:
>> On 11.08.2026 22:56, dmukhin@ford.com wrote:
>>> On Tue, Aug 11, 2026 at 10:05:17AM +0200, Roger Pau Monné wrote:
>>>> On Mon, Aug 10, 2026 at 04:04:01PM -0700, dmukhin@ford.com wrote:
>>>>> +static int __init cf_check misc_init(void)
>>>>> +{
>>>>> +    register_keyhandler('X', show_hypervisor_info,
>>>>> +                        "show hypervisor information", 0);
>>>>
>>>> "show hypervisor information" seems too generic to me, almost all
>>>> debug keys could be defined by this sentence TBH.  I think this needs
>>>> to be more specific, but I'm not sure what's the plan regarding this
>>>> key.  Is there an intention to print more stuff here, or just the
>>>> command line?  Knowing the full set of information to be printed might
>>>> help come up with a better name.
>>>
>>> I will update to "show_cmdline" since I originally planed to expose Xen
>>> command line only so it is possible to better debug a system when dom0
>>> becomes almost unresponsive.
>>
>> Yet as indicated already on v1 (I think) - a precious debug key character
>> for just the command line seems rather wasteful to me. If it's only the
>> command line, and if that _really_ needs exposing via a debug key (i.e.
>> if there are reasonable scenarios where "xl info" cannot be used), perhaps
>> attach it to e.g. the 'h' key output?
> 
> I was going to say that we should not overload the 'h' key with
> printing a possibly long string, but I see we already print a bunch of
> information there, like the buildid and the compiler banner.
> 
> One option would be to introduce a new debug character, and move the
> printing of the buildid and the banner to that key, together with the
> command line.  Then 'h' output will be cleaner and just print the list
> of installed handlers.  That would give the new key more content, and
> help cleanup the output from the 'h' debug key at the same time.

Hmm, yes, that's definitely an option. May I then further suggest to use
'?' as the key for this? (Or am I overlooking that key already being in
use somewhere?)

Jan

