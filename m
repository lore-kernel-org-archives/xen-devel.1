Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5F9CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 12:50:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437197.1656022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtlB-0002w5-3g; Wed, 30 Sep 2026 12:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437197.1656022; Wed, 30 Sep 2026 12:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtlA-0002vy-WA; Wed, 30 Sep 2026 12:50:09 +0000
Received: by outflank-mailman (input) for mailman id 1437197;
 Wed, 30 Sep 2026 12:50:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBtlA-0002ps-EQ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:50:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBtl9-00EN0d-6a
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:50:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd057e-e002-0a2a0a5209dd-0a2a4506b1c0-4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:50:07 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd057e-195a-0a2a45060019-4a7de18d85d0-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:50:06 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ffe817151so22623425e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 05:50:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cb8a2d6sm6682225e9.1.2026.09.30.05.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 05:50:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1790772606; x=1791377406; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wc4EPvcb36G2yKBF4VNdcZT48Lpak+YsrD9MxyrnPlo=;
        b=SPu9KxLdlemV+6LIOdxdd8v1a089CCF81uUAIMxmHurth+NEvZ14EhA7XTqSKQV+2J
         7TH9MBU+85byCuHENBfP2mmqvD7LBLgceUKZtjQof8qMPIo4KJrbTubN90azRaCMlfeL
         YTiTgxnGght2xYFq69JHS4yFVWLxbCZ+3xoVXb0YMkmDzPlrfvGHiOAdcKx0CNK8Slxv
         tZGcV+xwiq8Hy40l9R3Fr4m4XuKdv/OxHHl1LzSLNIooqwyZcTyT9EKZjjkd4rI43k26
         JF8px2xsuXk+6RPtUNP4Z/P0DmCaJjglQy+hoVid6+5C1mC38CgP5dSRR277IsQmqN8d
         TlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772606; x=1791377406;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wc4EPvcb36G2yKBF4VNdcZT48Lpak+YsrD9MxyrnPlo=;
        b=tS6nueXIrOnc2udtF+U5e6xw3ukxCDcYURhWKlmPhAcHnZdWZ2Rs6Xs81GP+jCfHjM
         LMoE5iKJflxuQTBYyDZUKhBBAL1s0me9jSJRl9Itzznrdm7ZTvf4PmPbrckbahQAs4Xe
         fMuuLNRkdFzmz435l+huUkaQdZynEkbnKilKtwLLMFFPTz6i2msY50hDtChYjxU5nzPq
         P4gkrsw82IZZIfmISwfjtiI1oa8V0KkOZRYyJSGQeTXj2ZkVS6ubL0bABb2j9YuLowuJ
         kkSyStkbfu7M/NgC46n2WFNR3e0HOx2uC4OlL2wTnlXrcCV6TYpepYJJq9Y+GhwA+UnF
         YdHw==
X-Forwarded-Encrypted: i=1; AKwUvBzhT+njd4pHTT3mtZEogNvJwniGXUG2De3gznsQXMjl24rOWGG5Uw5UmdnxSrmHjq4ozPVRuZDGglk=@lists.xenproject.org
X-Gm-Message-State: AFuF++mkqtqhGNGSs1pIfzfPfGjRdaix0XZ7yfvU7SD6CQAU+bUORzJM
	1budfvnGQ88yA8myJkXbM6QaisZx608yglGAc4AKkqdV6MDd2KPiROHdN0P4MHsT1Q==
X-Gm-Gg: AYBFou1mfwtEn2sqWNMWu0qKB/XqIV7dXwwQhviFw8QkBpHmtrf+XCUZNsreDd6cm+d
	fZq80Pbk0e+7QUz4dj3ydlFhNQ6oOcJfWqVikpDGFP/hG+ltqb9ddqlvhP7hKwYRcdzw5WvlBO9
	kTpfIKX3u6yX0reyE1EtrZpYHkmYmoJHjIvIDP8qqZ4LaumCv9jpwXP4REzHa+eFcbAx5OZZO80
	uX8Ev3jrndxr78R6J1L8YuAvwsn2hqFKPwjY5qx+ZZ9qigkLSdCv2wF2Yc+5pqflBrRs3o6QySq
	gC+58/UQ7p2X7lp8fvC1pyXgdA45RcIHbX7JnogbkyLP5YWVTUC3QXV6Dwihjg+nYSm+tjWfqeT
	IXb9LmW1CS3WRWntEpDHirI4ACf+U5j2DWXP3iKA7EmZh7xUSog69vRspl52Ouv8I7lxHppbtgZ
	8FlxoFMkmc7W37dcttIN9yUyi4N3tFEhRKLHWZkiV7GxIXYDjtmsRsVVPyzeFatLLir8NbZise6
	yFLnlCiHgCHP4k7CWW7sqe8gcYKb/yU2rve+Y1ovE5jnf4hkYMWNca2lRloD8s=
X-Received: by 2002:a05:600c:4454:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a01b00f607mr22197705e9.22.1790772606313;
        Wed, 30 Sep 2026 05:50:06 -0700 (PDT)
Message-ID: <7f3e7bb4-a3ad-4ce9-86ba-660b8134a5a7@suse.com>
Date: Wed, 30 Sep 2026 14:50:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
 <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
 <1790772153.8631fc262581453bbf619ec5b2062170.1a0f2568c0a0003f66@vates.tech>
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
In-Reply-To: <1790772153.8631fc262581453bbf619ec5b2062170.1a0f2568c0a0003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790772606-FC80577B-518C8AEB/10/78276251493
X-purgate-type: spam
X-purgate-size: 1387

On 30.09.2026 14:42, Baptiste Le Duc wrote:
> On 2026-09-30 14:07:34+02:00, Jan Beulich wrote:
>> On 29.09.2026 18:32, Baptiste Le Duc wrote:
>>
>>> paddr_to_pte()'s "permissions" parameter, the matching local in
>>>
>>> setup_initial_mapping() and p2m_set_permission() don't only deal with
>>>
>>> permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
>>>
>>> PTE_DIRTY.
>>>
>>>
>>>
>>> Rename them to "pte_flags" and p2m_set_pte_flags() respectively.
>>>
>>>
>>>
>>> No functional change.
>>>
>>>
>>>
>>> Requested-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Assisted-by: Claude:claude-opus-5
>>>
>>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>
>> In principle
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> I won't, however, be able to apply this patch as-is. As you can see both above
>> and below, extra newlines were inserted everywhere on the way here. The list
>> archive doesn't show this issue, but instead shows undue wrapped lines. It is
>> also only this one patch in the series which has this issue. You will need to
>> resend for me to properly consume.
>>
> It's weird, it appears my original message didn't contain such `\r`. We
> took a look with Anthony Perard and it seems to be an issue from Xen's server
> side. I will try to resend it, just to see.

Sadly same issue there.

Jan

