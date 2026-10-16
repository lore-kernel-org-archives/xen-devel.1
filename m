Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586A4CCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 08:58:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451400.1666463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdlU-0003Mb-T8; Fri, 16 Oct 2026 08:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451400.1666463; Fri, 16 Oct 2026 08:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdlU-0003MU-QT; Fri, 16 Oct 2026 08:58:12 +0000
Received: by outflank-mailman (input) for mailman id 1451400;
 Fri, 16 Oct 2026 08:58:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHdlT-0003MM-Te
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 08:58:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHdlT-0057zy-6i
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 10:58:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e719-bab6-0a2a0a5309dd-0a2a4501bb88-44
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:58:11 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e722-5984-0a2a45010019-d155dd2ee524-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:58:11 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso1477494f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 01:58:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ad6451sm41982045e9.4.2026.10.16.01.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 01:58:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1792141090; x=1792745890; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PR9lRPIG8/Y939BZAaMFoj8bjV2bIjKUE7RFR5/k+GM=;
        b=ZGPjoTGHYXdMJ5ntSL1spXF02/5F6kwQnLZPE2Rh/dlzVCtJYZ2g+WjoYJUZ2+QSUj
         izCqX74fddPlPhvGcutzjI4wi2cbmqGRBVhCNVoFwDF0K0WEw+6GScim8Rri3GXkBeRE
         KIbZ5JAP53e3J23YUFxfAXZvsvswP0osSscUkLo6DbsrMsiLKJIdhuUrrp7NckS4QaTz
         dTD4NJ9Ft69zbn8FM0bKHc/x4pvPgTSd9aHZ/Y+pfb8yTOo2n0/rQHPWU24JpD3xuL8X
         n5GQUJZMhj03nyTvwoRY+BZYRboAW5wUSv1Dn4qQG+ndT8zBQ2tFRYPWrHUWHJrCXcBj
         +qsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141090; x=1792745890;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PR9lRPIG8/Y939BZAaMFoj8bjV2bIjKUE7RFR5/k+GM=;
        b=LP6dw467fpjHedesmXSp17NU1jBu/fMbfz6YCr2FmOthF8ByQMMlecd80dps4tv1JC
         ZK6Kw8153cKzOZ3WyVjQF9+s6+VsEMDf4LcqsfLRB1blt3w/300TMWTHQaCWmNVh19IS
         17W1slSDhJIIp0mKOHP+7ooVDUSnCqJBCff/6W8PEsDpe7OE+NRMj/reEp9Wd1cBvfVQ
         j80+JDr/254bCzKNWKbj8RAr7nSqRyjs84tPHoAdawUDukEjKASKWbyk5mqKDJ1wTgbK
         1V/r88rymmCgSkEngSqNk+fP2XpDUjGMSykLHduRfziMCc9u5z2h85XzgTmste4USgr4
         E8eg==
X-Gm-Message-State: AFq9FYIiNvqCg510zxb+w4qft6E3V6FPbGQAyH7U5N1CFfhjzm7eFuyn
	xo+K/AXPutisum3t73ep8SZRXXXk3gnTKpJuium5GNuSS1eczDTsJYhvwSlQzQlAqA==
X-Gm-Gg: AYBFou158MZRgYzURyYKAhkL9prc87ixL99bFYIkWvezXjGzznMP4rzFOINWBaD3sKX
	iycJx3A1HQV+epaPqRMP63Lx/wRQmh/NX5pxpZWnEM1/3KoGLmin5+/GeR5H8+b0sGChZp+s7hz
	v0faw8A5P3KbNI4APWly5ENiiVZCP5IIq6cNxcAZHkAuXmAxLbT+Nf7SYSQo0dKTxV/nqA7/7V4
	h2x33H/Pyf/yLw9inDNnH3Ta8nBNUqqrOlbF6Nal3GrsHBa8RQV/ATmt8k7KdKCoMSLgMBcFYyH
	hytpKIBm+DKdsol2n60JD5YS9iWHjAMTzM8x27IiFZAionyFgBe+2+2g9K2jEu7t48QfvtrgGv9
	w1zdzgHL8QKjBQjZ8tKhas9KlFzeRs1LWe2FxAWbToMUOLHtu433cK5OOypEU6LpeIhWzwp4ah4
	3KEQCgV3Eqd7ioIOh8e5mBtXHk43Vry947PinYMcKPR4/DQD07M24aenZtKN7xFX2cuk0Ct3qz5
	VA8MtdV64N8xKjTSLItF1bRyPGwxh293EluPbLxkLuzkDFBtB+5waD14IrHfoE=
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a18e4841c1mr458595375e9.14.1792141090544;
        Fri, 16 Oct 2026 01:58:10 -0700 (PDT)
Message-ID: <acbbec65-3435-4869-ab71-090afd751083@suse.com>
Date: Fri, 16 Oct 2026 10:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com> <atEQPq2zvmxxEgIY@Mac.lan>
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
In-Reply-To: <atEQPq2zvmxxEgIY@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1792141091-C4D44757-3E2987BB/10/78276251493
X-purgate-type: spam
X-purgate-size: 978

On 15.10.2026 19:41, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
>> @@ -867,7 +1078,7 @@ static int __init pvh_load_kernel(
>>          }
>>          start_info.modlist_paddr = last_addr;
>>          start_info.nr_modules = 1;
>> -        last_addr += sizeof(mod);
>> +        last_addr += sizeof(*mod);
>>      }
>>  
>>      start_info.magic = XEN_HVM_START_MAGIC_VALUE;
> 
> Isn't this still not properly ordered, as start_info address must
> strictly be below 4GB (as is passed in a CPU register with the CPU in
> 32bit mode), yet it is allocated last in pvh_load_kernel()?

Well. For one, this is pre-existing. With the size of the region that
find_memory() needs to find greatly reduced when the initrd isn't
included there, there's about zero chance that it won't find a suitable
region below 4G. Once we have find_memory() go downwards from 4G, the
remaining little bit of a risk will also go away.

Jan

