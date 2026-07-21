Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69569C44532
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:36:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367894.1617550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCWP-0008P4-Ez; Tue, 21 Jul 2026 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367894.1617550; Tue, 21 Jul 2026 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCWP-0008Ox-By; Tue, 21 Jul 2026 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1367894;
 Tue, 21 Jul 2026 15:36:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmCWO-0008Or-K9
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:36:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmCWN-002xcK-QF
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 17:36:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f91ee-bab6-0a2a0a5309dd-0a2a450b8d72-46
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:36:39 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f9207-b7e8-0a2a450b0019-d155dd2acd7b-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:36:39 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so10129438f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 08:36:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f67466e09sm43576806f8f.21.2026.07.21.08.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 08:36:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784648199; x=1785252999; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J8Ulj9iKOwSYXvE2EFhPHBzVqz4G9rJgFFMM9FKCwa8=;
        b=aJRoRj9yzgmMjrxGJKbAo2UR/nc2GFu9rkBcp9Gx/74y2Ny24nlgDjlbIYyDDynFDG
         fTTAUrUd2zVfieIe78TfpThML/52BSQYyPX74B884IZOvjHqRQrL1CIrwtWKoPy0hXLQ
         +N/V4Re9UaEZYHbE9FEzBYAOaF0G3cNqb8VJDIjH6qYk95ZtKcG7v+rmb5Jor82fPSsF
         kuKx/aI0jRCCN5EuJ7LEe3Ds2wPhvb8VEW/DFN9moH0rABn3qGFR1lqCq6DfsgXWnO+S
         ga3Crg/QAwfCW/gMPqTbE54PI8onxD0whasoR8arr6FltWdw5NKgDCMHxkRDRDAeiCva
         SeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648199; x=1785252999;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J8Ulj9iKOwSYXvE2EFhPHBzVqz4G9rJgFFMM9FKCwa8=;
        b=gyS94/tS4bE7w64wO8P7lNQbslBDbh421IGDOAW7gzR+3baPvS4TVyAf8607slm0A6
         YyPjGPGUwtCKK/xxCJBDdnfJYQozAOApCOcU5jMCiKhOaVyZWl/d/VsJCO+VBEkTNdZQ
         rqVTp4w4ZJMgIKqNmQ24LPYbAUCo3DG1IYPLDEtuzTSlty38JKFmBNj4+FJzDKsFj31e
         rU2VIk6Tp5PuuvX2Xmx3ZOr/FiWLMjGGmBprqj5jUlcf5AiWUaN1ZBQcAEuoXcfX1aaY
         09p0JLwdRvf7vV1pzr128MQL3f/j16cd2c/MxOsekFhvYvfMlYlawSiWgS6DuARNkPg6
         8nQg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4J0Np3YpYV+n/CUSZhlawmH/twJhQNvunrYykKVJKua1EVJBy45GYXzEPuVYxTehAAuTnwKvBBgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwroKF5EXl9MCt1/K2/D1OyPpweIRPlZsiKNkPOdWakz0Ch9Isj
	4vG18IxN4pTR26vBDfndO9cFTHx2h2raX0MpOHR1N7RE1aaPTr2c+k/Mvx0UiBFPUA==
X-Gm-Gg: AR+sD13sB8xEwTRpe/1yj/bySV07teG/VxhIE9JDqw3M6KJQea7kvbbPZo6yFXBuUIz
	SVPtcXYlF/3ZqV51o3IaqKyCKA+e7tMmM8H4zIkoXp4YjTOwuWRybKp6sj1JUaT4jAv3MvqJwyK
	TrPKQ+8zvV9VrmUFdt2riIXdTSBtaRc1BahPYon0AuylEmCMbr/LWx8W59UadZ9x2A74ZWkFuXa
	YQ5aXvqn5vGC8Ksd03zqciLwyx0Fq5UGPuu6cKjx9/cPjPap8mFwcULcgrP5cG9OVjV7TV77yCl
	PSVuCzAxrfQdazeHp/RoYiyrd582bpTfqHmLmq6bHLrRnYpFzTzSdl1WGzL652PDyMPRqLMTRqG
	Ny3/a7GPDTebbhCfY01gMltb/ukrqWmIPWm8AOcGv7awXAeKdNEltvESdi5QBH3s0lLl3y8hwRF
	4zB0KckYQrO/lMkhoY2pYE0GsHhWq9/OjFesP6G79dSlpD7xuyJ4QDJ5cipcAxZ0WacA==
