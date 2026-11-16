Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2BD606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PLzN+rM9
Received: from list by lists.xenproject.org with outflank-mailman.1491194.1692086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSz6F-0002Iy-LZ; Mon, 16 Nov 2026 15:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491194.1692086; Mon, 16 Nov 2026 15:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSz6F-0002Ir-Iw; Mon, 16 Nov 2026 15:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1491194;
 Mon, 16 Nov 2026 15:58:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSz6D-0002Ie-JU
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:58:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSz6C-008YtA-H6
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:58:28 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb280a-2eae-0a2a0a5409dd-0a2a450ca170-38
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:58:28 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb2824-f479-0a2a450c0019-d155dd36c048-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:58:28 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so1715355f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 07:58:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c7390fe82sm23896042f8f.17.2026.11.16.07.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 07:58:27 -0800 (PST)
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
        d=suse.com; s=google; t=1794844708; x=1795449508; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S75vfLM6jYvnyqv9enpeOGGpJB4QD+xJuboc1fPv5xM=;
        b=PLzN+rM9G9U41NpqVpP6H9geTVZu6Deih//Ok9T44wNEYGOYjgCNQBUzM8pCC+yMog
         0oseWy+RNqvtN9zli9Xd6tmX2H/LsREJyZMX83nPKmWU8UUQ12roG7i1O/SMRH/y0966
         ZQ1mpbmurIaueMHevQS1Lj5gs7RoydFIdwwmhBZEWzlwycrVUTjztjctZbCHOJ112ve7
         BRtFNTD8bZj0kowaXeN8PCSkXfk2crhGlQjYymEEMrqu/H0jx73rWTEqCi5AOGXM+FZS
         0tgr95Q81/gtpY61aPJpTp0jzfEffyWFRJ308ZPSIWOexG6wNih8fG4XrDPKRlEurdZF
         NrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844708; x=1795449508;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S75vfLM6jYvnyqv9enpeOGGpJB4QD+xJuboc1fPv5xM=;
        b=nF3wgMUXYArt5v8+t7piKX7nbikyJe9lr0NDR4QzEOKAJaDgIzJlsFPlFXQ8xUPU7H
         u2fRXiAuVrBYyYmDduYlPbzTkwTqEO8Ee/b+KAWGQZIO5P7CR2OVpBlqe9HCA30zDGBE
         ps1nKuPGPWVGPRcFMOj2Zpl6cy/6vhc6wIe5QjFUqWPXUTyOlAcj1yS78qX6AHJj5h59
         /gAzuZaz3TRTBztO9eTxev3KEZa5WF7AAJlmHbRG2whBXMZuz/aCUrWf2tepXQqNW4aK
         wzH4J+rqlWFJ9TSZX3QqnA5j4B+bu+PbVQiu+XRfBYsjF/adDTj6L27o00H75E9mQg6u
         BDZQ==
X-Forwarded-Encrypted: i=1; AL+hErFCl9SbdZ0Yaq2Y3rqae1gMZOtyaSnZEQ+avNK3hAQLpYnbWJ5kPwmWF+/z2e3MJk8Hvzcjf4ruTzQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z92DU6ZfRW/Gnmep5LEfgQdVrUgHGOoKYQH//6POrj/tX+OZfp3
	/3MwrjpWmVNt0N4Q3I3NPZ9SwXmzxYuKc34m3BuALmeHZ7CrU17Zryd0dNjjK6cK7kVwoNN+LSI
	eFZQ0yA==
