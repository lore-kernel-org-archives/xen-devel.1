Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F28C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 15:16:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394283.1633117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLXf-00010h-2L; Tue, 18 Aug 2026 15:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394283.1633117; Tue, 18 Aug 2026 15:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLXe-00010a-Vp; Tue, 18 Aug 2026 15:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1394283;
 Tue, 18 Aug 2026 15:15:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwLXd-00010U-BB
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:15:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwLXc-00DkoA-KO
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 17:15:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a847728-e002-0a2a0a5209dd-0a2a4506abb6-2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:15:52 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a847728-195a-0a2a45060019-d155dd2fe195-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:15:52 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so4169308f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:15:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b7834dsm12710927f8f.28.2026.08.18.08.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 08:15:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1787066152; x=1787670952; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZMOSjPuvvS5I2CGyKk4ioLNHh1L8JHs+oyJLDw0keM=;
        b=GS9uz/QMI+/jvMCT7B3QAx+FG/lFhiDDzG6lR0A9vKpHycJBfx0ApNqP/VoXQJHBZr
         O7Y7tiBXHumNpJSRQv9q4DoGX/wI26eVHTyvBZj6wauPmSm3JMbcvwM4Tvbr4sCtnxnj
         2rX4U2mKVEY+GDfZjyTzmRV4pY2BF8GFp0CV6/wgz0Tpr5j0nQjgNLGXWnN7NmDAasoX
         LjPh7BtYz4HkMadGuWBNq4ovVJTujmYiejiJqv7iHDSD2UprWlDc/n583aa/TzxhE8ey
         CLJCWtbm/XBlszMh3SLmvxuD2PeWhV4YHyJKplU8n87gfChtFmIbfM84j+QkpA9mR4Dy
         GzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066152; x=1787670952;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZMOSjPuvvS5I2CGyKk4ioLNHh1L8JHs+oyJLDw0keM=;
        b=m2bcjCIGmC/rUNgjUsrVVe2cWleDTiFR2gqgNosVcwwtAYX7J5dtQujdkvACpJ2FpL
         R91Kb9Bx0X6Z6jcqDKnwJlM2kXd94VXqac1jvqDyIzj4KWqR11pmZV5HCNX2X/G6NZiL
         vmlsryVZtIUT1tSYD2Stq92ONImvlfpkqgBJHEAIaB6Tfv4/6dLS1dgR2V4v2KXPm1/v
         DJR1YpO46QZGiAMOU2bPe7wp5xDXvD35httcKEvlsQBSazLv/iFmugnwqxausBeFJvTo
         UWW05vPOt2SjmHquAecSakIP4ln82oBpnUdQQSCRvnetwdJ0EsO1UPjFwrRYpv5ajHAI
         KeLw==
X-Forwarded-Encrypted: i=1; AHgh+RqXugAC1NJKHournM+iBpW0X5aMFGPuH3VkkXJqKf1SbyMkf6amWhEsaUEVR8Yrx046dqlPFK3h2Mc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX5gAl4dhC06OadjCpv4juPSqwR+FfIlz7zaVLD3T4YaDw6wBx
	KblS+JJNxSOlTyErroFFlyzlc480HgDsJ145l5NW/R5NN7v5r0ISzm9PAqTmFr/B/w==
X-Gm-Gg: AR+sD10NpuHAZ/BQ3aVl3smSiXiR2wUOWOgIfXQeLasqr4LrYwOZdbxsxo2HxI9Ce5N
	it1QQjSO0s+IhBjn4vt6ipEjqkoQ/GoDiELfxnO+EzS4ulOYqz4NYj54zsn+eWWEYwr1lCW2VXA
	jw3HIr2+zkiAp2DrsKmgsFwIxF3w/3WPLqwXvE9it9SeEBAVP87YaE3RHu3DY7b9zizVk8hCyoK
	og9QELnO9dq0U0T6aDxdnlM8mUTzzdGJ0UuRYRrmYuHUiKHM4Nf7abW8QEU8q3RQp4ayx0n0P6H
	MosZjWi7qbsTWoawxqGpiSC2rXNLeK9MPqKUkhy3493kjhPe9yLDYXONdvuYnIrpKdts0FgwJW1
	cVIzbcqRHKkZA1D5N0/7vkeSe2DmzMAF5ZvevOgduAAPilPWSD2qVlhqddNzGZQAQ25u/dfZnu6
	Pv9QZJTfVksWJaGaAqHWtVL5cOy/+k7DvXX3ZXHJWvHnJ3fQkHKfmep+vkqJFiG6R6ygoN7k5el
	Kt7oZ9ON0EPVf+a+pMayX9nlFEAUajretA4pPgv07IoGSfvck+X
X-Received: by 2002:a05:6000:2089:b0:481:573d:9d29 with SMTP id ffacd0b85a97d-481607574fbmr54157382f8f.14.1787066152042;
        Tue, 18 Aug 2026 08:15:52 -0700 (PDT)
Message-ID: <0a257dd8-86ee-4be2-9d7a-cfd90250a522@suse.com>
Date: Tue, 18 Aug 2026 17:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] time: add "NOW() good" indicator
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
 <7ef46d06-7674-40bf-816c-71f6935394fb@amd.com>
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
In-Reply-To: <7ef46d06-7674-40bf-816c-71f6935394fb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1787066152-F7ECC77B-AA46F12A/0/0
X-purgate-type: clean
X-purgate-size: 878

On 18.08.2026 17:10, Orzel, Michal wrote:
> On 30-Jun-26 16:06, Jan Beulich wrote:
>> printk_start_of_line() checks for a value of 0 right now. In order to be
>> able to have NOW() return at least monotonically increasing values, that
>> needs replacing by an explicit indicator.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

>> ---
>> Arm and RISC-V may want to consider whether their initial get_cycles()
>> can't be moved yet earlier, such that the indicator also can be set
>> yet earlier.
> On Arm, get_cycles() just reads a system register and it could be moved earlier.
> That said, is there any rule as to what should actually be considered a start of
> time (i.e. the boot_count value)?

Whatever NOW() uses as the "bias", I think. That looks to be boot_count on
Arm, yes.

Jan

