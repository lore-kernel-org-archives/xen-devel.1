Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB5C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 08:43:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427159.1649779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Zce-0000Fk-33; Mon, 21 Sep 2026 08:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427159.1649779; Mon, 21 Sep 2026 08:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Zcd-0000Fd-Vx; Mon, 21 Sep 2026 08:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1427159;
 Mon, 21 Sep 2026 08:43:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8Zcc-0000FH-TQ
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 08:43:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Zcc-000ReK-6A
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:43:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab0ee31-8faa-0a2a0a5109dd-0a2a4501c7d2-20
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:43:33 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab0ee35-5984-0a2a45010019-4a7de14cf7ae-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:43:33 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485ac898fa4so2307611f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 01:43:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724583250sm21083999f8f.22.2026.09.21.01.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 01:43:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1789980213; x=1790585013; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmSBsavPa9iLNV0IyjqD5m1QBa+Jzn+kQXoCp/wH6w0=;
        b=c5EschBbbObNrdx6yPu1sGHTn8QgC/enI4ZbmwtHkbEmC0nbF9OsP2p8HURwdqbu9w
         9nGN8UQGULziPDW0dxKSc4tt4ziQKyH13JtpzZgF+O588uD9J7gZm+Mc30713+VIRXU8
         kgKrJuHviUO2Fi6SjxdudurEF2DGYsp1jTUtDJs5UCZKfYQBzbN36/MtaUGeJ2ZaE5QG
         +NW02U9/pcWw03lipc21HH98fu0Rso91bu9H8CoP/UTEOCI41mYncLZWsEcZcWIjjDVw
         FzdQv5hBJ95OrU8L0p+ryShEiU8Em1Lce/Dm1ylBdHmPZCgL1fdFqLcBLFr6oM05XVWi
         n/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980213; x=1790585013;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmSBsavPa9iLNV0IyjqD5m1QBa+Jzn+kQXoCp/wH6w0=;
        b=JOmRv0cXczdWPkgh3MMlpkQMPPdmQYx/nBQgjljVOE2UaefCC206+uYPgcJfYzOzKP
         6CtoQPkx6SYmyAvKkRruPvhVJbWIAoWu7HlYSwkEoxy3CeFpds4K0iWxyVdY7SS+uNdX
         4mU7DtSV5S9CIMoEoy3yIYFmsJ4oa38He/F2WytrK9lcSPbhbwzLfl2Ar0uwxGlgtXp3
         n9mE4lqi1SyLmLYSMKOBBX7bSxnaLdRYcYoUSJc9aUzde3pnIHSIEUSmHOW8PSPEpjGf
         96ODJxqPmljZU6EMM1ML638ufAr2xoW40vZvdnOrOUhqOfi0OiPcegdmdPZzH0nrjijC
         CfcQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5eYh62jfvRrtydbcjQizjvXVKBai7Zm86uTyQ0kAW5oVYb8vme4pS0QX4BpaqyGiONxG0C19mJGM=@lists.xenproject.org
X-Gm-Message-State: AFuF++kwK906Q8VwAUYgzbuc5qvKm8dAI15zKzBkqg+BEi8CqfKyk5VN
	Bz0amiGiefGQeTtBz2qEEW6pPaYKnMziz4NTMFgie7lfZ+R7IYlZuvEDFHd67TKCqg==
X-Gm-Gg: AYBFou1tnNdcf5nU+iZpIKgKWRder5JVKWeB3HfKl6zaQD4VgZ8mOaDJRt770yWCwSs
	3s3onOr/suPX0vSgyI1wCu3BaT8kkVl7ejB8Y9vAB2dn8uTUV5L1Ju6yfvUSYaB2Vl9wnDx3Q/U
	VBF8NNitv5ZKsSLlzmlkoV58+zxJ9f7MXwTblOZRVNsx8Gy1R+YDnVU+jtiH9JIuemnhW/qzDy8
	sEfW58n72Bz0XAPKNQzxDD7XFlDLoqSQa6tA+aV8BtVnoB/IYCXBn0wnCmIFlxtDq0h/scJfrwf
	YnhiTtShEnfJQ8BZLuunglLn3W/3wrzicN0UDPacQuqXpYGp4FC9CzrNVI6FBFhoDifjj4XSgMY
	9U6sUsboBsl0RW+ddVpe/xiNSHCg9UGdk3woqWPC2xmaJ20e7kQ3zxOZtqhTrAsxt5tL88wweuK
	6WkqL4+lXrBf2ST6QN9et/yoz+EX+N56ihD6lhORqkSjDm3YW5/eNGHWLGn4zh+N4CeNqRQd6yI
	L/Ra87Iodecz1/REb28mr+3Z1KRMb6zbfMYk2oPrDQJY3llp++8jezZciCwjw==
X-Received: by 2002:a05:6000:2884:b0:487:360:5be1 with SMTP id ffacd0b85a97d-4871e2112femr14096932f8f.8.1789980213398;
        Mon, 21 Sep 2026 01:43:33 -0700 (PDT)
Message-ID: <09190c27-fd5f-4f7b-9d2b-be03785c7bbc@suse.com>
Date: Mon, 21 Sep 2026 10:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] stubdom: remove build of zlib
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20260917075351.37208-1-jgross@suse.com>
 <20260917075351.37208-3-jgross@suse.com>
 <6f9965b4-4d06-46a2-ae18-8014b1a1c4cf@suse.com>
 <d69cbb72-e46f-488c-bd35-109d8707731c@suse.com>
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
In-Reply-To: <d69cbb72-e46f-488c-bd35-109d8707731c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1789980213-BCF47757-20A7A38F/0/0
X-purgate-type: clean
X-purgate-size: 1088

On 17.09.2026 14:31, Jürgen Groß wrote:
> On 17.09.26 12:51, Jan Beulich wrote:
>> On 17.09.2026 09:53, Juergen Gross wrote:
>>> The last users of zlib for stubdoms have been removed.
>>
>> Looking at patch 1, I can't really conclude whether that's where the last
>> user disappeared (no occurrence of "zlib" in that patch), or whether this
>> patch really could go in right away. Please clarify.
> 
> It can go in right away. The last user disappeared with commit
> 6a94eaa2bf3fa06b05ed2dad3dd9116060235326.

Apparently not:

names.c:18:10: fatal error: zlib.h: No such file or directory
 #include <zlib.h>
          ^~~~~~~~
compilation terminated.
<builtin>: recipe for target 'names.o' failed
make[3]: *** [names.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory '/builds/xen-project/hardware/xen-staging/stubdom/pciutils-x86_64/lib'
Makefile:37: recipe for target 'lib/libpci.a' failed
make[2]: *** [lib/libpci.a] Error 2
make[2]: Leaving directory '/builds/xen-project/hardware/xen-staging/stubdom/pciutils-x86_64'

Jan

