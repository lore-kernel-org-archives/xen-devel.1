Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22503C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:52:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414292.1644072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bS2-0001YY-5e; Thu, 10 Sep 2026 09:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414292.1644072; Thu, 10 Sep 2026 09:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bS2-0001YR-2q; Thu, 10 Sep 2026 09:52:14 +0000
Received: by outflank-mailman (input) for mailman id 1414292;
 Thu, 10 Sep 2026 09:52:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4bS0-0001YL-UQ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:52:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bS0-00AG8B-70
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:52:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa27dca-e002-0a2a0a5209dd-0a2a45058ca4-6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:52:12 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa27dcb-4cb1-0a2a45050019-d155802cd49b-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:52:12 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso50180805e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 02:52:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485958f1493sm38170192f8f.37.2026.09.10.02.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 02:52:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1789033931; x=1789638731; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3SFNLvQSoJtBjgqhOMA4Ch6yzscJjCRZhPApbgo4IE=;
        b=eJQe54Pe3MaPzxWhvvH560Wl8g54wKiH20AuW2ZpZfYdDoeR8noSMeRnhcS71TBgHD
         j8S3CMMdjp9jepdNMbcUcTcznoQQK241EfXZSW/bF872oYWvOzQAAnEIFjuynSTQLIxi
         CeMmN74IX7+2O4iqm9DZkNPcoCZBCzKLzI3KMcKz74R/asiypDD/1Z2ZShJcI6WETVyw
         8qvhnxYQiWdzx93BABxjDw2RRm4HDPz4ZGvkcU2zDdEofEQfVCsTRiEBgIEA/enIWh/Y
         vGUczqnttEjBV5flnwOCBax9b+JaDsEAybdAsKvktO+nOvEUBzBpHJpOfQ7KrXkp1PRE
         0L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033931; x=1789638731;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3SFNLvQSoJtBjgqhOMA4Ch6yzscJjCRZhPApbgo4IE=;
        b=aB0lZCdll2rPvqmOvMF4I8BHA7nPV6wAUZD+FezV30Nr+guTuEvQVre9kgvM7byZA0
         Cr1qPsi/z/7zF9tdwpoJtRzvzGfUrmUJ0ST7PBRzSROtN4S8bGe1rT2py2PU3twDv3tA
         bHMGMHs3MIuEslOLl4JBGyV+orJIjwyVz1y3LysP8th9fw1QECghY1Wi8E+08f0VOOV8
         UOkNYHwu/YUmJUSbcUu07/ZirEbt9+yyKPdvN+xO+GCLDMlJ3orEX3Ba/CzJgxfR1iJN
         DKskE+MdOs2mG+siCdcJso1/XHHahUImjOQP1gAW4F1tQg4uAjdWwZJUoSJFs1ZmenPq
         Lk0Q==
X-Gm-Message-State: AFuF++mYfZbmQ7ReTa4/yuZPfZh3FeKgTOFmLfOSEKKT6s217bXzXo9L
	FcNl7QQNLd62BMrOcn+U58/Lof4mD7cFZbTt513Pg6Snd/rdAnrCC3ulg5ghHTJ8PA==
X-Gm-Gg: AYBFou1gmWUTRzoDHbOo0+cJAhBe0Vy4aDiI92pwXGI0AbpXKnvxypwrUTSkGaB9vDB
	t6dQrq2dpcZxax7c7uEeykVOA7xypUvZQoRNUk4G1IxAyUsoIda0PfSICqEbA8XiWsBpz/Mrk9/
	G2xg3jAZUcghozO80I0uznOis13/0Di+LZa4ovrLAwY14GROeVG1xSBW18xu7IilF+DbNXIA5kc
	FCjr9kq8cXmm0pFHarOhz658o4f4k8Z9lf3qml36GeLUQmKdTuv0m2OKLZiqQF8X2kEhEfbE/Y0
	7+vE5SEvRMAidLZ5RT663+KxdqCgIzV5q54iK/+i1398g3yOMTkfam50MEEBzPZ84bYo3fUq6Lt
	4YMAil4xIoL/8HFkXA6PBGsgqKV5r4ijEbGrbRaJmMKPxuY5E16/mFVpuOXdMHt2AqCbfHDafuD
	r0lNAhNwDGGkjN+9JSIq2nbW0aKsInljATz1bnTcn1wbSDO8lf5YPRKS2cYXLyT1FRdncf2eZN4
	+ejFCPGHTeswETOjT+vud0TPOn6mHAXejhVnsK4cOpNJr3bKRGk8kZOJJP0dZI=
X-Received: by 2002:a05:600c:b93:b0:49d:17c5:8f7a with SMTP id 5b1f17b1804b1-49d17c58fa8mr175719285e9.18.1789033931576;
        Thu, 10 Sep 2026 02:52:11 -0700 (PDT)
Message-ID: <f51588b3-4100-4353-a35d-ac0780f2aab0@suse.com>
Date: Thu, 10 Sep 2026 11:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
 <aqJhJO2FtkrJCabM@macbook.local>
 <f17563f9-3a42-4002-afa0-b763e125dcd6@suse.com>
 <aqJ4myv4_II75W5K@macbook.local>
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
In-Reply-To: <aqJ4myv4_II75W5K@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1789033932-71CA82A1-A8F500FD/0/0
X-purgate-type: clean
X-purgate-size: 1112

On 10.09.2026 11:30, Roger Pau Monné wrote:
> On Thu, Sep 10, 2026 at 10:38:34AM +0200, Jan Beulich wrote:
>> On 10.09.2026 09:49, Roger Pau Monné wrote:
>>> On Fri, Aug 28, 2026 at 09:02:18AM +0200, Jan Beulich wrote:
>>>> The use of unreachable(), when unreachability is visible to Eclair (and
>>>> compilers), is deemed a violation. Drop the redundant statement.
>>>
>>> Urg, isn't that something that should be fixed in Eclair then?
>>> Otherwise all the unreachable() calls in our codebase are likely to be
>>> found by Eclair sooner or later, and will need to be removed.
>>
>> No, aiui most are covered by deviations. In particular ones in BUG() and
>> ASSERT_UNREACHABLE().
> 
> Shouldn't this be a deviation then also?

Maybe, just that I had no good idea how to express such a deviation (preferably
without a SAF comment).

>  Maybe it would be helpful if
> the commit message states why this is handled differently from other
> unreachable() instances then.

I've added "..., , and the one here isn't covered by a deviation" to the first
sentence. Will that suffice?

Jan