X-Gm-Gg: AZFdTZfusD+G4aGLz3Rs6Y+xiYrdUak/YnG8Wxo0eyycpmhWxoQhy6nfJVDRnI91/as
	s9FRGMOw2u6u9w0LAwHt8mrmJmn68Fd52Nmv7wE+Y18zVEhL0J6fXYYIMGtg25GnKICShErhdYB
	1DXr2tBDwiPlPr2D6TPGM2f1e18lER2+2Oy084pFilG7fXxmCjaADklJOHPHvIE6EnQwuqF3665
	/ZXOoQsDLKImvjbqColhDAoy37oRZ5ueRYsNvgL8vy+QvemlEFEtSWuGaXgTrdvdfKTCYZ7hE6I
	SzFNW/Gx0CqINIqQcoYHZukmR8iZBV0OtnIqeP2neb4qdbGkCNgpCcvAeEPNXrgcLO0NIeCJ4jQ
	WmYohMB2cg8zksjTxCcmy/ny1TNwRMb1fcm5o4QBy3C7XUJ1k5eJkcK5DBtyNmRAqY6/tW87fQf
	SL/hiJ+EPGMyY0UpJzzskCvWIfK385g+eJI6ZpkdORb102/1SJwT5kmeY4++udgJ7m6gzaKWH83
	sY6DT1Z+qMVo6SSBwK8uiVgSepNLRzT3wSlcHjVCk1S0znTSh/3FEOOIcxpMDv4nqpK1yPfZt4O
	BibrIxkdmO3Y1B+GGqIJz6Hq3RHHoajUyeiOsixZh5+TCtajevlOE/wX8SRaT4MQGL9+/A+lhvC
	7CNdVZX43WrrWB6Qk
X-Received: by 2002:a05:6000:2408:b0:490:6327:96da with SMTP id ffacd0b85a97d-49c6b788747mr32543315f8f.0.1794844707789;
        Mon, 16 Nov 2026 07:58:27 -0800 (PST)
Message-ID: <a7396d64-3251-431d-a24c-afcc6c1f6e0c@suse.com>
Date: Mon, 16 Nov 2026 16:58:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 04/14] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <3f0239435a9013b5ea35dda4ddd0253ef42e26ee.1793129971.git.mykola_kvach@epam.com>
 <35bf81cf-594f-4fff-ad3f-13cccf559d72@suse.com>
 <CAGeoDV8bMiJFZ9X6G3e+qEP3xnbrsd-ycHiscidzR9PPx7PN4g@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8bMiJFZ9X6G3e+qEP3xnbrsd-ycHiscidzR9PPx7PN4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794844708-76CDBA5B-4341F747/10/78276251493
X-purgate-type: spam
X-purgate-size: 2138
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 16:15, Mykola Kvach wrote:
> Hi Jan,
> 
> Thank you for the review.
> 
> On Tue, Nov 10, 2026 at 1:03 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 27.10.2026 22:05, Mykola Kvach wrote:
>>> When a CPU fails to come back during system resume, cpu_up() sends
>>> CPU_UP_CANCELED. After trying the other CPUs, enable_nonboot_cpus()
>>> sends CPU_RESUME_FAILED for the same CPU.
>>>
>>> On architectures which do not park offline CPUs, both notifications
>>> queue free_percpu_area(). The release metadata, including the rcu_head,
>>> is stored in that CPU's per-CPU area. The first callback may already
>>> have freed the area when the second notification arrives, or the same
>>> rcu_head may be queued twice. The CPU_RESUME_FAILED callbacks also need
>>> the area to clean up timers and CPU-pool state.
>>
>> I think there's another change needed, for the change you presently do
>> to not cause a leak: If enable_nonboot_cpus() calls cpu_up() for a CPU
>> whose bit isn't set in frozen_cpus, and if that call fails, the CPU
>> later wouldn't have the CPU_RESUME_FAILED notification sent for it.
>> IOW the freeing would then not happen at all. Question is whether
>> simply setting the bit in frozen_cpus would be correct: Notify
>> handlers may not expect CPU_RESUME_FAILED for a CPU which wasn't
>> online at the point of suspend.
> 
> CPUs outside frozen_cpus are only tried when park_offline_cpus is true.
> In that case, the existing !park_offline_cpus check already prevents
> freeing their per-CPU areas.
> 
> When park_offline_cpus is false, CPUs outside frozen_cpus are skipped.
> A failed cpu_up() leaves the bit set, so CPU_RESUME_FAILED is sent.
> 
> Am I missing a case where this patch would introduce a leak?

No, you're right. What I'd like to ask for is an adjustment to the last
sentence of the description: "does not take this release path" is
ambiguous, because the notifiers are the same everywhere. What's skipped
(for both of the notifier codes of interest here) is the call to
free_percpu_area(). I'd appreciate if you could disambiguate that.

Jan