X-Received: by 2002:a5d:5f88:0:b0:47f:8183:e9bf with SMTP id ffacd0b85a97d-47f8183eae2mr3630849f8f.23.1784648199061;
        Tue, 21 Jul 2026 08:36:39 -0700 (PDT)
Message-ID: <75581474-8ef4-48c4-8c19-fc0549730552@suse.com>
Date: Tue, 21 Jul 2026 17:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from
 I/O port mapping
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
 <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
 <al-G7l2IM736d-Q6@macbook.local>
 <05425d51-965f-4176-a297-c5e6f966d886@suse.com>
 <al-LGwlNXH5EfsAw@macbook.local>
 <5653aede-dbff-405d-9df7-2edb7d8180d1@suse.com>
Content-Language: en-US
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
In-Reply-To: <5653aede-dbff-405d-9df7-2edb7d8180d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784648199-1AAD89EA-36BE1DFA/0/0
X-purgate-type: clean
X-purgate-size: 2536

On 21.07.2026 17:34, Jan Beulich wrote:
> On 21.07.2026 17:07, Roger Pau Monné wrote:
>> On Tue, Jul 21, 2026 at 04:57:36PM +0200, Jan Beulich wrote:
>>> On 21.07.2026 16:49, Roger Pau Monné wrote:
>>>> On Tue, Jun 30, 2026 at 03:54:04PM +0200, Jan Beulich wrote:
>>>>> Rather than granting permissions when mapping (an operation that DM-s are
>>>>> allowed to carry out, while they can't invoke ioport-permission), check
>>>>> whether permissions actually were granted when adding a mapping. This then
>>>>> also allows relaxing the necessary locking.
>>>>>
>>>>> While no longer granting permissions upon mapping is "only" at risk of
>>>>> breaking guests, no longer revoking permissions upon unmapping strictly
>>>>> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
>>>>> else a security issue would arise. In-tree code already does so.
>>>>>
>>>>> While there switch to using %pd in the two log messages.
>>>>>
>>>>> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> It's difficult to not think about someone appearing in 3 or 4 years
>>>> complaining that this change in behavior has caused them a security
>>>> issue, but I do agree that the previous behavior was inconsistent at
>>>> best:
>>>
>>> A positive aspect here is that the similar change for MMIO went without
>>> any fallout, as far as I'm aware.
>>>
>>>> Acked-by: Roger Pau Monné <roger@xenproject.org>
>>>
>>> Thanks, but ...
>>>
>>>> However you need to bump XEN_DOMCTL_INTERFACE_VERSION to note the ABI
>>>> change as we are in 4.23 now.
>>>
>>> ... there's no interface change here. A bump therefore won't buy us
>>> anything. I'm hesitant to take your ack as long as we disagree here.
>>
>> It's not an interface change, but it's a change in behavior of an
>> existing hypercall in a security-relevant way, so people would
>> generally need to be aware of it, just in case.
> 
> But the interface version bump won't necessarily make anyone aware. Things
> will continue to build as before, and there's also no binary incompatibility.
> The best way of making people aware is the ChangeLog entry that iirc you had
> asked for (and that's now there).

I should probably add that bumping the interface version now also wouldn't do
any harm; there's at least one other series pending which wants to do this
anyway in this starting release cycle. Yet I still think the bumping doesn't
quite belong here.

Jan

