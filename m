Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B49C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 10:12:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395073.1633604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdHW-0006qW-9N; Wed, 19 Aug 2026 10:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395073.1633604; Wed, 19 Aug 2026 10:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdHW-0006qP-6g; Wed, 19 Aug 2026 10:12:26 +0000
Received: by outflank-mailman (input) for mailman id 1395073;
 Wed, 19 Aug 2026 10:12:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwdHV-0006qI-Cs
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:12:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwdHU-0090ZM-OH
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 12:12:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a858184-8faa-0a2a0a5109dd-0a2a450bb5ea-6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:12:24 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a858188-b7e8-0a2a450b0019-d1558031bdf9-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:12:24 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso5535385e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 03:12:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa17567asm48380635e9.10.2026.08.19.03.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 03:12:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1787134344; x=1787739144; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKWqU+1jI6a1UnAym+QHfLDxwV0xh/bkzkwdE77jal4=;
        b=XciyvTGQQ/q+zW9O+QlAngGdONj7AS8kdQRSyXQykxWjP/F60UYYZ0ASHXgIgRDeyg
         IutQRgP13uAAvzgvOzxLhd8FWnMsT6PEDg4kumDQL9g039Czsa9Hn/aGV3Jkj4pB1lrK
         2aCbl4BXzATlXOLUUx8lVjjl19SICsplKWDMA2wpGWnXoD0mQ6Pq6QAwNGQHWPWqfJZt
         P6LYkwF27BOKR6So0RHPC+VfvHsJMiF4appFQFN3C5fwgGRlOfn+ypdznL6pN0CT/gQP
         pB/ZZp6+Uw1xte7cDAXoG5fL3wjI1zcgxv10kdoDK2RD++m93Trww/87NbI9uZRP4ao9
         qeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134344; x=1787739144;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKWqU+1jI6a1UnAym+QHfLDxwV0xh/bkzkwdE77jal4=;
        b=MVYjaEyxTRvyVg49BEuZrogTD8+91Xp1wLteHVMdcZv6m8DKp/ABZjAAcDhEkPWL1n
         BJI0qgZDooIyzLTj4hGDHlo6RADnNNgnfDcAI+EE9iGKvyDYm6qq1SqpoBGVT2bUF/8K
         4ZDperYRcMj/LOSyqLI4gq6FB7kV+JWP9Mhgq1npTRzbdk9SvQRRR2aj6Z8+4GfaltyS
         xXGuE1uvl7JGNlhQcCWFaKW/b/sH5B017GKH4XFHwk0fPxNQQ3lKyXnIsvXZksl7UanB
         F6fJ6J3J4CQLS1mg9wXWsV8p0f1EPBOOJniLzM5nyq2ayflGsX5zdMumuAq6A+cpfEPS
         2zbg==
X-Forwarded-Encrypted: i=1; AHgh+RpmZXDYBDKhjYgVpvi06dMP0a5qn3L87KPJrjZzY/t8BvPIWyRQFeg8OMUhWJoh/AZfAfss1uBDEII=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8GtwyQprF6ajLxXnvRw9MyGBOiZo5Z352be/QQuO77xiahABj
	4Vz8sVsCAkgJzwyRG8+dYM+9mj8bQeYCNJ41euIMrH23oAv38fWOA9lXvGQMxnvfoQ==
X-Gm-Gg: AR+sD11DQcocX0f4cTzRSVNe6tSC/17p2AIDn7CUOJPUEeCqf+Y5B3rYbD/E+AiI80z
	BrpLTpk6xOImPBSBOy0GH1toKvqtMGa0rg8WxWF183BiRpj+ESxhqdDmBlSS77Ln9DfRMUss2DK
	FJ+oXAfLF7wLIJmnT/8SsllXj1/ENyLZxP2DtnMC3dREXITC1Y++tCHcDWZvLQN3ud4v1XQFINu
	LYJDEBmE1lm42VTj2hrueB+wGLbTP+sOjPTuNZKdYOlwNxXz26bDd6WXUkwOFkbN8NKVyBxkwmN
	H0HbaKIRvEI6i/dC0ACcVbvWhWCKBk8xERCru694o3Id1g5fjgTnG3jWIC36pn2mL7MVdID4M4s
	5qujWW51ZIoiFf6f1CAQ35wqnM2spQZNGtAabVIbzUvUIBlWwHCIitAWkjL4qBABBFPrFe61zRD
	EvOOpse1AZlXrzM//DaqCkPc1/iAa+n5TT2b5vVPYRSv9Fn+i8LQZtmL2dXuN4TJjy4WvRU3UBy
	BJjYLkTU0wIQSqxiAUt0b3rCCb3PRQ6Z+7f1us20mB2WE29btHG
