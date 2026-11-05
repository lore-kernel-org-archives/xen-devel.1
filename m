Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADD1606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Yh8CBNcC
Received: from list by lists.xenproject.org with outflank-mailman.1474413.1681544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOutv-0003eL-9j; Thu, 05 Nov 2026 10:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474413.1681544; Thu, 05 Nov 2026 10:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOutv-0003eE-75; Thu, 05 Nov 2026 10:40:59 +0000
Received: by outflank-mailman (input) for mailman id 1474413;
 Thu, 05 Nov 2026 10:40:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOutu-0003e8-49
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 10:40:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOutt-00DXEI-Gr
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:40:57 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec5d32-bab6-0a2a0a5309dd-0a2a450aedc6-16
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:40:57 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec5d39-f2d2-0a2a450a0019-d1558030c559-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:40:57 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso12632365e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:40:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4532916f2sm133329245e9.5.2026.11.05.02.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 02:40:56 -0800 (PST)
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
        d=suse.com; s=google; t=1793875257; x=1794480057; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cgea8IgC9n38sgqwiYmIv1DTx7WSO1v61TCnny7OieU=;
        b=Yh8CBNcCOxQngd3dgcOeRvgwVKFbEuYhwPR8+lXDUC4ClL/3ZyQNtIXUSiH2LOrTfg
         B1+0I8+MzNI6c4AlsO1ryz9PMWBWlfysnaKBYr3RoBDHTcuLsSgSOYVY7ci8IWAn1htb
         /y9AgM2j8+j1s0DKQcs2nasMgNo/LGYAOJeqyh5xvLNyQFUFNyQyfOzhzmVG7QbmmYW8
         OTS9KKOecG28gOswNRvtMXXqxXvvqKip39LedHZypJVuK92EXoHaYnZPN9BEpzBL6XI2
         CTe05RTlKu7m2VFY3YRPDQ1F08ZSZtFEyq37bM3ZpClTV1yVx1u2ePVGjPdgGh6AI92J
         kzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875257; x=1794480057;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cgea8IgC9n38sgqwiYmIv1DTx7WSO1v61TCnny7OieU=;
        b=H31sxSUjvoD76HVAUflB8z+XHPYbfprHSoBPwuyhElq8fjmM008tIgVVoZj3hv2wMt
         ipdDXWY+3H+s10nbj3lokOfGnkRKXf6VnPzzmNW4djBFQdP1k47haBgkPgiJfBSqCS4U
         An1HNsuT+z8BB5joxZtYR8+kvzWv599pcIrjeqVGFW98YQcO8gX2fHqOO7KOtUI9/pda
         6A8EqSaUuP/pi0+9K3gVuhLoGvBmTa7HKaBe9s5BCnrTZ2HfZtraFKFZCE9igT/CcoeH
         EKETXGkaszw8wlBlr/7ZnHgnQ4EkIfwEB2wLakvR9OZCrIQ2cHoxA+8aoc4hCXKrrFZ/
         B4iQ==
X-Gm-Message-State: APuU4Z/whRpdJTt+0chvYVS3ghH919jd9gGMhrRBDiE6qp+nl5j4vcri
	gdyDZ7ZYqiTvNYcNbI1tku6mBdDZ5eh2ILYV0SKBDyD1u4JyYMx8dpGzWzieS/Xwng==
X-Gm-Gg: AYBFou3yVtJE9i/+XUdxmw81US2jPZhsS59OE5e6cvw5Xs65Vuip/oHFlaWXRI4Ts+m
	F93p6epcyl9ObjtpxaGS94fhp9TKIy8xTY2XlEnkK2C/Rdiq2xjKvW1R72AJ2BssdHRT4Sf52NO
	2PuSalLH7UL5XpjiKB7azygTGfSZlC8JSWeuuD0fvAyYmTDvi2DlAE6cXgPOa3ChzDeBtSulnjo
	gmptDJE1nUOs+FCPWnssxDGF/45Xa2TdbqcwuhLgo3n/EpM7B1fRxmdWykzQdpsQ3QWZ6oYyJp0
	GiJtW/X/yCCwxPx4q4/gVYhwXvPe8VHbzYsrEXNqybUUul+twfDpMDUCMLDJpt0TTwGjyRqcaXm
	csJK1O5P5qPXudQo2KUbcXXngLqjUHJxpthmSdrgoZ0IE8exfueJHIj3mVliORjK2dVOaCsek+/
	jrVrryIS6pXf7UXZfF6th5JfpJZGkZCHIeZQyl/oUGnK0Wk9uj67H0cW/g3K/l75n931fmIyVc5
	H9p/evHjFrjoAlwY2JRLw8jiCXGkVc7cKio/iqDFJkbVN+E/L7OeIYgb79Kv0IXyCX6ZzeEdkpv
	Rl5lv6tW1BjAE3cr/ID4IXyc4Z06vfhKhn4oDmzyaN3eCt19jRCM4Di/OD32Eb27fEsJFmdQGvA
	b12K0f4AfF87ypJFC
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr414175735e9.32.1793875256858;
        Thu, 05 Nov 2026 02:40:56 -0800 (PST)
Message-ID: <b93ddf46-14b9-4dd6-ade7-ba343e73bc40@suse.com>
Date: Thu, 5 Nov 2026 11:40:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com> <atEADbxD4mL_bXy6@Mac.lan>
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
In-Reply-To: <atEADbxD4mL_bXy6@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793875257-4BAD4CFC-A60693D3/10/78276251493
X-purgate-type: spam
X-purgate-size: 1194
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.10.2026 18:32, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -450,7 +450,9 @@ static void __init pvh_init_p2m(struct d
>>  static int __init pvh_populate_p2m(
>>      struct domain *d,
>>      const struct e820entry *e820,
>> -    unsigned int nr_e820)
>> +    unsigned int nr_e820,
>> +    unsigned long initrd_start,
>> +    unsigned long initrd_end)
> 
> We already have a rangeset in find_memory() that contains the RAM
> regions, I think it would be better if we propagated that rangeset
> here as it would make the logic easier overall.  We would need to
> initialize it earlier (as find_memory() is used after pvh_init_p2m()),
> but would avoid the extra logic.

find_memory() is now gone, and a RAM rangeset exists at wider scope. However,
that rangeset still has stolen (ACPI and reserved) regions subtracted out of
it by the time we call into this function. Are you suggesting to maintain two
rangesets, with the broader one having having only this mapped region
subtracted out? That would get a little unwieldy, I think.

Jan