X-Received: by 2002:a05:600c:8b81:b0:499:8ff5:8ec4 with SMTP id 5b1f17b1804b1-499aa1802a9mr70231845e9.3.1787134344041;
        Wed, 19 Aug 2026 03:12:24 -0700 (PDT)
Message-ID: <559e68bb-1689-456b-89a5-0a39d3bb3afd@suse.com>
Date: Wed, 19 Aug 2026 12:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] Various patches to improve Secure Boot support
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
 <CAHt6W4cG_-=8MBJ+7dWQrLuC2Lf-fLOHDUyGwWDGQn6=9bO1Lw@mail.gmail.com>
 <CAHt6W4fFYs8fMUFer2oRL67voM_NbwtFbD=fJxFiQ5g0cujsMA@mail.gmail.com>
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
In-Reply-To: <CAHt6W4fFYs8fMUFer2oRL67voM_NbwtFbD=fJxFiQ5g0cujsMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787134344-A9EC69EA-653DF019/0/0
X-purgate-type: clean
X-purgate-size: 2136

On 19.08.2026 12:03, Frediano Ziglio wrote:
> On Sat, 8 Aug 2026 at 07:41, Frediano Ziglio <freddy77@gmail.com> wrote:
>>
>> On Wed, 15 Jul 2026 at 07:22, Frediano Ziglio <freddy77@gmail.com> wrote:
>>>
>>> These patches improve support for Secure boot.
>>> UEFI CA memory mitigation requires memory pages to be not executable and
>>> writable at the same time. So changing permissions and splitting some section
>>> is required.
>>> Remove multiboot pieces from EFI executable.
>>>
>>> Changes since v1:
>>> - improved some comments;
>>> - merged 2 pacthes removing multiboot support in x86 PE;
>>> - removed a patch dealing with SBAT;
>>> - other minor changes (see single patches).
>>>
>>> Changes since v2:
>>> - improved some comments.
>>>
>>> Changes since v3:
>>> - Added Acked-by;
>>> - Improve commit message.
>>>
>>> Changes since v4:
>>> - Messages updates;
>>> - Clean some dependencies cause by code removal;
>>> - Add small commit to remove a possibly unused string.
>>>
>>> Changes since v5:
>>> - removed merged commit;
>>> - remove more code/data from xen.efi output.
>>>
>>> Changes since v6:
>>> - fix commit message.
>>>
>>> Changes since v7:
>>> - added Acked-by, all commit are now acked.
>>>
>>> Frediano Ziglio (2):
>>>   Align relevant sections to 4KB
>>>   x86: Split .init section to satisfy UEFI CA memory mitigation
>>>
>>> Roger Pau Monné (2):
>>>   x86/efi: discard multiboot and PVH support for PE binary
>>>   x86/efi: avoid a relocation in efi_arch_post_exit_boot()
>>>
>>>  docs/hypervisor-guide/x86/how-xen-boots.rst |  6 -----
>>>  xen/arch/x86/boot/head.S                    |  8 +++----
>>>  xen/arch/x86/efi/efi-boot.h                 |  7 ++++--
>>>  xen/arch/x86/xen.lds.S                      | 25 ++++++++++++---------
>>>  xen/tools/combine_two_binaries.py           |  2 +-
>>>  5 files changed, 25 insertions(+), 23 deletions(-)
>>
>> Ping
> 
> Ping

Andrew had indicated to me (apparently not to you?) that he'd like to
massage the descriptions some while committing. Hence why I refrained
from putting any of this in.

Jan

